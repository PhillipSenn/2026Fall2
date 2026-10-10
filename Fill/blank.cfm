<cfscript>
if (StructKeyExists(form,'qid')) {
	grade = usr('poll.merge_q',form.qid)
	if (grade.earned gte 100) {
		location('results.cfm?actid=' & form.actid & '&id=' & request.usr.id, false)
	}
}
request.flush = false
include '/Inc/header.cfm'
disabled = 'disabled'
q = usr('poll.unanswered',form.actid)
if (!q.recordcount) {
	disabled = ''
	param form.qid=0;
	q = exec('poll.gt_q',[form.actid,form.qid])
	if (!q.recordcount) {
		location('../home.cfm?id=' & request.usr.id, false)
	}
}
polls = usr('q.usr_act',form.actid)
started = false
for (i = 1; i <= polls.recordcount; i++) {
	if (polls.qid[i] == q.qid and isDate(polls.pollStart[i])) {
		started = true
		break
	}
}
if (!started) {
	usr('poll.start_q',q.qid)
}
ans = exec('ans.where_q',q.qid)
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col-lg-6 mx-lg-auto">
		<form class="card">
			<div class="card-header bg-primary-subtle">
				#q.qname#
			</div>
			<div class="card-body">
				<cfif len(q.qdesc)>
					<fieldset>
						<legend>#ReplaceNoCase(ListFirst(ListLast(q.qdesc,'/'),'.'),'Figure','Figure ')#</legend>
						<img src="#q.qdesc#" class="img-thumbnail">
					</fieldset>
				</cfif>
				<cfloop query="ans">
					<p>#ansname#</p>
					<cfif len(ansdesc)>
						<fieldset>
							<legend>#ReplaceNoCase(ListFirst(ListLast(ansdesc,'/'),'.'),'Figure','Figure ')#</legend>
							<img src="#ansdesc#" class="img-thumbnail">
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
