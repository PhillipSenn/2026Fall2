<cfscript>
grade = new dbo.proc().usr('poll.merge_q',url.qid)
WriteOutput(grade.earned)
</cfscript>
