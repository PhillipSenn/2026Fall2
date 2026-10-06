<cfscript>
include '/Inc/header.cfm'
guess = usr('guess.where_q',form.qid)
q = exec('q.where_q',form.qid)
ans = exec('ans.where_q',form.qid)
</cfscript>

<cfoutput query="act">
<form action="Questions.cfm">
	<div class="card">
		<div class="card-header bg-primary-subtle">
			#q.qname#
		</div>
		<div class="card-body">
			<cfloop query="ans">
				<div class="form-check">
					<cfset checked = "">
					<cfif guess.guess_ans eq ansid>
						<cfset checked = "checked">
					</cfif>
					<input class="form-check-input" type="radio" name="ansid" value="#ansid#" id="ans#ansid#" #checked#>
					<label class="form-check-label" for="ans#ansid#">
						#ansname#
					</label>
				</div>
			</cfloop>
		</div>
		<div class="card-footer">
			<textarea autofocus name="guessname">#guess.guessname#</textarea>
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			<button>Save</button>
		</div>
	</div>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<a class="nav-link" href="#request.scriptname#">Feedback for: #actname#</a>
<script src="/Inc/js/autosize.js"></script>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>