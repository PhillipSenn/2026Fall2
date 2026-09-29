var dom = {} // Document Object Model

$('button').addClass('btn')
$('.btn:not([class*="btn-"]):not([class*="bg-"])').addClass('btn-primary')

$('form:not([method=get])').attr('method', 'post')
$('textarea').addClass('form-control')
$('input[type=email]').addClass('form-control')
$('table').addClass('table table-bordered').wrap('<div class="table-responsive"></div>')

pgm.each_navlink = function() {
	if ($(this).closest('nav').length) return
	if ($(this).hasClass('btn-primary')) {
		$(this).removeClass('btn-primary')
			.addClass('btn-link')
	}
	$(this).addClass('active')
		.wrap('<li class="nav-item"></li>')
	$(this).parent().appendTo('#main-navbar')
}
$('.nav-link').each(pgm.each_navlink)

function caught(url) {
	function make_caught(error) {
		console.error('Fetch error for URL:', url)
		console.error('Status:', error.status || 'unknown')
		console.error('Message:', error.message)
		console.error('Stack:', error.stack)
		$('.card-header').text('Fetch to ' + url + ' failed: ' + error.message)
	}
	return make_caught
}

function get_text(url) {
	var response = fetch(url).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.text()
	}
}

function get_json(url) {
	var response = fetch(url).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.json()
	}
}

function post_text(url, form) {
	var response = fetch(url, {
		 method: 'POST'
		,headers: { 'Content-Type': 'application/json' }
		,body: JSON.stringify(form)
	}).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.text()
	}
}

function post_json(url, form) {
	var response = fetch(url, {
		 method: 'POST'
		,headers: { 'Content-Type': 'application/json' }
		,body: JSON.stringify(form)
	}).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.json()
	}
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

pgm.tooltip = function(element) {
	new bootstrap.Tooltip(element)
}
document.querySelectorAll('[title]').forEach(pgm.tooltip)

var end = performance.now()
console.log((performance.now() - app.start).toFixed(0) + 'ms')