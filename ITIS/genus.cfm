<cfscript>
request.title = 'genus'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainname, kingdomname, phylumname, classname, ordname, familyname
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

<cfoutput>
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
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
