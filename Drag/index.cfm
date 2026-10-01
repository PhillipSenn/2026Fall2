<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form action="Drop.cfm">
	<div class="card">
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			Here be instructions.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<button>Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<button class="nav-link" formaction="#request.script_name#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
