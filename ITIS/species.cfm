<cfscript>
request.title = 'species'
request.progress.bar = false
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname, ordid, ordname, familyid, familyname, genusid, genusname
	from genus
	left join family on genus_family = familyid
	left join ord on family_ord = ordid
	left join class on ord_class = classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where genusid = :genusid",
	{genusid: {value: form.genusid, cfsqltype: "cf_sql_integer"}}
)
species = queryExecute(
	"select * from species where species_genus = :genusid order by speciesname",
	{genusid: {value: form.genusid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="breed.cfm">
	<div class="card-header bg-subtle-primary">domain: #path.domainname#</div>
	<div class="card-header bg-subtle-primary">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-subtle-primary">phylum: #path.phylumname#</div>
	<div class="card-header bg-subtle-primary">class: #path.classname#</div>
	<div class="card-header bg-subtle-primary">ord: #path.ordname#</div>
	<div class="card-header bg-subtle-primary">family: #path.familyname#</div>
	<div class="card-header bg-subtle-primary">genus: #path.genusname#</div>
	<div class="card-body">
		<cfloop query="species">
			<div>
				<button class="btn-link" name="speciesid" value="#speciesid#">#speciesname#</button>
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
<button class="nav-link" formaction="genus.cfm?familyid=#path.familyid#">Genus</button>
<button class="nav-link" formaction="species.cfm?genusid=#path.genusid#">Species</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
