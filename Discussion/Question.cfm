<cfscript>
include '/Inc/header6.cfm'
q = exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header theme-primary theme-subtle">
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
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>