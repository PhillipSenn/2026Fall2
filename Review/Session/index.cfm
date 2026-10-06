<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput query="act">
<form action="quickCheck.cfm">
	<div class="card">
		<div class="card-header bg-primary-subtle">
		</div>
		<div class="card-body">
			In the middle of each module of
			<a href="https://faculty.cengage.com/works/9780357671993?_gl=1*1xgabw8*_gcl_au*NTA4MTE0MDMwLjE3ODYwNjA5ODk.*_ga*MTY4NDAxNzI0NS4xNzg2MDYwOTkx*_ga_1Z1VMVSHXM*czE3OTA4NzQyODMkbzM2JGcxJHQxNzkwODc0MzcyJGozMyRsMCRoMA.."
			>the textbook</a>
			can be several sessions with a Quick Check, but unfortunately with no answer.
			<p>So I have this program ask an AI called <a href="https://console.groq.com/home">Groq</a> for an answer.<p>
			<p>Hopefully, you read the question and think about it before revealing Groq's answer.
		</div>
	</div>
	<div class="card">
		<div class="card-body">
			#actdesc#
		</div>
		<div class="card-footer">
			<button>Ready!</button>
		</div>
		<input hidden name="id" value="#request.usr.id#">
		<input hidden name="actid" value="#actid#">
	</div>
</form>
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
