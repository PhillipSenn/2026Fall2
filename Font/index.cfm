<cfscript>
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="card card-subtle theme-primary">
	<div class="card-header">
		You may recognize some companies by their logos:
	</div>
	<div class="card-body">
		<img src="https://upload.wikimedia.org/wikipedia/en/3/32/Michael_Kors_%28brand%29_logo.svg" class="img-thumbnail" width="300px">
		<img src="https://upload.wikimedia.org/wikipedia/commons/a/a1/Fendi_logo.svg" class="img-thumbnail" width="300px">
		<img src="https://1000logos.net/wp-content/uploads/2021/05/Kate-Spade-Logo-history.jpg" class="img-thumbnail" width="300px">
		<img src="https://upload.wikimedia.org/wikipedia/commons/c/cb/Louis_Vuitton_LV_logo.png" class="img-thumbnail" width="300px">
		Let's play with you coming up with your own signature font.
		<a href="editor.cfm?id=#request.usr.id#&actid=#form.actid#">Click here to begin</a>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
