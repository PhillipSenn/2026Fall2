<cfscript>
include '/Inc/header6.cfm'
cat = new dbo.proc().usr('act.where_cat', act.catid)
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header theme-primary theme-subtle">
	</div>
	<div class="card-body">
		<table>
			<thead>
				<tr>
					<th>Chapter</th>
					<th>Assignment</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="cat">
				<tr>
					<td>
						#grpname#
					</td>
					<td>
						<a href="#request.home##actlink#?id=#request.usr.id#&actid=#actid#">#actname#</a>
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
