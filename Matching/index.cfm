<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div action="matching.cfm">
	<article>
		<header class="theme-primary theme-subtle">
		</header>
		<section>
			I'm trying to make this course a little better than reading a textbook, so pick a keyword on the left and it's description on the right.
			<p>Or the description first and then find its keyword.</p>
		</section>
	</article>
	<article>
		<section>
			#actdesc#
		</section>
		<footer>
			<a class="btn" href="matching.cfm?actid=#actid#">Ready!</a>
		</footer>
	</article>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
