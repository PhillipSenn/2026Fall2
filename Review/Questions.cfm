<cfscript>
if (StructKeyExists(form,'ansid')) {
	new dbo.proc().usr('guess.merge_ans_name',[form.ansid,form.guessname])
}
include '/Inc/header.cfm'
q = new dbo.proc().usr('guess.where_act',form.actid)
// q left join guess
tscore = 0
tpossible = 0
</cfscript>

<cfoutput query="act">
<form action="Feedback.cfm" class="card" method="post">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
		<table class="table-bordered table-striped table-hover">
			<thead>
				<tr>
					<th class="text-center">Row</th>
					<th>Answer</th>
					<th>Question</th>
					<th class="text-end">Score</th>
					<th class="text-end">Possible</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="q">
					<tr>
						<td class="text-center">
							<button name="qid" value="#qid#" class="btn-outline-primary">
								#currentRow#
							</button>
						</td>
						<td>#ansname#</td>
						<td>
							#qname#
						</td>
						<td class="text-end">
							#score#
							<cfset tscore += score>
						</td>
						<td class="text-end">
							#possible#
							<cfset tpossible += possible>
						</td>
					</tr>
				</cfloop>
			</tbody>
			<tfoot>
				<tr>
					<th></th>
					<th></th>
					<th>Total Score:</th>
					<th class="text-end">
						#tscore#
					</th>
					<th class="text-end">
						#tpossible#
					</th>
				</tr>
		</table>
	</div>
	<div class="card-footer">
	</div>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<a class="nav-link" href="#request.scriptname#">Review: #actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>