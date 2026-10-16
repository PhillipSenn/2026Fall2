<cfscript>
setting showdebugoutput=false;
grade = usr('q.merge_name',[form.actid,form.qname])
writeOutput(grade.earned)
</cfscript>