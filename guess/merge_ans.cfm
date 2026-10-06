<cfscript>
setting showdebugoutput=false;
redo = 0
grade = exec('guess.merge_ans',[form.id,form.ansid,redo])
WriteOutput(grade.earned)
</cfscript>
