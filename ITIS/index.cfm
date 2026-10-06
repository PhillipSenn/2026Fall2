<cfscript>
request.title = 'ITIS'
request.progress.bar = false
include '/Inc/header.cfm'
</cfscript>

<cfoutput>
<form class="card" action="domain.cfm">
	<div class="card-header bg-primary-subtle">ITIS</div>
	<div class="card-body">
		<button class="btn-link">Domain</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
