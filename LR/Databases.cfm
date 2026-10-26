<cfscript>
param form.actid = 342;
request.container = 'container-fluid';
include '/Inc/header6.cfm';
q = queryExecute(
	"SELECT q.qid, q.qname, q.qdesc, poll.pollname
	FROM q
	LEFT JOIN (
		SELECT poll_q, pollname
		FROM poll
		JOIN grade ON poll_grade = gradeid
		WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	) poll ON poll.poll_q = q.qid
	WHERE q.q_act = :actid
	ORDER BY
		CASE WHEN TRY_CAST(poll.pollname AS int) IS NULL THEN 1 ELSE 0 END,
		TRY_CAST(poll.pollname AS int),
		q.qname",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	},
	{datasource: "lr2026Fall2"}
);
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header theme-primary theme-subtle d-flex justify-content-between align-items-center gap-3">
		<span>Type a number to move that database to the top. Databases with no number stay at the bottom, in alphabetical order.</span>
		<a href="Top5.cfm?actid=#val(form.actid)#">Top 5</a>
	</div>
	<div class="card-body">
		<table id="databases">
			<thead>
				<tr>
					<th class="text-end">Rank</th>
					<th>Database</th>
					<th>Description</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="q">
					<cfset ranked = !isNull(pollname) && isNumeric(pollname) && val(pollname) gt 0>
					<cfset descText = "">
					<cfif !isNull(qdesc)>
						<cfset descText = replace(encodeForHTML(qdesc), "&lt;br&gt;", "<br>", "all")>
					</cfif>
					<tr data-qid="#qid#" data-qname="#encodeForHTMLAttribute(qname)#">
						<td class="text-end">
							<input class="rank" type="number" min="1" step="1" inputmode="numeric" autocomplete="off" aria-label="Rank for #encodeForHTMLAttribute(qname)#"<cfif ranked> value="#val(pollname)#" data-saved="#val(pollname)#"</cfif>>
						</td>
						<td class="qname">#encodeForHTML(qname)#</td>
						<td class="qdesc">#descText#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
