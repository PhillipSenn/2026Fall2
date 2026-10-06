<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form action="question.cfm">
	<div class="card">
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			The textbook supplies these review questions, but no answer sheet.
			<p>Don't worry! You'll get a 100 posted into Canvas for having completed this task.
			But in addition, there is a scoring system that should help us come to an agreement as to which answer is best:
			<p>You receive 1 point towards consensus, for your vote and anyone who agrees with you.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<button>Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
