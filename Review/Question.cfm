<cfscript>
if (StructKeyExists(form,'ansid')) {
	new dbo.proc().usr('guess.merge_ans_name',[form.ansid,form.guessname])
}
include '/Inc/header6.cfm'
q = new dbo.proc().usr('q.unanswered',form.actid)
if (q.recordcount) {
	ans = new dbo.proc().exec('ans.where_q',q.qid)
}
</cfscript>

<cfoutput query="act">
<form class="card">
	<cfif q.recordcount>
		<div class="card-header theme-primary theme-subtle">
			Review Questions
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-4 d-flex xalign-items-centerx h4" id="qname">
					#q.qname#
				</div>
				<div class="col-4 border-start">
					<cfloop query="ans">
						<div class="col-12 form-field">
							<input class="radio" type="radio" name="ansid" value="#ansid#" id="ans#ansid#">
							<label for="ans#ansid#">
								#ansname#
							</label>
						</div>
					</cfloop>
				</div>
				<div id="ai_images" class="col-4 border-start">
					<cfif len(q.qdesc)>
						<img id="qdesc" src="#q.qdesc#" class="img-fluid">
					</cfif>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<textarea autofocus name="guessname"></textarea>
		</div>
	<cfelse>
		<div class="card-header theme-primary theme-subtle">
			Review Questions
			<button class="float-end btn-outline theme-danger" formaction="reset.cfm">Reset</button>
		</div>
		<div class="card-body fs-6xl fw-light">
			You did it!
		</div>
		<div class="card-footer">
			<button formaction="questions.cfm" class="btn-solid theme-success">Finished!</button>
		</div>
	</cfif>
	<input hidden name="actid" value="#form.actid#">
	<input hidden id="qid" value="#q.qid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<script src="/Inc/js/autosize.js"></script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>