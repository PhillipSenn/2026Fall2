<cfscript>
if (StructKeyExists(form,'ansid')) {
	new dbo.proc().usr('guess.merge_ans_name',[form.ansid,form.guessname])
}
include '/Inc/header.cfm'
q = new dbo.proc().usr('q.unanswered',form.actid)
if (q.recordcount) {
	ans = new dbo.proc().exec('ans.where_q',q.qid)
}

</cfscript>

<cfoutput query="act">
<form class="card">
	<cfif q.recordcount>
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			<div class="row">
				<div class="col-4 d-flex align-items-center h4" id="qname">
					#q.qname#
				</div>
				<div class="col-4 border-start">
					<cfloop query="ans">
						<div class="col-12 form-check">
							<input class="form-check-input me-2" type="radio" name="ansid" value="#ansid#" id="ans#ansid#">
							<label class="form-check-label" for="ans#ansid#">
								#ansname#
							</label>
						</div>
					</cfloop>
				</div>
				<div id="ai_images" class="col-4 border-start">
				</div>
			</div>
		</div>
		<div class="card-footer">
			<textarea autofocus name="guessname"></textarea>
		</div>
	<cfelse>
		<div class="card-header bg-success">
			Congratulations!
		</div>
		<div class="card-body display-1">
			You did it!
		</div>
		<div class="card-footer">
			<button formaction="questions.cfm" class="btn-success">Finished!</button>
		</div>
	</cfif>
	<input hidden name="actid" value="#form.actid#">
	<input hidden id="qid" value="#q.qid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<script src="/Inc/js/autosize.js"></script>
<script src="#request.home#Inc/js/cleanText.js"></script>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>