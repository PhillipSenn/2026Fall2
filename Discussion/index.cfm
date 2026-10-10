<cfscript>
include '/Inc/header.cfm'
q = exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col-6 mx-auto">
		<form class="card">
			<div class="card-header bg-primary-subtle">
				For classroom discussion
			</div>
		</form>
		<cfloop query="q">
			<div class="card">
				<div class="card-body">
					#qname#
				</div>
			</div>
		</cfloop>
		<input hidden name="actid" value="#actid#">
		<input hidden name="id" value="#request.usr.id#">
		<button class="nav-link" formaction="#request.dir#">#actname#</button>
	</div>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>