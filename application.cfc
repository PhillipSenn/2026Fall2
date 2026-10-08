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
//	if (structKeyExists(url, 'id')) {
//		include 'login.cfm'
//	} else {
		include '/Inc/cfm/exec.cfm'
		include '/Inc/cfm/dump.cfm'
		include targetPage
//	}
}
/*
function onError(exception, eventName) {
	var source = exception
	var message = ''
	var detail = ''
	var sql = ''
	var i = 0
	var template = ''
	var subject = '2026Fall2 error'
	var usrname = ''
	try {
		source = exception.rootCause
	} catch (any ignore) {}
	message = errorField(source, 'message')
	detail = errorField(source, 'detail')
	detail = replace(detail,'[Macromedia]','','all')
	detail = replace(detail,'[SQLServer JDBC Driver]','','all')
	detail = replace(detail,'[SQLServer]','','all')

	sql = errorField(source, 'sql')
//	cflog(file='2026Fall2', type='error', text=eventName & ': ' & message & ' ' & detail)
	writeOutput('<div class="card">' & chr(10))
	writeoutput('	<div class="card-header bg-danger-subtle">' & chr(10))
	if (len(message)) {
		writeOutput(encodeForHTML(message))
	}
	writeoutput('	</div>'  & chr(10))
	writeoutput('	<div class="card-body">' & chr(10))
	if (len(detail) and detail != message) {
		writeOutput('<div>' & encodeForHTML(detail) & '</div>')
	}
	if (len(sql)) {
		writeOutput('<pre>SQL:<br>' & encodeForHTML(sql) & '</pre>')
	}
	try {
		for (i = 1; i <= arrayLen(source.tagContext); i++) {
			template = toString(source.tagContext[i].template)
			if (!findNoCase('\wwwroot\', template)) {
				continue
			}
			template = replaceNoCase(template,this.dir,'','all')
			writeOutput(encodeForHTML(template) & ', Line: ' & source.tagContext[i].line & '<br>')
		}
	} catch (any ignore) {}
	if (len(detail) or len(sql)) {
		if (len(message)) {
			subject = message
		}
		include '/Passwords/2026Fall2.cfm'
		if (structKeyExists(request, 'usr')) {
			usrname = request.usr.usrname
		}
		try {
			cfmail(type='text'
				,to='sennp@lr.edu,PhillipSenn@gmail.com'
				,from='Professor Senn<Professor.Senn@gmail.com>'
				,server='smtp.gmail.com'
				,port=465
				,useSSL=true
				,username='Professor.Senn@gmail.com'
				,password=password
				,subject=subject) {
				writeOutput(usrname & ' had the following error:' & chr(10) & chr(10) & detail & chr(10) & chr(10) & sql)
			}
			writeoutput('</div>' & chr(10))
			writeoutput('<div class="card-footer bg-warning-subtle">An email has been sent to sennp@lr.edu and PhillipSenn@gmail.com' & chr(10))
		} catch (any ignore) {}
	}
	writeoutput('	</div>' & chr(10))
	writeOutput('</div>' & chr(10))
}

function errorField(source, key) {
	try {
		if (!structKeyExists(source, key)) {
			return ''
		}
		return trim(toString(source[key]))
	} catch (any ignore) {
		return ''
	}
}
*/
}
