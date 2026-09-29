<cfscript>
include '/Inc/header.cfm'
started = getTickCount()

cfstoredproc(procedure='q.usr_act') {
	cfprocparam(
		value='19C76747-5CF9-449C-9A52-FEF8906AD52E',
		cfsqltype='cf_sql_varchar'
	)
	cfprocparam(
		value=234,
		cfsqltype='cf_sql_integer'
	)
    cfprocresult(name='response')
}


writeOutput('Time: ' & (getTickCount() - started) & ' ms')
dump(response)
include '/Inc/footer.cfm'
</cfscript>