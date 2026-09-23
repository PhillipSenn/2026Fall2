<cfscript>

param form.term = "USB hub";
param form.definition = "An external device that contains many USB ports.";

term = trim(form.term)
definition = trim(form.definition)

imageURL = ""
imageTitle = ""
wikiTitle = ""
wikiURL = ""
searchTerm = ""


// ------------------------------------------------------------
// Search English Wikipedia
// Only accept articles whose TITLE contains the requested term
// ------------------------------------------------------------

function searchWikipedia(
	required string searchText,
	required string requiredTerm
) {

	local.result = {
		imageURL: "",
		imageTitle: "",
		wikiTitle: "",
		wikiURL: ""
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


	// --------------------------------------------------------
	// Process response
	// --------------------------------------------------------

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

			for (page in local.wikiData.query.pages) {

				// --------------------------------------------
				// Require article title to contain term
				// --------------------------------------------

				if (!findNoCase(requiredTerm, page.title)) {
					continue;
				}


				// --------------------------------------------
				// Require article to have an image
				// --------------------------------------------

				if (
					structKeyExists(page, "thumbnail") &&
					structKeyExists(page.thumbnail, "source")
				) {

					local.result.wikiTitle =
						page.title


					local.result.wikiURL =
						"https://en.wikipedia.org/wiki/" &
						replace(
							urlEncodedFormat(page.title),
							"%20",
							"_",
							"all"
						)


					local.result.imageURL =
						page.thumbnail.source


					// ----------------------------------------
					// Strip everything after ?
					// ----------------------------------------

					if (find("?", local.result.imageURL)) {

						local.result.imageURL =
							listFirst(
								local.result.imageURL,
								"?"
							)
					}


					if (
						structKeyExists(
							page,
							"pageimage"
						)
					) {

						local.result.imageTitle =
							page.pageimage
					}


					break;
				}
			}
		}
	}

	return local.result
}


// ------------------------------------------------------------
// PLAN A
// Term must appear in article title + use definition
// ------------------------------------------------------------

searchTerm =
	'intitle:"' &
	term &
	'" ' &
	definition

result = searchWikipedia(
	searchTerm,
	term
)


// ------------------------------------------------------------
// PLAN B
// Require term + use definition
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'+"' &
	term &
	'" ' &
	definition

	result = searchWikipedia(
		searchTerm,
		term
	)
}


// ------------------------------------------------------------
// PLAN C
// Term in article title
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'intitle:"' &
	term &
	'"'

	result = searchWikipedia(
		searchTerm,
		term
	)
}


// ------------------------------------------------------------
// PLAN D
// Exact term
// ------------------------------------------------------------

if (!len(result.imageURL)) {

	searchTerm =
	'"' &
	term &
	'"'

	result = searchWikipedia(
		searchTerm,
		term
	)
}


// ------------------------------------------------------------
// Final values
// ------------------------------------------------------------

imageURL = result.imageURL
imageTitle = result.imageTitle
wikiTitle = result.wikiTitle
wikiURL = result.wikiURL


// ------------------------------------------------------------
// Return JSON
// ------------------------------------------------------------

response = {
	term: term,
	definition: definition,
	searchTerm: searchTerm,
	imageTitle: imageTitle,
	imageURL: imageURL,
	wikiTitle: wikiTitle,
	wikiURL: wikiURL
}

cfcontent(
	type = "application/json; charset=utf-8"
)

writeOutput(
	serializeJSON(response)
)

</cfscript>