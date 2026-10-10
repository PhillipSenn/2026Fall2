<cfscript>
include '/Inc/header.cfm'
q = usr('q.usr_act',form.actid)
totalSeconds = 0
firstStart = ""
lastEnd = ""
</cfscript>

<cfoutput query="act">
<form action="question.cfm" class="card">
	<div class="card-header bg-primary-subtle">
		#actname# complete
	</div>
	<div class="card-body">
		<table class="table align-middle mb-0">
			<thead>
				<tr>
					<th>Key words</th>
					<th class="text-end">Start time</th>
					<th class="text-end">End time</th>
					<th class="text-end">Seconds</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="q">
					<cfset ans = exec('ans.where_q', qid)>
					<cfset elapsedSeconds = 0>
					<cfif isDate(pollStart) and isDate(pollEnd)>
						<cfset elapsedSeconds = DateDiff('s', pollStart, pollEnd)>
						<cfset totalSeconds += elapsedSeconds>
						<cfif !isDate(firstStart) or pollStart lt firstStart>
							<cfset firstStart = pollStart>
						</cfif>
						<cfif !isDate(lastEnd) or pollEnd gt lastEnd>
							<cfset lastEnd = pollEnd>
						</cfif>
					</cfif>
					<tr>
						<td>
							<cfset buttons = []>
							<cfloop query="ans">
								<cfset terms = reMatchNoCase("(?is)<a\b[^>]*>.*?</a>", ansname)>
								<cfloop array="#terms#" item="term">
									<cfset term = reReplace(term, "(?is)^<a\b[^>]*>|</a>$", "", "all")>
									<cfset term = reReplace(term, "(?is)<[^>]+>", "", "all")>
									<cfset arrayAppend(buttons, '<button class="btn-link p-0 text-start" name="qid" value="' & q.qid & '">' & term & '</button>')>
								</cfloop>
							</cfloop>
							#arrayToList(buttons, ", ")#
						</td>
						<td class="text-end font-monospace"><cfif isDate(pollStart)>#Replace(TimeFormat(pollStart, 'h:mm:ss tt'), ' ', '&nbsp;')#</cfif></td>
						<td class="text-end font-monospace"><cfif isDate(pollEnd)>#Replace(TimeFormat(pollEnd, 'h:mm:ss tt'), ' ', '&nbsp;')#</cfif></td>
						<td class="text-end font-monospace">#elapsedSeconds#</td>
					</tr>
				</cfloop>
			</tbody>
			<tfoot>
				<tr>
					<th>Total</th>
					<th class="text-end font-monospace"><cfif isDate(firstStart)>#Replace(TimeFormat(firstStart, 'h:mm:ss tt'), ' ', '&nbsp;')#</cfif></th>
					<th class="text-end font-monospace"><cfif isDate(lastEnd)>#Replace(TimeFormat(lastEnd, 'h:mm:ss tt'), ' ', '&nbsp;')#</cfif></th>
					<th class="text-end font-monospace">#totalSeconds#</th>
				</tr>
			</tfoot>
		</table>
	</div>
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<button class="nav-link" name="actid" value="#actid#" formaction="#request.serverdir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
