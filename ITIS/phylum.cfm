<cfscript>
request.title = 'phylum'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname
	from kingdom
	join domain on kingdom_domain = domainid
	where kingdomid = :kingdomid",
	{kingdomid: {value: form.kingdomid, cfsqltype: "cf_sql_integer"}}
)
phylum = queryExecute(
	"select * from phylum where phylum_kingdom = :kingdomid order by phylumname",
	{kingdomid: {value: form.kingdomid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="class.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-body">
		<cfloop query="phylum">
			<div>
				<button class="btn-link" name="phylumid" value="#phylumid#">#phylumname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<button class="nav-link" name="actid" value="#actid#" formaction="domain.cfm">Domain</button>
<button class="nav-link" name="actid" value="#actid#" formaction="kingdom.cfm?domainid=#path.domainid#">Kingdom</button>
<button class="nav-link" name="actid" value="#actid#" formaction="phylum.cfm?kingdomid=#path.kingdomid#">Phylum</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
