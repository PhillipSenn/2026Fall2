<cfscript>
form.qname = 'What is the cell reference for the cell located in the third column and fourth row of a worksheet?'

apiKey = "AQ.Ab8RN6KCYguBEIXWfpvlcXnbPtzf8shjIZC-4Rl3hE0NvDOjqQ"

requestBody = {
	"model": "gemini-3.5-flash-lite",
	"input": form.qname
}

cfhttp(
	url="https://generativelanguage.googleapis.com/v1beta/interactions",
	method="post",
	result="response",
	encodeUrl=false
) {
	cfhttpparam(
		type="header",
		name="X-goog-api-key",
		value=apiKey
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

dump(response)

</cfscript>