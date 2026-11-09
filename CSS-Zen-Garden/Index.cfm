<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
	</header>
	<section>

	</section>
	<footer>
		<button>Save</button>
	</footer>
	<input hidden name="id" value="#request.usr.id#" />
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>