<cfscript>
if (StructKeyExists(form,'ansid')) {
	new dbo.proc().usr('guess.merge_keyterm',form.ansid)
}
q = new dbo.proc().usr('q.keyTerms',form.actid) // All the unanswered questions that have > 1 available answers
if (!q.recordCount) {
	location url=request.home;
}
include '/Inc/header.cfm'
qs = new dbo.proc().exec('q.where_ans_gt_1',form.actid) // All the questions that have > 1 available answers.
ans = new dbo.proc().exec('ans.where_q',q.qid)
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header bg-primary-subtle display-6">
		#q.qname#
		<div class="float-end">
			#qs.recordCount-q.recordCount+1# / #qs.recordCount#
		</div>
	</div>
	<div class="card-body">
		#Replace(q.qdesc,'. ','.<br>','all')#
	</div>
</div>
<form class="card" id="slideDown">
	<div class="card-body">
		<div class="row g-3">
			<cfloop query="ans">
				<cfif Left(ansdesc,3) eq "en/">
					<cfset src = 'https://upload.wikimedia.org/wikipedia/' & ansdesc>
				<cfelse>
					<cfset src = 'https://upload.wikimedia.org/wikipedia/commons/' & ansdesc>
				</cfif>
				<cfset fragment = q.qhref & '##:~:text=' & URLEncodedFormat(ansname)>
				<div class="col-6 col-md-4 col-lg-3">
					<figure>
						<button name="ansid" value="#ansid#" class="bg-transparent">
							<img src="#src#" class="img-thumbnail">
						</button>
						<figcaption>
							<a target="_blank" href="#fragment#"
							class="link-dark link-underline-opacity-0 link-underline-opacity-75-hover">
								#ansname#
							</a>
						</figcaption>
					</figure>
				</div>
			</cfloop>
		</div>
	</div>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<a class="nav-link" href="#request.script_name#">#actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>