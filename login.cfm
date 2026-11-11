<cfoutput>
<cfinclude template="/Inc/header6.cfm">
<form>
	<article class="shadow">
		<header class="theme-primary theme-subtle">Login</header>
		<section>
			<label for="password">Password</label>
			<input type="password" class="form-control" id="password" name="password" required autofocus>
			<cfif len(request.loginError)>
				<div class="fg-danger mt-2">#request.loginError#</div>
			</cfif>
		</section>
		<footer class="text-end">
			<button>Login</button>
		</footer>
	</article>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>