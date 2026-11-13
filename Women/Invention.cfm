<cfscript>
if (structKeyExists(form, 'reset')) {
	new dbo.proc().usr('poll.reset_act', form.actid)
}
param form.level = 'hard';
levels = {easy: 4, medium: 5, hard: 7};
if (!structKeyExists(levels, lCase(form.level))) {
	form.level = 'hard';
}
form.level = lCase(form.level);
pairCount = levels[form.level];
request.container = 'container'
q = new dbo.proc().exec('q.where_act', form.actid)
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
request.progress.pct = val(answered.cnt) & ' / ' & q.recordCount & ' (' & val(gradeLabel.earned) & '%)'
include '/Inc/header6.cfm'
picked = queryExecute(
	"SELECT q.qid, q.qname
	FROM q
	WHERE q.q_act = :actid
	AND NOT EXISTS (
		SELECT 1
		FROM poll
		JOIN grade ON poll_grade = gradeid
		WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
		AND poll_q = q.qid
		AND pollEnd IS NOT NULL
	)
	AND EXISTS (
		SELECT 1
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Picture'
		AND a.ansname LIKE 'http%'
	)
	AND EXISTS (
		SELECT 1
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Image'
		AND a.ansname LIKE 'http%'
	)
	AND EXISTS (
		SELECT 1
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Invention'
	)
	ORDER BY NEWID()
	OFFSET 0 ROWS FETCH NEXT :pairs ROWS ONLY",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"},
		pairs: {value: pairCount, cfsqltype: "cf_sql_integer"}
	}
)
cards = []
if (picked.recordCount) {
	qidList = valueList(picked.qid)
	media = queryExecute(
		"SELECT q.qid, q.qname, c.catname, a.ansname
		FROM q
		JOIN ans a ON a.ans_q = q.qid
		JOIN cat c ON c.catid = a.ans_cat
		WHERE q.qid IN (#qidList#)
		AND c.catname IN (N'Picture', N'Image', N'Invention')"
	)
	byQ = {}
	for (row in media) {
		if (!structKeyExists(byQ, row.qid)) {
			byQ[row.qid] = {qid: row.qid, qname: row.qname, invention: '', picture: '', image: ''}
		}
		if (row.catname == 'Invention') {
			byQ[row.qid].invention = row.ansname
		} else if (row.catname == 'Picture' && left(row.ansname, 4) == 'http') {
			byQ[row.qid].picture = row.ansname
		} else if (row.catname == 'Image' && left(row.ansname, 4) == 'http') {
			byQ[row.qid].image = row.ansname
		}
	}
	for (qid in byQ) {
		item = byQ[qid]
		if (len(item.picture) && len(item.image) && len(item.invention)) {
			arrayAppend(cards, {
				qid: item.qid,
				catname: 'Picture',
				src: item.picture,
				invention: item.invention,
				qname: item.qname
			})
			arrayAppend(cards, {
				qid: item.qid,
				catname: 'Image',
				src: item.image,
				invention: item.invention,
				qname: item.qname
			})
		}
	}
	for (i = arrayLen(cards); i > 1; i--) {
		j = randRange(1, i)
		swap = cards[i]
		cards[i] = cards[j]
		cards[j] = swap
	}
}
solved = queryExecute(
	"SELECT q.qid, q.qname
		,pic.ansname AS picture
		,img.ansname AS image
		,inv.ansname AS invention
		,poll.pollEnd
	FROM poll
	JOIN grade ON poll_grade = gradeid
	JOIN q ON poll_q = q.qid
	OUTER APPLY (
		SELECT TOP 1 a.ansname
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Picture'
		AND a.ansname LIKE 'http%'
	) pic
	OUTER APPLY (
		SELECT TOP 1 a.ansname
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Image'
		AND a.ansname LIKE 'http%'
	) img
	OUTER APPLY (
		SELECT TOP 1 a.ansname
		FROM ans a
		JOIN cat c ON c.catid = a.ans_cat
		WHERE a.ans_q = q.qid
		AND c.catname = N'Invention'
	) inv
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid
	AND pollEnd IS NOT NULL
	AND q.q_act = :actid
	ORDER BY poll.pollEnd DESC",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		Match the woman with her invention.
		<span class="float-end">
			<a href="Invention.cfm?id=#request.usr.id#&actid=#form.actid#&level=easy" class="btn-outline #form.level EQ 'easy' ? 'theme-success' : 'theme-secondary'#">Easy</a>
			<a href="Invention.cfm?id=#request.usr.id#&actid=#form.actid#&level=medium" class="btn-outline #form.level EQ 'medium' ? 'theme-success' : 'theme-secondary'#">Medium</a>
			<a href="Invention.cfm?id=#request.usr.id#&actid=#form.actid#&level=hard" class="btn-outline #form.level EQ 'hard' ? 'theme-success' : 'theme-secondary'#">Hard</a>
			<cfif !arrayLen(cards)>
				<button name="reset" form="invention-reset" class="btn-outline theme-danger">Reset</button>
			</cfif>
		</span>
	</header>
	<section>
		<div id="memory-board" class="memory-board" data-level="#encodeForHTMLAttribute(form.level)#">
			<cfloop array="#cards#" index="card">
				<div class="memory-slot">
					<div class="memory-card"
						role="button"
						tabindex="0"
						data-qid="#card.qid#"
						data-cat="#encodeForHTMLAttribute(card.catname)#"
						data-qname="#encodeForHTMLAttribute(card.qname)#"
						data-invention="#encodeForHTMLAttribute(card.invention)#"
						aria-label="#encodeForHTMLAttribute(card.catname)# card">
						<span class="memory-card-inner">
							<span class="memory-card-face memory-card-back"></span>
							<span class="memory-card-face memory-card-front">
								<img src="#encodeForHTMLAttribute(card.src)#" alt="#encodeForHTMLAttribute(card.qname)#">
								<span class="memory-card-footer">#encodeForHTML(card.catname EQ 'Picture' ? card.qname : card.invention)#</span>
							</span>
						</span>
					</div>
				</div>
			</cfloop>
		</div>
	</section>
</article>
<article>
	<header class="theme-primary theme-subtle">
		Solved
	</header>
	<section>
		<table>
			<thead>
				<tr>
					<th>Woman</th>
					<th>Picture</th>
					<th>Image</th>
					<th>Invention</th>
				</tr>
			</thead>
			<tbody id="solved-body">
				<cfloop query="solved">
					<tr>
						<td>
							<a href="https://www.google.com/search?tbm=isch&q=#EncodeForURL(trim(qname & ' ' & invention))#" target="_blank">#encodeForHTML(qname)#</a>
						</td>
						<td>
							<cfif len(picture)>
								<img src="#encodeForHTMLAttribute(picture)#" class="img-thumbnail" width="100" alt="#encodeForHTMLAttribute(qname)#">
							</cfif>
						</td>
						<td>
							<cfif len(image)>
								<img src="#encodeForHTMLAttribute(image)#" class="img-thumbnail" width="100" alt="#encodeForHTMLAttribute(invention)#">
							</cfif>
						</td>
						<td>#encodeForHTML(invention)#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</section>
</article>
<form id="invention-reset" method="post">
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="level" value="#encodeForHTMLAttribute(form.level)#">
</form>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<input hidden name="level" value="#encodeForHTMLAttribute(form.level)#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
