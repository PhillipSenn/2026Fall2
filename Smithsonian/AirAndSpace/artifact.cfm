<cfscript>
setting showdebugoutput=false;
cfheader(name='Content-Type', value='application/json; charset=utf-8');

apiKey = 'DEMO_KEY';

try {
   cfhttp(
      url='https://api.si.edu/openaccess/api/v1.0/search',
      method='GET',
      result='smithsonian',
      timeout=30,
      charset='utf-8'
   ) {
      cfhttpparam(
         type='url',
         name='q',
         value='Wright Flyer'
      );

      cfhttpparam(
         type='url',
         name='rows',
         value='25'
      );

      cfhttpparam(
         type='url',
         name='start',
         value='0'
      );

      cfhttpparam(
         type='url',
         name='api_key',
         value=apiKey
      );
   }

   if (val(smithsonian.statusCode) NEQ 200) {
      cfheader(statuscode=502);

      writeOutput(serializeJSON({
         error = true,
         statusCode = smithsonian.statusCode,
         message = smithsonian.fileContent
      }));

   } else {
      // Return the Smithsonian's original JSON.
      // No filtering or title matching.
      writeOutput(smithsonian.fileContent);
   }

} catch (any e) {
   cfheader(statuscode=502);

   writeOutput(serializeJSON({
      error = true,
      message = e.message,
      detail = e.detail
   }));
}
</cfscript>