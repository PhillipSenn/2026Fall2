<cfscript>
if (StructKeyExists(form,'ansid')) {
	usr('guess.merge_ans0',form.ansid)
}
request.container = 'container-fluid'
include '/Inc/header6.cfm'
q = usr('guess.where_act',form.actid)
choices = queryExecute("
	select q.qid
		,ans.ansid
		,ans.ansname
		,(
			select count(*)
			from guess
			join grade on guess_grade = gradeid
			where guess_ans = ans.ansid
		) chosen
		,case when exists (
			select 1
			from guess
			join grade on guess_grade = gradeid
			where guess_ans = ans.ansid
			and grade_usr = (select usrid from usr where id = ?)
		) then 1 else 0 end mine
	from q
	join ans on ans_q = q.qid
	where q.q_act = ?
	order by q.qsort, q.qid, ans.ansid
", [
	{value: request.usr.id, cfsqltype: 'cf_sql_varchar'},
	{value: form.actid, cfsqltype: 'cf_sql_integer'}
], {datasource: 'lr2026Fall2'})
choiceMap = {}
maxChoices = 0
cfloop(query=choices) {
	if (!structKeyExists(choiceMap, qid)) {
		choiceMap[qid] = []
	}
	arrayAppend(choiceMap[qid], {
		ansid: ansid,
		ansname: ansname,
		chosen: chosen,
		mine: mine
	})
	maxChoices = max(maxChoices, arrayLen(choiceMap[qid]))
}
tscore = 0
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header bg-subtle-primary">
		Review Questions
		<button class="btn-sm float-end btn-outline theme-danger" formaction="reset.cfm">Reset</button>
	</div>
	<div class="card-body">
		<table class="table-bordered table-striped table-hover align-middle">
			<thead>
				<tr>
					<th class="text-center">Row</th>
					<th>Question</th>
					<cfloop from="1" to="#maxChoices#" index="choiceIndex">
						<th>Answer #choiceIndex#</th>
					</cfloop>
					<th class="text-end">Score</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="q">
					<cfset rowChoices = []>
					<cfset rowScore = 0>
					<cfset maxChosen = 0>
					<cfset voteWarning = false>
					<cfif structKeyExists(choiceMap, qid)>
						<cfset rowChoices = choiceMap[qid]>
					</cfif>
					<cfloop array="#rowChoices#" index="choice">
						<cfset maxChosen = max(maxChosen, choice.chosen)>
						<cfif choice.mine>
							<cfset rowScore = choice.chosen>
						</cfif>
					</cfloop>
					<cfloop array="#rowChoices#" index="choice">
						<cfif not choice.mine and choice.chosen + 1 gt rowScore>
							<cfset voteWarning = true>
						</cfif>
					</cfloop>
					<tr>
						<td class="text-end">
							#currentRow#
						</td>
						<td>
							#qname#
						</td>
						<cfloop from="1" to="#maxChoices#" index="choiceIndex">
							<td>
								<cfif choiceIndex lte arrayLen(rowChoices)>
									<cfset choice = rowChoices[choiceIndex]>
									<cfset choiceClass = "answer btn-outline theme-primary">
									<cfif choice.mine>
										<cfset choiceClass = "answer btn-solid theme-subtle theme-primary">
										<cfif choice.chosen eq maxChosen>
											<cfset choiceClass = "answer btn-solid theme-subtle theme-success">
										</cfif>
										<cfif voteWarning>
											<cfset choiceClass = "answer btn-solid theme-subtle theme-warning">
										</cfif>
									</cfif>
									<button name="ansid" value="#choice.ansid#" class="#choiceClass#">
										<span>#choice.ansname#</span>
										<span class="badge text-bg-secondary">#choice.chosen#</span>
									</button>
								</cfif>
							</td>
						</cfloop>
						<td class="text-end">
							#rowScore#
							<cfset tscore += rowScore>
						</td>
					</tr>
				</cfloop>
			</tbody>
			<tfoot>
				<tr>
					<th></th>
					<th colspan="#maxChoices+1#">Total
					<th class="text-end">
						#tscore#
					</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<div class="card-footer">
	</div>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
