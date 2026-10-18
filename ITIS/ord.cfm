<cfscript>
request.title = 'ord'
request.progress.bar = false
include '/Inc/header6.cfm'
path = queryExecute(
	"select domainid, domainname, kingdomid, kingdomname, phylumid, phylumname, classid, classname
	from class
	join phylum on class_phylum = phylumid
	join kingdom on phylum_kingdom = kingdomid
	join domain on kingdom_domain = domainid
	where classid = :classid",
	{classid: {value: form.classid, cfsqltype: "cf_sql_integer"}}
)
ord = queryExecute(
	"select * from ord where ord_class = :classid order by ordname",
	{classid: {value: form.classid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<form class="card" action="family.cfm">
	<div class="card-header bg-subtle-primary">domain: #path.domainname#</div>
	<div class="card-header bg-subtle-primary">kingdom: #path.kingdomname#</div>
	<div class="card-header bg-subtle-primary">phylum: #path.phylumname#</div>
	<div class="card-header bg-subtle-primary">class: #path.classname#</div>
	<div class="card-body">
		<cfloop query="ord">
			<div>
				<button class="btn-link" name="ordid" value="#ordid#">#ordname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
