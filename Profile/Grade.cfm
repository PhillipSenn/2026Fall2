<cfscript>
include '/Inc/header6.cfm'
include '/passwords/gmail.cfm'
act = usr('act.where_usr')
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header bg-info-subtle">
		An email has been sent to #request.usr.email#
	</div>
	<div class="card-body">
		<button class="btn-link" formaction="toc.cfm?accordion">Table Of Contents (TOC)</button>
		<cfsavecontent variable="str">
		<table>
			<thead>
				<tr>
					<cfif request.usr.isAdmin>
						<th class="text-end">Sort</th>
						<th classs="text-center">Hide</th>
					</cfif>
					<th>Chapter</th>
					<th>Category</th>
					<th>Assignment</th>
					<th class="text-end">Earned</th>
				</tr>
			</thead>
			<cfloop query="act">
				<tr data-actid="#actid#">
					<cfif request.usr.isAdmin>
						<td class="text-end actsort" contenteditable>#actsort#</td>
						<td class="text-center isHidden" contenteditable>#isHidden#</td>
					</cfif>
					<td>#grpname#</td>
					<td>#catname#</td>
					<td>
						<button name="actid" formaction="#actlink#" class="btn-link" value="#actid#">#actname#</button>
					</td>
					<td class="text-end">
						#earned#
					</td>
				</tr>
			</cfloop>
		</table>
		</cfsavecontent>
		#str#

	</div>
	<input hidden name="id" value="#request.usr.id#">
</div>
<cfset str = request.usr.firstname & ':<p>' & str & '</p>'
	& '<a href="https://PhillipSenn.com#request.home#?id=' & request.usr.id & '">Click here to login</a>.'>

<cfmail
	to=request.usr.email
	cc='PhillipSenn@gmail.com'
	from="Professor Senn<Professor.Senn@gmail.com>"
	subject="CSC175 accomplishments outside of Canvas"
	type="html"
	server="smtp.gmail.com"
	port="465"
	username="Professor.Senn@gmail.com"
	password=password
	useSSL="true">
	#str#
</cfmail>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>

