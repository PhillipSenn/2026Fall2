<cfscript>
q = queryExecute(
	"SELECT q.qid, q.qname, q.qdesc, q.qsort, q.q_cat, img.ansname
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
	AND pollEnd IS NOT NULL
	ORDER BY poll_q",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
startRow = 1
if (polled.recordCount) {
	lastQid = polled.poll_q[polled.recordCount]
	for (i = 1; i <= q.recordCount; i++) {
		if (q.qid[i] == lastQid) {
			startRow = i
			break
		}
	}
}
gradeLabel = new dbo.proc().usr('grade.where_act', form.actid)
request.progress.pct = polled.recordCount & '/' & q.recordCount & ' (' & val(gradeLabel.earned) & '%)'
include '/Inc/header6.cfm'
cat = new dbo.proc().usr('q.cat_act', form.actid)
</cfscript>

<cfoutput>
<cfset appHref = ''>
<cfset appDesc = trim(q.qdesc[startRow] & '')>
<cfset md = reFindNoCase('\[([^\]]+)\]\((https?://[^)]+)\)', appDesc, 1, true)>
<cfif arrayLen(md.pos) GTE 3 AND md.len[1] AND md.len[3]>
	<cfset appHref = mid(appDesc, md.pos[3], md.len[3])>
</cfif>
<div class="row">
	<div class="col-12 md:col-9 apps-main">
		<article>
			<header class="theme-primary theme-subtle" id="appsTitle">
				<cfif len(appHref)>
					<a href="#encodeForHTMLAttribute(appHref)#" target="_blank" rel="noopener noreferrer">#encodeForHTML(q.qname[startRow])#</a>
				<cfelse>
					#encodeForHTML(q.qname[startRow])#
				</cfif>
			</header>
			<section>
				<div id="appsCarousel" class="carousel slide"
					data-bs-wrap="false"
					data-total="#q.recordCount#"
					data-answered-count="#polled.recordCount#"
					data-answered="#valueList(polled.poll_q)#">
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
							<div class="carousel-item<cfif q.currentRow EQ startRow> active</cfif>"
								data-slide-index="#q.currentRow#"
								data-qid="#qid#"
								data-catid="#val(q_cat)#"
								data-qname="#encodeForHTMLAttribute(qname)#"
								data-href="#encodeForHTMLAttribute(appHref)#"
								data-downloads="#encodeForHTMLAttribute(numberFormat(val(qsort) * 1000) & ' downloads')#">
								<div class="app-slide d-flex flex-column justify-content-center p-5">
									<cfif len(appDesc)>
										<p class="app-desc fg-emphasis-secondary mb-0">#encodeForHTML(appDesc)#</p>
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
				<span class="float-end" id="appsDownloads">#numberFormat(val(q.qsort[startRow]) * 1000)# downloads</span>
			</footer>
		</article>
	</div>
	<aside class="col-12 md:col-3">
		<article>
			<header class="theme-primary theme-subtle d-flex justify-content-end align-items-center">
				<button class="btn-icon btn-sm" type="button" id="appsSkipForward" title="Skip to next unanswered"<cfif NOT listFind(valueList(polled.poll_q), q.qid[startRow])> disabled aria-disabled="true"</cfif>>
					<i class="bi bi-chevron-double-right" aria-hidden="true"></i>
					<span class="visually-hidden">Skip forward</span>
				</button>
			</header>
			<section>
				<div id="appsCats" class="btn-group-vertical btn-group-sm w-100" role="group" aria-label="Categories">
					<cfloop query="cat">
						<button type="button" class="btn-outline theme-primary btn-sm d-flex justify-content-between align-items-center" data-catid="#catid#" title="Next">
							<span>#encodeForHTML(catname)#</span>
							<span class="badge theme-secondary">#cnt#</span>
						</button>
					</cfloop>
				</div>
			</section>
		</article>
	</aside>
</div>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
