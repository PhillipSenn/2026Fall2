<cfscript>
include '/Inc/header6.cfm'
usrs = exec('usr.list')
selectedUsrid = val(form.usrid ?: '')
sql = 'select 
guessid,usrid,gradeid,actid,actname,qid,qname,ansid,ansname,guessname
from guess
left join grade on guess_grade=gradeid
left join usr on grade_usr=usrid
left join act on grade_act=actid
left join ans on guess_ans=ansid
left join q on ans_q=qid'
if (selectedUsrid) {
	sql &= '
where usrid = :usrid'
}
sql &= '
order by guessid desc'
guess = queryexecute(sql, selectedUsrid ? {usrid: {value: selectedUsrid, cfsqltype: 'cf_sql_integer'}} : {})
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header theme-primary theme-subtle">
		<form method="get">
			<select name="usrid" id="usrid" class="form-control" onchange="this.form.submit()">
				<option value="">All</option>
				<cfloop query="usrs">
					<option value="#usrid#"<cfif usrid eq selectedUsrid> selected</cfif>>#encodeForHtml(firstname)#</option>
				</cfloop>
			</select>
			<input type="hidden" name="id" value="#request.usr.id#">
		</form>
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
				</tr>
			</thead>
			<tbody>
				<cfloop query="guess">
					<tr>
						<td class="text-end">#guessid#</td>
						<td class="text-end"><a href="usr.cfm?usrid=#usrid#">#usrid#</a></td>
						<td class="text-end"><a href="act.cfm?actid=#actid#" title="#encodeForHtmlAttribute(actname)#">#actid#</a></td>
						<td class="text-end"><a href="q.cfm?qid=#qid#" title="#encodeForHtmlAttribute(qname)#">#qid#</a></td>
						<td class="text-end"><a href="ans.cfm?ansid=#ansid#">#ansid#</a></td>
						<td>#ansname#</td>
						<td>#guessname#</td>
						<td class="text-end"><a href="grade.cfm?gradeid=#gradeid#">#gradeid#</a></td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>