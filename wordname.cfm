<cfscript>
include '/Inc/header6.cfm'
if (structKeyExists(form, 'wordname')) {
	new dbo.proc().usr('usr.update_wordname', form.wordname)
	location(request.home & '?id=' & request.usr.id, false)
}

word = new dbo.proc().exec('word.random20')
</cfscript>

<cfoutput>
<article class="shadow">
	<header class="theme-primary theme-subtle">
		Choose a password.
	</header>
	<form>
		<section>
			<div>
				<cfloop query="word">
					<button name="wordname" value="#wordname#">
						#wordname#
					</button>
				</cfloop>
			</div>
		</section>
		<input type="hidden" name="id" value="#request.usr.id#">
	</form>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
