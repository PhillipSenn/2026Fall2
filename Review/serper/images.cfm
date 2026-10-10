<cfscript>
setting showdebugoutput=false;
form.q = form.qname
	& ' site:wikipedia.org';

requestBody = serializeJSON({
	'q' = form.q,
	'num' = 5
})

cfhttp(
	url='https://google.serper.dev/images',
	method='POST',
	charset='utf-8',
	result='result'
) {
	cfhttpparam(
		type='header',
		name='X-API-KEY',
		value='3f47dd9628ea832607ddba08beb2cd7de24ad10e'
	);

	cfhttpparam(
		type='header',
		name='Content-Type',
		value='application/json'
	);

	cfhttpparam(
		type='body',
		value=requestBody
	);
}
writeOutput(result.fileContent)
</cfscript>