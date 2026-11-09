<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form action="Drop.cfm">
	<article>
		<header class="theme-primary theme-subtle">
		</header>
		<section>
			Drag-and-Drop
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
