<cfscript>
request.body = 'bg-body-tertiary d-flex flex-column min-vh-100'
request.container = 'container-fluid'
if (isDefined('form.reset')) {
	usr('poll.reset_act',form.actid)
}
include '/Inc/header6.cfm'
poll = usr('poll.unanswered', form.actid)
</cfscript>

<cfoutput query="act">
<div class="card" data-earned="#grade.earned#">
	<form class="card-header">
		<button name="reset" class="btn-outline-danger">Reset</button>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</form>
</div>
<div class="sea" id="sea">
	<cfloop query="poll">
		<span class="qname" data-qid="#qid#">#qname#</span>
	</cfloop>
	<div class="launcher" id="launcher"></div>
</div>
<div class="card mt-auto sticky-bottom">
	<div class="card-body d-flex align-items-center gap-3">
		<div id="qdesc" class="flex-grow-1">#poll.qdesc[1]#</div>
		<span class="qdesc-keys text-nowrap" title="Up and down arrows">
			<i class="bi bi-arrow-up"></i>
			<i class="bi bi-arrow-down"></i>
		</span>
	</div>
</div>
<div id="questions" hidden>
	<cfloop query="poll">
		<div data-qid="#qid#">#qdesc#</div>
	</cfloop>
</div>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#actid#">
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
