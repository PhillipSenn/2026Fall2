<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().usr('grade.merge_act',[form.actid,form.earned])
writeoutput(grade.earned)
</cfscript>
