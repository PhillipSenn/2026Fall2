<cfscript>
include '/Inc/header6.cfm'
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header">
		
	</div>
	<div class="card-body">
        Here is a <a href="https://cdn.jsdelivr.net/gh/unicode-org/unicodetools@main/unicodetools/data/ucd/dev/UnicodeData.txt">list of Unicode characters</a>.
    </div>
</div>
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>