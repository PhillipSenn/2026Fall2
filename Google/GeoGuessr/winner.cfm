<cfscript>
request.progress.bar = false
include '/Inc/header6.cfm'
geoguessr = new dbo.proc().exec('geoguessr.where_geoguessr',url.geoguessrid)
function milesBetween(lat1, lng1, lat2, lng2) {
    var earthMiles = 3958.7613
    var p = pi() / 180
    var dLat = (lat2 - lat1) * p
    var dLng = (lng2 - lng1) * p
    var a = sin(dLat / 2) * sin(dLat / 2)
        + cos(lat1 * p) * cos(lat2 * p) * sin(dLng / 2) * sin(dLng / 2)
    if (a > 1) {
        a = 1
    }
    return earthMiles * (2 * asin(sqr(a)))
}

spot = new dbo.proc().exec('geoguessr.where_geoguessr', url.geoguessrid)
if (!spot.recordCount) {
    throw(message='Location not found.')
}

guesses = new dbo.proc().exec('guessr.where_geo', url.geoguessrid)
miles = []
for (i = 1; i <= guesses.recordCount; i++) {
    arrayAppend(miles, milesBetween(
        spot.lat,
        spot.lng,
        guesses.guessr_lat[i],
        guesses.guessr_lng[i]
    ))
}
queryAddColumn(guesses, 'miles', 'double', miles)
ranked = queryExecute('
    select firstname, guessr_lat, guessr_lng, guessrdate, miles
    from guesses
    order by miles
', {}, {dbtype: 'query'})
</cfscript>

<cfoutput>
<div class="card">
    <div class="card-header theme-primary theme-subtle">
        #encodeForHtml(spot.locationname)#
    </div>
    <div class="card-body">
        <table>
            <thead>
                <tr>
                    <th>First name</th>
                    <th class="text-end">Distance</th>
                    <th class="text-end">Latitude</th>
                    <th class="text-end">Longitude</th>
                    <th>Date</th>
                </tr>
            </thead>
            <tbody>
                <cfloop query="ranked">
                    <cfset mapUrl = 'https://www.google.com/maps?q=' & encodeForUrl(guessr_lat) & ',' & encodeForUrl(guessr_lng)>
                    <tr>
                        <td>#encodeForHtml(firstname)#</td>
                        <td class="text-end">#numberFormat(miles, '9,999.00')# miles</td>
                        <td class="text-end">
                            <a href="#mapUrl#" target="_blank">#encodeForHtml(guessr_lat)#</a>
                        </td>
                        <td class="text-end">
                            <a href="#mapUrl#" target="_blank">#encodeForHtml(guessr_lng)#</a>
                        </td>
                        <td>#dateFormat(guessrdate, 'mmm d, yyyy')# #timeFormat(guessrdate, 'h:mm tt')#</td>
                    </tr>
                </cfloop>
            </tbody>
        </table>
    </div>
</div>
<div id="map"></div>
<script>
var spot = {
    lat: #val(spot.lat)#,
    lng: #val(spot.lng)#,
    name: '#encodeForJavaScript(spot.locationname)#'
};
var guesses = [
<cfloop query="ranked">
    {
        name: '#encodeForJavaScript(firstname)#',
        lat: #val(guessr_lat)#,
        lng: #val(guessr_lng)#
    }<cfif ranked.currentRow lt ranked.recordCount>,</cfif>
</cfloop>
];
</script>
<cfinclude template="../myGoogleKey.cfm">
<script async onerror="googleMapsError()" src="https://maps.googleapis.com/maps/api/js?key=#myGoogleKey#&amp;callback=initMap&amp;loading=async"></script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
