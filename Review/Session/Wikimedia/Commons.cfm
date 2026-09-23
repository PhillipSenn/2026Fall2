<cfscript>
form.qname = 'What is the cell reference for the cell located in the third column and fourth row of a worksheet?'
form.ansname = 'c4'
form.image_query = 'diagram of spreadsheet column letters and row numbers'

cfhttp(
	url="https://commons.wikimedia.org/w/api.php",
	method="get",
	result="response"
) {
	cfhttpparam(
		type="url",
		name="action",
		value="query"
	)

	cfhttpparam(
		type="url",
		name="generator",
		value="search"
	)

	cfhttpparam(
		type="url",
		name="gsrsearch",
		value=form.image_query 
// 		& ' in response to this question: "' & form.qname 
//			& '" and this answer: "' & form.ansname & '"'
	)

	cfhttpparam(
		type="url",
		name="gsrnamespace",
		value="6"
	)

	cfhttpparam(
		type="url",
		name="gsrlimit",
		value="5"
	)

	cfhttpparam(
		type="url",
		name="prop",
		value="imageinfo"
	)

	cfhttpparam(
		type="url",
		name="iiprop",
		value="url"
	)

	cfhttpparam(
		type="url",
		name="iiurlwidth",
		value="500"
	)

	cfhttpparam(
		type="url",
		name="format",
		value="json"
	)

	cfhttpparam(
		type="url",
		name="formatversion",
		value="2"
	)
}

fileContent = deserializeJSON(response.fileContent)
result = []

for (page in fileContent.query.pages) {

	if (structKeyExists(page, "imageinfo")	&& arrayLen(page.imageinfo)) {
		arrayAppend(result, {
			title: page.title,
			url: page.imageinfo[1].thumburl
		})
//		WriteOutput('<img src="' & page.imageinfo[1].thumburl & '">')
	}
}
cfcontent(type="application/json")
writeoutput(SerializeJSON(result))

</cfscript>