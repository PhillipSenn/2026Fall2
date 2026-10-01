app = {}
//app.start = performance.now()

pgm = {}
pgm.resolve = function() {	
	document.querySelector('main').style.opacity = 1
	if (document.querySelector('.cfdebug')) {
		document.querySelector('.cfdebug').style.display = 'table'
	}
}

setTimeout(pgm.resolve,1000)


