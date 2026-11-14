<cfscript>
setting showdebugoutput = false;
param form.qid = 0;
param form.id = '';

qRow = queryExecute(
	"SELECT qid, q_act AS actid
	FROM q
	WHERE qid = :qid
	AND q_act = :actid",
	{
		qid: {value: val(form.qid), cfsqltype: "cf_sql_integer"},
		actid: {value: val(form.actid), cfsqltype: "cf_sql_integer"}
	}
);
if (!qRow.recordCount) {
	qRow = queryExecute(
		"SELECT qid, q_act AS actid
		FROM q
		WHERE qid = :qid",
		{qid: {value: val(form.qid), cfsqltype: "cf_sql_integer"}}
	);
}
if (!qRow.recordCount) {
	writeOutput('0|0 / 0 (0%)');
	abort;
}

actid = qRow.actid;
usr = queryExecute(
	"SELECT usrid
	FROM usr
	WHERE id = :id",
	{id: {value: form.id, cfsqltype: "cf_sql_varchar"}}
);
usrid = usr.usrid;

gradeRow = queryExecute(
	"SELECT gradeid, earned
	FROM grade
	WHERE grade_usr = :usrid
	AND grade_act = :actid",
	{
		usrid: {value: usrid, cfsqltype: "cf_sql_integer"},
		actid: {value: actid, cfsqltype: "cf_sql_integer"}
	}
);
if (!gradeRow.recordCount) {
	queryExecute(
		"INSERT INTO grade(grade_usr, grade_act)
		VALUES (:usrid, :actid)",
		{
			usrid: {value: usrid, cfsqltype: "cf_sql_integer"},
			actid: {value: actid, cfsqltype: "cf_sql_integer"}
		}
	);
	gradeRow = queryExecute(
		"SELECT gradeid, earned
		FROM grade
		WHERE grade_usr = :usrid
		AND grade_act = :actid",
		{
			usrid: {value: usrid, cfsqltype: "cf_sql_integer"},
			actid: {value: actid, cfsqltype: "cf_sql_integer"}
		}
	);
}
gradeid = gradeRow.gradeid;

pollRow = queryExecute(
	"SELECT pollid
	FROM poll
	WHERE poll_grade = :gradeid
	AND poll_q = :qid",
	{
		gradeid: {value: gradeid, cfsqltype: "cf_sql_integer"},
		qid: {value: qRow.qid, cfsqltype: "cf_sql_integer"}
	}
);
if (!pollRow.recordCount) {
	queryExecute(
		"INSERT INTO poll(poll_grade, poll_q, pollStart, pollEnd)
		VALUES (:gradeid, :qid, GETDATE(), GETDATE())",
		{
			gradeid: {value: gradeid, cfsqltype: "cf_sql_integer"},
			qid: {value: qRow.qid, cfsqltype: "cf_sql_integer"}
		}
	);
} else {
	queryExecute(
		"UPDATE poll
		SET pollEnd = GETDATE()
		WHERE pollid = :pollid",
		{pollid: {value: pollRow.pollid, cfsqltype: "cf_sql_integer"}}
	);
}

answered = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM poll
	JOIN q ON poll_q = qid
	WHERE poll_grade = :gradeid
	AND q.q_act = :actid
	AND pollEnd IS NOT NULL",
	{
		gradeid: {value: gradeid, cfsqltype: "cf_sql_integer"},
		actid: {value: actid, cfsqltype: "cf_sql_integer"}
	}
);
total = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM q
	WHERE q_act = :actid",
	{actid: {value: actid, cfsqltype: "cf_sql_integer"}}
);
points = min(100, val(answered.cnt) * 10);
queryExecute(
	"UPDATE grade
	SET earned = :points
	WHERE gradeid = :gradeid",
	{
		points: {value: points, cfsqltype: "cf_sql_integer"},
		gradeid: {value: gradeid, cfsqltype: "cf_sql_integer"}
	}
);
writeOutput(points & '|' & val(answered.cnt) & ' / ' & val(total.cnt) & ' (' & points & '%)');
</cfscript>
