<cfscript>
include '/Inc/header6.cfm'
poll = new dbo.proc().usr('poll.unanswered',form.actid)
</cfscript>

<cfoutput>
<div id="manGame">
   <div id="mazeSpace">
      <canvas id="maze" tabindex="0" aria-label="Move with arrow keys or WASD. Find the correct term, then catch a ghost. Swipe to steer on touch screens."></canvas>
   </div>
   <aside class="man-sidebar" id="manDefinition" aria-label="Current definition">
      <p id="definition" aria-live="polite"></p>
      <strong id="termHint" hidden aria-live="polite"></strong>
      <button type="button" id="soundToggle" class="theme-primary btn-solid btn-styled" aria-pressed="true">Sound on</button>
   </aside>
</div>

<dialog id="completeModal" class="man-modal" aria-labelledby="completeTitle" aria-describedby="completeDescription">
   <h2 id="completeTitle">All ghosts caught!</h2>
   <p id="completeDescription">You matched all four definitions.</p>
   <button type="button" id="reloadGame" class="theme-warning btn-solid btn-styled">Reload page</button>
</dialog>
<table id="questions" hidden>
   <cfloop query="poll" endrow="4">
      <tr>
         <td>#qid#</td>
         <td>#qname#</td>
         <td>#qdesc#</td>
      </tr>
   </cfloop>
   </table>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
