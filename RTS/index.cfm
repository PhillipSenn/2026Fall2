<cfscript>
request.navbar = false;
request.container = '';
request.body = 'rts-body';
request.bootstrap = false;
request.header = { css: false };
include '/Inc/header6.cfm';
</cfscript>

<section class="rts-demo" aria-label="RTS movement demo">
	<canvas id="rtsCanvas" aria-label="A scrollable RTS world. Click the ground to move the explorer."></canvas>
	<div class="rts-vignette" aria-hidden="true"></div>
	<div id="rtsStatus" class="rts-status" role="status" aria-live="polite">Explorer ready</div>
	<div class="rts-overview">
		<span>Terrain overview</span>
		<canvas id="miniMap" aria-label="World overview. Click to move the camera."></canvas>
	</div>
</section>

<cfinclude template="/Inc/footer6.cfm">
