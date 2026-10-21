<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div action="matching.cfm">
	<div class="card">
		<div class="card-header theme-primary theme-subtle">
		</div>
		<div class="card-body">
			I'm trying to make this course a little better than reading a textbook, so pick a keyword on the left and it's description on the right.
			<p>Or the description first and then find its keyword.</p>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<a class="btn" href="matching.cfm?actid=#actid#">Ready!</a>
		</div>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
