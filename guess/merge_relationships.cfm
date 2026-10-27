<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().exec('guess.merge_relationships',[form.id,form.ansid])
WriteOutput(grade.earned)
</cfscript>
