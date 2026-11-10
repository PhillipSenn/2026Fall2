<cfscript>
setting showdebugoutput=false;
// Allows grpid = null
cfstoredproc(procedure='act.update_grp', datasource='lr2026Fall2') {
	cfprocparam(value=form.actid, cfsqltype='cf_sql_integer');
	cfprocparam(value=form.grpid, cfsqltype='cf_sql_integer', null=!len(form.grpid));
}
</cfscript>
