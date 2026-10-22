<cfscript>
if (isDefined('form.actid')) {
//	writeoutput('<h4>' & form.actid & '</h4>')
}
writeOutput('</main>' & chr(10))
param request.bootstrap = true;
if (request.bootstrap) {
	//getbootstrap.com/docs/6.0/guides/quickstart/
	writeoutput('<script type="module" src="' & request.home & 'Inc/js/bootstrap.js?cache=' & TimeFormat(now(),'Hmmss') & '"></script>' & chr(10))
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
	writeoutput('<script src="' & request.home & 'Inc/js/footer.js"></script>' & chr(10))
}
//writeoutput('<h1>#request.pgmDir#</h1>')
//writeoutput('<h1>#request.pgmname#</h1>')
//writeoutput('<h1>#fileExists(request.pgmDir & request.pgmName & '.js')#</h1>')
if (structKeyExists(request,'usr') AND fileExists(request.pgmDir & request.pgmName & '.js')) {
	writeoutput('<script src="' & request.pgmName & '.js"></script>' & chr(10))
}
//writeOutput('<div hidden id="serverfile">' & request.serverFile & '</div>' & chr(10))
//if (isDefined('request.scriptname')) {
	//writeoutput('<div hidden id="scriptname">' & request.scriptname & '</div>')
//}
</cfscript>
</body>
</html>