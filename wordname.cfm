<cfscript>
include '/Inc/header.cfm'
if (structKeyExists(form, 'wordname')) {
	usr('usr.update_wordname', form.wordname)
	location(request.home & '?id=' & request.usr.id, false)
}

word = exec('word.random20')
</cfscript>

<cfoutput>
<div class="card shadow">
	<div class="card-header bg-primary-subtle">
		Choose a password.
	</div>
	<form>
		<div class="card-body">
			<div>
				<cfloop query="word">
					<button name="wordname" value="#wordname#">
						#wordname#
					</button>
				</cfloop>
			</div>
		</div>
		<input type="hidden" name="id" value="#request.usr.id#">
	</form>
</div>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
