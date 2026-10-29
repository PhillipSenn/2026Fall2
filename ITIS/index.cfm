<cfscript>
request.title = 'ITIS'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="card" action="domain.cfm">
	<div class="card-header theme-primary theme-subtle">ITIS</div>
	<div class="card-body">
		<button class="btn-link">Domain</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
