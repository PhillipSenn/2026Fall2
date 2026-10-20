<cfscript>
include '/Inc/header6.cfm'
gradeid = val(form.gradeid ?: '')
grade = queryexecute('select *
from grade
where gradeid = :gradeid', {
	gradeid: {value: gradeid, cfsqltype: 'cf_sql_integer'}
})
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header theme-primary theme-subtle">
		gradeid: #gradeid#
	</div>
	<div class="card-body">
		<cfif grade.recordCount>
			<table>
				<tbody>
					<cfloop array="#getMetaData(grade)#" index="col">
						<tr>
							<th class="text-end">#col.name#</th>
							<td>#grade[col.name][1]#</td>
						</tr>
					</cfloop>
				</tbody>
			</table>
		</cfif>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
