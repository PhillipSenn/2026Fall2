<cfscript>
include '/Inc/header.cfm'
q = exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header bg-primary-subtle">
		To be discussed aloud
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
<cfinclude template="/Inc/footer.cfm">
</cfoutput>