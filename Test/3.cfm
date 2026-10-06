<cfscript>
result = queryExecute("
	select
		ans_q
		,string_agg(ansname,'|') as incorrect_ansnames
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	where grade_usr=1
	and isnull(correct,0)=0
	group by ans_q
")
dump(result)
</cfscript>