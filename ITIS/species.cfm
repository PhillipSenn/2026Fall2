<cfscript>
request.title = 'species'
request.progress.bar = false
param form.actid=323;
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
	{genusid: {value: form.genusid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
species = queryExecute(
	"select * from species where species_genus = :genusid order by speciesname",
	{genusid: {value: form.genusid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="breed.cfm">
	<div class="card-header theme-primary theme-subtle">domain: #path.domainname#</div>
	<div class="card-header theme-primary theme-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header theme-primary theme-subtle">phylum: #path.phylumname#</div>
	<div class="card-header theme-primary theme-subtle">class: #path.classname#</div>
	<div class="card-header theme-primary theme-subtle">ord: #path.ordname#</div>
	<div class="card-header theme-primary theme-subtle">family: #path.familyname#</div>
	<div class="card-header theme-primary theme-subtle">genus: #path.genusname#</div>
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
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
