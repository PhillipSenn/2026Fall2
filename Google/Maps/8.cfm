<cfscript>
request.container = ''
request.navbar=false
include '/Inc/header6.cfm'
airport = queryExecute('select * from airport where isActive=1 and statename is null and countrycode <> ''SCT''')
</cfscript>

<cfoutput >
<nav class="navbar lg:navbar-expand bg-black" data-bs-theme="dark">
    <div class="container-fluid">
        <a href="index.cfm" class="navbar-brand">Airport Map</a>
        <div class="ticker-container">
            <div class="ticker-text">
                Phillip departed Egypt for United States
            </div>
        </div>
        <button class="btn btn-outline theme-inverse fg-white border-white" id="toggleSidebar">
            Info
        </button>
    </div>
</nav>
<!-- MAP -->

<div id="map"></div>
<div id="sidebar">

    <h5>Map Info</h5>

    <p>Flight: CAI → IAD</p>
    <p>Speed: <span id="speed"></span> mph</p>
    <p>Duration: 30 seconds</p>

</div>
<table id="airports" hidden>
<cfloop query="airport">
    <tr>
        <td>#iata#</td>
        <td>#airportname#</td>
        <td>#lat#</td>
        <td>#lng#</td>
        <td>#countryname#</td>
        <td>#countrycode#</td>
    </tr>
</cfloop>
</table>
<script src="google-maps.js"></script>
<cfinclude template="/Inc/footer6.cfm">
   
</cfoutput>
