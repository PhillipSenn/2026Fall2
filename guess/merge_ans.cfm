<cfsetting showdebugoutput="false">
<cfscript>
redo = 0
grade = new dbo.proc().exec('guess.merge_ans',[form.id,form.ansid,redo])
WriteOutput(grade.earned)
</cfscript>
