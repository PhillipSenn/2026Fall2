<cfscript>
svc = new http()
svc.setMethod('POST')
svc.setUrl('https://google.serper.dev/images')
svc.setCharset('utf-8')
svc.addParam(
	type='header',
	name='X-API-KEY',
	value='3f47dd9628ea832607ddba08beb2cd7de24ad10e'
)
svc.addParam(
	type='header',
	name='Content-Type',
	value='application/json'
)
form.q = form.qname & ' ' & form.ansname
	& ' site:wikipedia.org'
// & ' -chegg -studocu -quizlet -coursehero'

svc.addParam(
	type='body',
	value=serializeJson({
		q = form.q,
		num = 5
	})
)

result = svc.send().getPrefix()
writeOutput(result.fileContent)
</cfscript>