<cfscript>
setting showdebugoutput=false;
grade = usr('Grade.where_act',form.actid)
WriteOutput(grade.earned)
</cfscript>
