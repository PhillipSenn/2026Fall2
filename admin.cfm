<cfscript>
if (!request.usr.isAdmin) {
	writeOutput("Not and admin")
	abort;
}
form.actid=0
include '/Inc/header6.cfm'
flush;
act = new dbo.proc().usr('act.where_usr')
grp = new dbo.proc().exec('grp.list')
cat = new dbo.proc().exec('cat.list')

listView = structKeyExists(form, 'view') && form.view == 'list'
sections = [{title: 'New', low: 0, high: 9999, open: false, blank: true}]
for (band = 1; band <= 10; band++) {
	arrayAppend(sections, {
		title: 'Week ' & band,
		low: band * 10000,
		high: band * 10000 + 9999,
		open: band == 5
	})
}
</cfscript>

<cfoutput>
<form class="card">
	<header>
		<div class="btn-group" role="group" aria-label="View">
			<button name="view" value="accordion" formaction="index.cfm"<cfif listView> class="btn-outline theme-secondary"</cfif>>Focused</button>
			<button name="view" value="list" formaction="index.cfm?view=list"<cfif !listView> class="btn-outline theme-secondary"</cfif>>List View</button>
		</div>
	</header>
	<section>
		<cfif listView>
			<a href="toc.cfm?accordion">Table Of Contents (TOC)</a>
			<table>
				<thead>
					<tr>
						<th classs="text-center">Hide</th>
						<th class="text-end">Sort</th>
						<th>Chapter</th>
						<th>Assignment</th>
						<th>Category</th>
						<th class="text-end">Earned</th>
					</tr>
				</thead>
				<cfloop query="act">
					<tr data-actid="#actid#">
						<td class="text-center isHidden" contenteditable>#isHidden#</td>
						<td class="text-end actsort" contenteditable>#actsort#</td>
						<td>
							<select class="grpname form-control">
								<option value=""<cfif !len(act.grpname)> selected</cfif>></option>
								<cfloop query="grp">
									<option value="#grp.grpid#"<cfif grp.grpname EQ act.grpname> selected</cfif>>#grp.grpname#</option>
								</cfloop>
							</select>
						</td>
						<td>
							<a href="#actlink#?actid=#actid#">#actname#</a>
						</td>
						<td>
							<select class="catname form-control">
								<option value=""<cfif !len(act.catname)> selected</cfif>></option>
								<cfloop query="cat">
									<option value="#cat.catid#"<cfif cat.catname EQ act.catname> selected</cfif>>#cat.catname#</option>
								</cfloop>
							</select>
						</td>
						<td class="text-end">
							<button formaction="Admin/act.cfm" name="actid" value="#actid#" class="btn-outline theme-info">
								#earned#
							</button>
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
									<th classs="text-center">Hide</th>
									<th class="text-end">Sort</th>
									<th>Chapter</th>
									<th>Assignment</th>
									<th>Category</th>
									<th class="text-end">Earned</th>
								</tr>
							</thead>
							<cfloop query="rows">
								<tr data-actid="#actid#">
									<td class="text-center isHidden" contenteditable>#isHidden#</td>
									<td class="text-end actsort" contenteditable>#actsort#</td>
									<td>
										<select class="grpname form-control">
											<option value=""<cfif !len(rows.grpname)> selected</cfif>></option>
											<cfloop query="grp">
												<option value="#grp.grpid#"<cfif grp.grpname EQ rows.grpname> selected</cfif>>#grp.grpname#</option>
											</cfloop>
										</select>
									</td>
									<td>
										<a href="#actlink#?actid=#actid#">#actname#</a>
									</td>
									<td>
										<select class="catname form-control">
											<option value=""<cfif !len(rows.catname)> selected</cfif>></option>
											<cfloop query="cat">
												<option value="#cat.catid#"<cfif cat.catname EQ rows.catname> selected</cfif>>#cat.catname#</option>
											</cfloop>
										</select>
									</td>
									<td class="text-end">
										<button formaction="Admin/act.cfm" name="actid" value="#actid#" class="btn-outline theme-info">
											#earned#
										</button>
									</td>
								</tr>
							</cfloop>
						</table>
					</div>
				</details>
			</cfloop>
		</div>
		</cfif>
	</section>
	<footer>
		<button formaction="Debug/guess.cfm">Guess</button>
	</footer>
	<input hidden name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
