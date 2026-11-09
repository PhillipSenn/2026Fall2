<cfscript>
request.title = 'phylum'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname
	from kingdom
	join domain on kingdom_domain = domainid
	where kingdomid = :kingdomid",
	{kingdomid: {value: form.kingdomid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
phylum = queryExecute(
	"select * from phylum where phylum_kingdom = :kingdomid order by phylumname",
	{kingdomid: {value: form.kingdomid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="class.cfm">
	<header class="theme-primary theme-subtle">domain: #path.domainname#</header>
	<header class="theme-primary theme-subtle">kingdom: #path.kingdomname#</header>
	<section>
		<cfloop query="phylum">
			<div>
				<button class="btn-link" name="phylumid" value="#phylumid#">#phylumname#</button>
			</div>
		</cfloop>
	</section>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
