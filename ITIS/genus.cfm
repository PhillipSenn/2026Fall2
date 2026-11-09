<cfscript>
request.title = 'genus'
request.progress.bar = false
param form.actid=323;
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname, ordid, ordname, familyid, familyname
	from family
	left join ord on family_ord = ordid
	left join class on ord_class = classid
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where familyid = :familyid",
	{familyid: {value: form.familyid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
genus = queryExecute(
	"select * from genus where genus_family = :familyid order by genusname",
	{familyid: {value: form.familyid, cfsqltype: "cf_sql_integer"}},
	{datasource: "ITIS"}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="species.cfm">
	<header class="theme-primary theme-subtle">domain: #path.domainname#</header>
	<header class="theme-primary theme-subtle">kingdom: #path.kingdomname#</header>
	<header class="theme-primary theme-subtle">phylum: #path.phylumname#</header>
	<header class="theme-primary theme-subtle">class: #path.classname#</header>
	<header class="theme-primary theme-subtle">ord: #path.ordname#</header>
	<header class="theme-primary theme-subtle">family: #path.familyname#</header>
	<section>
		<cfloop query="genus">
			<div>
				<button class="btn-link" name="genusid" value="#genusid#">#genusname#</button>
			</div>
		</cfloop>
	</section>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
