<cfscript>
setting showdebugoutput=false;
grade = usr('poll.merge_top5', [form.qid,form.pollname])
WriteOutput(grade.earned)
</cfscript>
