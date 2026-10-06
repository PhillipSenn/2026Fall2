<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">

	</div>
	<div class="card-footer">
		<button>Save</button>
	</div>
	<input hidden name="actid" value="#actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<button class="nav-link" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>