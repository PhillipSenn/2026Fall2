<cfscript>
request.container = 'container-fluid'
request.progress.bar = false
include '/Inc/header6.cfm'
row = new dbo.proc().exec('row.rnd',{},'UNESCO')
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
                <a class="btn-sm btn-outline theme-primary float-end" href="geoguessr.cfm?actid=#form.actid#&id=#request.usr.id#">Next</a>
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
