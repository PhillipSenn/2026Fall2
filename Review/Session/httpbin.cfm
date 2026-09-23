<cfscript>

cfhttp(
	url="https://httpbin.org/headers",
	method="get",
	result="response"
) {
	cfhttpparam(
		type="header",
		name="Authorization",
		value="Bearer TEST123"
	)

	cfhttpparam(
		type="header",
		name="X-Test-Header",
		value="Hello"
	)
}

writeOutput(response.fileContent)

</cfscript>