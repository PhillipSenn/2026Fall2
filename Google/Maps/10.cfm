<cfscript>
param form.actid=343;
request.progress.bar = false
request.container = 'container-fluid'
include '/Inc/header6.cfm'
airport = queryExecute('select * from airport where isActive=1')
savedFlight = {}
savedLat = ""
savedLng = ""
savedAirport = ""
savedCity = ""
savedCountry = ""
function flightValue(row, key) {
	if (!isStruct(row)) {
		return ""
	}
	if (structKeyExists(row, key) && !isNull(row[key])) {
		return row[key]
	}
	if (structKeyExists(row, uCase(key)) && !isNull(row[uCase(key)])) {
		return row[uCase(key)]
	}
	return ""
}
if (structKeyExists(application, "flight") && isStruct(application.flight)) {
	cflock(scope="application", type="readonly", timeout="5") {
		if (structKeyExists(application.flight, request.usr.id)) {
			savedFlight = duplicate(application.flight[request.usr.id])
		} else {
			for (flightId in application.flight) {
				if (uCase(flightId) == uCase(request.usr.id)) {
					savedFlight = duplicate(application.flight[flightId])
					break
				}
			}
		}
	}
	savedLat = flightValue(savedFlight, "latitude")
	savedLng = flightValue(savedFlight, "longitude")
	if (!isNumeric(savedLat) || !isNumeric(savedLng)) {
		savedLat = ""
		savedLng = ""
	} else {
		savedAirport = flightValue(savedFlight, "airportname")
		savedCity = flightValue(savedFlight, "cityname")
		savedCountry = flightValue(savedFlight, "countryname")
	}
}
</cfscript>

<cfoutput >
<button type="button" id="showFlights" class="btn btn-dark" data-bs-toggle="drawer" data-bs-target="##flightDrawer" aria-controls="flightDrawer">Flights</button>
<div id="map"></div>
<dialog class="drawer drawer-end" id="flightDrawer" tabindex="-1" aria-labelledby="flightDrawerTitle">
    <div class="drawer-header">
        <h5 class="drawer-title" id="flightDrawerTitle">Flights</h5>
        <button type="button" class="btn-close" data-bs-dismiss="drawer" aria-label="Close"></button>
    </div>
    <div class="drawer-body" id="flightRows"></div>
</dialog>
<span id="flight" hidden>HKY</span>
<span id="savedLat" hidden>#encodeForHtml(savedLat)#</span>
<span id="savedLng" hidden>#encodeForHtml(savedLng)#</span>
<span id="savedAirport" hidden>#encodeForHtml(savedAirport)#</span>
<span id="savedCity" hidden>#encodeForHtml(savedCity)#</span>
<span id="savedCountry" hidden>#encodeForHtml(savedCountry)#</span>
<span id="speed" hidden>0</span>
<span id="usrCodePoint" hidden>#encodeForHtml(request.usr.codePoint)#</span>
<table id="airports" hidden>
<cfloop query="airport">
    <tr>
        <td>#iata#</td>
        <td>#replacenocase(airportname,'airport','')#</td>
        <td>#lat#</td>
        <td>#lng#</td>
        <td>#countryname#</td>
        <td>#countrycode#</td>
        <td>#statename#</td>
        <td>#statecode#</td>
        <td>#cityname#</td>
    </tr>
</cfloop>
</table>
<script src="google-maps.js"></script>
<cfinclude template="/Inc/footer6.cfm">
   
</cfoutput>
