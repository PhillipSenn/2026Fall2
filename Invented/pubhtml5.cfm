<cfscript>
include '/Inc/header6.cfm'
param url.page=258;
</cfscript>

<cfoutput>
<article>
	<header class="theme-primary theme-subtle">
	</header>
	<section>
		<cfloop from="1" to="#Min(258,url.page)#" index="i"> <!--- max 258 --->
			<img id="#i#" class="d-block img-fluid" src="https://online.pubhtml5.com/hmeo/wjuj/files/large/#i#.jpg">
		</cfloop>
	</section>
</article>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>