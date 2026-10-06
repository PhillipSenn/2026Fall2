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
								<cfset color = "">
								<cfif row lte 4>
									<cfset color = "red">
								<cfelseif row gte 14>
									<cfset color = "blue">
								<cfelseif row lte 8>
									<cfset n = 9 - row>
									<cfif i lte n>
										<cfset color = "orange">
									<cfelseif i gt count - n>
										<cfset color = "yellow">
									</cfif>
								<cfelseif row gte 10>
									<cfset n = row - 9>
									<cfif i lte n>
										<cfset color = "purple">
									<cfelseif i gt count - n>
										<cfset color = "green">
									</cfif>
								</cfif>
								<div class="hole" data-square="r#row#c#i#" role="gridcell">
									<cfif len(color)>
										<span class="marble #color#" draggable="true"></span>
									</cfif>
								</div>
							</cfloop>
						</div>
					</cfloop>
				</div>
			</div>
		</div>
	</div>
	<div class="col-4">
		<form class="card h-100">
			<div class="card-header bg-primary-subtle">"Create a Chinese Checkers board"</div>
			<div class="card-body">
			</div>
			<div class="card-footer">
				<button class="float-end" formaction="Checkers2.cfm">Next</button>
			</div>
			<input hidden name="actid" value="#actid#">
			<input hidden name="id" value="#request.usr.id#">
		</form>
	</div>
</div>

<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
