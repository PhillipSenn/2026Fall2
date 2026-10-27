<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().usr('poll.merge_top5', [form.qid,form.pollname])
WriteOutput(grade.earned)
</cfscript>
