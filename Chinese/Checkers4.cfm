<cfscript>
request.container = 'container-xl';
request.progress.bar = false;
include '/Inc/header.cfm';
// Holes per row, top point through bottom point. 121 holes.
rows = [1, 2, 3, 4, 13, 12, 11, 10, 9, 10, 11, 12, 13, 4, 3, 2, 1];
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="col-8">
		<div class="card">
			<div class="card-header bg-primary-subtle d-flex justify-content-end align-items-center">
				<span class="d-flex gap-2">
					<button type="button" id="flip" class="btn btn-sm btn-outline-secondary">Flip</button>
					<button type="button" id="reset" class="btn btn-sm btn-outline-secondary">Reset</button>
				</span>
			</div>
			<div class="card-body">
				<div class="star" id="board" aria-label="Chinese checkers board">
					<cfloop from="1" to="#arrayLen(rows)#" index="row">
						<cfset count = rows[row]>
						<div class="cc-row">
							<cfloop from="1" to="#count#" index="i">
								<div class="hole" role="gridcell"></div>
							</cfloop>
						</div>
					</cfloop>
				</div>
				<p id="status" class="text-center text-body-secondary mb-0 mt-3">Try a move.</p>
			</div>
		</div>
	</div>
	<div class="col-4">
		<div class="card h-100">
			<div class="card-header bg-primary-subtle">One player</div>
			<div class="card-body">
				<div class="d-flex flex-wrap gap-2" id="players">
					<button type="button" class="btn btn-outline-secondary" data-players="2">2</button>
					<button type="button" class="btn btn-outline-secondary" data-players="3">3</button>
					<button type="button" class="btn btn-outline-secondary" data-players="4">4</button>
					<button type="button" class="btn btn-outline-secondary" data-players="6">6</button>
				</div>
				<p class="mt-3 mb-2">You play the marbles at the bottom. This starts with only your marbles, so you can try moves with no opponent. Drag a marble onto a highlighted hole, or click the marble and then the hole. Flip rotates the colors. You stay in the bottom seat.</p>
				<p class="mb-0" id="setup-note">Choose 2, 3, 4, or 6 players to add the computer. You stay at the bottom.</p>
			</div>
		</div>
	</div>
</div>

<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
