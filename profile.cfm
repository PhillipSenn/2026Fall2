<cfscript>
include '/Inc/header.cfm'
if (structKeyExists(form, 'firstname')) {
	usr = new dbo.proc().usr('usr.update_firstname', trim(form.firstname))
	request.usr = {}
	for (column in usr.columnList) {
		request.usr[column] = usr[column][1]
	}
	session.usr = structCopy(request.usr)
	location(request.home, false)
}

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
	<div class="profile-banner">
		<div class="profile-mark" aria-hidden="true">#mark#</div>
		<div class="usrname">#encodeForHtml(request.usr.usrname)#</div>
		<div class="email">#encodeForHtml(request.usr.email)#</div>
	</div>
	<form>
		<div class="card-body">
			<p class="lead mb-3">Hello, <span class="profile-firstname">#encodeForHtml(request.usr.firstname)#</span>.</p>
			<label for="firstname">First name</label>
			<input type="text" name="firstname" id="firstname" class="form-control" required autofocus
				value="#encodeForHtmlAttribute(request.usr.firstname)#">
			<div class="form-text">This is the name shown in the menu.</div>
		</div>
		<div class="card-footer text-end">
			<button><i class="bi bi-person-check me-1"></i>Save</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
	</form>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
