<cfscript>
include '/Inc/header6.cfm'
q = new dbo.proc().exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<form class="card">
	<header class="theme-primary theme-subtle">
		To be discussed aloud
	</header>
</form>
<cfloop query="q">
	<article>
		<section>
			#qname#
		</section>
	</article>
</cfloop>
<input hidden name="actid" value="#actid#">
<input hidden name="id" value="#request.usr.id#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>