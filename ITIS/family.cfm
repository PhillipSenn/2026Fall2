<cfscript>
request.title = 'family'
request.progress.bar = false
include '/Inc/header.cfm'
path = queryExecute(
	"select domainname, kingdomname, phylumname, classname, ordname
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

<cfoutput>
<form class="card" action="genus.cfm">
	<div class="card-header bg-primary-subtle">domain: #path.domainname#</div>
	<div class="card-header bg-primary-subtle">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-primary-subtle">phylum: #path.phylumname#</div>
	<div class="card-header bg-primary-subtle">class: #path.classname#</div>
	<div class="card-header bg-primary-subtle">ord: #path.ordname#</div>
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
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
