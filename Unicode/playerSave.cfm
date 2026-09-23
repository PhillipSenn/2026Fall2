<cfscript>
if (len(form.codePoint)) {
    new dbo.proc().usr('usr.codePoint', form.codePoint)
}
location url=request.home;
</cfscript>