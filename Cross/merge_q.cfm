<cfscript>
setting showdebugoutput = false;
param form.qid = 0;
param form.row = 0;
param form.col = 0;
param form.dir = 0;
grade = new dbo.proc().usr('crossword.merge_q', [
	form.qid,
	form.row,
	form.col,
	form.dir
]);
act = queryExecute(
	"SELECT q_act AS actid
	FROM q
	WHERE qid = :qid",
	{qid: {value: val(form.qid), cfsqltype: "cf_sql_integer"}}
);
placed = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM crossword.crossword c
	JOIN grade g ON c.crossword_grade = g.gradeid
	WHERE g.grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND g.grade_act = :actid",
	{
		id: {value: form.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: act.actid, cfsqltype: "cf_sql_integer"}
	}
);
total = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM q
	WHERE q_act = :actid
	AND qname LIKE '%[A-Za-z]%'",
	{actid: {value: act.actid, cfsqltype: "cf_sql_integer"}}
);
writeOutput(grade.earned & '|' & val(placed.cnt) & ' / ' & val(total.cnt) & ' (' & grade.earned & '%)');
</cfscript>
