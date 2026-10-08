<cfoutput>
<cfinclude template="/Inc/header.cfm">
<form id="index" hidden action="#request.dir#">
    <input name="id" value="#url.id#">
</form>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>