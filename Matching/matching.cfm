<cfscript>
request.container = 'container-lg'
include '/Inc/header.cfm'
ans = new dbo.proc().usr('ans.where_act', form.actid)
choices = []
guessed = {}
cfloop(query=ans) {
	choices.append({
		ansid: ans.ansid,
		ansname: ans.ansname
	})
	if (len(ans.guess_ans)) {
		guessed[ans.ansid] = true
	}
}
for (i = arrayLen(choices); i > 1; i--) {
	j = randRange(1, i)
	swap = choices[i]
	choices[i] = choices[j]
	choices[j] = swap
}
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header bg-primary-subtle">
		Click a shortcut and what it does, in either order.
	</div>
	<div class="card-body">
		<div class="row g-3">
			<div class="col-md-4" id="questions">
				<cfloop query="ans">
					<cfset matched = structKeyExists(guessed, ans.ansid)>
					<button type="button" data-ansid="#ans.ansid#"
						class="d-block w-100 mb-2 text-start #matched ? 'btn-success' : 'btn-outline-primary'#"
						<cfif matched>disabled</cfif>>#encodeForHtml(ans.qname)#</button>
				</cfloop>
			</div>
			<div class="col-md-8" id="answers">
				<cfloop array="#choices#" index="choice">
					<cfset matched = structKeyExists(guessed, choice.ansid)>
					<button type="button" data-ansid="#choice.ansid#"
						class="d-block w-100 mb-2 text-start #matched ? 'btn-success' : 'btn-outline-secondary'#"
						<cfif matched>disabled</cfif>>#encodeForHtml(choice.ansname)#</button>
				</cfloop>
			</div>
		</div>
	</div>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
