<cfscript>
result = queryExecute("
	declare @usrid int = (
		select usrid
		from usr
		where id='19C76747-5CF9-449C-9A52-FEF8906AD52E'
	)

	select
		qid
		,qname
		,qdesc
		,qhref
		,correct_ansnames
		,incorrect_ansnames
		,pollStart
		,pollEnd
	from q

	left join (
		select
			ans_q as correct_q
			,string_agg(ansname,'|') as correct_ansnames
		from ans
		where correct=1
		group by ans_q
	) correct
		on correct_q=q.qid

	left join (
		select
			ans_q as incorrect_q
			,string_agg(ansname,'|') as incorrect_ansnames
		from guess
		join grade on guess_grade=gradeid
		join ans on guess_ans=ansid
		where grade_usr=@usrid
		and isnull(correct,0)=0
		group by ans_q
	) incorrect
		on incorrect_q=q.qid

outer apply (
	select
		pollStart
		,pollEnd
	from poll
	join grade on poll_grade=gradeid
	where poll_q=qid
	and grade_usr=@usrid
) poll

	where q_act=234
	order by qsort,qid
    option (recompile)
")

dump(result)
</cfscript>