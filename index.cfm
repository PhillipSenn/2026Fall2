<cfscript>
form.actid=0
include '/Inc/header.cfm'
act = usr('act.where_usr')
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header bg-primary-subtle">
		<button class="btn-link" formaction="toc.cfm?accordion">Table Of Contents (TOC)</button>
	</div>
	<div class="card-body">
		<table>
			<thead>
				<tr>
					<cfif request.usr.isAdmin>
						<th class="text-end">Sort</th>
						<th classs="text-center">Hide</th>
					</cfif>
					<th>Chapter</th>
					<th>Category</th>
					<th>Assignment</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="act">
				<tr data-actid="#actid#">
					<cfif request.usr.isAdmin>
						<td class="text-end actsort" contenteditable>#actsort#</td>
						<td class="text-center isHidden" contenteditable>#isHidden#</td>
					</cfif>
					<td>#grpname#</td>
					<td>#catname#</td>
					<td>
						<button name="actid" formaction="#actlink#" class="btn-link" value="#actid#">#actname#</button>
					</td>
					<td class="text-end">
						<cfif request.usr.isAdmin>
							<button formaction="Admin/act.cfm" name="actid" value="#actid#" class="btn-outline-info">
								#earned#
							</button>
						<cfelse>
							#earned#
						</cfif>
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