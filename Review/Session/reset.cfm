<cfscript>
include '/Inc/header6.cfm'
new dbo.proc().usr('guess.reset_act',form.actid)
</cfscript>

<cfoutput query="act">
<form id="index" hidden action="#request.dir#">
    <input hidden name="actid" value="#actid#">
    <input name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
