<cfscript>
if (len(form.codePoint)) {
    usr('usr.codePoint', form.codePoint)
}
location(request.home, false)
</cfscript>