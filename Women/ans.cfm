<cfscript>
param form.actid = 20;
if (structKeyExists(form, 'ansid') && val(form.ansid) && structKeyExists(form, 'ansname') && len(trim(form.ansname))) {
	queryExecute(
		"UPDATE ans SET ansname = :ansname WHERE ansid = :ansid",
		{
			ansname: {value: trim(form.ansname), cfsqltype: "cf_sql_longvarchar"},
			ansid: {value: val(form.ansid), cfsqltype: "cf_sql_integer"}
		}
	);
	if (structKeyExists(form, 'ajax')) {
		setting showdebugoutput = false;
		writeOutput('ok');
		abort;
	}
}
request.container = 'container-fluid'
include '/Inc/header6.cfm'
ans = queryExecute(
	"SELECT a.ansid, a.ansname, q.qid, q.qname, c.catname
		,inv.ansname AS invention
	FROM ans a
	JOIN q ON q.qid = a.ans_q
	JOIN cat c ON c.catid = a.ans_cat
	OUTER APPLY (
		SELECT TOP 1 invAns.ansname
		FROM ans invAns
		JOIN cat invCat ON invCat.catid = invAns.ans_cat
		WHERE invAns.ans_q = q.qid
		AND invCat.catname = N'Invention'
	) inv
	WHERE q.q_act = :actid
	AND c.catname IN (N'Picture', N'Image')
	ORDER BY q.qname, c.catname, a.ansid",
	{actid: {value: form.actid, cfsqltype: "cf_sql_integer"}}
)
</cfscript>

<cfoutput query="act">
<article>
	<header class="theme-primary theme-subtle">
		#encodeForHTML(actname)# images (#ans.recordCount#)
	</header>
	<section>
		<table>
			<thead>
				<tr>
					<th class="text-end">ansid</th>
					<th>Woman</th>
					<th>Cat</th>
					<th>Image</th>
					<th>Paste new URL</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="ans">
					<cfset search = qname>
					<cfset altText = qname>
					<cfif catname EQ 'Image' AND len(invention)>
						<cfset search = trim(invention & ' ' & qname)>
						<cfset altText = qname & ' ' & invention>
					</cfif>
					<tr data-ansid="#ansid#">
						<td class="text-end">#ansid#</td>
						<td>
							<a href="https://www.google.com/search?tbm=isch&q=#EncodeForURL(search)#" target="_blank">
								#encodeForHTML(qname)#
								<cfif catname EQ 'Image' AND len(invention)>
									<br>#encodeForHTML(invention)#
								</cfif>
							</a>
						</td>
						<td>#encodeForHTML(catname)#</td>
						<td>
							<img class="ans-preview img-thumbnail" src="#encodeForHTMLAttribute(ansname)#" alt="#encodeForHTMLAttribute(altText)#" width="120">
						</td>
						<td>
							<input class="form-control ans-url" data-ansid="#ansid#" value="#encodeForHTMLAttribute(ansname)#">
						</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</section>
</article>
<input hidden name="id" value="#request.usr.id#">
<input hidden name="actid" value="#form.actid#">
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
