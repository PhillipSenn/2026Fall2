<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta	name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<cfscript>
param request.cache='';
param request.cache = '?cache=' & TimeFormat(now(),'Hmmss');
param request.container = 'md:container';
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
	writeoutput('<link	rel="preconnect" href="https://fonts.googleapis.com">' & chr(10))
	writeoutput('<link	rel="preconnect" href="https://fonts.gstatic.com" crossorigin>' & chr(10))
	writeoutput('<link	rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Geist+Mono:wght@100..900&family=Geist:wght@100..900&display=swap">' & chr(10))
	writeoutput('<link	rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/css/bootstrap.css">' & chr(10))
	writeoutput('<link	rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.13.2/font/bootstrap-icons.css">' & chr(10))
	fontName = ''
	fontStack = ''
	fontSize = ''
	styleRules = ''
	if (structKeyExists(request, 'usr') && !isNull(request.usr.fontFamily) && len(request.usr.fontFamily)) {
		fontName = request.usr.fontFamily
	} else if (structKeyExists(request, 'fontFamily') && len(request.fontFamily)) {
		fontName = request.fontFamily
	}
	if (structKeyExists(request, 'usr') && !isNull(request.usr.fontSize) && len(request.usr.fontSize)) {
		fontSize = request.usr.fontSize
	} else if (structKeyExists(request, 'fontSize') && len(request.fontSize)) {
		fontSize = request.fontSize
	}
	if (len(fontName)) {
		builtinFile = expandPath(request.home & 'Fonts/builtin.json')
		if (fileExists(builtinFile)) {
			for (builtinFont in deserializeJSON(fileRead(builtinFile))) {
				if (builtinFont.family == fontName) {
					fontStack = builtinFont.stack
					break
				}
			}
		}
	}
	if (len(fontStack)) {
		styleRules &= '--bs-body-font-family:' & fontStack & ';font-family:var(--bs-body-font-family);'
	} else if (reFind("^[A-Za-z0-9 .'+-]{1,80}$", fontName)) {
		writeoutput('<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=' & encodeForURL(fontName) & '&display=swap">' & chr(10))
		styleRules &= '--bs-body-font-family:"' & encodeForHTML(fontName) & '",sans-serif;font-family:var(--bs-body-font-family);'
	}
	if (reFind('^\d{2}$', fontSize) && val(fontSize) >= 12 && val(fontSize) <= 72) {
		styleRules &= '--bs-body-font-size:' & fontSize & 'px;font-size:' & fontSize & 'px;'
	}
	if (len(styleRules)) {
		writeoutput('<style>body{' & styleRules & '}</style>' & chr(10))
	}
}
if (request.header.css) {
	writeoutput('<link	rel="stylesheet" href="' & request.home & 'Inc/css/header6.css' & request.cache & '">' & chr(10))
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
param request.body = 'bg-1';
writeoutput('</head>' & chr(10))
writeoutput('<body class="' & request.body & '">')
</cfscript>
<cfoutput>
<cfif request.navbar>
<div class="#request.container# #request.top#">
	<nav class="navbar navbar-expand bg-body py-0" data-bs-theme="dark">
		<a class="navbar-brand ms-5 me-1" href="https://lr.edu" target="_self">
			LR
			<!---
			<img src="https://upload.wikimedia.org/wikipedia/commons/f/f0/Lenoir-rhyne_logo_from_NCAA.svg" alt="Logo" height="32">
			--->
		</a>
		<form class="d-flex flex-grow-1 align-items-center">
			<cfif StructKeyExists(request,'usr')>
				<ul id="main-navbar" class="navbar-nav me-auto">
					<li class="nav-item">
						<button formaction="#request.home#" class="btn-link nav-link">CSC175</button>
					</li>
				</ul>

				<ul class="navbar-nav ms-auto me-3">
					<li class="nav-item position-relative">
						<a class="nav-link" href="JavaScript:" role="button" data-bs-toggle="menu" data-bs-placement="bottom-end" aria-expanded="false">
							#request.usr.firstname#
						</a>
						<div class="menu">
							<button class="menu-item btn-link justify-content-start" formaction="#request.home#Profile/profile.cfm">Edit Profile</button>
							<button class="menu-item btn-link justify-content-start" formaction="#request.home#Profile/grade.cfm">Email Grade</button>
						</div>
					</li>
				</ul>
				<input hidden name="id" value="#request.usr.id#">
			<cfelse>
				<ul id="main-navbar" class="navbar-nav me-auto">
				</ul>
			</cfif>
			<cfif structKeyExists(form,'actid')>
				<input hidden name="actid" value="#form.actid#">
			</cfif>
		</form>
	</nav>
	<cfif isDefined('grade')>
		<cfif grade.earned ge 100>
			<cfset request.progress.color = "bg-success progress-bar-striped progress-bar-animated fw-bold">
		</cfif>
		<cfif request.progress.bar>
			<div class="row">
				<div class="col">
					<div class="progress border-start border-end">
						<div class="progress-bar #request.progress.color#" role="progressbar" 
							aria-valuenow="#grade.earned#"
							aria-valuemin="0" 
							aria-valuemax="100"
							style="width: #request.progress.width#%">
							<cfif val(grade.earned)>#grade.earned#%</cfif> <!--- This should be earned so as not to confused the student --->
						</div>
					</div>
				</div>
			</div>
		</cfif>
	</cfif>
</div>
</cfif>
</cfoutput>
<cfif false and request.flush>
	<cfflush> <!--- Can only be done if there will be no location url=request.home & 'x.cfm' --->
</cfif>
<main class="<cfoutput>#request.container#</cfoutput>">
