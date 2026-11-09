<cfscript>
include '/Inc/header6.cfm'
guess = new dbo.proc().usr('guess.where_q',form.qid)
q = new dbo.proc().exec('q.where_q',form.qid)
ans = new dbo.proc().exec('ans.where_q',form.qid)
</cfscript>

<cfoutput query="act">
<form action="Questions.cfm">
	<article>
		<header class="theme-primary theme-subtle">
			#q.qname#
		</header>
		<section>
			<cfloop query="ans">
				<div class="form-field">
					<cfset checked = "">
					<cfif guess.guess_ans eq ansid>
						<cfset checked = "checked">
					</cfif>
					<input class="radio" type="radio" name="ansid" value="#ansid#" id="ans#ansid#" #checked#>
					<label for="ans#ansid#">
						#ansname#
					</label>
				</div>
			</cfloop>
		</section>
		<footer>
			<textarea autofocus name="guessname">#guess.guessname#</textarea>
		</footer>
	</article>
	<article>
		<section>
			<button>Save</button>
		</section>
	</article>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<script src="/Inc/js/autosize.js"></script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>