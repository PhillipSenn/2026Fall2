<cfscript>
if (structKeyExists(form, 'wordname')) {
	usr('usr.update_wordname', form.wordname)
	location(request.home & '?id=' & request.usr.id, false)
}

include '/Inc/header.cfm'
words = exec('word.random20')
</cfscript>

<cfoutput>
<div class="card shadow">
	<div class="card-header bg-primary-subtle">
		Choose your word
	</div>
	<form>
		<div class="card-body">
			<p class="mb-3">Choose one word to identify yourself in this course.</p>
			<div class="d-grid gap-2">
				<cfloop query="words">
					<button name="wordname" value="#encodeForHtmlAttribute(words.wordname)#" class="btn btn-outline-primary">
						#encodeForHtml(words.wordname)#
					</button>
				</cfloop>
			</div>
		</div>
		<input type="hidden" name="id" value="#request.usr.id#">
	</form>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
