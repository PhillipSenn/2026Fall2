<cfscript>
if (len(form.codePoint)) {
    usr('usr.codePoint', form.codePoint)
}
location('../home.cfm?id=' & request.usr.id, false)
</cfscript>