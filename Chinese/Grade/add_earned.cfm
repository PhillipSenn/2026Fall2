<cfscript>
grade = usr('grade.add_earned',[form.actid,form.points])
writeoutput(grade.earned)
</cfscript>