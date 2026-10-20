<cfscript>
include '/Inc/header6.cfm'
act = usr('act.where_cat', act.catid)
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-body">
		<table>
			<thead>
				<tr>
					<th>Assignment</th>
					<th>Group</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="act">
				<tr>
					<td>
						<a href="#request.home##actlink#?id=#request.usr.id#&actid=#actid#">#actname#</a>
					</td>
					<td>
						#grpname#
					</td>
					<td class="text-end">
						#earned#
					</td>
				</tr>
			</cfloop>
		</table>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
