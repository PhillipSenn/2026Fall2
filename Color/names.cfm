<cfscript>
request.jQueryUI = 'base'
include '/Inc/header6.cfm'
q = new dbo.proc().usr('poll.unanswered', form.actid)
if (!q.recordcount) {
	location(request.home, false)
}
colors = []
limit = min(20, q.recordcount)
for (i = 1; i <= limit; i++) {
	arrayAppend(colors, {
		qid: q.qid[i],
		qname: q.qname[i],
		qdesc: q.qdesc[i]
	})
}
for (i = arrayLen(colors); i > 1; i--) {
	j = randRange(1, i)
	swap = colors[i]
	colors[i] = colors[j]
	colors[j] = swap
}
</cfscript>

<cfoutput query="act">
<form id="color-names">
	<row>
		<div class="col">
			<article>
				<header class="theme-primary theme-subtle">
					Color
				</header>
				<section id="colors">
               <cfloop array="#colors#" index="item">
                  <div class="color-swatch" data-qid="#item.qid#" data-qdesc="#encodeForHTMLAttribute(item.qdesc)#" style="background-color:###encodeForHTMLAttribute(item.qname)#"></div>
               </cfloop>
            </section>
         </article>
		</div>
		<aside>
			<article>
				<header class="theme-primary theme-subtle">
					Color names
				</header>
				<section>
					<ul id="names" class="list-unstyled mb-0">
						<cfloop array="#colors#" index="item">
							<li>
								<span class="color-name" data-qid="#item.qid#">#encodeForHTML(item.qdesc)#</span>
							</li>
						</cfloop>
					</ul>
				</section>
			</article>
		</aside>
	</row>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
