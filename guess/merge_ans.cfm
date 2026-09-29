<cfsetting showdebugoutput="false">
<cfscript>
redo = 0
grade = new dbo.proc().usr('guess.merge_ans',[url.ansid,redo])
WriteOutput(grade.earned)
</cfscript>
