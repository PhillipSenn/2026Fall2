<cfoutput>
<cfinclude template="/Inc/header.cfm">
<form method="post" class="card">
	<div class="card-header bg-primary-subtle">
		Email Address
	</div>
	<div class="card-body">
		<input type="email" name="email" required autofocus>
	</div>
	<div class="card-footer">
	</div>
</form>
<a href="Login.cfm" class="nav-link">Login</a>
<cfinclude template="/Inc/footer.cfm">
<script src="Login.js"></script>
</cfoutput>
