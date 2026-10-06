<cfscript>
request.container = ''
request.navbar=false
include '/Inc/header.cfm'
</cfscript>

<nav class="navbar navbar-dark bg-dark navbar-expand-lg">

    <div class="container-fluid">

        <a class="navbar-brand">Airport Map</a>

        <div class="ticker-container">
            <div class="ticker-text">
                Phillip departed Egypt for United States
            </div>
        </div>

        <button class="btn btn-outline-light" id="toggleSidebar">
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
<script src="google-maps.js"></script>
<cfinclude template="/Inc/footer.cfm">
