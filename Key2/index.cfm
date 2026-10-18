<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form action="Terms.cfm">
	<div class="card">
		<div class="card-header bg-subtle-primary">
		</div>
		<div class="card-body">
			This program pulls a relevant picture from Wikipedia.
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
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
