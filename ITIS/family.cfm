<cfscript>
request.title = 'family'
request.progress.bar = false
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname, ordid, ordname
	from ord
	left join class on ord_class = classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where ordid = :ordid",
	{ordid: {value: form.ordid, cfsqltype: "cf_sql_integer"}}
)
family = queryExecute(
	"select * from family where family_ord = :ordid order by familyname",
	{ordid: {value: form.ordid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="genus.cfm">
	<div class="card-header bg-subtle-primary">domain: #path.domainname#</div>
	<div class="card-header bg-subtle-primary">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-subtle-primary">phylum: #path.phylumname#</div>
	<div class="card-header bg-subtle-primary">class: #path.classname#</div>
	<div class="card-header bg-subtle-primary">ord: #path.ordname#</div>
	<div class="card-body">
		<cfloop query="family">
			<div>
				<button class="btn-link" name="familyid" value="#familyid#">#familyname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<button class="nav-link" formaction="domain.cfm">Domain</button>
<button class="nav-link" formaction="kingdom.cfm?domainid=#path.domainid#">Kingdom</button>
<button class="nav-link" formaction="phylum.cfm?kingdomid=#path.kingdomid#">Phylum</button>
<button class="nav-link" formaction="class.cfm?phylumid=#path.phylumid#">Class</button>
<button class="nav-link" formaction="ord.cfm?classid=#path.classid#">Order</button>
<button class="nav-link" formaction="family.cfm?ordid=#path.ordid#">Family</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
