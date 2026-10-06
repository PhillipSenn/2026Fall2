<cfscript>
request.title = 'breed'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainid,domainname
		,kingdomid,kingdomname
		,phylumid,phylumname
		,classid,classname
		,ordid,ordname
		,familyid,familyname
		,genusid,genusname
		,speciesid,speciesname
	from species
	left join genus on species_genus = genusid
	left join family on genus_family = familyid
	left join ord on family_ord = ordid
	left join class on ord_class = classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where speciesid = :speciesid",
	{speciesid: {value: form.speciesid, cfsqltype: "cf_sql_integer"}}
)
breed = queryExecute(
	"select * from breed where breed_species = :speciesid order by breedname",
	{speciesid: {value: form.speciesid, cfsqltype: "cf_sql_integer"}}
)
anchor = ''
if (path.speciesname == 'Equus caballus') {
	anchor = 'https://breeds.okstate.edu/horses/'
}
</cfscript>

<cfoutput query="act">
<form class="card">
	<div class="card-header bg-primary-subtle">Domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">Kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">Phylum: #path.phylumname#</div>
	<div class="card-header bg-primary-subtle">Class: #path.classname#</div>
	<div class="card-header bg-primary-subtle">Order: #path.ordname#</div>
	<div class="card-header bg-primary-subtle">Family: #path.familyname#</div>
	<div class="card-header bg-primary-subtle">Genus: #path.genusname#</div>
	<div class="card-header bg-primary-subtle">Species: #path.speciesname#</div>
	<div class="card-body">
		<cfloop query="breed">
			<div>
				<cfif len(anchor)>
					<a target="_blank" href="#anchor##replace(lcase(breedname),' ','-','all')#">#breedname#</a>
				<cfelse>
					#breedname#
				</cfif>
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
<button class="nav-link" name="actid" value="#actid#" formaction="species.cfm?genusid=#path.genusid#">Species</button>
<button class="nav-link" name="actid" value="#actid#" formaction="breed.cfm?speciesid=#path.speciesid#">Breed</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
