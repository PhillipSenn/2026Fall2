<cfscript>
request.container = 'container'
q = queryExecute(
	"SELECT q.qid, q.qname, q.qdesc, q.qhref,
		COALESCE(q.qsort, src.qsort) AS qsort
	FROM q
	OUTER APPLY (
		SELECT TOP 1 s.qsort
		FROM q s
		JOIN act a ON a.actid = s.q_act
		WHERE a.actname = N'Technology and Society'
		AND s.qname = q.qname
		AND s.qsort IS NOT NULL
		ORDER BY s.qid
	) src
	WHERE q.q_act = :actid
	ORDER BY COALESCE(q.qsort, src.qsort), q.qid",
	{actid: {value: form.actid, cfsqltype: "cf_sql_integer"}}
)
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		#encodeForHTML(actname)#
	</header>
	<section>
		<div id="timelineCarousel" class="carousel slide">
			<div class="d-flex justify-content-between align-items-center mb-3">
				<div class="fg-emphasis-secondary" id="timelineCounter">1 / #q.recordCount#</div>
				<div>
					<button class="btn-icon btn-sm" type="button" data-bs-target="##timelineCarousel" data-bs-slide="prev">
						<span class="carousel-icon-prev" aria-hidden="true"></span>
						<span class="visually-hidden">Previous</span>
					</button>
					<button class="btn-icon btn-sm" type="button" data-bs-target="##timelineCarousel" data-bs-slide="next">
						<span class="carousel-icon-next" aria-hidden="true"></span>
						<span class="visually-hidden">Next</span>
					</button>
				</div>
			</div>
			<div class="carousel-inner rounded-5">
				<cfloop query="q">
					<div class="carousel-item<cfif q.currentRow EQ 1> active</cfif>" data-slide-index="#q.currentRow#">
						<div class="timeline-slide d-flex flex-column justify-content-center p-5">
							<div class="timeline-year">#val(qsort)#</div>
							<p class="fs-4 mb-0">#encodeForHTML(qname)#</p>
							<cfif len(trim(qdesc & ''))>
								<p class="fg-emphasis-secondary mt-3 mb-0">#encodeForHTML(qdesc)#</p>
							</cfif>
						</div>
					</div>
				</cfloop>
			</div>
		</div>
	</section>
</article>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
