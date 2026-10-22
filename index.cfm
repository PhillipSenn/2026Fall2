<cfscript>
form.actid=0
include '/Inc/header6.cfm'
flush;
act = usr('act.where_usr')
listView = structKeyExists(form, 'view') && form.view == 'list'
sections = [{title: 'New', low: 0, high: 9999, open: false, blank: true}]
for (band = 1; band <= 10; band++) {
	arrayAppend(sections, {
		title: 'Week ' & band,
		low: band * 10000,
		high: band * 10000 + 9999,
		open: band == 3
	})
}
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header">
		<div class="btn-group" role="group" aria-label="View">
			<button name="view" value="accordion" formaction="index.cfm"<cfif listView> class="btn-outline theme-secondary"</cfif>>Focused</button>
			<button name="view" value="list" formaction="index.cfm?view=list"<cfif !listView> class="btn-outline theme-secondary"</cfif>>List View</button>
		</div>
	</div>
	<div class="card-body">
		<cfif listView>
			<a href="toc.cfm?accordion">Table Of Contents (TOC)</a>
			<table>
				<thead>
					<tr>
						<cfif request.usr.isAdmin>
							<th classs="text-center">Hide</th>
							<th class="text-end">Sort</th>
						</cfif>
						<th>Chapter</th>
						<th>Assignment</th>
						<th>Category</th>
						<th class="text-end">Earned</th>
					</tr>
				</thead>
				<cfloop query="act">
					<tr data-actid="#actid#">
						<cfif request.usr.isAdmin>
							<td class="text-center isHidden" contenteditable>#isHidden#</td>
							<td class="text-end actsort" contenteditable>#actsort#</td>
						</cfif>
						<td>#grpname#</td>
						<td>
							<a href="#actlink#?actid=#actid#">#actname#</a>
						</td>
						<td>#catname#</td>
						<td class="text-end">
							<cfif request.usr.isAdmin>
								<button formaction="Admin/act.cfm" name="actid" value="#actid#" class="btn-outline theme-info">
									#earned#
								</button>
							<cfelse>
								#earned#
							</cfif>
						</td>
					</tr>
				</cfloop>
			</table>
		<cfelse>
		<div class="accordion">
			<cfloop array="#sections#" index="section">
				<cfset low = section.low>
				<cfset high = section.high>
				<cfset where = "actsort >= :low AND actsort <= :high">
				<cfif structKeyExists(section, "blank")>
					<cfset where = "(" & where & ") OR actsort IS NULL">
				</cfif>
				<cfset rows = queryExecute(
					"SELECT * FROM act WHERE #where# ORDER BY isHidden, actsort, actid",
					{
						low: {value: low, cfsqltype: "cf_sql_integer"},
						high: {value: high, cfsqltype: "cf_sql_integer"}
					},
					{dbtype: "query"}
				)>
				<details class="accordion-item" name="assignments"<cfif section.open> open</cfif>>
					<summary class="accordion-header">
						#section.title#
					</summary>
					<div class="accordion-body">
						<table>
							<thead>
								<tr>
									<cfif request.usr.isAdmin>
										<th classs="text-center">Hide</th>
										<th class="text-end">Sort</th>
									</cfif>
									<th>Chapter</th>
									<th>Assignment</th>
									<th>Category</th>
									<th class="text-end">Earned</th>
								</tr>
							</thead>
							<cfloop query="rows">
								<tr data-actid="#actid#">
									<cfif request.usr.isAdmin>
										<td class="text-center isHidden" contenteditable>#isHidden#</td>
										<td class="text-end actsort" contenteditable>#actsort#</td>
									</cfif>
									<td>#grpname#</td>
									<td>
										<a href="#actlink#?actid=#actid#">#actname#</a>
									</td>
									<td>#catname#</td>
									<td class="text-end">
										<cfif request.usr.isAdmin>
											<button formaction="Admin/act.cfm" name="actid" value="#actid#" class="btn-outline theme-info">
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
				</details>
			</cfloop>
		</div>
		</cfif>
	</div>
	<cfif request.usr.isAdmin>
		<div class="card-footer">
			<button formaction="Debug/guess.cfm">Guess</button>
		</div>
	</cfif>
	<input hidden name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
