<cfscript>
result = queryExecute("
	select
		poll_q
		,pollStart
		,pollEnd
	from poll
	join grade on poll_grade=gradeid
	where grade_usr=1
")
dump(result)
</cfscript>