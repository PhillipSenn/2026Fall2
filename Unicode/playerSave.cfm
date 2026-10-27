<cfscript>
if (len(form.codePoint)) {
    new dbo.proc().usr('usr.codePoint', form.codePoint)
}
location(request.home, false)
</cfscript>