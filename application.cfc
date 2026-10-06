component {
this.name = 'lr2026Fall2'
this.datasource = 'lr2026Fall2'
this.sessionmanagement = false
this.tag.location.addtoken = false
this.nullSupport = true

this.app	= getCurrentTemplatePath()
this.dir	= getDirectoryFromPath(this.app)
this.mappings['/inc'] = this.dir & 'inc\'
this.mappings['/passwords'] = 'C:\Passwords'
this.serialization = {}
this.serialization.dateTimeFormat = 'iso8601' // 2025-12-20T13:45:00Z

function onRequestStart(targetPage) {
//	cfheader(name='Content-Type', value='text/html; charset=utf-8')
	structAppend(form,url,false)
	request.home = '/2026Fall2/' // Trailing slash so that everywhere it's used we don't need a slash
	if (structKeyExists(form,'id') and len(form.id) == 36 
		and Mid(form.id,9,1) == '-'
		and Mid(form.id,14,1) == '-'
		and Mid(form.id,19,1) == '-'
		and Mid(form.id,24,1) == '-') {
		cfstoredproc(procedure='usr.where_id') {
			cfprocparam(cfsqltype='cf_sql_varchar', value=form.id)
			cfprocresult(name='request.usr')
		}
		if (!request.usr.recordcount) {
			setting showdebugoutput=false;
			writeoutput("Invalid user")
			return false
		}
	}
	if (!structKeyExists(request,'usr')) {
		setting showdebugoutput=false;
		writeoutput("No user")
		return false
	}
	request.cginame = getPageContext().getRequest().getServletPath()
	if (FindNoCase('/admin/',request.cginame)) {
		if (!structKeyExists(cookie,'admin')) {
			dump(cookie)
			return false
		}
	}
	request.scriptname = cgi.SCRIPT_NAME
	if (len(cgi.QUERY_STRING)) {
		request.scriptname &= '?' & cgi.QUERY_STRING
	}
	request.dir = getDirectoryFromPath(request.cgiName)
	include '/server.cfm' // outside of request.home
}

function onRequest(targetPage) {
	if (structKeyExists(url, 'id')) {
		include 'login.cfm'
	} else {
		include '/Inc/cfm/exec.cfm'
		include '/Inc/cfm/dump.cfm'
		include targetPage
	}
}
}
