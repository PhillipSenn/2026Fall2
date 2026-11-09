<cfscript>
include '/Inc/header6.cfm'
param url.page=258;
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header theme-primary theme-subtle">
	</div>
	<div class="card-body">
		<cfloop from="1" to="#Min(258,url.page)#" index="i"> <!--- max 258 --->
			<img id="#i#" class="d-block img-fluid" src="https://online.pubhtml5.com/hmeo/wjuj/files/large/#i#.jpg">
		</cfloop>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>