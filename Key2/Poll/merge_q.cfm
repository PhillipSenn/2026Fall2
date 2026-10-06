<cfscript>
setting showdebugoutput=false;
grade = usr('poll.merge_q',form.qid)
WriteOutput(grade.earned)
</cfscript>
