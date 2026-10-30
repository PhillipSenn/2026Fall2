<cfscript>
request.container = 'container-fluid'
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div id="wikidataExplorer">
    <div class="row g-4">

        <div class="col-12 lg:col-5">
            <div class="card">
                <div class="card-header">
                    <a id="askChatGPT" target="_blank" rel="noopener noreferrer"
                        href="https://chatgpt.com/?q=#urlEncodedFormat('Write a Wikidata SPARQL query for a top 10 list of ')#"
                    >Ask ChatGPT</a>
                </div>

                <div class="card-body">
                    <textarea
                        id="sparqlQuery"
                        class="form-control font-monospace"
                        rows="16"
                        spellcheck="false"
                        placeholder="Paste your SPARQL query here..."
                    ></textarea>

                    <div class="d-flex gap-2 mt-3">
                        <button
                            type="button"
                            id="runQuery"
                            class="btn-solid theme-primary btn-styled"
                        >Execute Query</button>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 lg:col-7">
            <div class="card">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h2 class="h4 mb-0">Results</h2>
                    <span id="resultCount" class="small fg-2"></span>
                </div>

                <div class="card-body">
                    <div id="queryMessage" role="status" aria-live="polite"></div>

                    <div id="resultsArea" class="table-responsive">
                        <p class="fg-2">
                            Your query results will appear here.
                        </p>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div>


<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
