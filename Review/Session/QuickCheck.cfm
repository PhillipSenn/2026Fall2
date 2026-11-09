<cfscript>
//request.body = 'bg-1 min-vh-100 d-flex flex-column'
//request.container = 'sm:container flex-grow-1 d-flex'
if (structKeyExists(form,'qid')) {
	new dbo.proc().usr('poll.merge_q',form.qid)
}
include '/Inc/header6.cfm'
qs = new dbo.proc().exec('q.where_act',form.actid)
q = new dbo.proc().usr('poll.unanswered',form.actid) // Includes all unanswered questions
if (q.recordCount) {
	new dbo.proc().usr('poll.start_q',q.qid)
	cat = new dbo.proc().exec('cat.where_cat',act.catid)
	ans = new dbo.proc().exec('ans.where_q',q.qid)
}
</cfscript>

<cfoutput query="act">
<cfif q.recordcount>
	<form class="card flex-grow-1">
		<header class="theme-primary theme-subtle">
			Question #qs.recordcount-q.recordCount+1#/#qs.recordCount#
		</header>
		<section>
			<row>
				<div class="col-6" id="qname">
					#q.qname#
				</div>
				<div class="col-6">
					<div class="accordion">
						<details class="accordion-item" name="answers" id="answer">
							<summary class="accordion-header">
								Groq's answer
								<svg class="accordion-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m2 5 6 6 6-6"/></svg>
							</summary>
							<div class="accordion-body">
								<article>
									<section id="ansname"></section>
									<footer>
										<button name="qid" value="#q.qid#" class="mt-2">Save</button>
									</footer>
									<section id="imgname">
									</section>
								</article>
							</div>
						</details>
						<details class="accordion-item" name="answers">
							<summary class="accordion-header">
								Textbook's answer
								<svg class="accordion-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round"><path d="m2 5 6 6 6-6"/></svg>
							</summary>
							<div class="accordion-body">
								<article>
									<section>
										#ans.ansname#
									</section>
									<footer>
										<button name="qid" value="#q.qid#" class="mt-2">Save</button>
									</footer>
								</article>
							</div>
						</details>
					</div>
				</div>
			</row>
		</section>
		<input hidden name="actid" value="#form.actid#">
		<input hidden name="id" value="#request.usr.id#">
	</form>
	<div hidden id="catname">#cat.catname#</div>
<cfelse>
	<form class="card">
		<header class="theme-primary theme-subtle">
			You did it!
			<button class="float-end btn-outline theme-danger" name="actid" value="#actid#" formaction="reset.cfm">Reset</a>
		</header>
		<section>
			<button class="theme-success" formaction="#request.home#">Finished!</button>
		</section>
		<input hidden name="id" value="#request.usr.id#">
	</form>
</cfif>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>