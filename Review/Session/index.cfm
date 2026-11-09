<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<form>
	<article>
		<header class="theme-primary theme-subtle">
			<cfif grade.earned ge 100>
				<button name="reset" class="float-end btn-outline theme-danger">Reset</button>
			</cfif>
		</header>
		<section>
			In the middle of each module of	<a href="https://faculty.cengage.com/works/9780357671993?_gl=1*1xgabw8*_gcl_au*NTA4MTE0MDMwLjE3ODYwNjA5ODk.*_ga*MTY4NDAxNzI0NS4xNzg2MDYwOTkx*_ga_1Z1VMVSHXM*czE3OTA4NzQyODMkbzM2JGcxJHQxNzkwODc0MzcyJGozMyRsMCRoMA..">the textbook</a>
			can be several sessions with a Quick Check.
			<p>I found the answers buried in the Instructor Companion site, but not before I had ChatGPT write a program
			to ask an AI called <a href="https://console.groq.com/home">Groq</a> for the answer.<p>
			<p>And while I was at it, I asked Wikipedia for a relevant picture to go along with it.</p>
			<p>Hopefully, you read the question and think about it before revealing Groq's answer or the textbook's answer.
		</section>
	</article>
	<article>
		<section>
			#actdesc#
		</section>
		<footer>
			<button formaction="QuickCheck.cfm">Ready!</button>
		</footer>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</article>
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
