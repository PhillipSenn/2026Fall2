<cfscript>
request.title = 'breed'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
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
	{speciesid: {value: form.speciesid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
breed = queryExecute(
	"select * from breed where breed_species = :speciesid order by breedname",
	{speciesid: {value: form.speciesid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
anchor = ''
if (path.speciesname == 'Canis familiaris') {
//	anchor = 'https://breeds.okstate.edu/dogs/'
} else if (path.speciesname == 'Felis catus') {
	anchor = 'https://cfa.org/breed/'
} else if (path.speciesname == 'Equus caballus') {
	anchor = 'https://breeds.okstate.edu/horses/'
} else if (path.speciesname == 'Equus asinus') {
	anchor = 'https://breeds.okstate.edu/other-breeds-of-livestock/donkeys/'
} else if (path.speciesname == 'EBos taurus') {
	anchor = 'https://breeds.okstate.edu/cattle/'
} else if (path.speciesname == 'Capra hircus') {
	anchor = 'https://breeds.okstate.edu/goats/'
} else if (path.speciesname == 'Ovis aries') {
	anchor = 'https://breeds.okstate.edu/sheep/'
} else if (path.speciesname == 'Sus scrofa') {
	anchor = 'https://breeds.okstate.edu/swine/'
} else if (path.genusname == 'Anas') {
	anchor = 'https://breeds.okstate.edu/poultry/ducks/'
}
</cfscript>

<cfoutput query="act">
<form class="card">
	<header class="theme-primary theme-subtle">Domain: #path.domainname#</header>
	<header class="theme-primary theme-subtle">Kingdom: #path.kingdomname#</header>
	<header class="theme-primary theme-subtle">Phylum: #path.phylumname#</header>
	<header class="theme-primary theme-subtle">Class: #path.classname#</header>
	<header class="theme-primary theme-subtle">Order: #path.ordname#</header>
	<header class="theme-primary theme-subtle">Family: #path.familyname#</header>
	<header class="theme-primary theme-subtle">Genus: #path.genusname#</header>
	<header class="theme-primary theme-subtle">Species: #path.speciesname#</header>
	<section>
		<cfloop query="breed">
			<div>
				<cfif len(anchor)>
					<a target="_blank" href="#anchor##replace(lcase(breedname),' ','-','all')#">#breedname#</a>
				<cfelse>
					#breedname#
				</cfif>
			</div>
		</cfloop>
	</section>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
