<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div>
	<article>
		<header class="theme-primary theme-subtle">
		</header>
		<section>
			This program pulls a relevant picture from Wikipedia.
		</section>
	</article>
	<article>
		<section>
			#actdesc#
		</section>
		<footer>
			<a class="btn" href="Terms.cfm?actid=#actid#">Ready!</a>
		</footer>
	</article>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
