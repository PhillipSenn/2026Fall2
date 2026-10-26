<cfscript>
if (isDefined('form.actid')) {
//	writeoutput('<h4>' & form.actid & '</h4>')
}
writeOutput('</main>' & chr(10))
param request.bootstrap = true;
if (request.bootstrap) {
	// https://getbootstrap.com/docs/6.0/guides/quickstart/
	writeoutput('<script type="importmap">' & chr(10))
	writeoutput('{' & chr(10))
	writeoutput('  "imports": {' & chr(10))
	writeoutput('    "@floating-ui/dom": "https://cdn.jsdelivr.net/npm/@floating-ui/dom@1.7.6/dist/floating-ui.dom.esm.min.js",' & chr(10))
	writeoutput('    "@floating-ui/core": "https://cdn.jsdelivr.net/npm/@floating-ui/core@1.7.5/dist/floating-ui.core.mjs",' & chr(10))
	writeoutput('    "@floating-ui/utils": "https://cdn.jsdelivr.net/npm/@floating-ui/utils@0.2.11/dist/floating-ui.utils.mjs",' & chr(10))
	writeoutput('    "@floating-ui/utils/dom": "https://cdn.jsdelivr.net/npm/@floating-ui/utils@0.2.11/dist/floating-ui.utils.dom.mjs",' & chr(10))
	writeoutput('    "vanilla-calendar-pro": "https://cdn.jsdelivr.net/npm/vanilla-calendar-pro@3.4.0/index.mjs"' & chr(10))
	writeoutput('  }' & chr(10))
	writeoutput('}' & chr(10))
	writeoutput('</script>' & chr(10))
	writeoutput('<script type="module" src="https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.min.js" integrity="sha384-BJf/nQgxZJU68GxBse97Vdlc8Rh+z9PzzXiS3/BjV+1nQPR7IKn+iJnD3DJvCMaU" crossorigin="anonymous"></script>' & chr(10))
	writeoutput('<script type="module" src="' & request.home & 'Inc/js/bootstrap.js"></script>' & chr(10))
}
param request.jQuery = '';
if (request.jQuery == 'none') {
} else {
	writeoutput('<script src="/Inc/js/jQuery.js"></script>' & chr(10))
}
param request.jQueryUI = 'none';
if (request.jQueryUI != 'none') {
	writeoutput('<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>' & chr(10))
}
param request.footer = {};
param request.footer.js = true;
request.serverFile	= getFileFromPath(request.cgiName)
request.pgmDir		= ExpandPath(request.dir)
request.pgmName	= Left(request.serverFile,Len(request.serverFile)-4)
if (request.footer.js) {
	writeoutput('<script src="' & request.home & 'Inc/js/footer6.js"></script>' & chr(10))
}
//writeoutput('<h1>#request.pgmDir#</h1>')
//writeoutput('<h1>#request.pgmname#</h1>')
//writeoutput('<h1>#fileExists(request.pgmDir & request.pgmName & '.js')#</h1>')
param request.pageModule = false;
if (structKeyExists(request,'usr') AND fileExists(request.pgmDir & request.pgmName & '.js')) {
	if (request.pageModule) {
		writeoutput('<script type="module" src="' & request.pgmName & '.js"></script>' & chr(10))
	} else {
		writeoutput('<script src="' & request.pgmName & '.js"></script>' & chr(10))
	}
}
//writeOutput('<div hidden id="serverfile">' & request.serverFile & '</div>' & chr(10))
//if (isDefined('request.scriptname')) {
	//writeoutput('<div hidden id="scriptname">' & request.scriptname & '</div>')
//}
</cfscript>
</body>
</html>