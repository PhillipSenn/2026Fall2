<cfscript>
function dump(response, string label='') {
	writeDump(var=response,label=label)
}
function h1(response) {
	writeOutput('<h1>' & response & '</h1>')
}

</cfscript>