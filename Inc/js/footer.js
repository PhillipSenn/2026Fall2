var dom = {} // Document Object Model

pgm.init = function() {
	function each_navlink() { // .home.nav-link needs to be moved into #main-navbar
		if ($(this).closest('nav').length) return
		if ($(this).hasClass('theme-primary')) {
			$(this).removeClass('btn-solid theme-primary')
				.addClass('btn-link')
		}
		$(this).wrap('<li class="nav-item"></li>')
		$(this).parent().appendTo('#main-navbar')
	}
	$('button:not([class*="btn-"]):not([class*="bg-"])').addClass('btn-solid theme-primary CharliePark')
	$('.nav-link').each(each_navlink)

	dom.home = $('.home.nav-link')
	if (dom.home.length) {
		$('main').hide()
		dom.home.click()
	}

	var nativeFetch = window.fetch
	window.fetch = function(url, form) {
		form = Object.assign({ method: 'post' }, form)
		console.log(url)
		console.log(form)
		console.log(url + pgm.form_query(form.body))
		return nativeFetch.call(window, url, form)
	}
	
	var nativeText = $.fn.text
	$.fn.text = function(response) {
		if (response === undefined) {
			return nativeText.call(this).trim()
		}
		return nativeText.call(this, response)
	}
}
pgm.form_query = function(body) {
	var parts = []
	if (!body) return ''
	if (typeof body.forEach !== 'function') return '?' + body
	body.forEach(each_field)
	return '?' + parts.join('&')
	function each_field(value, key) {
		parts.push(key + '=' + value)
	}
}

pgm.init()


app.id = $('input[name=id]').val()
app.actid = +$('[name=actid]').val()

$('form:not([method=get])').attr('method', 'post')
$('textarea').addClass('form-control')
$('input[type=email]').addClass('form-control')
$('table').addClass('table table-bordered').wrap('<div class="table-responsive"></div>')

$('#main-navbar .nav-link').last().addClass('active')

function text_done(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.text()
}
function json_done(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.json()
}


function caught(url) {
	function make_caught(error) {
		console.log('Fetch error for URL:', url)
		console.log('Status:', error.status || 'unknown')
		console.log('Message:', error.message)
		console.log('Stack:', error.stack)
		$('.card-header').removeClass('bg-subtle-primary')
			.addClass('bg-danger')
			.text('Fetch to ' + url + ' failed: ' + error.message)
		debugger // It could be because you're on the wrong server.
	}
	return make_caught
}
pgm.form_submit = function() {
	$('body').css('cursor', 'wait')
}
$('form').on('submit', pgm.form_submit)

if ($('textarea').length) {
	if (typeof autosize === 'function') {
		autosize($('textarea'))
	}
}

pgm.tooltip = function(element, options) {
	function create_tip() {
		if (!element.isConnected) return element
		bootstrap.Tooltip.getOrCreateInstance(element, options || {})
		return element
	}
	if (window.bootstrap && bootstrap.Tooltip) return create_tip()
	document.addEventListener('bootstrap-ready', create_tip)
	return element
}

function each_title(element) {
	pgm.tooltip(element)
}
function init_tooltips() {
	document.querySelectorAll('[title]').forEach(each_title)
}
document.addEventListener('bootstrap-ready', init_tooltips)

//var end = performance.now()
//console.log((performance.now() - app.start).toFixed(0) + 'ms')
setTimeout(cfdebug,100)
function cfdebug() {
	var debug = $('table.cfdebug').first()
	if (!debug.length) return
	debug.wrap('<div class="container"></div>')
	debug.wrap('<div class="card"></div>')
	debug.wrap('<div class="collapse" id="cfdebugBody"></div>')
	debug.wrap('<div class="card-body"></div>')

	debug.closest('.card').prepend(
		'<div class="card-header" data-bs-toggle="collapse" data-bs-target="#cfdebugBody">' +
			'Debugging Information' +
		'</div>'
	)
	$('a[name="cfdebug_top"]').remove()
	$('style[type="text/css"]').remove()
	$('.template_overage').remove()
	$('[name=cfdebug_execution]').remove()
	$('hr').remove()
	$('.cfdebuglge').remove()
}
