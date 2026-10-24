<cfscript>
param form.actid = 340;
include '/Inc/header6.cfm';
qs = exec('q.where_act', form.actid);
imageSrc = "";
if (qs.recordCount) {
	if (!isNull(qs.qdesc) && len(qs.qdesc)) {
		imageSrc = qs.qdesc;
		if (left(imageSrc, 3) == "../") {
			imageSrc = "/" & mid(imageSrc, 4, len(imageSrc) - 3);
		}
	}
	ans = exec('ans.where_q', qs.qid);
} else {
	ans = queryNew("ansid,ansname");
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header theme-primary theme-subtle">
		<cfif qs.recordCount>#qs.qname#</cfif>
	</div>
	<div class="card-body">
		<cfif len(imageSrc)>
			<img src="#encodeForHTMLAttribute(imageSrc)#" class="img-fluid" alt="#encodeForHTMLAttribute(qs.qname)#">
		</cfif>
		<cfloop query="ans">
			<p>#ansname#</p>
		</cfloop>
	</div>
	<div class="card-footer">
		<a class="btn" href="ans.cfm?actid=#actid#">Next</a>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
