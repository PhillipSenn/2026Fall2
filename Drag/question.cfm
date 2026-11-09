<cfscript>
include '/Inc/header6.cfm'
q = new dbo.proc().exec('q.where_q', form.qid)
ans = new dbo.proc().exec('ans.where_q', form.qid)
</cfscript>

<cfoutput query="act">
<row>
	<div class="lg:col-6 lg:mx-auto">
		<article>
			<header class="theme-primary theme-subtle">
				#q.qname#
			</header>
			<section>
				<cfif len(q.qdesc)>
					<fieldset>
						<legend>#ReplaceNoCase(ListFirst(ListLast(q.qdesc, '/'), '.'), 'Figure', 'Figure ')#</legend>
						<img src="#q.qdesc#" class="img-thumbnail">
					</fieldset>
				</cfif>
				<cfloop query="ans">
					<p>#ansname#</p>
					<cfif len(ansdesc)>
						<fieldset>
							<legend>#ReplaceNoCase(ListFirst(ListLast(ansdesc, '/'), '.'), 'Figure', 'Figure ')#</legend>
							<img src="#ansdesc#" class="img-thumbnail">
						</fieldset>
					</cfif>
				</cfloop>
			</section>
			<footer>
				<form action="results.cfm">
					<button class="btn-outline theme-primary">Back to results</button>
					<input hidden name="actid" value="#form.actid#">
					<input hidden name="id" value="#request.usr.id#">
				</form>
			</footer>
		</article>
	</div>
</row>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
