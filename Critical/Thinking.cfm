<cfscript>
if (isDefined('form.pollname')) {
	usr('poll.merge_q',[form.qid,form.pollname])
}
include '/Inc/header6.cfm'
cat = exec('cat.where_cat',act.catid)
q = usr('poll.unanswered',form.actid)
if (!q.recordcount) {
	location('../home.cfm?id=' & request.usr.id, false)
}
poll = usr('poll.start_q',[q.qid,q.qname])
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col">
		<div class="card">
			<div class="card-header bg-subtle-primary">
				Textbook AI grade: <span id="original-grade"></span>
			</div>
			<div class="card-body">
				<fieldset>
					<legend>Original</legend>
					<p id="qname">#encodeForHTML(q.qname)#</p>
				</fieldset>
				<input hidden id="original" value="#encodeForHTMLAttribute(q.qname)#">
			</div>
			<input hidden name="id" value="#request.usr.id#" />
		</div>
	</div>
	<form class="col">
		<div class="card">
			<div class="card-header bg-subtle-primary text-muted">
				Flesch-Kincaid Grade: <span id="Flesch-Kincaid"></span> (not used)
			</div>
			<div class="card-body">
				<fieldset>
					<legend>Your simplified version</legend>
					<textarea autofocus name="pollname" class="form-control" rows="10">#encodeForHTML(poll.pollname)#</textarea>
				</fieldset>
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<div id="ai-feedback" hidden>
					<p>AI Grade Level: <span id="ai-grade"></span></p>
					<p>Meaning preserved: <span id="ai-meaning"></span></p>
					<p id="ai-reason"></p>
					<p>Difficult words: <span id="ai-words"></span></p>
				</div>
			</div>
			<div class="card-footer">
				<button type="button" id="askAI" class="btn btn-outline theme-secondary me-2" disabled>Ask AI</button>
				<button id="save" class="btn btn-outline theme-primary" disabled>Save</button>
			</div>
			<input hidden name="actid" value="#actid#">
			<input hidden name="id" value="#request.usr.id#">
			<input hidden name="qid" value="#q.qid#">
			<input hidden id="isAdmin" value="#val(request.usr.isAdmin)#">
		</div>
	</form>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>