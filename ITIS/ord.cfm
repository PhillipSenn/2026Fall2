<cfscript>
request.title = 'ord'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname
	from class
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where classid = :classid",
	{classid: {value: form.classid, cfsqltype: "cf_sql_integer"}}
)
ord = queryExecute(
	"select * from ord where ord_class = :classid order by ordname",
	{classid: {value: form.classid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="family.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">phylum: #path.phylumname#</div>
	<div class="card-header bg-primary-subtle">class: #path.classname#</div>
	<div class="card-body">
		<cfloop query="ord">
			<div>
				<button class="btn-link" name="ordid" value="#ordid#">#ordname#</button>
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
<button class="nav-link" name="actid" value="#actid#" formaction="ord.cfm?classid=#path.classid#">Order</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
