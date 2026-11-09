<cfscript>
if (isDefined('form.reset')) {
	new dbo.proc().usr('poll.reset_act',form.actid)
}
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form>
	<article>
		<header class="theme-primary theme-subtle">
You are to reword the question, <strong>not answer it</strong>.
			<cfif grade.earned ge 100>
				<button name="reset" class="float-end btn-outline theme-danger">Reset</a>
			</cfif>
		</header>
		<section>
<p class="fg-2">A Flesch-Kincaid Grade Level score is calculated by a combination of words, syllables &amp; sentences:</p>
<blockquote class="fg-2">0.39 * (words / sentences) + 11.8 * (syllables / words) - 15.59</blockquote>
<p>But that's old-school thinking! Today we have AI.
<p>Rewrite the question so AI gives a lower grade and still keeps the meaning.
		</section>
	</article>
	<article>
		<section>
			#actdesc#
		</section>
		<footer>
			<button formaction="Thinking.cfm">Ready!</button>
		</footer>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</article>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
