<cfscript>
include '/Inc/header.cfm'
q = usr('q.usr_act',form.actid) // All questions
// A started poll is not a finished answer. Score counts pollEnd only.
finishedPoll = queryExecute(
	"select pollid, poll_q
	from poll
	join grade on poll_grade = gradeid
	where grade_usr = (select usrid from usr where id = :id)
	and pollEnd is not null",
	{id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"}},
	{datasource: "lr2026Fall2"}
)
finished = {}
cfloop(query=finishedPoll) {
	finished[poll_q] = pollid
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-8">
				<div id="qid"></div>
				<figure>
					<a id="wikipedia-link" target="_blank">
						<img id="wikipedia" class="img-thumbnail mt-3 d-none" alt="">
					</a>
					<figcaption></figcaption>
				</figure>
			</div>
			<div class="col-4">
				<cfloop query="q">
					<div><button class="btn-outline-primary<cfif structKeyExists(finished, qid)> d-none</cfif>" value="#qid#">#qname#</button></div>
				</cfloop>
			</div>
		</div>
		<table id="qids" class="d-none">
			<thead>
				<tr>
					<th class="text-end">Row</th>
					<th>Key Term</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="q">
					<tr data-qid="#qid#"<cfif structKeyExists(finished, qid)> data-pollid="#finished[qid]#"</cfif>>
						<td class="text-end"><a href="JavaScript:" class="rownum">#currentRow#</a></td>
						<td><a href="https://en.wikipedia.org/wiki/#replace(qname, ' ', '_', 'all')#" target="_blank">#qname#</a></td>
						<td>#qdesc#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#actid#">
</div>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
