<cfscript>
request.container = 'container-xl'
request.progress.bar = false
include '/Inc/header.cfm';
files = ['a','b','c','d','e','f','g','h'];
// Unicode: white ♖♘♗♕♔♙ then black ♜♞♝♛♚♟
start = {
	'a1': 9814, 'b1': 9816, 'c1': 9815, 'd1': 9813, 'e1': 9812, 'f1': 9815, 'g1': 9816, 'h1': 9814,
	'a2': 9817, 'b2': 9817, 'c2': 9817, 'd2': 9817, 'e2': 9817, 'f2': 9817, 'g2': 9817, 'h2': 9817,
	'a7': 9823, 'b7': 9823, 'c7': 9823, 'd7': 9823, 'e7': 9823, 'f7': 9823, 'g7': 9823, 'h7': 9823,
	'a8': 9820, 'b8': 9822, 'c8': 9821, 'd8': 9819, 'e8': 9818, 'f8': 9821, 'g8': 9822, 'h8': 9820
};
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
				<div class="board" id="board" aria-label="Chessboard">
				<cfloop from="8" to="1" index="rank" step="-1">
					<cfloop from="1" to="8" index="fileN">
						<cfset col = files[fileN]>
						<cfset sq = col & rank>
						<cfset shade = "light">
						<cfif ((fileN + rank) mod 2) eq 0>
							<cfset shade = "dark">
						</cfif>
						<div class="square #shade#" data-square="#sq#" role="gridcell" aria-label="#sq#">
							<cfif fileN eq 1><span class="coord rank">#rank#</span></cfif>
							<cfif rank eq 1><span class="coord file">#col#</span></cfif>
							<cfif structKeyExists(start, sq)>
								<cfset side = "white">
								<cfif start[sq] gte 9818>
									<cfset side = "black">
								</cfif>
								<span class="piece #side#" draggable="true">#chr(start[sq])#</span>
							</cfif>
						</div>
					</cfloop>
				</cfloop>
				</div>
				<p class="chess-hint text-center text-body-secondary mb-0 mt-3">Click a piece, then a square. You can also drag a piece.</p>
			</div>
		</div>
	</div>
	<div class="col-4">
		<form class="card h-100" action="index2.cfm">
			<div class="card-header bg-primary-subtle">"create a chessboard"</div>
			<div class="card-body">
Chess/index now shows a chessboard in the starting position, with white at the bottom and files a–h and ranks 1–8 labeled.
<ul>
<li>Click a piece, then click a square, or drag a piece onto a square.
<li><b>Flip</b> turns the board around.
<li><b>Reset</b> restores the starting position.
</ul>
Pieces can move to any square. The page does not enforce chess rules.			
			</div>
			<div class="card-footer">
				<button class="float-end">Next</button>
			</div>
			<input hidden name="actid" value="#actid#">
			<input hidden name="id" value="#request.usr.id#">
		</form>
	</div>
</div>
</cfoutput>

<cfif isDefined('act') and act.recordCount>
	<cfoutput query="act">
		<button class="nav-link" name="actid" value="#actid#">#actname#</button>
	</cfoutput>
</cfif>
<cfinclude template="/Inc/footer.cfm">
