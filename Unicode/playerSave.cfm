<cfscript>
if (len(form.codePoint)) {
    usr('usr.codePoint', form.codePoint)
}
location(request.home & 'profile.cfm?id=' & request.usr.id,false)
</cfscript>