<cfscript>
if (structKeyExists(form, 'reset')) {
	new dbo.proc().usr('poll.reset_act', form.actid)
}
request.body = 'bg-1 d-flex flex-column min-vh-100'
request.container = 'container'
total = new dbo.proc().exec('q.where_act', form.actid)
answered = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM poll
	JOIN grade ON poll_grade = gradeid
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid
	AND pollEnd IS NOT NULL",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
gradeLabel = new dbo.proc().usr('grade.where_act', form.actid)
request.progress.pct = val(answered.cnt) & ' / ' & total.recordCount & ' (' & val(gradeLabel.earned) & '%)'
include '/Inc/header6.cfm'
q = queryExecute(
	"SELECT TOP 1 q.qid, q.qname, q.qdesc
	FROM q
	WHERE q.q_act = :actid
	AND q.qname NOT LIKE '%[^A-Za-z]%'
	AND NOT EXISTS (
		SELECT 1
		FROM poll
		JOIN grade ON poll_grade = gradeid
		WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
		AND poll_q = q.qid
		AND pollEnd IS NOT NULL
	)
	ORDER BY NEWID()",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
if (q.recordCount) {
	new dbo.proc().usr('poll.start_q', q.qid)
}
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		<span id="status" class="wordle-status ms-3" role="status" aria-live="polite"></span>
		<span class="float-end">
			<cfif q.recordCount>
				<button type="button" id="next" class="btn-outline theme-primary">Next</button>
			</cfif>
			<cfif !q.recordCount || val(gradeLabel.earned) ge 100>
				<button name="reset" form="wordle-reset" class="btn-outline theme-danger">Reset</button>
			</cfif>
		</span>
	</header>
	<section>
		<cfif q.recordCount>
			<div id="wordle"
				data-qid="#q.qid#"
				data-answer="#encodeForHTMLAttribute(uCase(q.qname))#"
				data-len="#len(q.qname)#"
				style="--wordle-len: #len(q.qname)#">
				<div id="board" class="wordle-board" aria-label="Guess grid"></div>
				<div id="keyboard" class="wordle-keyboard" aria-label="Keyboard"></div>
			</div>
		<cfelse>
			<p class="mb-0">You did it! Every single-word key term is solved.</p>
		</cfif>
	</section>
</article>
<cfif q.recordCount>
	<article id="qdesc-card" class="mt-auto sticky-bottom theme-warning theme-subtle">
		<section>
			<div id="qdesc" class="wordle-qdesc">#encodeForHTML(q.qdesc)#</div>
		</section>
	</article>
</cfif>
<form id="wordle-reset" method="post">
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
