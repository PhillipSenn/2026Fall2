<cfscript>
form.actid=345
request.progress.bar = false
request.container = 'container-fluid'
include '/Inc/header6.cfm'
if (isDefined('form.locationName')) {
   new dbo.proc().usr('geoguessr.insert_location',
      [form.locationName
      ,form.lat
      ,form.lng
      ,form.heading
      ,form.pitch
      ,form.zoom
      ,form.panoid]
   )
   new dbo.proc().usr('poll.merge_q',form.qid)
}
poll = new dbo.proc().usr('poll.unanswered',form.actid)
ans = new dbo.proc().exec('ans.where_q',poll.qid)
</cfscript>

<cfoutput >
<div class="location-page">
   <div class="location-layout">

      <section class="location-panel">
         <div id="streetview"></div>
      </section>

      <section class="location-panel">
         <div id="mapSearch" data-qname="#encodeForHtmlAttribute(poll.qname)#"></div>
         <div id="map"></div>
      </section>

   </div>

   <form id="location" class="location-actions">
      <div class="row">
         <div class="col">
            <textarea autofocus class="form-control"
                  id="locationName"
                  name="locationName"
                  placeholder="Give us a hint at least!"></textarea>
         </div>
         <div id="coordinates" class="col">
            Loading Street View...
         </div>
      </div>

      <input type="hidden" name="lat">
      <input type="hidden" name="lng">
      <input type="hidden" name="heading">
      <input type="hidden" name="pitch">
      <input type="hidden" name="zoom">
      <input type="hidden" name="panoid">

      <button type="button" id="hereButton" disabled>
         Here!
      </button>

      <div
         id="message"
         role="status"
         aria-live="polite"
      ></div>
      <input hidden name="qid" value="#poll.qid#">
   </form>
   #poll.qname#<br>
   qdesc: #poll.qdesc#
   <cfloop query="ans">
      <p>#ansid#: #ansname#</p>
   </cfloop>
</div>
<cfinclude template="../myGoogleKey.cfm">
<script async onerror="googleMapsError()" src="https://maps.googleapis.com/maps/api/js?key=#myGoogleKey#&amp;libraries=places&amp;callback=initMap&amp;loading=async"></script>
<script src="/Inc/js/autosize.js"></script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
