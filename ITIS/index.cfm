<cfscript>
request.title = 'ITIS'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="card" action="domain.cfm">
	<header class="theme-primary theme-subtle">ITIS</header>
	<section>
		<button class="btn-link">Domain</button>
	</section>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
