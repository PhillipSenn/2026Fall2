<cfscript>
started = getTickCount()

result = queryExecute("
	SET ARITHABORT ON;

	declare @id uniqueidentifier = '19C76747-5CF9-449C-9A52-FEF8906AD52E';

	exec q.usr_act @id,234;
")

writeOutput('<h2>' & (getTickCount() - started) & ' ms</h2>')
dump(result)
</cfscript>