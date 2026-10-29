<cfscript>
request.title = 'kingdom'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname
	from domain
	where domainid = :domainid",
	{domainid: {value: form.domainid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
kingdom = queryExecute(
	"select * from kingdom where kingdom_domain = :domainid order by kingdomname",
	{domainid: {value: form.domainid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="phylum.cfm">
	<div class="card-header theme-primary theme-subtle">domain: #path.domainname#</div>
	<div class="card-body">
		<cfloop query="kingdom">
			<div>
				<button class="btn-link" name="kingdomid" value="#kingdomid#">#kingdomname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
