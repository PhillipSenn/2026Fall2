component {
this.name = 'lr2026Fall2'
this.datasource = 'lr2026Fall2'
this.sessionmanagement = true
this.tag.location.addtoken = false
this.nullSupport = true

this.app	= getCurrentTemplatePath()
this.dir	= getDirectoryFromPath(this.app)
this.mappings['/inc'] = this.dir & 'inc\'
this.mappings['/dbo'] = this.dir & 'dbo\'
this.serialization = {}
//	 preserveCaseForStructKey = true // do not lowercase struct keys
//	,serializeQueryAs = 'array' // [{'id':'1','name':'Alice'},  {'id':'2','name':'Bob'}]
//	,serializeQueryAs = 'struct' // { COLUMNS:[...], DATA:[ [...], [...], ... ] }
//	dateTimeFormat = 'iso8601' // 2025-12-20T13:45:00Z
this.serialization.dateTimeFormat = 'iso8601' // 2025-12-20T13:45:00Z
this.mappings['/passwords'] = 'C:\Passwords'

function onRequestStart(response) {
//	cfheader(name='Content-Type', value='text/html; charset=utf-8')
	structAppend(form,url,false)

	request.home = '/2026Fall2'
	request.counter = 0
	var cginame = getPageContext().getRequest().getServletPath()
	var usr = {}
	if (structKeyExists(form,'email') AND Len(form.email)) {
		if (Find('@',form.email) and structKeyExists(url,'actid')) {
			usr = new dbo.proc().exec('usr.email_act',[form.email,url.actid])
			if (usr.recordcount) {
				var svc = new mail()
				svc.setSubject('LRU CSC Login')
				svc.setFrom('Professor Senn<Professor.Senn@gmail.com>')
				include '/passwords/2026Fall2.cfm'
				svc.setPassword(password)
				svc.setPort(465)
				svc.setServer('smtp.gmail.com')
				var emailBody = usr.firstname & ':<p>'
					& '<a href="https://PhillipSenn.com' & request.home & '/' & usr.actlink & '?actid=' & url.actid & '&id=' & usr.id & '">Click here to login</a>.'
					& '<br>PhillipSenn.com' & request.home & '?id=' & usr.id
				
				svc.setBody(emailBody)
				svc.setto(form.email)
				svc.setcc('sennp@lr.edu')
				svc.setType('html');
				svc.setUserName('Professor.Senn@gmail.com')
				svc.setUseSSL(true)
				svc.Send()
				location url=request.home & '/Login?actid=' & url.actid;
			}
		} else {
			usr = new dbo.proc().exec('usr.where_pass',form.email)
		}
		if (usr.recordCount) {
			request.usr = {}

			for (var column in usr.columnList) {
				request.usr[column] = usr[column][1]
			}
		} else {
			sleep(3000)
		}
	}
	if (structKeyExists(form,'id') and len(form.id) == 36 
		and Mid(form.id,9,1) == '-'
		and Mid(form.id,14,1) == '-'
		and Mid(form.id,19,1) == '-'
		and Mid(form.id,24,1) == '-') {
		// 61953961-5BDF-41CA-890F-5FB76AD6073B
		// 123456789012345678901234567890123456
		var usr = new dbo.proc().exec('usr.where_id',form.id)
		if (usr.recordCount) {
			request.usr = {}

			for (var column in usr.columnList) {
				request.usr[column] = usr[column][1]
			}
		}
	}
	if (FindNoCase('/google/maps/',cginame)) {
//	} else if (FindNoCase('/unicode',cginame)) {
	} else if (structKeyExists(request,'usr')) {
		session.usr = StructCopy(request.usr)
		if (cginame == request.home & '/login.cfm') {
			location url=request.home;
		}
	} else {
		if (cginame == request.home & '/login.cfm') {
		} else if (structKeyExists(session,'usr')) {
			request.usr = structCopy(session.usr)
		} else {
			include request.home & '/Login.cfm'
			return false
		}
	}
	if (FindNoCase('/admin/',cginame)) {
		if (!structKeyExists(cookie,'admin')) {
			dump(cookie)
			return false
		}
	}
	request.scriptname = cgi.SCRIPT_NAME
	if (len(cgi.QUERY_STRING)) {
		request.scriptname &= '?' & cgi.QUERY_STRING
	}
}

function onRequest(required string targetPage) {
	include '/Inc/cfm/dump.cfm'
	include '/Inc/cfm/echo.cfm'
	include arguments.targetPage
}
}
