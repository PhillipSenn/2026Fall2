<cfscript>
param form.actid = 342;
request.container = 'container-fluid';
include '/Inc/header6.cfm';
rows = queryExecute(
	"SELECT usr.usrid, usr.firstname, usr.usrname, q.qname
	FROM usr
	LEFT JOIN grade
		ON grade.grade_usr = usr.usrid
		AND grade.grade_act = :actid
	LEFT JOIN poll
		ON poll.poll_grade = grade.gradeid
		AND TRY_CAST(poll.pollname AS int) BETWEEN 1 AND 5
	LEFT JOIN q
		ON q.qid = poll.poll_q
		AND q.q_act = :actid
	ORDER BY usr.usrname, TRY_CAST(poll.pollname AS int), q.qname",
	{
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	},
	{datasource: "lr2026Fall2"}
);
users = [];
seen = {};
cfloop(query=rows) {
	if (!structKeyExists(seen, usrid)) {
		label = "";
		if (!isNull(firstname) && len(trim(firstname))) {
			label = trim(firstname);
		} else if (!isNull(usrname) && len(trim(usrname))) {
			label = trim(usrname);
		}
		seen[usrid] = arrayLen(users) + 1;
		arrayAppend(users, {name: label, items: []});
	}
	if (!isNull(qname) && len(qname) && arrayLen(users[seen[usrid]].items) < 5) {
		arrayAppend(users[seen[usrid]].items, qname);
	}
}
</cfscript>

<cfoutput>
<div class="row">
	<cfloop array="#users#" index="person">
		<div class="col-2">
			<div class="card h-100">
				<div class="card-header theme-primary theme-subtle">#encodeForHTML(person.name)#</div>
				<ol class="list-group list-group-numbered list-group-flush">
					<cfloop array="#person.items#" index="qname">
						<li class="list-group-item">#encodeForHTML(qname)#</li>
					</cfloop>
				</ol>
			</div>
		</div>
	</cfloop>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
