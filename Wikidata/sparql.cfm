<cfscript>
request.container = 'container-fluid'
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div id="wikidataExplorer">
    <row class="g-4">

        <div class="col-12 lg:col-5">
            <article>
                <header>
                    <a id="askChatGPT" target="_blank" rel="noopener noreferrer"
                        href="https://chatgpt.com/?q=#urlEncodedFormat('Write a Wikidata SPARQL query for a top 10 list of ')#"
                    >Ask ChatGPT</a>
                </header>

                <section>
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
                </section>
            </article>
        </div>

        <div class="col-12 lg:col-7">
            <article>
                <header class="d-flex justify-content-between align-items-center">
                    <h2 class="h4 mb-0">Results</h2>
                    <span id="resultCount" class="small fg-2"></span>
                </header>

                <section>
                    <div id="queryMessage" role="status" aria-live="polite"></div>

                    <div id="resultsArea" class="table-responsive">
                        <p class="fg-2">
                            Your query results will appear here.
                        </p>
                    </div>
                </section>
            </article>
        </div>

    </row>
</div>


<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
