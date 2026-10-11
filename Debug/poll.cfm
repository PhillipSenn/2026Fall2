<cfscript>
include '/Inc/header.cfm'
guess = queryexecute('select 
from poll
left join grade on guess_grade=gradeid
left join usr on grade_usr=usrid
left join act on grade_act=actid
left join q on poll_q=qid
order by pollid desc')
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
		<table>
			<thead>
				<tr>
					<th class="text-end">pollid</th>
					<th class="text-end">usrid</th>
					<th class="text-end">actid</th>
					<th class="text-end">qid</th>
					<th>qname</th>
					<th class="text-end">gradeid</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="guess">
					<tr>
						<td class="text-end">#pollid#</td>
						<td class="text-end"><a href="usr.cfm?usrid=#usrid#">#usrid#</a></td>
						<td class="text-end"><a href="act.cfm?actid=#actid#">#actid#</a></td>
						<td class="text-end"><a href="q.cfm?qid=#qid#">#qid#</a></td>
						<td>#qname#</td>
						<td class="text-end"><a href="grade.cfm?gradeid=#gradeid#">#gradeid#</a></td>
						<td class="text-end">#earned#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</div>
<button class="nav-link">Poll</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>