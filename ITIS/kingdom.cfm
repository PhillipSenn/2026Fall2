<cfscript>
request.title = 'kingdom'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainname
	from domain
	where domainid = :domainid",
	{domainid: {value: form.domainid, cfsqltype: "cf_sql_integer"}}
)
kingdom = queryExecute(
	"select * from kingdom where kingdom_domain = :domainid order by kingdomname",
	{domainid: {value: form.domainid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput>
<form class="card" action="phylum.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
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
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
