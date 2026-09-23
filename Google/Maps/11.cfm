<cfscript>
request.container = ''
request.navbar=false
include '/Inc/header.cfm'
param url.actid=178;
latlng = new dbo.proc().exec('latlng.where_act',url.actid)
</cfscript>

<cfoutput >
<nav class="navbar navbar-dark bg-dark navbar-expand-lg">
    <div class="container-fluid">
        <a href="index.cfm" class="navbar-brand">Airport Map</a>
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
<table id="airports" hidden>
<cfloop query="latlng">
    <tr>
        <td>#latlngname#</td>
        <td>#replacenocase(latlngdesc,'airport','')#</td>
        <td>#lat#</td>
        <td>#lng#</td>
        <td>#countryName#</td>
        <td>#countryCode#</td>
    </tr>
</cfloop>
</table>
<script src="google-maps.js"></script>
<script src="twemoji.js"></script>
<div hidden>
    <div id="codePoint">#request.usr.codePoint#</div>
</div>
<cfinclude template="/Inc/footer.cfm">
   
</cfoutput>
