<cfscript>
//request.body = 'bg-body-tertiary min-vh-100 d-flex flex-column'
//request.container = 'container-sm flex-grow-1 d-flex'
if (structKeyExists(form,'qid')) {
	usr('poll.merge_q',form.qid)
}
include '/Inc/header.cfm'
qs = exec('q.where_act',form.actid)
q = usr('poll.unanswered',form.actid) // Includes all unanswered questions
if (q.recordCount) {
	usr('poll.start_q',q.qid)
	cat = exec('cat.where_cat',act.catid)
}
</cfscript>

<cfoutput query="act">
<cfif q.recordcount>
	<form class="card flex-grow-1">
		<div class="card-header bg-primary-subtle">
			Question #qs.recordcount-q.recordCount+1#/#qs.recordCount#
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-6" id="qname">
					#q.qname#
				</div>
				<div class="col-6">
					<div class="accordion" id="answerAccordion">
						<div class="accordion-item">
							<h2 class="accordion-header">
								<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="##answer">
									Answer
								</button>
							</h2>
							<div id="answer" class="accordion-collapse collapse" data-bs-parent="##answerAccordion">
								<div class="accordion-body">
									<div class="card">
										<div class="card-body" id="ansname"></div>
										<div class="card-footer">
											<button name="qid" value="#q.qid#" class="mt-2">Save</button>
										</div>
										<div class="card-body" id="imgname">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="card-footer">
		</div>
		<input hidden name="actid" value="#form.actid#">
		<input hidden name="id" value="#request.usr.id#">
	</form>
	<div hidden id="catname">#cat.catname#</div>
<cfelse>
	<form class="card">
		<div class="card-header bg-primary-subtle">
			You did it!
			<button class="float-end btn-outline-danger" name="actid" value="#actid#" formaction="reset.cfm">Reset</a>
		</div>
		<div class="card-body">
			<button class="btn-success" formaction="#request.home#">Finished!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
	</form>
</cfif>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>