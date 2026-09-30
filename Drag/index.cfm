<cfscript>
request.jQueryUI = 'base'
if (StructKeyExists(form,'qid')) {
	new dbo.proc().usr('poll.merge_q',form.qid)
}
request.flush = false
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<button class="nav-link" formaction="#request.script_name#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
    
</cfoutput>
