<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form>
	<div class="card">
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			In the middle of each module of
			<a href="https://faculty.cengage.com/works/9780357671993?_gl=1*1xgabw8*_gcl_au*NTA4MTE0MDMwLjE3ODYwNjA5ODk.*_ga*MTY4NDAxNzI0NS4xNzg2MDYwOTkx*_ga_1Z1VMVSHXM*czE3OTA4NzQyODMkbzM2JGcxJHQxNzkwODc0MzcyJGozMyRsMCRoMA.."
			>the textbook</a>
			can be several sessions with a Quick Check.
			<p>I found the answers buried in the Instructor Companion site, but not before I had ChatGPT write a program
			to ask an AI called <a href="https://console.groq.com/home">Groq</a> for the answer.<p>
			<p>Hopefully, you read the question and think about it before revealing Groq's answer or the textbook's answer.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<button formaction="QuickCheck.cfm">Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
