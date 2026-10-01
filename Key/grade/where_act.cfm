<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().usr('Grade.where_act',form.actid)
WriteOutput(grade.earned)
</cfscript>
