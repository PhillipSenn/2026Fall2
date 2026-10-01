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

<cfoutput>
<form class="card">
	<cfif q.recordcount>
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			<div class="row">
				<div id="qname" class="col-4 d-flex align-items-center h4">
					#q.qname#
				</div>
				<div class="col-8 border-start">
					<cfloop query="ans">
						<div class="form-check">
							<input class="form-check-input me-2" type="radio" name="ansid" value="#ansid#" id="ans#ansid#">
							<label class="form-check-label" for="ans#ansid#">
								#ansname#
							</label>
							<cfif len(q.qdesc)>
								<img src="#q.qdesc#" width="100px">
							<cfelseif ansname eq "False">
							<cfelse>
								<img class="ai cursor-pointer" src="NoPictureAvailable.jpg" width="100px">
								<img class="ai cursor-pointer" src="NoPictureAvailable.jpg" width="100px">
								<img class="ai cursor-pointer" src="NoPictureAvailable.jpg" width="100px">
								<img class="ai cursor-pointer" src="NoPictureAvailable.jpg" width="100px">
								<img class="ai cursor-pointer" src="NoPictureAvailable.jpg" width="100px">
							</cfif>
						</div>
					</cfloop>
				</div>
			</div>
		</div>
		<div class="card-footer">
			<textarea autofocus name="guessname"></textarea>
		</div>
	<cfelse>
		<div class="card-header bg-primary">
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
<a class="nav-link active" href="#request.scriptname#">Review Question: #act.actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>