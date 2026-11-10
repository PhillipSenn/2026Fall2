<cfscript>
request.container = 'container-fluid'
starter = "navigator.geolocation.getCurrentPosition(callback)
function callback(response) {
   document.write(response.coords.longitude + '<br>')
   document.write(response.coords.latitude)
}"
if (structKeyExists(form, 'js')) {
	new dbo.proc().usr('grade.merge_act',[form.actid,100])
} else {
	form.js = starter
}
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="row">
	<aside class="js-topics" aria-label="Examples">
		<article>
			<header class="theme-primary theme-subtle">
				Examples
			</header>
			<section>
				<ul class="list-unstyled">
					<li><a href="JavaScript:" class="example-link active" data-example="location">Your longitude and latitude</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="count">Count to 10</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="loop">Say your name 100 times</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="speak">Fair Star of Caroline</a></li>
				</ul>
			</section>
		</article>
	</aside>
	<div class="js-source col">
		<article>
			<header class="theme-primary theme-subtle">
				JavaScript source
				<button type="button" class="btn-sm btn-styled float-end" id="runBtn">Run</button>
			</header>
			<section>
				<label class="form-label" for="jsSource">Enter JavaScript</label>
				<textarea id="jsSource" name="js" rows="10" autofocus spellcheck="false">#encodeForHTML(form.js)#</textarea>
			</section>
		</article>
	</div>
	<aside class="js-sidebar" aria-labelledby="js-preview-heading">
		<article>
			<header id="js-preview-heading" class="theme-primary theme-subtle">
				Output
			</header>
			<section>
				<iframe id="jsPreview" title="JavaScript output" allow="geolocation"></iframe>
			</section>
		</article>
	</aside>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
