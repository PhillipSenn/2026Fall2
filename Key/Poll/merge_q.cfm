<cfsetting showdebugoutput="false">
<cfscript>
grade = new dbo.proc().usr('poll.merge_q',form.qid)
WriteOutput(grade.earned)
</cfscript>
