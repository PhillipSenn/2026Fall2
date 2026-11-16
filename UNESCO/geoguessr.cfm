<cfscript>
request.container = 'container-fluid'
done = queryExecute('
	select count(*) as cnt
	from ug
	join (
		select poi_row
		from poi
		group by poi_row
	) poi on poi_row = ug_row
	where ug_usr = :usrid',
	{usrid: {value: request.usr.usrid, cfsqltype: 'cf_sql_integer'}},
	{datasource: 'UNESCO'}
)
total = queryExecute('
	select count(*) as cnt
	from row
	join (
		select poi_row
		from poi
		group by poi_row
	) poi on poi_row = rowid',
	{},
	{datasource: 'UNESCO'}
)
gradeLabel = new dbo.proc().usr('grade.where_act', form.actid)
request.progress.pct = val(done.cnt) & ' / ' & val(total.cnt) & ' (' & val(gradeLabel.earned) & '%)'
include '/Inc/header6.cfm'
row = queryNew('')
if (structKeyExists(url, 'rowid') && isNumeric(url.rowid) && val(url.rowid)) {
	row = queryExecute('
		select rowid,image_url,danger,date_inscribed,extension,short_description,sitename,transnational
			,categoryname
		from row
		left join category on row_category=categoryid
		where rowid=:rowid
		and not exists(
			select 1 from ug
			where ug_row=rowid
			and ug_usr=:usrid
		)',
		{
			rowid: {value: val(url.rowid), cfsqltype: 'cf_sql_integer'},
			usrid: {value: request.usr.usrid, cfsqltype: 'cf_sql_integer'}
		},
		{datasource: 'UNESCO'}
	)
}
if (!row.recordCount) {
	row = new dbo.proc().usr('row.rnd',{},'UNESCO')
}
poi = new dbo.proc().exec('poi.where_row',row.rowid,'UNESCO')
</cfscript>

<cfoutput query="act">
<row>
    <div class="col-5">
        <article>
            <header class="<cfif row.danger>theme-danger<cfelse>theme-primary</cfif> theme-subtle d-flex justify-content-between align-items-center gap-3">
                <span>#row.sitename#,  
                <cfif row.extension>
                    Extension,
                </cfif>
                #row.date_inscribed#</span>
                <cfif row.transnational>
                    <span>Transnational</span>
                </cfif>
            </header>
            <section>
                <fieldset>
                    <legend>#row.categoryname#</legend>
                    <a href="https://whc.unesco.org/en/list/#row.rowid#" target="_blank">
                        <img class="rounded w-100" src="#row.image_url#">
                    </a>
                </fieldset>
            </section>
        </article>
        <table hidden id="poi">
            <tbody>
                <cfloop query="poi">
                    <tr><td>#lat#</td><td>#lng#</td><td>#iso2#</td>
                </cfloop>
            </tbody>
        </table>
    </div>
    <div class="col-7">
        <article class="map-card">
            <header class="theme-primary theme-subtle">
                <a class="btn-sm btn-outline" href="./?actid=#form.actid#">Back</a>
                <a class="btn-sm btn-outline float-end" href="geoguessr.cfm?actid=#form.actid#&id=#request.usr.id#">Next</a>
            </header>
            <section>
                <div id="map"></div>
            </section>
        </article>
    </div>
</row>
<button type="button" class="desc-tab" id="desc-open" aria-controls="desc-panel" aria-expanded="false">
    Description
</button>
<button type="button" class="results-tab" id="results-open" aria-controls="results-panel" aria-expanded="false">
    Results
</button>
<div class="desc-backdrop" id="desc-backdrop" hidden></div>
<aside class="desc-panel" id="desc-panel" aria-label="Description" aria-hidden="true">
    <button type="button" class="btn btn-sm btn-outline-primary desc-close" id="desc-close" aria-label="Close description"><i class="bi bi-x-lg" aria-hidden="true"></i></button>
    <div class="desc-body">
        #row.short_description#
    </div>
</aside>
<aside class="desc-panel results-panel" id="results-panel" aria-label="Results" aria-hidden="true">
    <button type="button" class="btn btn-sm btn-outline-primary desc-close" id="results-close" aria-label="Close results"><i class="bi bi-x-lg" aria-hidden="true"></i></button>
    <div class="desc-body">
        <table id="results">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Date</th>
                    <th class="text-end">Miles</th>
                </tr>
            </thead>
            <tbody></tbody>
        </table>
    </div>
</aside>
<div hidden id="codePoint">#request.usr.codePoint#</div>
<div hidden id="rowid">#row.rowid#</div>
<cfinclude template="../Google/myGoogleKey.cfm">
<script>
var googleMapsLoaded = false;
function initMap() {
    googleMapsLoaded = true;
}
</script>
<script async onerror="googleMapsError()"
    src="https://maps.googleapis.com/maps/api/js?key=#myGoogleKey#&amp;callback=initMap&amp;loading=async">
</script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
