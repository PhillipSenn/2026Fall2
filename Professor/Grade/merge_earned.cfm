<cfscript>
grade = new dbo.proc().usr('grade.merge_earned',[form.actid,form.earned])
echo(grade.earned)
</cfscript>
