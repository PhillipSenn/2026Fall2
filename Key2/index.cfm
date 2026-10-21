<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div>
	<div class="card">
		<div class="card-header theme-primary theme-subtle">
		</div>
		<div class="card-body">
			This program pulls a relevant picture from Wikipedia.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<a class="btn" href="Terms.cfm?actid=#actid#">Ready!</a>
		</div>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
