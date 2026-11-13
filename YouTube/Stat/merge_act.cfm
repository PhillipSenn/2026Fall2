<cfscript>
setting showdebugoutput=false;
if (!structKeyExists(form, 'ranges')) {
	form.ranges = ''
}
grade = new dbo.proc().usr('stat.merge_act',[form.actid,form.earned,form.ranges])
writeoutput(grade.earned)
</cfscript>
