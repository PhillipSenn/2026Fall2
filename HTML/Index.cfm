<cfscript>
request.container = 'container-fluid'
gettysburg = 'Gettysburg Address

Four score and seven years ago our fathers brought forth on this continent, a new nation, conceived in Liberty, and dedicated to the proposition that all men are created equal.

Now we are engaged in a great civil war, testing whether that nation, or any nation so conceived and so dedicated, can long endure. We are met on a great battle-field of that war. We have come to dedicate a portion of that field, as a final resting place for those who here gave their lives that that nation might live. It is altogether fitting and proper that we should do this.

But, in a larger sense, we can not dedicate—we can not consecrate—we can not hallow—this ground. The brave men, living and dead, who struggled here, have consecrated it, far above our poor power to add or detract. The world will little note, nor long remember what we say here, but it can never forget what they did here. It is for us the living, rather, to be dedicated here to the unfinished work which they who fought here have thus far so nobly advanced. It is rather for us to be here dedicated to the great task remaining before us—that from these honored dead we take increased devotion to that cause for which they gave the last full measure of devotion—that we here highly resolve that these dead shall not have died in vain—that this nation, under God, shall have a new birth of freedom—and that government of the people, by the people, for the people, shall not perish from the earth.'
if (structKeyExists(form, 'html')) {
	new dbo.proc().usr('grade.merge_act',[form.actid,100])
} else {
	form.html = gettysburg
}
include '/Inc/header6.cfm'
</cfscript>

<cfoutput>
<form class="row">
	<aside class="html-topics" aria-label="Examples">
		<article>
			<header class="theme-primary theme-subtle">
				Examples
			</header>
			<section>
				<ul class="list-unstyled">
					<li><a href="JavaScript:" class="example-link active" data-example="gettysburg">Gettysburg Address</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="headings">H1 - H6</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="anchor">The anchor element</a></li>
					<li><a href="JavaScript:" class="example-link" data-example="bootstrap">Bootstrap classes</a></li>
				</ul>
			</section>
		</article>
	</aside>
	<div class="html-source col">
		<article>
			<header class="theme-primary theme-subtle">
				HTML source
				<button class="btn-sm btn-styled float-end">Save</button>
			</header>
			<section>
				<label class="form-label" for="htmlSource">Enter text and HTML tags</label>
				<textarea id="htmlSource" name="html" rows="20" autofocus spellcheck="false">#encodeForHTML(form.html)#</textarea>
			</section>
			<footer class="text-end">
				<button>Save</button>
			</footer>
		</article>
	</div>
	<aside class="html-sidebar" aria-labelledby="html-preview-heading">
		<article>
			<header id="html-preview-heading" class="theme-primary theme-subtle">
				Rendered HTML
			</header>
			<section class="html-preview">#form.html#</section>
		</article>
	</aside>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<script type="application/json" id="example-gettysburg">#serializeJSON(gettysburg)#</script>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
