<cfscript>
setting showdebugoutput=false;
new dbo.proc().exec('act.update_hidden',[form.actid,form.isHidden])
</cfscript>