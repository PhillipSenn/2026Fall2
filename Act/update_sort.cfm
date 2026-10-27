<cfscript>
setting showdebugoutput=false;
new dbo.proc().exec('act.update_sort',[form.actid,form.actsort])
</cfscript>