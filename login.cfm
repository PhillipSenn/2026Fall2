<cfoutput>
<cfinclude template="/Inc/header6.cfm">
<div class="card shadow">
	<div class="card-header theme-primary theme-subtle">Login</div>
	<form method="post">
		<div class="card-body">
			<label for="password">Password</label>
			<input type="password" class="form-control" id="password" name="password" required autofocus>
			<cfif len(request.loginError)>
				<div class="text-danger mt-2">#request.loginError#</div>
			</cfif>
		</div>
		<div class="card-footer text-end">
			<button>Login</button>
		</div>
	</form>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>