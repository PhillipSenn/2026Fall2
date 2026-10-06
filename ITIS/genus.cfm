<cfscript>
request.title = 'genus'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname, ordid, ordname, familyid, familyname
	from family
	left join ord on family_ord = ordid
	left join class on ord_class = classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where familyid = :familyid",
	{familyid: {value: form.familyid, cfsqltype: "cf_sql_integer"}}
)
genus = queryExecute(
	"select * from genus where genus_family = :familyid order by genusname",
	{familyid: {value: form.familyid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="species.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">phylum: #path.phylumname#</div>
	<div class="card-header bg-primary-subtle">class: #path.classname#</div>
	<div class="card-header bg-primary-subtle">ord: #path.ordname#</div>
	<div class="card-header bg-primary-subtle">family: #path.familyname#</div>
	<div class="card-body">
		<cfloop query="genus">
			<div>
				<button class="btn-link" name="genusid" value="#genusid#">#genusname#</button>
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
<button class="nav-link" name="actid" value="#actid#" formaction="family.cfm?ordid=#path.ordid#">Family</button>
<button class="nav-link" name="actid" value="#actid#" formaction="genus.cfm?familyid=#path.familyid#">Genus</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
