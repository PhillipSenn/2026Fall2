<cfscript>
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<form method="post" action="marbles.cfm" class="card">
	<header class="theme-primary theme-subtle">
	</header>
	<section>
	</section>
	<footer>
		<button>Ready!</button>
	</footer>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#actid#">
</form>
</cfoutput>
<cfinclude template="/Inc/footer6.cfm">
