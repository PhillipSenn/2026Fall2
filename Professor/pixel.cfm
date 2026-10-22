<cfscript>
include '/Inc/header.cfm'
if (!isDefined('form.js')) {
	filepath = ExpandPath('.') & '\pixel.txt'
	form.js = FileRead(filepath)
	form.js = Replace(form.js,'	','   ','all')
	filepath = ExpandPath('.') & '\html.txt'
	form.html = FileRead(filepath)
	filepath = ExpandPath('.') & '\css.txt'
	form.css = FileRead(filepath)
}
</cfscript>

<cfoutput query="act">
<style>
#form.css#
</style>
<form id="fs-small" class="row">
	<div class="col-12 col-md-7">
		<div class="card">
			<div class="card-body" id="canvas-container">
				<canvas id="canvas"></canvas>
			</div>
			<div class="card-footer">
				which_key: <span id="which-key"></span>
				<button class="float-end">Save</button>
			</div>
		</div>
	</div>
	<div class="col-12 col-md-5 ps-md-0">
		<div class="accordion mb-2">
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="##collapseOne" aria-expanded="false" aria-controls="collapseOne">
						<i class="bi bi-caret-right me-2"></i>
						JavaScript
					</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse" data-bs-parent=".accordion">
					<div class="accordion-body">
						<textarea class="font-monospace" name="js" rows="12" spellcheck="false">#form.js#</textarea>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="##collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
						<i class="bi bi-caret-right me-2"></i>
						HTML
					</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse show" data-bs-parent=".accordion">
					<div class="accordion-body">
						<textarea name="html" class="font-monospace" spellcheck="false">#form.html#</textarea>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="##collapseThree" aria-expanded="false" aria-controls="collapseThree">
						<i class="bi bi-caret-right me-2"></i>
						CSS
					</button>
				</h2>
				<div id="collapseThree" class="accordion-collapse collapse" data-bs-parent=".accordion">
					<div class="accordion-body">
						<textarea name="css" class="font-monospace" rows="10">#form.css#</textarea>
					</div>
				</div>
			</div>
			<div class="accordion-item">
				<h2 class="accordion-header">
					<button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="##collapseFour" aria-expanded="false" aria-controls="collapseFour">
						<i class="bi bi-caret-right me-2"></i>
						Sources
					</button>
				</h2>
				<div id="collapseFour" class="accordion-collapse collapse" data-bs-parent=".accordion">
					<div class="accordion-body">
						I got hurt.wav from <a href="http://soundbible.com/tags-hitting.html">soundbible</a>.<br>
						Try using <a href="buzz.wav">buzz.wav</a> instead of <a href="hurt.wav">hurt.wav</a>.<br>
						Try using <a href="LRBear.gif">LRBear.gif</a> instead of <a href="player.png">player.png</a>.<br>
						There are an array of keys on the keyboard, so we look for: 37-Left Arrow, 38-Up Arrow, 39-Right Arrow, 40-Down Arrow.<br>
						Every time we request an animation frame, we
						<ol>
							<li>White out the entire context with a fillRect command,</li>
							<li>Draw a DarkGoldenrod rectangle,</li>
							<li>Draw the bear image.</li>
						</ol>
						The enemy moves across the screen 3 pixels at a time, but you can change it. Try changing the color to cornflowerblue or Lenoir-Rhyne red (##a31f34).
					</div>
				</div>
			</div>
		</div>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</form>
#form.html#
<cfset JavaScript = '<script>' & form.js & '</script>'>
#JavaScript#
<a class="nav-link" href="#request.script_name#">#actname#</a>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>