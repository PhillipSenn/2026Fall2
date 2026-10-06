<cfscript>
qs = cgi.query_string
amp = find("&", qs)
if (amp) {
	qs = mid(qs, amp + 1, len(qs))
} else {
	qs = ""
}
action = cgi.script_name
if (len(qs)) {
	action &= "?" & qs
}
</cfscript>
<cfoutput>
<form hidden method="post" action="#action#">
    <input name="id" value="#url.id#">
</form>
<script>
setTimeout(timer,1000)
function timer() {
    document.querySelector('form').requestSubmit()
}
</script>
</cfoutput>