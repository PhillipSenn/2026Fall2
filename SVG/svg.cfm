<cfscript>
request.container = 'container-fluid'
q = new dbo.proc().exec('q.where_act', form.actid)
basicShapes = []
extraShapes = []
for (row in q) {
	item = {
		qid: row.qid,
		qname: row.qname
	}
	if (row.qname == 'Triangle' || row.qname == 'Star') {
		arrayAppend(extraShapes, item)
	} else {
		arrayAppend(basicShapes, item)
	}
}
basicNames = []
for (item in basicShapes) {
	arrayAppend(basicNames, item.qname)
}
arraySort(basicNames, 'textnocase')
sortedBasic = []
for (name in basicNames) {
	for (item in basicShapes) {
		if (item.qname == name) {
			arrayAppend(sortedBasic, item)
			break
		}
	}
}
basicShapes = sortedBasic
shapes = []
for (item in basicShapes) {
	arrayAppend(shapes, item)
}
for (item in extraShapes) {
	arrayAppend(shapes, item)
}
answered = queryExecute(
	"SELECT COUNT(*) AS cnt
	FROM poll
	JOIN grade ON poll_grade = gradeid
	JOIN q ON poll_q = qid
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid
	AND q.q_act = :actid
	AND pollEnd IS NOT NULL",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
credited = queryExecute(
	"SELECT poll_q AS qid
	FROM poll
	JOIN grade ON poll_grade = gradeid
	JOIN q ON poll_q = qid
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid
	AND q.q_act = :actid
	AND pollEnd IS NOT NULL",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
creditedQids = []
for (row in credited) {
	arrayAppend(creditedQids, row.qid)
}
points = min(100, val(answered.cnt) * 10)
queryExecute(
	"UPDATE grade
	SET earned = :points
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND grade_act = :actid",
	{
		points: {value: points, cfsqltype: "cf_sql_integer"},
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	}
)
request.progress.pct = val(answered.cnt) & ' / ' & q.recordCount & ' (' & points & '%)'
request.progress.width = points
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="row" id="svg-form">
	<aside class="svg-topics" aria-label="Shapes">
		<article>
			<header class="theme-primary theme-subtle">
				Shapes
			</header>
			<section>
				<ul class="list-unstyled mb-0" id="shape-list">
					<cfloop array="#basicShapes#" index="item">
						<li>
							<a href="JavaScript:" class="shape-link" data-qid="#item.qid#" data-qname="#encodeForHTMLAttribute(item.qname)#">#encodeForHTML(item.qname)#</a>
						</li>
					</cfloop>
					<li><hr class="my-2"></li>
					<cfloop array="#extraShapes#" index="item">
						<li>
							<a href="JavaScript:" class="shape-link" data-qid="#item.qid#" data-qname="#encodeForHTMLAttribute(item.qname)#">#encodeForHTML(item.qname)#</a>
						</li>
					</cfloop>
				</ul>
			</section>
		</article>
	</aside>
	<div class="svg-source col">
		<article>
			<header class="theme-primary theme-subtle">
				Attributes
				<span class="float-end">
					<button type="button" class="btn-sm btn-outline theme-danger d-none" id="deleteShape">Delete</button>
					<button type="button" class="btn-sm btn-styled" id="addShape">Add shape</button>
				</span>
			</header>
			<section>
				<p class="form-text mb-3" id="shape-help">Choose a shape type, set <code>fill</code>, <code>stroke</code>, and <code>filter</code>, then add it. Each shape type is worth 10 points the first time you add it (10 types = 100%).</p>
				<div class="row g-3 mb-3">
					<div class="col-auto">
						<label class="form-label" for="fillColor">fill</label>
						<div class="d-flex align-items-center gap-2">
							<input type="color" id="fillColor" value="##3498db" class="form-control form-control-color" title="fill">
							<input type="text" id="fillValue" class="form-control attr-text" value="##3498db" spellcheck="false">
							<label class="form-check-label ms-1">
								<input type="checkbox" id="fillNone" class="form-check-input"> none
							</label>
						</div>
					</div>
					<div class="col-auto">
						<label class="form-label" for="strokeColor">stroke</label>
						<div class="d-flex align-items-center gap-2">
							<input type="color" id="strokeColor" value="##1a1a2e" class="form-control form-control-color" title="stroke">
							<input type="text" id="strokeValue" class="form-control attr-text" value="##1a1a2e" spellcheck="false">
							<label class="form-check-label ms-1">
								<input type="checkbox" id="strokeNone" class="form-check-input"> none
							</label>
						</div>
					</div>
					<div class="col-auto">
						<label class="form-label" for="filterSelect">filter</label>
						<select id="filterSelect" class="form-control">
							<option value="">none</option>
							<option value="blur">blur</option>
							<option value="shadow">drop shadow</option>
							<option value="grayscale">grayscale</option>
							<option value="sepia">sepia</option>
							<option value="saturate">saturate</option>
							<option value="invert">invert</option>
						</select>
					</div>
				</div>
				<div class="table-responsive">
					<table class="table table-sm align-middle mb-2" id="attr-table">
						<thead>
							<tr>
								<th scope="col">Attribute</th>
								<th scope="col">Value</th>
								<th scope="col"></th>
							</tr>
						</thead>
						<tbody id="attr-body"></tbody>
					</table>
				</div>
				<label class="form-label mt-3" for="svgSource">SVG markup</label>
				<textarea id="svgSource" rows="10" readonly spellcheck="false"></textarea>
			</section>
		</article>
	</div>
	<aside class="svg-sidebar" aria-labelledby="svg-preview-heading">
		<article>
			<header id="svg-preview-heading" class="theme-primary theme-subtle">
				Canvas
			</header>
			<section class="svg-preview">
				<svg id="svgCanvas" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 400 300" width="100%" height="300" aria-label="SVG canvas">
					<defs id="svgFilters">
						<filter id="blur" x="-50%" y="-50%" width="200%" height="200%">
							<feGaussianBlur stdDeviation="4"></feGaussianBlur>
						</filter>
						<filter id="shadow" x="-50%" y="-50%" width="200%" height="200%">
							<feDropShadow dx="4" dy="4" stdDeviation="3" flood-color="##000000" flood-opacity="0.45"></feDropShadow>
						</filter>
						<filter id="grayscale">
							<feColorMatrix type="saturate" values="0"></feColorMatrix>
						</filter>
						<filter id="sepia">
							<feColorMatrix type="matrix" values="0.393 0.769 0.189 0 0  0.349 0.686 0.168 0 0  0.272 0.534 0.131 0 0  0 0 0 1 0"></feColorMatrix>
						</filter>
						<filter id="saturate">
							<feColorMatrix type="saturate" values="2.5"></feColorMatrix>
						</filter>
						<filter id="invert">
							<feColorMatrix type="matrix" values="-1 0 0 0 1  0 -1 0 0 1  0 0 -1 0 1  0 0 0 1 0"></feColorMatrix>
						</filter>
					</defs>
					<rect class="svg-bg" width="400" height="300" fill="##f8f9fa" stroke="##dee2e6"></rect>
				</svg>
			</section>
		</article>
		<article class="mt-3">
			<header class="theme-primary theme-subtle">
				HTML page
			</header>
			<section>
				<label class="form-label" for="htmlPage">Complete HTML for the shapes on the canvas</label>
				<textarea id="htmlPage" rows="14" readonly spellcheck="false" wrap="off"></textarea>
			</section>
		</article>
	</aside>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<script type="application/json" id="shape-data">#serializeJSON(shapes)#</script>
<script type="application/json" id="credited-qids">#serializeJSON(creditedQids)#</script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
