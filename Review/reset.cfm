<cfscript>
new dbo.proc().usr('guess.reset_act',form.actid)
location(request.home, false)
</cfscript>