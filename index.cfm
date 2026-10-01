<cfscript>
include '/Inc/header.cfm'
//act = new dbo.proc().usr('act.where_usr')
cfstoredproc (procedure="act.where_usr") {
	cfprocparam(cfsqltype="cf_sql_varchar", value=request.usr.id)
	cfprocresult(name='act')
}
</cfscript>

<cfoutput>
<form class="card" method="post">
	<div class="card-header bg-primary-subtle">
		
	</div>
	<div class="card-body">
		<a href="toc.cfm?accordion">Table Of Contents (TOC)</a>
		<table>
			<thead>
				<tr>
					<th>Chapter</th>
					<th>Category</th>
					<th>Assignment</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="act">
				<tr>
					<td>#grpname#</td>
					<td>#catname#</td>
					<td>
						<button name="actid" formaction="#actlink#" class="btn-link" value="#actid#">#actname#</button>
					</td>
					<td class="text-end">
						#earned#
					</td>
				</tr>
			</cfloop>
		</table>
	</div>
	<div class="card-footer">
		<button formaction="Debug/guess.cfm">Guess</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>