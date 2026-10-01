<cfscript>
new dbo.proc().usr('guess.reset_act',form.actid)
location(request.dir & '?id=' & request.usr.id & '&actid=' & form.actid,false)
</cfscript>