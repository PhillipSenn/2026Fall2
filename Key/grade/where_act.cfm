<cfscript>
grade = new dbo.proc().usr('Grade.where_act',url.actid)
WriteOutput(grade.earned)
</cfscript>
