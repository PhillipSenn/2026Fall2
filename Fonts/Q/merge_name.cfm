<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().usr('q.merge_name',[form.actid,form.qname])
writeOutput(grade.earned)
</cfscript>