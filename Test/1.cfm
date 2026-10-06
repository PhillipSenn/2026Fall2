<cfscript>
result = queryExecute("
	declare @id uniqueidentifier = '19C76747-5CF9-449C-9A52-FEF8906AD52E'

	select usrid
	from usr
	where id=@id
")
dump(result)
</cfscript>