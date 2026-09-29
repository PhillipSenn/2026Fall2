<cfscript>
result = queryExecute('DBCC USEROPTIONS')
dump(result)
</cfscript>