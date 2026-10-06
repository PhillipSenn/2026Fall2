<cfscript>
include '/Inc/header.cfm'
act = usr('act.where_usr')
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header bg-primary-subtle">
		
	</div>
	<div class="card-body">
		<button class="btn-link" formaction="toc.cfm?accordion">Table Of Contents (TOC)</button>
		<table>
			<thead>
				<tr>
					<th class="text-end">Sort</th>
					<th>Chapter</th>
					<th>Category</th>
					<th>Assignment</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="act">
				<tr data-actid="#actid#">
					<td class="text-end" contenteditable>#actsort#</td>
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