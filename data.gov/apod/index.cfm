<cfscript>
param form.actid = 347;
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div class="row">
      <div class="col-12 md:col-8 lg:col-5 order-2 md:order-1">

         <div class="card" id="picturePanel">
            <div class="card-header" role="status" aria-live="polite">
               <a id="apodTitle"
                  href="https://science.nasa.gov/"
                  target="_blank"
                  rel="noopener noreferrer"></a>
            </div>

            <div class="card-body p-0">
               <figure id="apodMedia">
                  <figcaption id="apodCredit" class="apod-credit text-body-secondary"></figcaption>
               </figure>
            </div>
         </div>

      </div>

      <div class="col-12 lg:col-4 order-3 lg:order-2">

         <div class="accordion accordion-gap" id="apodAccordion">

            <details class="accordion-item" id="explanationPanel">
               <summary class="accordion-header">
                  Explanation
                  <svg class="accordion-icon"
                       xmlns="http://www.w3.org/2000/svg"
                       viewBox="0 0 16 16"
                       fill="none"
                       stroke="currentColor"
                       stroke-linecap="round"
                       stroke-linejoin="round"
                       aria-hidden="true">
                     <path d="m2 5 6 6 6-6"/>
                  </svg>
               </summary>

               <div class="accordion-body">
                  <div id="apodExplanation" class="apod-explanation"></div>
               </div>
            </details>

         </div>

      </div>

      <div class="col-12 md:col-4 lg:col-3 order-1 md:order-2 lg:order-3">
         <div class="card">
            <div class="card-header">
               <input id="apodDate" class="form-control apod-date" type="text" autocomplete="off" spellcheck="false" placeholder="YYYY-MM-DD" aria-label="Picture date">
            </div>

            <div class="card-body p-0">
               <div class="btn-group w-100" role="group" aria-label="Picture navigation">
                  <button type="button" id="btnPrev" class="btn-outline theme-primary">Prev</button>
                  <button type="button" id="btnRandom" class="btn-outline theme-primary">Rnd</button>
                  <button type="button" id="btnNext" class="btn-outline theme-primary">Next</button>
               </div>

               <button type="button" id="btnExplanation" class="btn-outline theme-primary w-100 lg:d-none">
                  Explanation
               </button>
            </div>
         </div>
      </div>
   </div>

<cfinclude template="/Inc/footer6.cfm">
</cfoutput>