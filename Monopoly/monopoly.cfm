<cfscript>
request.container = 'container-fluid'
request.jqueryui = true
include '/Inc/header.cfm'
</cfscript>

<cfoutput>
<div class="card">
	<cfinclude template="/Inc/card-header.cfm">
</div>
<div class="row mx-0">
	<div class="col-1 playarea freeParking">
		<div class="property">FREE PARKING</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">KENTUCKY<br>AVENUE</div>
		<div class="bottomHeader red">&nbsp;</div>
	</div>
	<div class="borderBottom col-1 playarea chance2">
		<div class="property">CHANCE</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">INDIANA<br>AVENUE</div>
		<div class="bottomHeader red">&nbsp;</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">ILLINOIS<br>AVENUE</div>
		<div class="bottomHeader red">&nbsp;</div>
	</div>
	<div class="borderBottom col-1 playarea railroad3">
		<div class="property">B &amp; O RAILROAD</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">ATLANTIC<br>AVENUE</div>
		<div class="bottomHeader yellow">&nbsp;</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">VENTNOR<br>AVENUE</div>
		<div class="bottomHeader yellow">&nbsp;</div>
	</div>
	<div class="borderBottom col-1 playarea waterWorks">
		<div class="property">WATER WORKS</div>
	</div>
	<div class="borderBottom col-1 playarea">
		<div class="property">MARVIN<br>GARDENS</div>
		<div class="bottomHeader yellow">&nbsp;</div>
	</div>
	<div class="col-1 playarea gotoJail">
		<div class="property">GO TO JAIL</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader orange">&nbsp;</span>
		<div class="property">NEW YORK AVENUE</div>
	</div>
	<div class="col-9 text-center">
		<h1>This game doesn't work.</h1>
	</div>
	<div class="col-1 playarea">
		<span class="leftHeader green">&nbsp;</span>
		<div class="property">PACIFIC AVENUE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader orange">&nbsp;</span>
		<div class="property">TENN ESSEE AVENUE</div>
	</div>
	<div class="col-9 text-center">
		<h2>I'm just messin' with ya.</h2>
	</div>
	<div class="col-1 playarea">
		<span class="leftHeader green">&nbsp;</span>
		<div class="property">NORTH CAROLINA AVENUE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea communityChest">
		<div class="property">COMMUNITY CHEST</div>
	</div>
	<div class="col-9">
	</div>
	<div class="col-1 playarea communityChest">
		<div class="property">COMMUNITY CHEST</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader orange">&nbsp;</span>
		<div class="property">ST. JAMES PLACE</div>
	</div>
	<div class="col-9">&nbsp;</div>
	<div class="col-1 playarea">
		<span class="leftHeader green">&nbsp;</span>
		<div class="property">PENN SYLVANIA AVENUE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea railroad2">
		<div class="property">PENN SYLVANIA RAILROAD</div>
	</div>
	<div class="col-9">&nbsp;</div>
	<div class="col-1 playarea railroad4">
		<div class="property">SHORT LINE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader pink">&nbsp;</span>
		<div class="property">VIRGINIA AVENUE</div>
	</div>
	<div class="col-9">&nbsp;</div>
	<div class="col-1 playarea chance3">
		<div class="property">CHANCE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader pink">&nbsp;</span>
		<div class="property">STATES AVENUE</div>
	</div>
	<div class="col-9">&nbsp;</div>
	<div class="col-1 playarea">
		<span class="leftHeader blue">&nbsp;</span>
		<div class="property">PARK PLACE</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea electricCompany">
		<div class="property">ELECTRIC COMPANY</div>
	</div>
	<div class="col-9">&nbsp;</div>
	<div class="col-1 playarea luxuryTax">
		<div class="property">LUXURY TAX</div>
	</div>
</div>
<div class="row mx-0 h100">
	<div class="col-1 playarea">
		<span class="rightHeader pink">&nbsp;</span>
		<div class="property">ST. CHARLES PLACE</div>
	</div>
	<div class="col-9">
		<div class="row text-center">
			<div class="col-1 offset-2">
				<img src="gif/battleship.gif" class="draggable" width="50px">
			</div>
			<div class="col-1">
				<img src="gif/bobbin.gif" class="draggable" width="30px">
			</div>
			<div class="col-1">
				<img src="gif/car.gif" class="draggable" width="50px">
			</div>
			<div class="col-1">
				<img src="gif/dog.gif" class="draggable" width="50px">
			</div>
			<div class="col-1">
				<img src="gif/hat.gif" class="draggable" width="50px">
			</div>
			<div class="col-1">
				<img src="gif/iron.gif" class="draggable" width="50px">
			</div>
			<div class="col-1">
				<img src="gif/shoe.gif" class="draggable" width="50px">
			</div>
			<div class="offset-1 col-1 display-1">
				&##9861;
			</div>
			<div class="col-1 display-1">
				&##9861;
			</div>
			<!---
			<div class="col-1">
				<img src="gif/helicopter.gif" class="img-fluid">
			</div>
			<div class="col-1">
				<img src="gif/ring.gif" class="img-fluid">
			</div>
			<div class="col-1">
				<img src="gif/robot.gif" class="img-fluid">
			</div>
			<div class="col-1">
				<img src="gif/cat.gif" class="img-fluid">
			</div>
			<div class="col-1">
				<img src="gif/guitar.gif" class="img-fluid">
			</div>
			--->
		</div>
	</div>
	<div class="col-1 playarea">
		<span class="leftHeader blue">&nbsp;</span>
		<div class="property">BOARD WALK</div>
	</div>
</div>
<div class="row mx-0 h150">
	<div class="col-1 playarea jail">
		<div class="property">JUST VISITING</div>
	</div>
	<div class="col-1 playarea">
		<div class="topHeader lightBlue">&nbsp;</div>
		<div class="property">CONNECTICUT AVENUE</div>
	</div>
	<div class="col-1 playarea">
		<div class="topHeader lightBlue">&nbsp;</div>
		<div class="property">VERMONT AVENUE</div>
	</div>
	<div class="col-1 playarea chance1">
		<div class="property">CHANCE</div>
	</div>
	<div class="col-1 playarea">
		<div class="topHeader lightBlue">&nbsp;</div>
		<div class="property">ORIENTAL AVENUE</div>
	</div>
	<div class="col-1 playarea railroad1">
		<div class="property">READING RAILROAD</div>
	</div>
	<div class="col-1 playarea">
		<div class="property">INCOME TAX</div>
	</div>
	<div class="col-1 playarea">
		<div class="topHeader brown">&nbsp;</div>
		<div class="property">BALTIC AVENUE</div>
	</div>
	<div class="col-1 playarea communityChest">
		<div class="property">COMMUNITY CHEST</div>
	</div>
	<div class="col-1 playarea">
		<div class="topHeader brown">&nbsp;</div>
		<div class="property">MEDITER- RANEAN AVENUE</div>
	</div>
	<div id="GO" class="col-1 playarea">
		<div class="property">GO</div>
	</div>
</div>
</cfoutput>
<cfinclude template="/Inc/footer.cfm">