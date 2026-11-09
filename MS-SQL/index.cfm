<cfscript>
request.title = 'MS-SQL'
request.progress.bar = false
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="card" action="Relationships.cfm">
	<header class="theme-primary theme-subtle">MS-SQL</header>
	<section>
		<button class="btn-link">Relationships</button>
	</section>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
