<cfscript>
setting showdebugoutput=false;
grade = usr('q.merge_unicode',[form.actid,form.qsort,form.pollname])
writeOutput(grade.earned)
</cfscript>