<cfscript>
include '/Passwords/Anthropic.cfm'

prompt = 'Give me a concise image-search phrase that would produce a picture representing this answer in the context of the question. '
	& 'Question: ' & form.qname
	& ' Answer: ' & form.ansname
	& '. Return only the search phrase.'
	
svc = new http()
svc.setMethod('post')
svc.setUrl('https://api.openai.com/v1/responses')
svc.addParam(
	type = 'header',
	name = 'Authorization',
	value = 'Bearer ' & apiKey
)
svc.addParam(
	type = 'header',
	name = 'Content-Type',
	value = 'application/json'
)
svc.addParam(
	type = 'body',
	value = serializeJson({
		model = 'gpt-5-mini',
		input = prompt
	})
)

prefix = svc.send().getPrefix()
dump(prefix)

fileContent = deserializeJson(prefix.fileContent)

result = fileContent.output[1].content[1].text

content type='text/plain';
writeOutput(result)
</cfscript>