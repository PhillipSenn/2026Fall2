<cfscript>
include '/Inc/header.cfm'
guess = queryexecute('select 
guessid,usrid,gradeid,actid,qid,ansid,ansname,guessname
	,earned
from guess
left join grade on guess_grade=gradeid
left join usr on grade_usr=usrid
left join act on grade_act=actid
left join ans on guess_ans=ansid
left join q on ans_q=qid
order by guessid desc')
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
		<table>
			<thead>
				<tr>
					<th class="text-end">guessid</th>
					<th class="text-end">usrid</th>
					<th class="text-end">actid</th>
					<th class="text-end">qid</th>
					<th class="text-end">ansid</th>
					<th>ansname</th>
					<th>guessname</th>
					<th class="text-end">gradeid</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="guess">
					<tr>
						<td class="text-end">#guessid#</td>
						<td class="text-end"><a href="usr.cfm?usrid=#usrid#">#usrid#</a></td>
						<td class="text-end"><a href="act.cfm?actid=#actid#">#actid#</a></td>
						<td class="text-end"><a href="q.cfm?qid=#qid#">#qid#</a></td>
						<td class="text-end"><a href="ans.cfm?ansid=#ansid#">#ansid#</a></td>
						<td>#ansname#</td>
						<td>#guessname#</td>
						<td class="text-end"><a href="grade.cfm?gradeid=#gradeid#">#gradeid#</a></td>
						<td class="text-end">#earned#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</div>
<a class="nav-link" href="#request.script_name#">Guess</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>