<cfscript>
function dump(response) {
    writedump(response)
}
function h1(response) {
	writeOutput('<h1>' & response & '</h1>')
}
function h2(response) {
	writeOutput('<h2>' & response & '</h2>')
}
function h3(response) {
	writeOutput('<h3>' & response & '</h3>')
}
function h4(response) {
	writeOutput('<h4>' & response & '</h4>')
}
function h5(response) {
	writeOutput('<h5>' & response & '</h5>')
}
function h6(response) {
	writeOutput('<h6>' & response & '</h6>')
}
function echo(response) {
	writeOutput(response & '<br>')
}
</cfscript>