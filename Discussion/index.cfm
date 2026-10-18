<cfscript>
include '/Inc/header6.cfm'
cat = exec('cat.where_cat',act.catid)
q = exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col-6 mx-auto">
		<form class="card">
			<div class="card-header bg-subtle-primary">
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
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>