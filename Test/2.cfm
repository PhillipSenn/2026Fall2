<cfscript>
result = queryExecute("
	select
		ans_q
		,string_agg(ansname,'|') as correct_ansnames
	from ans
	where correct=1
	group by ans_q
")
dump(result)
</cfscript>