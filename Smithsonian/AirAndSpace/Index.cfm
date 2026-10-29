<cfscript>
param form.actid = 348;
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="row">
   <div class="col-12 md:col-10 lg:col-5 order-2 md:order-1">
      <div class="card" id="picturePanel">
         <div class="card-header" role="status" aria-live="polite">
            <a id="artifactTitle" target="_blank" rel="noopener noreferrer"></a>
         </div>
         <div class="card-body p-0">
            <figure id="artifactMedia">
               <figcaption id="artifactCredit" class="artifact-credit text-body-secondary"></figcaption>
            </figure>
         </div>
      </div>
   </div>

   <div class="col-12 lg:col-5 order-3 lg:order-2">
      <div class="accordion accordion-gap" id="artifactAccordion">
         <details class="accordion-item" id="explanationPanel">
            <summary class="accordion-header">
               Explanation
               <svg class="accordion-icon" xmlns="http://www.w3.org/2000/svg"
                    viewBox="0 0 16 16" fill="none" stroke="currentColor"
                    stroke-linecap="round" stroke-linejoin="round" aria-hidden="true">
                  <path d="m2 5 6 6 6-6"/>
               </svg>
            </summary>
            <div class="accordion-body">
               <div id="artifactExplanation" class="artifact-explanation"></div>
            </div>
         </details>
      </div>
   </div>

   <div class="col-12 md:col-2 lg:col-2 order-1 md:order-2 lg:order-3">
      <div class="card">
         <div class="card-body p-0">
            <div class="btn-group-vertical align-self-stretch w-100" role="group"
                 aria-label="Artifact navigation">
               <button type="button" id="btnPrev" class="btn btn-outline-primary">&larr; Previous</button>
               <button type="button" id="btnNext" class="btn btn-outline-primary">Next &rarr;</button>
               <button type="button" id="btnExplanation" class="btn btn-outline-primary lg:d-none">Explanation</button>
            </div>
         </div>
      </div>
   </div>
</div>

<div id="artifactZoom" class="artifact-zoom" hidden>
   <img id="artifactZoomImage" alt="">
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
