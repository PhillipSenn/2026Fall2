<cfscript>
request.title = 'species'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainname, kingdomname, phylumname, classname, ordname, familyname, genusname
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

<cfoutput>
<form class="card" action="breed.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">phylum: #path.phylumname#</div>
	<div class="card-header bg-primary-subtle">class: #path.classname#</div>
	<div class="card-header bg-primary-subtle">ord: #path.ordname#</div>
	<div class="card-header bg-primary-subtle">family: #path.familyname#</div>
	<div class="card-header bg-primary-subtle">genus: #path.genusname#</div>
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
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
