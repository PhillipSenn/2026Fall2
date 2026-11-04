<cfscript>
include '/Inc/header6.cfm'
q = new dbo.proc().exec('q.where_act',form.actid)
</cfscript>

<cfoutput query="act">
<div hidden id="videoId">#encodeForHTML(q.qname)#</div>
<div hidden id="startSecond">#val(q.qsort)#</div>
<div class="card">
	<div class="card-body">
		<div class="row">
			<div class="md:col-8">
				<div class="ratio ratio-16x9">
					<div id="player"></div>
				</div>
			</div>
			<aside class="md:col-4 mt-3 md:mt-0" aria-labelledby="watched-heading">
				<div class="card">
					<div class="card-header" id="watched-heading">Watched</div>
					<div class="card-body p-0">
						<table class="table table-sm mb-0">
							<thead>
								<tr>
									<th>From</th>
									<th>To</th>
								</tr>
							</thead>
							<tbody id="watchedSummary"></tbody>
						</table>
					</div>
				</div>
			</aside>
		</div>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
