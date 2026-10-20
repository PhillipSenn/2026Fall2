<cfscript>
include '/Inc/header6.cfm'
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
	<form class="card-header theme-primary theme-subtle">
		<button class="float-end btn-solid theme-primary">Pass</button>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</form>
	<div class="card-body">
		<div class="row">
			<div id="key-term-prompt" class="col-8">
				<div id="qid"></div>
				<figure class="border ps-4">
					<a id="wikipedia-link" target="_blank">
						<img id="wikipedia" class="img-thumbnail mt-3 d-none" alt="">
					</a>
					<figcaption class="small mt-4"></figcaption>
				</figure>
			</div>
			<div class="col-4">
				<cfloop query="q">
					<div class="mb-2"><button class="btn-outline theme-primary<cfif structKeyExists(finished, qid)> d-none</cfif>" value="#qid#">#qname#</button></div>
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
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
