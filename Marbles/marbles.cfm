<cfscript>
request.container = 'container-fluid'
setting showdebugoutput=false;
include '/Inc/header.cfm'
usr = queryExecute("select usrid, firstname, id from usr order by usrname")
</cfscript>

<cfoutput query="act">
<div class="board">
	<canvas id="myCanvas"></canvas>
	<aside class="scores" id="scores">
		<h2>Scores</h2>
		<ol id="scoreList">
			<cfloop query="usr">
				<li class="score-row" data-usrid="#usrid#" data-id="#encodeForHtmlAttribute(id)#">
					<span class="score-rank"></span>
					<span class="score-name">#encodeForHtml(firstname)#</span>
					<span class="score-usrid">#usrid#</span>
					<span class="score-points">0</span>
				</li>
			</cfloop>
		</ol>
	</aside>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
