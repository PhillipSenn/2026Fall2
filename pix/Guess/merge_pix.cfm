<cfscript>
setting showdebugoutput=false;
grade = exec('guess.merge_pix',[form.id,form.ansid])
WriteOutput(grade.earned)
</cfscript>
