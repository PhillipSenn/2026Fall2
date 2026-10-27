<cfscript>
if (structKeyExists(form, 'ansid') && val(form.ansid)) {
	new dbo.proc().usr('guess.merge_pix', form.ansid)
}
request.container = 'container-fluid'
include '/Inc/header6.cfm'
unanswered = new dbo.proc().usr('ans.unanswered_pix', form.actid); // Top 1
if (!unanswered.recordCount) {
	location(request.home, false)
}
rnd = new dbo.proc().usr('ans.unanswered_rnd', form.actid); // order by newid()
ans = new dbo.proc().exec('ans.where_q', unanswered.qid);
param form.pixorder = "";
available = {};
for (i = 1; i <= rnd.recordCount; i++) {
	available[rnd.ansid[i] & ""] = rnd.ansdesc[i];
}
side = [];
below = [];
if (!len(form.pixorder)) {
	ids = [];
	for (i = 1; i <= rnd.recordCount; i++) {
		arrayAppend(ids, rnd.ansid[i] & "");
	}
	form.pixorder = arrayToList(ids);
}
savedIds = listToArray(form.pixorder);
originalHalf = ceiling(arrayLen(savedIds) / 2);
for (i = 1; i <= arrayLen(savedIds); i++) {
	id = savedIds[i];
	if (!structKeyExists(available, id)) {
		continue;
	}
	pic = {ansid: id, ansdesc: available[id]};
	if (i <= originalHalf) {
		arrayAppend(side, pic);
	} else {
		arrayAppend(below, pic);
	}
}
previous = queryExecute(
	"SELECT MAX(ans.ansid) AS ansid
	FROM guess
	JOIN grade ON guess_grade = gradeid
	JOIN ans ON guess_ans = ansid
	JOIN q ON ans_q = qid
	WHERE grade_usr = (SELECT usrid FROM usr WHERE id = :id)
	AND q_act = :actid",
	{
		id: {value: request.usr.id, cfsqltype: "cf_sql_varchar"},
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"}
	},
	{datasource: "lr2026Fall2"}
);
previousAnsid = 0;
if (previous.recordCount && !isNull(previous.ansid)) {
	previousAnsid = previous.ansid;
}
</cfscript>

<cfoutput query="act">
<form id="pix">
<div class="row">
	<div class="col-6">
		<div class="card">
			<div class="card-header theme-primary theme-subtle">
				#unanswered.qname#
			</div>
			<div class="card-body">
				<cfloop query="ans">
					<cfif ansid gt previousAnsid and ansid le unanswered.ansid>
						<p>#ansname#</p>
					</cfif>
				</cfloop>
			</div>
			<div class="card-footer" data-ansid="#unanswered.ansid#">
				<span class="pix-hint">Drop the picture here</span>
			</div>
		</div>
	</div>
	<div class="col-6">
		<div class="pix-choices pix-side">
			<cfloop array="#side#" index="pic">
				<img src="#pic.ansdesc#" data-ansid="#pic.ansid#" class="pix-choice img-thumbnail" draggable="true" alt="">
			</cfloop>
		</div>
	</div>
</div>
<div class="pix-choices">
	<cfloop array="#below#" index="pic">
		<img src="#pic.ansdesc#" data-ansid="#pic.ansid#" class="pix-choice img-thumbnail" draggable="true" alt="">
	</cfloop>
</div>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#actid#">
<input hidden name="ansid">
<input hidden name="pixorder" value="#encodeForHTMLAttribute(form.pixorder)#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
