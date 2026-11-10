<cfscript>
setting showdebugoutput=false;
// Allows catid = null
cfstoredproc(procedure='act.update_cat', datasource='lr2026Fall2') {
	cfprocparam(value=form.actid, cfsqltype='cf_sql_integer');
	cfprocparam(value=form.catid, cfsqltype='cf_sql_integer', null=!len(form.catid));
}
</cfscript>
