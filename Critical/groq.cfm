<cfscript>
setting showdebugoutput=false;
param form.qname = 'You and your roommate decide to reduce your environmental impact by recycling more.';
param form.pollname = 'You and your roommate want to recycle more.';
include '/Passwords/groq.cfm'

if (cgi.request_method != 'POST') {
	writeOutput('<form method="post">')
	writeOutput('<input type="hidden" name="id" value="' & encodeForHTMLAttribute(request.usr.id) & '">')
	writeOutput('<input type="hidden" name="dump" value="1">')
	writeOutput('<p>Original<br><textarea name="qname" rows="6" cols="80">' & encodeForHTML(form.qname) & '</textarea></p>')
	writeOutput('<p>Rewrite<br><textarea name="pollname" rows="6" cols="80">' & encodeForHTML(form.pollname) & '</textarea></p>')
	writeOutput('<p><button>Post to Groq</button></p>')
	writeOutput('</form>')
	abort;
}

requestBody = {
	"model": "openai/gpt-oss-120b",
	"messages": [
		{
			"role": "system",
			"content": "
You score a student's rewrite of textbook wording.

Compare the original and the rewrite.

Estimate the minimum US school grade at which a typical student
could comfortably understand the rewrite.

Consider vocabulary, sentence structure, abstract concepts,
and assumed background knowledge.

Do not judge only by word length or sentence length.

Decide whether the rewrite still says the same thing as the original.

Return only JSON with these keys:
grade (number),
meaningPreserved (boolean),
reason (one or two short sentences),
difficultWords (array of hard words that still appear in the rewrite).
Do not list words that were removed from the rewrite.
Do not list words from these instructions."
		},
		{
			"role": "user",
			"content": "Original:" & chr(10) & form.qname
				& chr(10) & chr(10)
				& "Rewrite:" & chr(10) & form.pollname
		}
	],
	"temperature": 0,
	"max_completion_tokens": 1000,
	"response_format": {
		"type": "json_object"
	}
}

cfhttp(
	url="https://api.groq.com/openai/v1/chat/completions",
	method="post"
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
if (structKeyExists(form, 'dump')) {
	writeOutput('<h3>' & encodeForHTML(cfhttp.statusCode) & '</h3>')
	writeOutput('<pre>' & encodeForHTML(cfhttp.fileContent) & '</pre>')
	abort;
}
if (cfhttp.statusCode == "200 OK") {
	response = deserializeJSON(cfhttp.fileContent)
	result = trim(response.choices[1].message.content)
	if (left(result, 3) == "```") {
		result = reReplace(result, "^```(?:json)?\s*", "")
		result = reReplace(result, "\s*```$", "")
	}
	cfcontent(type="application/json")
	writeOutput(result)
} else {
	writeOutput('<h3>' & encodeForHTML(cfhttp.statusCode) & '</h3>')
	writeOutput('<pre>' & encodeForHTML(cfhttp.fileContent) & '</pre>')
}
</cfscript>
