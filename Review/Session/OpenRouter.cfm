<cfscript>
form.qname = 'What is the cell reference for the cell located in the third column and fourth row of a worksheet?'

apiKey = "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"

requestBody = {
	"model": "openrouter/free",
	"messages": [
		{
			"role": "user",
			"content": form.qname
		}
	]
}

</cfscript>

<cfhttp
	url="https://openrouter.ai/api/v1/chat/completions"
	method="post"
	result="response">

	<cfhttpparam
		type="header"
		name="Authorization"
		value="Bearer #apiKey#">

	<cfhttpparam
		type="header"
		name="Content-Type"
		value="application/json">

	<cfhttpparam
		type="body"
		value="#serializeJSON(requestBody)#">

</cfhttp>

<cfscript>

if (response.statusCode == "200 OK") {

	data = deserializeJSON(response.fileContent)

	writeOutput(data.choices[1].message.content)

}
else {

	dump(response)

}

</cfscript>