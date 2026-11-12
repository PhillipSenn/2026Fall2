<cfscript>
setting showdebugoutput = false;
new dbo.proc().usr('poll.merge_q', form.qid);
act = queryExecute(
	"SELECT q_act AS actid
	FROM q
	WHERE qid = :qid",
	{qid: {value: val(form.qid), cfsqltype: "cf_sql_integer"}}
);
answered = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM poll
	JOIN grade ON poll_grade = gradeid
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid
	AND pollEnd IS NOT NULL",
	{
		id: {value: form.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: act.actid, cfsqltype: "cf_sql_integer"}
	}
);
total = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM q
	WHERE q_act = :actid",
	{actid: {value: act.actid, cfsqltype: "cf_sql_integer"}}
);
points = min(100, val(answered.cnt) * 2);
grade = new dbo.proc().usr('grade.merge_act', [act.actid, points]);
writeOutput(grade.earned & '|' & val(answered.cnt) & ' / ' & val(total.cnt) & ' (' & grade.earned & '%)');
</cfscript>
