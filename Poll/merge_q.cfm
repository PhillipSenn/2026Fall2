<cfscript>
setting showdebugoutput=false;
if (structKeyExists(form, 'pollname')) {
	grade = new dbo.proc().usr('poll.merge_q', [form.qid, form.pollname])
} else {
	grade = new dbo.proc().usr('poll.merge_q', form.qid)
}
WriteOutput(grade.earned)
</cfscript>
