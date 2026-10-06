<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form action="matching.cfm">
	<div class="card">
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			I'm trying to make this course a little better than reading a textbook, so pick a keyword on the left and it's description on the right.
			<p>Or the description first and then find its keyword.</p>
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
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
