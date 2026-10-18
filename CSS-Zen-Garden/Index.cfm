<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header bg-subtle-primary">
	</div>
	<div class="card-body">

	</div>
	<div class="card-footer">
		<button>Save</button>
	</div>
	<input hidden name="id" value="#request.usr.id#" />
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>