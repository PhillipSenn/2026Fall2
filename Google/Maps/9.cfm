<cfscript>
request.container = ''
request.navbar=false
include '/Inc/header6.cfm'
airport = queryExecute('select * from airport where isActive=1')
</cfscript>

<cfoutput >
<nav class="navbar lg:navbar-expand bg-black" data-bs-theme="dark">
    <div class="container-fluid">
        <a href="index.cfm" class="navbar-brand">Airport Map</a>
        <button type="button" class="btn btn-outline theme-inverse fg-white border-white ms-auto" data-bs-toggle="drawer" data-bs-target="##mapInfo" aria-controls="mapInfo">
            Info
        </button>
    </div>
</nav>
<!-- MAP -->

<div id="map"></div>
<dialog class="drawer drawer-end" id="mapInfo" tabindex="-1" aria-labelledby="mapInfoTitle">
    <div class="drawer-header">
        <h5 class="drawer-title" id="mapInfoTitle">Map Info</h5>
        <button type="button" class="btn-close" data-bs-dismiss="drawer" aria-label="Close"></button>
    </div>
    <div class="drawer-body">
        <p>Flight: <span id="flight">HKY</span></p>
        <p>Speed: <span id="speed">0</span> mph</p>
        <p>Duration: 30 seconds</p>
    </div>
</dialog>
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
