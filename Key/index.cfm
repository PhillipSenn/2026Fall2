<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form action="Terms.cfm">
	<article>
		<header class="theme-primary theme-subtle">
			How would you like to solve this modules's key terms?
		</header>
		<section>
			<ul>
				<li>
					<a href="../Key2/Terms.cfm?actid=#url.actid#">Key Terms</a>
				</li>
				<li>
					<a href="../Sub/?actid=#url.actid#">Shooting Gallery</a>
				</li>
				<li>
					<a href="../Pac/man.cfm">Pac-Man</a>
				</li>
			</ul>
		</section>
		<footer>
			<button>Ready!</button>
		</footer>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</article>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
