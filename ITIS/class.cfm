<cfscript>
request.title = 'class'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname
	from phylum
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where phylumid = :phylumid",
	{phylumid: {value: form.phylumid, cfsqltype: "cf_sql_integer"}}
)
class = queryExecute(
	"select * from class where class_phylum = :phylumid order by classname",
	{phylumid: {value: form.phylumid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="ord.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">phylum: #path.phylumname#</div>
	<div class="card-body">
		<cfloop query="class">
			<div>
				<button class="btn-link" name="classid" value="#classid#">#classname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<button class="nav-link" name="actid" value="#actid#" formaction="domain.cfm">Domain</button>
<button class="nav-link" name="actid" value="#actid#" formaction="kingdom.cfm?domainid=#path.domainid#">Kingdom</button>
<button class="nav-link" name="actid" value="#actid#" formaction="phylum.cfm?kingdomid=#path.kingdomid#">Phylum</button>
<button class="nav-link" name="actid" value="#actid#" formaction="class.cfm?phylumid=#path.phylumid#">Class</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
