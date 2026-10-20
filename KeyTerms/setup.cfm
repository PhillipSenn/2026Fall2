<cfscript>
if (StructKeyExists(form,'ansid')) {
	usr('guess.merge_keyterm',form.ansid)
}
q = usr('q.keyTerms',form.actid) // All the unanswered questions that have > 1 available answers
if (!q.recordCount) {
	location(request.home, false)
}
include '/Inc/header6.cfm'
qs = exec('q.where_ans_gt_1',form.actid) // All the questions that have > 1 available answers.
ans = exec('ans.where_q',q.qid)
</cfscript>

<cfoutput query="act">
<style>
#slideDown figcaption a.hover\:underline-80:hover {
	text-decoration-line: underline;
}
</style>
<div class="card">
	<div class="card-header theme-primary theme-subtle fs-3xl fw-light">
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
				<div class="col-6 md:col-4 lg:col-3">
					<figure>
						<button name="ansid" value="#ansid#" class="bg-transparent">
							<img src="#src#" class="img-thumbnail">
						</button>
						<figcaption>
							<a target="_blank" href="#fragment#"
							class="fg-body text-decoration-none hover:underline-80">
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
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>