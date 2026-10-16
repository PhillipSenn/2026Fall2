<cfscript>
if (isDefined('form.actid')) {
//	writeoutput('<h4>' & form.actid & '</h4>')
}
writeOutput('</main>' & chr(10))
param request.bootstrap = true;
if (request.bootstrap) {
	writeoutput('<script src="/Inc/js/popper.js"></script>' & chr(10))
	writeoutput('<script src="/Inc/js/bootstrap.js"></script>' & chr(10))
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
param request.cache = '?cache=' & TimeFormat(now(),'Hmmss');
param request.footer = {};
param request.footer.js = true;
request.cache=''
request.serverFile	= getFileFromPath(request.cgiName)
request.pgmDir		= ExpandPath(request.dir)
request.pgmName	= Left(request.serverFile,Len(request.serverFile)-4)
if (request.footer.js) {
	writeoutput('<script src="' & request.home & 'Inc/js/footer.js' & request.cache & '"></script>' & chr(10))
}
//writeoutput('<h1>#request.pgmDir#</h1>')
//writeoutput('<h1>#request.pgmname#</h1>')
//writeoutput('<h1>#fileExists(request.pgmDir & request.pgmName & '.js')#</h1>')
if (fileExists(request.pgmDir & request.pgmName & '.js')) {
	writeoutput('<script src="' & request.pgmName & '.js' & request.cache & '"></script>' & chr(10))
}
//writeOutput('<div hidden id="serverfile">' & request.serverFile & '</div>' & chr(10))
//if (isDefined('request.scriptname')) {
	//writeoutput('<div hidden id="scriptname">' & request.scriptname & '</div>')
//}
</cfscript>
</body>
</html>