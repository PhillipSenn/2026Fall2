<cfscript>
request.title = 'Marbles';
include '/Inc/header.cfm';
</cfscript>

<cfoutput>
<form method="post" action="marbles.cfm" class="card">
	<div class="card-header bg-primary-subtle">
	</div>
	<div class="card-body">
	</div>
	<div class="card-footer">
		<button>Ready!</button>
	</div>
</form>
</cfoutput>
<cfinclude template="/Inc/footer.cfm">
