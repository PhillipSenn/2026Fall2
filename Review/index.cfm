<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form action="question.cfm">
	<article>
		<header class="theme-primary theme-subtle">
			Review Questions
		</header>
		<section>
			The textbook supplies these review questions, but no answer sheet.
			<p>Don't worry! You'll get a 100 posted into Canvas for having completed this task.
			But in addition, there is a scoring system that should help us come to an agreement as to which answer is best:
			<p>You receive 1 point towards consensus, for your vote and anyone who agrees with you.
		</section>
	</article>
	<article>
		<section>
			#actdesc#
		</section>
		<footer>
			<button>Ready!</button>
		</footer>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</article>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
