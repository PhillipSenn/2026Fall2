<cfscript>
request.progress.bar = false
request.container = 'container-fluid'
include '/Inc/header6.cfm'
geoguessr = new dbo.proc().exec('geoguessr.where_geoguessr',url.geoguessrid)

if (!geoguessr.recordCount) {
    throw(message='Location not found.')
}

if (isDefined('form.guessLat') && isDefined('form.guessLng')) {
    new dbo.proc().usr(
        'guessr.merge_geo', // aka guess
        [url.geoguessrid
        ,form.guessLat
        ,form.guessLng]
    )
    location('./?actid=' & form.actid,false)
}

submitted = val(url.submitted ?: 0)
</cfscript>

<cfoutput>
<div class="location-page">

    <div class="location-layout">

        <section class="location-panel">
            <div id="streetview"></div>
        </section>

        <section class="location-panel">
            <div id="map"></div>
        </section>

    </div>

    <form id="location" class="location-actions">

        <div class="row align-items-center g-3">

            <div class="col">
                <div class="fw-semibold">
                    Find this location!
                </div>
                <div class="text-body-secondary">
                    Explore Street View, then click
                    the map to place your marker.
                </div>
            </div>

            <div id="coordinates" class="col-auto">
                No guess yet.
            </div>

            <div class="col-auto">
                <button type="button" id="hereButton" disabled>
                    Here!
                </button>
            </div>

        </div>
        <input hidden name="actid" value="#form.actid#">
        <input hidden name="guessLat" id="guessLat">
        <input hidden name="guessLng" id="guessLng">
        <div id="message" role="status" aria-live="polite"></div>

    </form>

</div>

<script>
var spot = {
    lat: #val(geoguessr.lat)#,
    lng: #val(geoguessr.lng)#,
    heading: #val(geoguessr.heading)#,
    pitch: #val(geoguessr.pitch)#,
    zoom: #val(geoguessr.zoom)#,
    panoid: '#encodeForJavaScript(geoguessr.panoid)#'
};

var alreadySubmitted = #serializeJSON(submitted == 1)#;
</script>

<script src="findr.js"></script>
<cfinclude template="../myGoogleKey.cfm">
<script async onerror="googleMapsError()"
    src="https://maps.googleapis.com/maps/api/js?key=#myGoogleKey#&amp;callback=initMap&amp;loading=async">
</script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
