<cfscript>
include '/Inc/header.cfm';
</cfscript>

<cfoutput query="act">
<form method="post" action="marbles.cfm" class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
	</div>
	<div class="card-footer">
		<button>Ready!</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#actid#">
</form>
</cfoutput>
<cfinclude template="/Inc/footer.cfm">
