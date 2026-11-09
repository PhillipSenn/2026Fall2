<cfscript>
request.body = 'bg-1 d-flex flex-column min-vh-100'
request.container = 'container-fluid'
if (isDefined('form.reset')) {
	new dbo.proc().usr('poll.reset_act',form.actid)
}
include '/Inc/header6.cfm'
poll = new dbo.proc().usr('poll.unanswered', form.actid)
</cfscript>

<cfoutput query="act">
<style>
.qname.fg-danger {
	color: var(--bs-red-600);
}
</style>
<article data-earned="#grade.earned#">
	<header><form>
		<button name="reset" class="btn-outline theme-danger">Reset</button>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</form></header>
</article>
<div class="sea" id="sea">
	<cfloop query="poll">
		<span class="qname" data-qid="#qid#">#qname#</span>
	</cfloop>
	<div class="launcher" id="launcher"></div>
</div>
<article class="mt-auto sticky-bottom">
	<section class="d-flex flex-row align-items-center gap-3">
		<div id="qdesc" class="flex-grow-1">#poll.qdesc[1]#</div>
		<span class="qdesc-keys text-nowrap" title="Up and down arrows">
			<i class="bi bi-arrow-up"></i>
			<i class="bi bi-arrow-down"></i>
		</span>
	</section>
</article>
<div id="questions" hidden>
	<cfloop query="poll">
		<div data-qid="#qid#">#qdesc#</div>
	</cfloop>
</div>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
