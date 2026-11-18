<cfscript>
request.container = 'container'
q = queryExecute(
	"SELECT q.qid, q.qname, q.qdesc, q.qsort, img.ansname
	FROM q
	OUTER APPLY (
		SELECT TOP 1 a.ansname
		FROM ans a
		WHERE a.ans_q = q.qid
		AND a.ansname LIKE 'http%'
		ORDER BY a.ansid
	) img
	WHERE q.q_act = :actid
	ORDER BY q.qid",
	{actid: {value: form.actid, cfsqltype: "cf_sql_integer"}}
)
polled = queryExecute(
	"SELECT poll_q
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
request.progress.pct = polled.recordCount & '/' & q.recordCount & ' (' & val(gradeLabel.earned) & '%)'
answeredMap = {}
for (row in polled) {
	answeredMap[toString(row.poll_q)] = true
}
firstOpen = queryExecute(
	"SELECT TOP 1 q.qid
	FROM q
	WHERE q.q_act = :actid
	AND NOT EXISTS (
		SELECT 1
		FROM poll
		JOIN grade ON poll_grade = gradeid
		WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
		AND grade_act = :actid
		AND pollEnd IS NOT NULL
		AND poll_q = q.qid
	)
	ORDER BY q.qid",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
startRow = 1
if (firstOpen.recordCount) {
	for (rowIndex = 1; rowIndex <= q.recordCount; rowIndex++) {
		if (toString(queryGetCell(q, 'qid', rowIndex)) EQ toString(firstOpen.qid)) {
			startRow = rowIndex
			break
		}
	}
}
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		#encodeForHTML(actname)#
	</header>
	<section>
		<div id="appsCarousel" class="carousel slide"
			data-total="#q.recordCount#"
			data-start="#startRow#"
			data-answered-count="#polled.recordCount#"
			data-answered="#valueList(polled.poll_q)#">
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div class="fg-emphasis-secondary" id="appsCounter">#startRow# / #q.recordCount#</div>
				<div>
					<button class="btn-icon btn-sm" type="button" id="appsSkipBack" title="Skip back 10">
						<i class="bi bi-chevron-double-left" aria-hidden="true"></i>
						<span class="visually-hidden">Skip back</span>
					</button>
					<button class="btn-icon btn-sm" type="button" data-bs-target="##appsCarousel" data-bs-slide="prev">
						<span class="carousel-icon-prev" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="btn-icon btn-sm" type="button" data-bs-target="##appsCarousel" data-bs-slide="next">
						<span class="carousel-icon-next" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
					<button class="btn-icon btn-sm" type="button" id="appsSkipForward" title="Skip to next unanswered">
						<i class="bi bi-chevron-double-right" aria-hidden="true"></i>
						<span class="visually-hidden">Skip forward</span>
					</button>
				</div>
			</div>
			<div class="carousel-inner rounded-5">
				<cfloop query="q">
					<cfset appHref = ''>
					<cfset appDesc = trim(qdesc & '')>
					<cfset md = reFindNoCase('\[([^\]]+)\]\((https?://[^)]+)\)', appDesc, 1, true)>
					<cfif arrayLen(md.pos) GTE 3 AND md.len[1] AND md.len[3]>
						<cfset appHref = mid(appDesc, md.pos[3], md.len[3])>
						<cfset appDesc = reReplaceNoCase(appDesc, '\[([^\]]+)\]\((https?://[^)]+)\)', '\1')>
					</cfif>
					<cfif len(appDesc) AND left(lCase(appDesc), len(qname)) EQ lCase(qname)>
						<cfset appDesc = trim(mid(appDesc, len(qname) + 1, len(appDesc)))>
					</cfif>
					<div class="carousel-item<cfif q.currentRow EQ startRow> active</cfif>" data-slide-index="#q.currentRow#" data-qid="#qid#">
						<div class="app-slide d-flex flex-column justify-content-center p-5">
							<p class="fs-4 mb-0">
								<cfif len(appHref)>
									<a href="#encodeForHTMLAttribute(appHref)#" target="_blank" rel="noopener noreferrer">#encodeForHTML(qname)#</a>
								<cfelse>
									#encodeForHTML(qname)#
								</cfif>
							</p>
							<p class="fg-emphasis-secondary mb-0">#numberFormat(val(qsort) * 1000)# downloads</p>
							<cfif len(appDesc)>
								<p class="app-desc fg-emphasis-secondary mt-3 mb-0">#encodeForHTML(appDesc)#</p>
							</cfif>
							<cfif len(trim(ansname & ''))>
								<cfset imgSrc = replace(ansname, '\', '', 'all')>
								<img class="app-image mt-4 rounded-3" src="#encodeForHTMLAttribute(imgSrc)#" alt="#encodeForHTMLAttribute(qname)#">
							</cfif>
						</div>
					</div>
				</cfloop>
			</div>
		</div>
	</section>
	<footer class="card-footer">
		<a href="https://www.blog.udonis.co/mobile-marketing/mobile-apps/top-100-apps" target="_blank" rel="noopener noreferrer">Source</a>
	</footer>
</article>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
