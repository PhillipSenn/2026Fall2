<cfscript>
include '/Inc/header6.cfm'
if (isDefined('form.js')) {
	//	application.cfc: this.scriptProtect = 'url,cookie,cgi'
} else {
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
	<div class="col-12 md:col-7">
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
	<div class="col-12 md:col-5 md:ps-0">
		<div class="accordion mb-2">
			<details class="accordion-item" name="professor-code">
				<summary class="accordion-header">
					<i class="bi bi-caret-right me-2"></i>
					JavaScript
				</summary>
				<div class="accordion-body">
					<textarea class="font-monospace" name="js" rows="12" spellcheck="false">#form.js#</textarea>
				</div>
			</details>
			<details class="accordion-item" name="professor-code" open>
				<summary class="accordion-header">
					<i class="bi bi-caret-right me-2"></i>
					HTML
				</summary>
				<div class="accordion-body">
					<textarea name="html" class="font-monospace" spellcheck="false">#form.html#</textarea>
				</div>
			</details>
			<details class="accordion-item" name="professor-code">
				<summary class="accordion-header">
					<i class="bi bi-caret-right me-2"></i>
					CSS
				</summary>
				<div class="accordion-body">
					<textarea name="css" class="font-monospace" rows="10">#form.css#</textarea>
				</div>
			</details>
			<details class="accordion-item" name="professor-code">
				<summary class="accordion-header">
					<i class="bi bi-caret-right me-2"></i>
					Sources
				</summary>
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
			</details>
		</div>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</form>
#form.html#
<cfset JavaScript = '<script>' & form.js & '</script>'>
#JavaScript#
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>