<cfscript>
if (len(form.codePoint)) {
    usr('usr.codePoint', form.codePoint)
}
location('../login.cfm?id=' & request.usr.id, false)
</cfscript>