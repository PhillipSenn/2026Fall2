<cfscript>
include '/Inc/header6.cfm'
cat = new dbo.proc().exec('cat.where_cat',act.catid)
q = new dbo.proc().exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<row>
	<div class="col-6 mx-auto">
		<form class="card">
			<header class="theme-primary theme-subtle">
				For classroom discussion
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
	</div>
</row>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>