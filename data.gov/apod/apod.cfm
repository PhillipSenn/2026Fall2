<cfscript>
cfcontent(type='application/json; charset=utf-8');

apiURL = 'https://science.nasa.gov/wp-json/wp/v2/apod-basic'
firstDate = createDate(1995,6,16)

function apodImageURL(html) {
   var match = {}
   var pictureURL = ''

   if (!isSimpleValue(html) || !len(html)) {
      return ''
   }

   match = reFindNoCase(
      '<img[^>]+src\s*=\s*"([^"]+)"',
      html,
      1,
      true
   )

   if (match.pos[1] == 0 || arrayLen(match.pos) < 2 || match.pos[2] == 0) {
      return ''
   }

   pictureURL = trim(mid(html, match.pos[2], match.len[2]))

   if (left(pictureURL, 2) == '//') {
      pictureURL = 'https:' & pictureURL
   }

   if (!len(pictureURL) || findNoCase('news-thumbnail.png', pictureURL)) {
      return ''
   }

   return pictureURL
}

function apodRealPicture(result) {
   var html = ''
   var pictureURL = ''
   var htmlResult = {}

   if (!isStruct(result)) {
      return result
   }

   if (
      structKeyExists(result, 'hdurl')
      && len(result.hdurl)
      && !findNoCase('news-thumbnail.png', result.hdurl)
   ) {
      return result
   }

   if (structKeyExists(result, 'basic_html')) {
      html = result.basic_html
   }

   pictureURL = apodImageURL(html)

   if (
      !len(pictureURL)
      && structKeyExists(result, 'basic_html_url')
      && len(result.basic_html_url)
   ) {
      cfhttp(
         url=result.basic_html_url,
         method='GET',
         result='htmlResult',
         timeout=30
      );

      if (val(htmlResult.statusCode) == 200) {
         pictureURL = apodImageURL(htmlResult.fileContent)
      }
   }

   if (len(pictureURL)) {
      result.hdurl = pictureURL
   }

   return result
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
   );

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

   result = apodRealPicture(result)

   writeOutput(serializeJSON(result))

} catch (any e) {
   cfheader(statuscode=502);

   writeOutput(serializeJSON({
      'error': true,
      'message': e.message
   }))
}
</cfscript>