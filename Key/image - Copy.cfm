<cfscript>
param form.term = 'microphone';
param form.definition = 'Used to enter voice or sound data into a computer.';
</cfscript>

<cfscript>

term = trim(form.term)
definition = trim(form.definition)

imageURL = ""
imageTitle = ""
wikiTitle = ""
wikiURL = ""
searchTerm = ""

// ------------------------------------------------------------
// Function: Search English Wikipedia and return
// the first matching article that has an image
// ------------------------------------------------------------

function searchWikipedia(required string searchText) {

	local.result = {
		"imageURL": "",
		"imageTitle": "",
		"wikiTitle": "",
		"wikiURL": ""
	}

	cfhttp(
		url = "https://en.wikipedia.org/w/api.php",
		method = "GET",
		result = "local.wikiResult",
		userAgent = "SwatchDog/1.0"
	) {

		cfhttpparam(
			type = "url",
			name = "action",
			value = "query"
		)

		cfhttpparam(
			type = "url",
			name = "generator",
			value = "search"
		)

		cfhttpparam(
			type = "url",
			name = "gsrsearch",
			value = searchText
		)

		cfhttpparam(
			type = "url",
			name = "gsrnamespace",
			value = "0"
		)

		cfhttpparam(
			type = "url",
			name = "gsrlimit",
			value = "10"
		)

		cfhttpparam(
			type = "url",
			name = "prop",
			value = "pageimages"
		)

		cfhttpparam(
			type = "url",
			name = "piprop",
			value = "thumbnail|name"
		)

		cfhttpparam(
			type = "url",
			name = "pithumbsize",
			value = "600"
		)

		cfhttpparam(
			type = "url",
			name = "pilimit",
			value = "10"
		)

		cfhttpparam(
			type = "url",
			name = "pilicense",
			value = "free"
		)

		cfhttpparam(
			type = "url",
			name = "format",
			value = "json"
		)

		cfhttpparam(
			type = "url",
			name = "formatversion",
			value = "2"
		)
	}

	if (
		findNoCase("200", local.wikiResult.statusCode) &&
		isJSON(local.wikiResult.fileContent)
	) {

		local.wikiData =
			deserializeJSON(local.wikiResult.fileContent)

		if (
			structKeyExists(local.wikiData, "query") &&
			structKeyExists(local.wikiData.query, "pages")
		) {

			for (local.page in local.wikiData.query.pages) {

				if (
					structKeyExists(local.page, "thumbnail") &&
					structKeyExists(local.page.thumbnail, "source")
				) {

					local.result.wikiTitle =
						local.page.title

					local.result.wikiURL =
						"https://en.wikipedia.org/wiki/" &
						replace(
							urlEncodedFormat(local.page.title),
							"%20",
							"_",
							"all"
						)

					local.result.imageURL =
						local.page.thumbnail.source

					// Strip query-string parameters
					if (find("?", local.result.imageURL)) {

						local.result.imageURL =
							listFirst(
								local.result.imageURL,
								"?"
							)
					}

					if (
						structKeyExists(
							local.page,
							"pageimage"
						)
					) {

						local.result.imageTitle =
							local.page.pageimage
					}

					break
				}
			}
		}
	}

	return local.result
}


// ------------------------------------------------------------
// PLAN A
// Require the term in the article title
// and use the definition
// ------------------------------------------------------------

searchTerm =
	'intitle:"' &
	term &
	'" ' &
	definition

result = searchWikipedia(searchTerm)


// ------------------------------------------------------------
// PLAN B
// Require the term somewhere in the result
// and still use the definition
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'+"' &
	term &
	'" ' &
	definition

	result = searchWikipedia(searchTerm)
}


// ------------------------------------------------------------
// PLAN C
// Require the term in the article title
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'intitle:"' &
	term &
	'"'

	result = searchWikipedia(searchTerm)
}


// ------------------------------------------------------------
// PLAN D
// Final fallback: exact term search
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'"' &
	term &
	'"'

	result = searchWikipedia(searchTerm)
}


// ------------------------------------------------------------
// Copy final result
// ------------------------------------------------------------

imageURL = result.imageURL
imageTitle = result.imageTitle
wikiTitle = result.wikiTitle
wikiURL = result.wikiURL


// ------------------------------------------------------------
// Return JSON
// ------------------------------------------------------------

response = {
	"term": term,
	"definition": definition,
	"searchTerm": searchTerm,
	"imageTitle": imageTitle,
	"imageURL": imageURL,
	"wikiTitle": wikiTitle,
	"wikiURL": wikiURL
}

cfcontent(
	type = "application/json; charset=utf-8"
)

writeOutput(
	serializeJSON(response)
)

</cfscript>