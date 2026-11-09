<cfscript>
if (isDefined('form.pollname')) {
	new dbo.proc().usr('poll.merge_q',[form.qid,form.pollname])
}
include '/Inc/header6.cfm'
cat = new dbo.proc().exec('cat.where_cat',act.catid)
q = new dbo.proc().usr('poll.unanswered',form.actid)
if (!q.recordcount) {
	location(request.home, false)
}
poll = new dbo.proc().usr('poll.start_q',[q.qid,q.qname])
</cfscript>

<cfoutput query="act">
<row>
	<div class="col">
		<article>
			<header class="theme-primary theme-subtle">
				Textbook AI grade: <span id="original-grade"></span>
			</header>
			<section>
				<fieldset>
					<legend>Original</legend>
					<p id="qname">#encodeForHTML(q.qname)#</p>
				</fieldset>
				<input hidden id="original" value="#encodeForHTMLAttribute(q.qname)#">
			</section>
			<input hidden name="id" value="#request.usr.id#" />
		</article>
	</div>
	<form class="col">
		<article>
			<header class="theme-primary theme-subtle fg-2">
				Flesch-Kincaid Grade: <span id="Flesch-Kincaid"></span> (not used)
			</header>
			<section>
				<fieldset>
					<legend>Your simplified version</legend>
					<textarea autofocus name="pollname" class="form-control" rows="10">#encodeForHTML(poll.pollname)#</textarea>
				</fieldset>
			</section>
		</article>
		<article>
			<section>
				<div id="ai-feedback" hidden>
					<p>AI Grade Level: <span id="ai-grade"></span></p>
					<p>Meaning preserved: <span id="ai-meaning"></span></p>
					<p id="ai-reason"></p>
					<p>Difficult words: <span id="ai-words"></span></p>
				</div>
			</section>
			<footer>
				<button type="button" id="askAI" class="btn btn-outline theme-secondary me-2" disabled>Ask AI</button>
				<button id="save" class="btn btn-outline theme-primary" disabled>Save</button>
			</footer>
			<input hidden name="actid" value="#actid#">
			<input hidden name="id" value="#request.usr.id#">
			<input hidden name="qid" value="#q.qid#">
			<input hidden id="isAdmin" value="#val(request.usr.isAdmin)#">
		</article>
	</form>
</row>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>