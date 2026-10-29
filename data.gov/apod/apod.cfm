<cfscript>
cfcontent(type='application/json; charset=utf-8')

apiKey = 'DEMO_KEY'
apiURL = 'https://science.nasa.gov/wp-json/wp/v2/apod-basic'
firstDate = createDate(1995,6,16)

function apodRateLimitRemaining(httpResult) {
   var headers = {}
   var name = ''

   if (!isStruct(httpResult) || !structKeyExists(httpResult, 'responseheader')) {
      return ''
   }

   headers = httpResult.responseheader

   for (name in headers) {
      if (lCase(name) == 'x-ratelimit-remaining') {
         if (isArray(headers[name])) {
            return toString(headers[name][1])
         }

         return toString(headers[name])
      }
   }

   return ''
}

try {
   isRandom = structKeyExists(url,'random') && url.random == '1'
   pictureDate = now()

   if (isRandom) {
      pictureDate = dateAdd(
         'd',
         randRange(0, dateDiff('d', firstDate, now())),
         firstDate
      )
   } else if (structKeyExists(url,'date') && len(trim(url.date))) {
      requestedDate = trim(url.date)

      if (!reFind('^\d{4}-\d{2}-\d{2}$',requestedDate)) {
         throw(message='Invalid date format.')
      }

      pictureDate = parseDateTime(requestedDate,'yyyy-MM-dd')

      if (pictureDate < firstDate || pictureDate > now()) {
         throw(message='Date is outside the APOD archive.')
      }
   }

   cfhttp(
      url=apiURL & '/' & dateFormat(pictureDate,'yymmdd'),
      method='GET',
      result='apiResult',
      timeout=30
   ) {
      /*
      cfhttpparam(
         type='url',
         name='api_key',
         value=apiKey
      )
      */
   }

   if (val(apiResult.statusCode) != 200) {
      throw(message='NASA returned HTTP ' & apiResult.statusCode)
   }

   result = deserializeJSON(apiResult.fileContent)

   if (isArray(result)) {
      if (!arrayLen(result)) {
         throw(message='NASA returned no pictures.')
      }

      result = result[1]
   }

   if (!isStruct(result)) {
      throw(message='Unexpected response from NASA.')
   }

   try {
      cfhttp(
         url='https://api.nasa.gov/planetary/apod',
         method='GET',
         result='limitResult',
         timeout=15
      ) {
         cfhttpparam(
            type='url',
            name='api_key',
            value=apiKey
         )
      }

      result['X-RateLimit-Remaining'] = apodRateLimitRemaining(limitResult)
   } catch (any limitError) {
      result['X-RateLimit-Remaining'] = ''
   }

   writeOutput(serializeJSON(result))

} catch (any e) {
   cfheader(statuscode=502)

   writeOutput(serializeJSON({
      'error': true,
      'message': e.message
   }))
}
</cfscript>