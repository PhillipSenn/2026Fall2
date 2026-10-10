<cfscript>
usr('guess.reset_act',form.actid)
location('../home.cfm?id=' & request.usr.id, false)
</cfscript>