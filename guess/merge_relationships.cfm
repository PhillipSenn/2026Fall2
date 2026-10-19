<cfscript>
setting showdebugoutput=false;
grade = exec('guess.merge_relationships',[form.id,form.ansid])
WriteOutput(grade.earned)
</cfscript>
