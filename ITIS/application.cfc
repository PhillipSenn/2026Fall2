component {
this.name = 'ITIS'
this.datasource = 'ITIS'
this.sessionmanagement = false
this.tag.location.addtoken = false
this.nullSupport = true

this.app = getCurrentTemplatePath()
this.dir = getDirectoryFromPath(this.app)
this.parentDir = getDirectoryFromPath(left(this.dir, len(this.dir) - 1))
this.mappings['/course'] = this.parentDir
this.mappings['/inc'] = this.parentDir & 'inc\'
this.mappings['/passwords'] = 'C:\Passwords'
/*
this.javaSettings = {
	loadPaths: [this.dir & 'lib'],
	loadColdFusionClassPath: true,
	reloadOnChange: false
}
this.datasources = {
	ITIS: {
		DRIVER: 'other',
		'class': 'net.ucanaccess.jdbc.UcanaccessDriver',
		url: 'jdbc:ucanaccess://' & replace(this.parentDir, '\', '/', 'all') & 'accdb/ITIS.accdb;memory=false',
		username: '',
		password: ''
	}
}

function onApplicationStart() {
	var poolClass = createObject("java", "java.lang.Class").forName("coldfusion.server.j2ee.sql.pool.JDBCPool")
	var loader = poolClass.getClassLoader()
	var urlType = createObject("java", "java.net.URL").getClass()
	var cls = loader.getClass()
	var addURL = javacast("null", "")
	while (not isNull(cls)) {
		try {
			addURL = cls.getDeclaredMethod("addURL", [urlType])
			break
		} catch (any e) {
			cls = cls.getSuperclass()
		}
	}
	if (isNull(addURL)) {
		return
	}
	addURL.setAccessible(true)
	for (var jar in directoryList(this.dir & "lib", false, "path", "*.jar")) {
		addURL.invoke(loader, [createObject("java", "java.net.URL").init("file:///" & replace(jar, "\", "/", "all"))])
	}
	createObject("java", "java.lang.Class").forName("net.ucanaccess.jdbc.UcanaccessDriver", javacast("boolean", true), loader)
}
*/
function onRequestStart(targetPage) {
	structAppend(form, url, false)
	request.home = '/2026Fall2/'
	if (structKeyExists(form,'id') and len(form.id) == 36
		and Mid(form.id,9,1) == '-'
		and Mid(form.id,14,1) == '-'
		and Mid(form.id,19,1) == '-'
		and Mid(form.id,24,1) == '-') {
		cfstoredproc(procedure='usr.where_id', datasource='lr2026Fall2') {
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
	request.scriptname = cgi.SCRIPT_NAME
	if (len(cgi.QUERY_STRING)) {
		request.scriptname &= '?' & cgi.QUERY_STRING
	}
	request.dir = getDirectoryFromPath(request.cgiName)
	include '/server.cfm'
}

function onRequest(targetPage) {
	return createObject('component', 'course.application').onRequest(targetPage)
}
}
