<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">

	</div>
	<div class="card-footer">
		<button>Save</button>
	</div>
	<input hidden name="id" value="#request.usr.id#" />
</div>
<a class="nav-link" href="#request.script_name#">#actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>