<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<div class="card" id="unicode-viewer">
	<div class="card-header bg-primary-subtle">
		Choose a block, then a character.
	</div>
	<div class="card-body">
		<div class="row">
			<div class="col-3">
				<div class="rendered-row">
					<p id="rendered" class="unicode-text" hidden></p>
					<div id="rotate" role="slider" tabindex="0" aria-label="Rotate character" aria-valuemin="0" aria-valuemax="359" aria-valuenow="0" title="0 degrees">
						<span class="rotate-arm">
							<span class="rotate-handle float-end">
								<span></span>
								<span></span>
							</span>
						</span>
					</div>
				</div>
				<div id="tones" class="d-flex flex-wrap gap-2 mb-3" hidden></div>
				<div id="detail"></div>
			</div>
			<div class="col-6">
				<div id="grid" aria-label="Characters in this block"></div>
			</div>
			<div class="col-3">
				<div id="blocks" class="btn-group flex-wrap" role="group" aria-label="Unicode blocks"></div>
			</div>
		</div>
	</div>
</div>
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>