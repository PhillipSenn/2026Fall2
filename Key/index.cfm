<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form action="Terms.cfm">
	<div class="card">
		<div class="card-header theme-primary theme-subtle">
			How would you like to solve this modules's key terms?
		</div>
		<div class="card-body">
			<ul>
				<li>
					<a href="../Key2/Terms.cfm?actid=#url.actid#">Key Terms</a>
				</li>
				<li>
					<a href="../Sub/?actid=#url.actid#">Shooting Gallery</a>
				</li>
				<li>
					<a href="../Pac/man.cfm">Pac-Man</a>
				</li>
			</ul>
		</div>
		<div class="card-footer">
			<button>Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
