<cfscript>
if (StructKeyExists(form,'qid')) {
	new dbo.proc().usr('poll.merge_q',form.qid)
}
request.flush = false
include '/Inc/header.cfm'
disabled = 'disabled'
q = new dbo.proc().usr('poll.unanswered',form.actid)
if (!q.recordcount) {
	disabled = ''
	param form.qid=0;
	q = new dbo.proc().exec('poll.gt_q',[form.actid,form.qid])
	if (!q.recordcount) {
		location(request.home & '?id=' & request.usr.id,false)
	}
}
ans = new dbo.proc().exec('ans.where_q',q.qid)
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col">
		<form class="card">
			<div class="card-header bg-primary-subtle">
				#q.qname#
			</div>
			<div class="card-body">
				<cfif len(q.qdesc)>
					<fieldset>
						<legend>#ReplaceNoCase(ListFirst(ListLast(q.qdesc,'/'),'.'),'Figure','Figure ')#</legend>
						<img src="../Drag/#q.qdesc#" class="img-thumbnail">
					</fieldset>
				</cfif>
				<cfloop query="ans">
					<p>#reReplace(ansname, '(?i)<a>([^<]*)<a>', '<a>\1</a>', 'all')#</p>
					<cfif len(ansdesc)>
						<fieldset>
							<legend>#ReplaceNoCase(ListFirst(ListLast(ansdesc,'/'),'.'),'Figure','Figure ')#</legend>
							<img src="../Drag/#ansdesc#" class="img-thumbnail">
						</fieldset>
					</cfif>
				</cfloop>
			</div>
			<div class="card-footer">
				<button name="qid" value="#q.qid#" class="btn-outline-success" #disabled#>Next</button>
			</div>
			<input hidden name="actid" value="#form.actid#">
			<input hidden name="id" value="#request.usr.id#">
		</form>
	</div>
</div>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.serverdir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
