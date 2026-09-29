</main>
<cfscript>
param request.bootstrap = true;
if (request.bootstrap) {
	writeoutput('<script src="' & request.home & 'Inc/js/popper.js"></script>' & chr(10))
	writeoutput('<script src="' & request.home & 'Inc/js/bootstrap.js"></script>' & chr(10))
}
param request.jQuery = '';
if (request.jQuery == 'none') {
} else if (request.jQuery == 'slim') {
	writeoutput('<script	src="https://code.jquery.com/jquery-4.0.0.slim.js"></script>' & chr(10))
} else {
	writeoutput('<script src="https://cdn.jsdelivr.net/npm/jquery/dist/jquery.js"></script>' & chr(10))
}
param request.jQueryUI = 'none';
if (request.jQueryUI != 'none') {
	writeoutput('<script src="https://code.jquery.com/ui/1.14.1/jquery-ui.js"></script>' & chr(10))
}
param request.cache = '?cache=' & TimeFormat(now(),'Hmmss');
param request.footer = {};
param request.footer.js = true;
request.cache=''
request.cgiName		= getPageContext().getRequest().getServletPath()
request.serverDir	= getDirectoryFromPath(request.cgiName)
request.serverFile= getFileFromPath(request.cgiName)
request.pgmDir		= ExpandPath(request.serverDir)
request.pgmName	= Left(request.serverFile,Len(request.serverFile)-4)
if (request.footer.js) {
	writeoutput('<script src="' & request.home & 'Inc/js/footer.js' & request.cache & '"></script>' & chr(10))
}
//writeoutput('<h1>#request.pgmDir#</h1>')
//writeoutput('<h1>#request.pgmname#</h1>')
//writeoutput('<h1>#fileExists(request.pgmDir & request.pgmName & '.js')#</h1>')
if (fileExists(request.pgmDir & request.pgmName & '.js')) {
	writeoutput('<script src="' & request.pgmName & '.js' & request.cache & '"></script>')
}
</cfscript>
</body>
</html>