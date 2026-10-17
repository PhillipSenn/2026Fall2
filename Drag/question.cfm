<cfscript>
include '/Inc/header6.cfm'
q = exec('q.where_q', form.qid)
ans = exec('ans.where_q', form.qid)
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col-lg-6 mx-lg-auto">
		<div class="card">
			<div class="card-header bg-subtle-primary">
				#q.qname#
			</div>
			<div class="card-body">
				<cfif len(q.qdesc)>
					<fieldset>
						<legend>#ReplaceNoCase(ListFirst(ListLast(q.qdesc, '/'), '.'), 'Figure', 'Figure ')#</legend>
						<img src="#q.qdesc#" class="img-thumbnail">
					</fieldset>
				</cfif>
				<cfloop query="ans">
					<p>#ansname#</p>
					<cfif len(ansdesc)>
						<fieldset>
							<legend>#ReplaceNoCase(ListFirst(ListLast(ansdesc, '/'), '.'), 'Figure', 'Figure ')#</legend>
							<img src="#ansdesc#" class="img-thumbnail">
						</fieldset>
					</cfif>
				</cfloop>
			</div>
			<div class="card-footer">
				<form action="results.cfm">
					<button class="btn-outline-primary">Back to results</button>
					<input hidden name="actid" value="#form.actid#">
					<input hidden name="id" value="#request.usr.id#">
				</form>
			</div>
		</div>
	</div>
</div>
<button class="nav-link" formaction="#request.serverdir#">#actname#</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
