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
			<cfif grade.earned ge 100>
				<button name="reset" class="float-end btn-outline-danger">Reset</a>
			</cfif>
		</div>
		<div class="card-body">
<p>You are to reword the question, <strong>not answer it</strong>.
<p>A Flesch-Kincaid Grade Level score is calculated by a combination of words, syllables &amp; sentences:</p>
<blockquote>0.39 * (words / sentences) + 11.8 * (syllables / words) - 15.59</blockquote>
<p>You are to change the textbook's wording so that it has a Flesch-Kincaid Grade Level score between 4-8.
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
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
