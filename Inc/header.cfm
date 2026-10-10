<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta	name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<cfscript>
param request.cache='';
param request.cache = '?cache=' & TimeFormat(now(),'Hmmss');
param request.container = 'container';
param request.title = 'CSC175';
param request.ico = 'https://www.lr.edu/sites/default/files/favicon.ico';
param request.top = 'sticky-top';
param request.header = {};
param request.header.css = true;

param request.progress.bar = true;
param request.progress.color = 'bg-primary';
param request.progress.anim = false;
param request.progress.width = 0;

param request.flush = true;
param request.script_name = cgi.script_name;
writeoutput('<script src="' & request.home & 'Inc/js/header.js"></script>' & chr(10))
if (Len(cgi.query_string)) {
	request.script_name &= '?' & cgi.query_string
}
request.cgiName	= getPageContext().getRequest().getServletPath()
request.serverDir	= getDirectoryFromPath(request.cgiName)
request.serverFile= getFileFromPath(request.cgiName)
request.pgmDir		= ExpandPath(request.serverDir)
request.pgmName	= Left(request.serverFile,Len(request.serverFile)-4)
param request.jQueryUI = 'none';	// base, black-tie, blitzer, cupertino, dark-hive, dot-luv, eggplant, excite-bike, flick, hot-sneaks, humanity, le-frog, mint-choc, overcast, pepper-grinder, redmond, smoothness, south-street, start, sunny, swanky-purse, trontastic, ui-darkness, ui-lightness, vader
if (request.jQueryUI  != 'none') {
	writeoutput('<link	rel="stylesheet" href="https://code.jquery.com/ui/1.14.1/themes/' & request.jQueryUI & '/jquery-ui.css">' & chr(10))
}
param request.bootstrap = true;
if (request.bootstrap) {
	writeoutput('<link	rel="stylesheet" href="' & request.home & 'Inc/css/bootstrap.css">' & chr(10))
	writeoutput('<link	rel="stylesheet" href="' & request.home & 'Inc/css/bootstrap-icons.css">' & chr(10))
}
if (request.header.css) {
	writeoutput('<link	rel="stylesheet" href="' & request.home & 'Inc/css/header.css' & request.cache & '">' & chr(10))
}
if (fileExists(request.pgmDir & request.pgmName & '.css')) {
	writeoutput('<link	rel="stylesheet" href="' & request.pgmName & '.css' & request.cache & '">' & chr(10))
}
writeoutput('<link	rel="icon"		 href="' & request.ico & '">' & chr(10))
param form.actid=0;
if (form.actid) {
	act = exec('act.where_act',form.actid)
	if (act.recordcount) {
		request.title = act.actname
	}
	if (structKeyExists(request,'usr')) {
		grade = usr('grade.where_act',form.actid)
		if (request.progress.anim) {
			request.progress.width = 0
		} else {
			request.progress.width = min(100,val(grade.earned))
		}
	}
}
writeoutput('<title>' & request.title & '</title>' & chr(10))
param request.navbar = true;
param request.body = 'bg-body-tertiary';
writeoutput('</head>' & chr(10))
writeoutput('<body class="' & request.body & '">')
</cfscript>
<cfoutput>
<cfif request.navbar>
<div class="#request.container# #request.top#">
	<nav class="navbar navbar-expand navbar-dark bg-dark py-0">
		<a class="navbar-brand ms-3 me-1" href="https://lr.edu" target="_self">
			LR
			<!---
			<img src="https://upload.wikimedia.org/wikipedia/commons/f/f0/Lenoir-rhyne_logo_from_NCAA.svg" alt="Logo" height="32">
			--->
		</a>
		<form class="navbar-collapse">
			<cfif StructKeyExists(request,'usr')>
				<ul id="main-navbar" class="navbar-nav me-auto">
					<li class="nav-item">
						<button formaction="#request.home#" class="btn-link nav-link">CSC175</button>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto me-3">
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="JavaScript:" role="button" data-bs-toggle="dropdown" aria-expanded="false">
							#request.usr.firstname#
						</a>
						<ul class="dropdown-menu dropdown-menu-end">
							<li><button class="dropdown-item btn-link" formaction="#request.home#profile.cfm">Edit Profile</button></li>
							<li><button class="dropdown-item btn-link" formaction="#request.home#audit.cfm">Email Grade</button></li>
							<li><hr class="dropdown-divider ms-3"></li>
							<li><a class="dropdown-item" href="#request.home#home.cfm">Logout</a></li>
						</ul>
					</li>
				</ul>
				<input hidden name="id" value="#request.usr.id#">
			<cfelse>
				<ul id="main-navbar" class="navbar-nav me-auto">
				</ul>
			</cfif>
		</form>
	</nav>
	<cfif isDefined('grade')>
		<cfif grade.earned ge 100>
			<cfset request.progress.color = "bg-success progress-bar-striped progress-bar-animated fw-bold">
		</cfif>
		<cfif request.progress.bar>
			<div class="progress">
				<div class="progress-bar #request.progress.color#" role="progressbar" 
					aria-valuenow="#grade.earned#"
					aria-valuemin="0" 
					aria-valuemax="100"
					style="width: #request.progress.width#%">
					<cfif val(grade.earned)>#grade.earned#%</cfif> <!--- This should be earned so as not to confused the student --->
				</div>
			</div>
		</cfif>
		<!---
		<input type="hidden" id="actid" value="#form.actid#">
		--->
	</cfif>
</div>
</cfif>
</cfoutput>
<cfif false and request.flush>
	<cfflush> <!--- Can only be done if there will be no location url=request.home & 'x.cfm' --->
</cfif>
<main class="<cfoutput>#request.container#</cfoutput>">
