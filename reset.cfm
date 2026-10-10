<cfscript>
usr('guess.reset_act',form.actid)
</cfscript>

<cfoutput>
<cfinclude template="/Inc/header.cfm">
<form>
    <button formaction="#request.dir#">Reset!</button>
    <input hidden name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>