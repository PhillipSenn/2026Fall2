<cfscript>
request.title = 'MS-SQL'
request.progress.bar = false
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="card" action="Relationships.cfm">
	<div class="card-header bg-subtle-primary">MS-SQL</div>
	<div class="card-body">
		<button class="btn-link">Relationships</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
