<cfscript>
request.jQueryUI = 'base'
request.container = 'container-fluid'
q = new dbo.proc().exec('q.where_act', form.actid)
gradeLabel = new dbo.proc().usr('grade.where_act', form.actid)
placedMap = {}
placedCount = 0
try {
	placed = queryExecute(
		"SELECT c.crossword_q AS qid
			,c.crossword_row AS placed_row
			,c.crossword_col AS placed_col
			,c.crossword_dir AS placed_dir
		FROM crossword.crossword c
		JOIN grade g ON c.crossword_grade = g.gradeid
		WHERE g.grade_usr = (SELECT usrid FROM usr WHERE id = :id)
		AND g.grade_act = :actid",
		{
			id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
			actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
		}
	)
	for (row in placed) {
		placedMap[row.qid] = {
			row: val(row.placed_row),
			col: val(row.placed_col),
			dir: val(row.placed_dir)
		}
	}
	placedCount = placed.recordCount
} catch (any e) {
	placedCount = 0
}
request.progress.pct = placedCount & ' / ' & q.recordCount & ' (' & val(gradeLabel.earned) & '%)'
request.progress.width = min(100, val(gradeLabel.earned))
gridSize = 35
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form id="crossword">
	<row>
		<div class="col">
			<article>
				<header class="theme-primary theme-subtle">
					Drag a word onto the grid. Click a word (or press R) to rotate horizontal / vertical.
					Words may cross when they share the same letter.
				</header>
				<section class="crossword-board-wrap">
					<div id="board" class="crossword-board" style="--grid-size: #gridSize#" data-size="#gridSize#">
						<cfloop from="0" to="#gridSize - 1#" index="r">
							<cfloop from="0" to="#gridSize - 1#" index="c">
								<div class="cell" data-row="#r#" data-col="#c#"></div>
							</cfloop>
						</cfloop>
					</div>
				</section>
			</article>
		</div>
		<aside>
			<article>
				<header class="theme-primary theme-subtle">
					Words
				</header>
				<section>
					<ul id="words" class="list-unstyled mb-0">
						<cfloop query="q">
							<cfset letters = reReplaceNoCase(qname, '[^A-Za-z]', '', 'all')>
							<cfif !len(letters)>
								<cfcontinue>
							</cfif>
							<cfset isPlaced = structKeyExists(placedMap, qid)>
							<li class="#isPlaced ? 'is-placed' : ''#">
								<span class="qname#isPlaced ? ' is-placed' : ''#"
									data-qid="#qid#"
									data-letters="#encodeForHTMLAttribute(uCase(letters))#"
									data-dir="0"
									title="Click to rotate">#encodeForHTML(qname)#</span>
							</li>
						</cfloop>
					</ul>
				</section>
			</article>
		</aside>
	</row>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
	<script type="application/json" id="placed-json">#serializeJSON(placedMap)#</script>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
