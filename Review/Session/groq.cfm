<cfscript>
//form.qname = 'Explain how to insert a comment in a document.'
//form.qname = 'What is the cell reference for the cell located in the third column and fourth row of a worksheet?'
apiKey = trim("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")

requestBody = {
	"model": "openai/gpt-oss-120b",
	"messages": [
		{
			"role": "system",
			"content": "
Answer the student's question directly and concisely.
Return only an HTML fragment suitable for inserting inside an existing page.
Do not include <!doctype>, <html>, <head>, or <body> tags.
Do not use Markdown."
		},
		{
			"role": "user",
			"content": form.qname
		}
	],
	"temperature": 0.2,
	"max_completion_tokens": 1000
}

cfhttp(
	url="https://api.groq.com/openai/v1/chat/completions",
	method="post",
	encodeUrl=false
) {
	cfhttpparam(
		type="header",
		name="Authorization",
		value="Bearer " & apiKey
	)

	cfhttpparam(
		type="header",
		name="Content-Type",
		value="application/json"
	)

	cfhttpparam(
		type="body",
		value=serializeJSON(requestBody)
	)
}
if (cfhttp.statusCode == "200 OK") {
	response = deserializeJSON(cfhttp.fileContent)
	result = response.choices[1].message.content
	echo(result)
} else {
	dump(cfhttp)
}
</cfscript>