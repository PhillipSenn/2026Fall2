<cfscript>
setting showdebugoutput=false;
grade = usr('grade.merge_act',[form.actid,form.earned])
writeOutput(grade.earned)
</cfscript>