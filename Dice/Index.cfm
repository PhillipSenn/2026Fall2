<cfscript>
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-body text-center">
		<h1 id="dice-heading" class="mb-4">Dice Roller</h1>
		<div class="row justify-content-center align-items-center">
			<div class="col-md-8">
				<div class="dice-pair d-flex justify-content-center gap-4 mb-4" aria-live="polite">
					<div id="dieOne" class="die" role="img" aria-label="Die one: 1">
						<div class="die-face face-top face-one"></div>
						<div class="die-face face-front face-two"></div>
						<div class="die-face face-back face-five"></div>
						<div class="die-face face-right face-three"></div>
						<div class="die-face face-left face-four"></div>
						<div class="die-face face-bottom face-six"></div>
					</div>
					<div id="dieTwo" class="die" role="img" aria-label="Die two: 1">
						<div class="die-face face-top face-one"></div>
						<div class="die-face face-front face-two"></div>
						<div class="die-face face-back face-five"></div>
						<div class="die-face face-right face-three"></div>
						<div class="die-face face-left face-four"></div>
						<div class="die-face face-bottom face-six"></div>
					</div>
				</div>
				<p id="total" class="fs-4 mb-4">Total: --</p>
				<div class="d-flex justify-content-center align-items-end gap-2">
					<div class="text-start">
						<label for="rollCount" class="form-label mb-1">Number of rolls</label>
						<input id="rollCount" class="form-control" type="number" min="1" max="100000" value="1">
					</div>
					<button id="rollButton">Roll Dice</button>
				</div>
				<p id="rollStatus" class="text-body-secondary mt-2 mb-0" role="status" aria-live="polite"></p>
			</div>
			<aside class="col-md-2 mt-4 mt-md-0 text-start" aria-labelledby="results-heading">
				<div class="card">
					<div class="card-header" id="results-heading">Roll totals</div>
					<ol id="rollResults" class="list-group list-group-numbered list-group-flush">
						<cfoutput><cfloop from="1" to="12" index="rollTotal">
							<li class="list-group-item d-flex justify-content-between align-items-center" data-total="#rollTotal#">
								<div class="progress flex-grow-1 me-2" role="presentation" style="height: 0.6rem">
									<div class="progress-bar bg-secondary result-bar" role="progressbar" aria-label="Total #rollTotal#: 0%" aria-valuemin="0" aria-valuemax="100" aria-valuenow="0" style="width: 0%"></div>
								</div>
								<span class="result-count me-2">0</span>
								<span class="badge text-bg-secondary result-percent">0%</span>
							</li>
						</cfloop></cfoutput>
						<li class="list-group-item d-flex justify-content-between align-items-center result-total">
							<span>Total</span>
							<span id="resultsTotal" class="badge text-bg-dark">0</span>
						</li>
					</ol>
					<div class="card-footer">
						<div class="form-check">
							<input id="speedMode" class="form-check-input" type="checkbox">
							<label class="form-check-label" for="speedMode">Speed</label>
						</div>
					</div>
				</div>
			</aside>
		</div>
	</div>
</div>
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>