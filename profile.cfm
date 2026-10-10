<cfscript>
include '/Inc/header.cfm'
if (structKeyExists(form, 'firstname')) {
	usr('usr.update_firstname', form.firstname)
	usr('usr.update_wordname', form.wordname)
	location('home.cfm?id=' & request.usr.id, false)
}

word = exec('word.random20')
mark = ''
points = listToArray(reReplace(request.usr.codePoint, '[^0-9A-Fa-f]+', ',', 'all'))
for (point in points) {
	chars = createObject('java', 'java.lang.Character').toChars(inputBaseN(point, 16))
	mark &= createObject('java', 'java.lang.String').init(chars)
}
if (!len(mark)) {
	mark = left(request.usr.firstname, 1)
}
</cfscript>

<cfoutput>
<div class="card profile shadow">
	<form>
		<div class="text-center">
			<button formaction="Unicode/player.cfm" class="profile-banner">
				<div class="profile-mark" aria-hidden="true">#mark#</div>
				<div class="usrname">#encodeForHtml(request.usr.usrname)#</div>
				<div class="email">#encodeForHtml(request.usr.email)#</div>
			</button>
		</div>
		<div class="card-body">
			<p class="lead mb-3">Hello, <span class="profile-firstname">#encodeForHtml(request.usr.firstname)#</span>.</p>
			<label for="firstname">First name</label>
			<input type="text" name="firstname" id="firstname" class="form-control" required autofocus
				value="#encodeForHtmlAttribute(request.usr.firstname)#">
			<div class="form-text">This is the name shown in the menu.</div>
			<label for="wordname" class="mt-3">Word name</label>
			<select name="wordname" id="wordname" class="form-select" required>
				<cfloop query="word">
					<option value="#encodeForHtmlAttribute(wordname)#">#encodeForHtml(wordname)#</option>
				</cfloop>
			</select>
		</div>
		<div class="card-footer text-end">
			<button><i class="bi bi-person-check me-1"></i>Save</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
	</form>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
