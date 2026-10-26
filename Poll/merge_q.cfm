<cfscript>
setting showdebugoutput=false;
if (structKeyExists(form, 'pollname')) {
	grade = usr('poll.merge_q', [form.qid, form.pollname])
} else {
	grade = usr('poll.merge_q', form.qid)
}
WriteOutput(grade.earned)
</cfscript>
