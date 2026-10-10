<cfscript>
usr('guess.reset_act',form.actid)
location('../login.cfm?id=' & request.usr.id, false)
</cfscript>