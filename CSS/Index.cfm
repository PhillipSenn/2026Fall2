<cfscript>
request.container = 'container-fluid'
starter = 'h1 {
color: navy;
}'
if (structKeyExists(form, 'css')) {
	new dbo.proc().usr('grade.merge_act',[form.actid,100])
} else {
	form.css = starter
}
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="row">
	<aside class="css-topics" aria-label="Examples">
		<article>
			<header class="theme-primary theme-subtle">
				Examples
			</header>
			<section>
				<ul class="list-unstyled">
					<li><a href="JavaScript:" class="example-link active" data-example="headings">Change the h1 tags</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="classname">Change a class</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="cascade">How rules cascade</a></li>
				</ul>
			</section>
		</article>
	</aside>
	<div class="css-source col">
		<article>
			<header class="theme-primary theme-subtle">
				CSS source
				<button class="btn-sm btn-styled float-end">Save</button>
			</header>
			<section>
				<label class="form-label" for="cssSource">Enter CSS rules</label>
				<textarea id="cssSource" name="css" rows="12" autofocus spellcheck="false">#encodeForHTML(form.css)#</textarea>
				<label class="form-label" for="htmlSourceA">Example A HTML</label>
				<textarea id="htmlSourceA" rows="6" readonly spellcheck="false"></textarea>
				<label class="form-label" for="htmlSourceB">Example B HTML</label>
				<textarea id="htmlSourceB" rows="6" readonly spellcheck="false"></textarea>
			</section>
			<footer class="text-end">
				<button>Save</button>
			</footer>
		</article>
	</div>
	<aside class="css-sidebar" aria-labelledby="css-preview-heading">
		<article>
			<header id="css-preview-heading" class="theme-primary theme-subtle">
				Applied to examples
			</header>
			<section class="css-previews">
				<figure class="css-preview">
					<figcaption>Example A</figcaption>
					<iframe id="previewA" title="Example A"></iframe>
				</figure>
				<figure class="css-preview">
					<figcaption>Example B</figcaption>
					<iframe id="previewB" title="Example B"></iframe>
				</figure>
			</section>
		</article>
	</aside>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
