<cfscript>
include '/Inc/header.cfm'
qs = new dbo.proc().exec('q.where_act',form.actid) // All questions
keyTerms = new dbo.proc().usr('poll.unanswered',form.actid) // order by qsort,qid
unanswered = new dbo.proc().usr('poll.unanswered_keyTerms',form.actid) 
	// All unanswered questions
	// with top voted setup image for each question
	// order by newid()
if (unanswered.recordCount) {
	new dbo.proc().usr('poll.start_q',unanswered.qid)
	cat = new dbo.proc().exec('cat.where_cat',act.catid)
}
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
		<cfif unanswered.recordcount>
			<div id="unanswered" class="row">
				<div class="col-8">
					<div class="row" id="slider">
						<div class="col-8 h3">
						</div>
						<div class="col-4">
							<figure>
								<a class="wikipedia-article" href="JavaScript:" target="_blank">
									<img id="ansdesc" class="rounded img-thumbnail">
								</a>
								<figcaption>
									<a class="wikipedia-article" href="JavaScript:">Wikipedia</a> <!--- ansname is the caption --->
								</figcaption>
							</figure>
						</div>
					</div>
				</div>
				<div class="col-4">
					<cfloop query="keyTerms">
						<!--- This is the list of key terms --->
						<button type="button" class="btn-outline-primary d-block mb-2 keyTerm#qid#" value="#qid#">#qname#</button>
					</cfloop>
				</div>
			</div>
		</cfif>
		<table id="all" class="d-none">
			<thead>
				<tr>
					<th class="text-end">Row</th>
					<th>Key Term</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="qs">
					<tr>
						<td class="text-end">#currentRow#</td>
						<td>#qname#</td>
						<td>#qdesc#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</form>
<div hidden>
	<cfloop query="unanswered">
		<cfif Left(ansdesc,3) eq "en/">
			<cfset src = 'https://upload.wikimedia.org/wikipedia/' & ansdesc>
		<cfelse>
			<cfset src = 'https://upload.wikimedia.org/wikipedia/commons/' & ansdesc>
		</cfif>
		<!---
		<cfset fragment = q.qhref & '##:~:text=' & URLEncodedFormat(ansname)>
		--->
		<div class="qid">#qid#</div>
		<div class="qname">#qname#</div>
		<div class="qdesc">#qdesc#</div>
		<div class="qhref">#qhref#</div>
		<div class="ansdesc">#src#</div>
	</cfloop>
</div>
<a class="nav-link" href="#request.script_name#">#actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>