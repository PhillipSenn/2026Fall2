<cfscript>
if (isDefined('form.pollname')) {
	usr('poll.merge_q',[form.qid,form.pollname])
}
include '/Inc/header.cfm'
q = usr('poll.unanswered',form.actid)
if (!q.recordcount) {
	location(request.home & '?id=' & request.usr.id,false)
}
poll = usr('poll.start_q',[q.qid,q.qname])
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col">
		<div class="card">
			<div class="card-header bg-primary-subtle">
				Textbook
			</div>
			<div class="card-body">
				<fieldset>
					<legend>Original</legend>
					<p id="qname">#q.qname#</p>
				</fieldset>
			</div>
			<input hidden name="id" value="#request.usr.id#" />
		</div>
	</div>
	<div class="col">
		<form class="card">
			<div class="card-header bg-primary-subtle">
				Flesch-Kincaid Grade Level: <span id="Flesch-Kincaid"></span>
			</div>
			<div class="card-body">
				<fieldset>
					<legend>Your simplified version</legend>
					<textarea autofocus name="pollname" class="form-control" rows="10">#encodeForHTML(poll.pollname)#</textarea>
				</fieldset>
			</div>
			<div class="card-footer">
				<button id="save" class="btn btn-outline-primary" disabled>Save</button>
			</div>
			<input hidden name="actid" value="#actid#">
			<input hidden name="id" value="#request.usr.id#">
			<input hidden name="qid" value="#q.qid#">
		</form>
	</div>
</div>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>