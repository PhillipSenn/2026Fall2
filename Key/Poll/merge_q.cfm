<cfsetting showdebugoutput="false">
<cfscript>
grade = usr('poll.merge_q',form.qid)
WriteOutput(grade.earned)
</cfscript>
