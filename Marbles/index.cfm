<cfscript>
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<form method="post" action="marbles.cfm" class="card">
	<div class="card-header theme-primary theme-subtle">
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
<cfinclude template="/Inc/footer6.cfm">
