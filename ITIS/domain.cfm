<cfscript>
request.title = 'domain'
request.progress.bar = false
include '/Inc/header.cfm'
domain = queryExecute(
	"select * from domain order by domainname"
)
</cfscript>

<cfoutput>
<form class="card" action="kingdom.cfm">
	<div class="card-body">
		<cfloop query="domain">
			<div>
				<button class="btn-link" name="domainid" value="#domainid#">#domainname#</button>
			</div>
		</cfloop>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
