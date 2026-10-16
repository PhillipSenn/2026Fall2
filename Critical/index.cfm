<cfscript>
if (isDefined('form.reset')) {
	usr('poll.reset_act',form.actid)
}
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form>
	<div class="card">
		<div class="card-header bg-primary-subtle">
You are to reword the question, <strong>not answer it</strong>.
			<cfif grade.earned ge 100>
				<button name="reset" class="float-end btn-outline-danger">Reset</a>
			</cfif>
		</div>
		<div class="card-body">
<p class="text-muted">A Flesch-Kincaid Grade Level score is calculated by a combination of words, syllables &amp; sentences:</p>
<blockquote class="text-muted">0.39 * (words / sentences) + 11.8 * (syllables / words) - 15.59</blockquote>
<p>But that's old-school thinking! Today we have AI.
<p>Rewrite the question so AI gives a lower grade and still keeps the meaning.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<button formaction="Thinking.cfm">Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
