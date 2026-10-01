<cfscript>
setting showdebugoutput=false;

//form.qname = 'Abraham Lincoln'
//form.ansname = ''

prompt = trim(form.qname & " " & form.ansname)

if (!len(prompt)) {
    cfcontent(type="application/json; charset=utf-8")
    writeOutput('{"error":"No search prompt supplied."}')
    abort
}

cfhttp(
    url = "https://en.wikipedia.org/w/api.php",
    method = "get",
    result = "httpResult",
    timeout = 30
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
        value = prompt
    )

    cfhttpparam(
        type = "url",
        name = "gsrnamespace",
        value = "0"
    )

    cfhttpparam(
        type = "url",
        name = "gsrlimit",
        value = "1"
    )

    cfhttpparam(
        type = "url",
        name = "prop",
        value = "pageimages"
    )

    cfhttpparam(
        type = "url",
        name = "piprop",
        value = "thumbnail|original|name"
    )

    cfhttpparam(
        type = "url",
        name = "pithumbsize",
        value = "800"
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


response = deserializeJSON(httpResult.fileContent);

result = {};

if (
    structKeyExists(response, "query") &&
    structKeyExists(response.query, "pages") &&
    arrayLen(response.query.pages)
) {

    page = response.query.pages[1];

    result.title = page.title;

    if (structKeyExists(page, "thumbnail")) {
        result.image = page.thumbnail.source;
    } else {
        result.image = "";
    }

}

cfcontent(type="application/json; charset=utf-8");
writeOutput(serializeJSON(result));


</cfscript>