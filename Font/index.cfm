<cfscript>
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="card card-subtle theme-primary">
	<div class="card-header">
	</div>
	<div class="card-body">
		Let's play with you coming up with your own signature font.
		<a href="editor.cfm?id=#request.usr.id#&actid=#form.actid#">Click here to begin</a>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
