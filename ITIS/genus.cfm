<cfscript>
request.title = 'genus'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domain.domainname, kingdom.kingdomname, phylum.phylumname, class.classname, ord.ordname, family.familyname
	from family
	left join ord on family.family_ord = ord.ordid
	left join class on ord.ord_class = class.classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where familyid = :genus_family",
	{genus_family: {value: form.genus_family, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
genus = queryExecute(
	"select * from genus where genus_family = :genus_family order by genusname",
	{genus_family: {value: form.genus_family, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header bg-primary-subtle">domain: #encodeForHTML(path.domainname)#</div>
	<div class="card-header bg-primary-subtle">kingdom: #encodeForHTML(path.kingdomname)#</div>
	<div class="card-header bg-primary-subtle">phylum: #encodeForHTML(path.phylumname)#</div>
	<div class="card-header bg-primary-subtle">class: #encodeForHTML(path.classname)#</div>
	<div class="card-header bg-primary-subtle">ord: #encodeForHTML(path.ordname)#</div>
	<div class="card-header bg-primary-subtle">family: #encodeForHTML(path.familyname)#</div>
	<div class="card-body">
		<cfloop query="genus">
			<div>
				<button class="btn-link" name="species_genus" value="#genusid#" formaction="species.cfm">#encodeForHTML(genusname)#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</form>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
