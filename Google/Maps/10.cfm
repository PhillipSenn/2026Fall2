<cfscript>
param form.actid=343;
request.progress.bar = false
request.container = 'container-fluid'
include '/Inc/header6.cfm'
airport = queryExecute('select * from airport where isActive=1')
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
    </tr>
</cfloop>
</table>
<script src="google-maps.js"></script>
<cfinclude template="/Inc/footer6.cfm">
   
</cfoutput>
