pgm.json = function(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.json()
}
pgm.caught = function(url) {
	function make_caught(error) {
		console.error('Fetch error for URL:', url)
		console.error('Status:', error.status || 'unknown')
		console.error('Message:', error.message)
		console.error('Stack:', error.stack)
		$('.card-header').text('Fetch to ' + url + ' failed: ' + error.message)
	}
	return make_caught
}

app.offset = $('.container.sticky-top').outerHeight()
	+ $('.card-header').outerHeight() + 10
	

function init() {
	$('.btn-warning').removeClass('btn-warning')
		.addClass('btn-outline-primary')

	// Pop the next description off the list
	var next = {}
	next.qid = $('.qid').first()
	next.qname = $('.qname').first()
	next.qdesc = $('.qdesc').first()
	next.qhref = $('.qhref').first()
	next.ansdesc = $('.ansdesc').first()

	app.qid = +next.qid.text()
	$('.h3').text(next.qdesc.text()) // qdesc
	$('.wikipedia-article').attr('href',next.qhref.text()) // <figure><a><img></a><figcaption><a></a></figcaption></figure>
	var src = next.ansdesc.text().trim()
	if (src.length) {
		$('#ansdesc').attr('src',src)
			.removeClass('d-none')
	} else {
		$('#ansdesc').addClass('d-none')
	}
	next.qid.remove()
	next.qname.remove()
	next.qdesc.remove()
	next.qhref.remove()
	next.ansdesc.remove()

	$('#slider').slideDown('slow','swing',done)
	function done() {
		$('.keyTerm' + app.qid).removeClass('btn-outline-primary')
			.addClass('btn-primary')
		$('html, body').animate({
			scrollTop: $('.keyTerm' + app.qid).offset().top - app.offset
		}, 1500)
	}
}


$(document).on('click','button.btn-outline-primary',btn)
$(document).on('click','button.btn-primary',btn)
function btn(myEvent) {
	if (+$(this).val() === app.qid) {
		$(this).removeClass('d-block')
			.hide('slow')
		$('#slider').slideUp('slow')
		var url = 'Poll/merge_q.cfm'
		var formData = new URLSearchParams()
		formData.set('id', dom.id)
		formData.set('qid', app.qid)
		var params = {
			method: 'POST',
			body: formData
		}
		fetch(url, params)
			.then(text)
			.then(pct_done)
			.catch(pgm.caught(url))
	} else {
		$(this).removeClass('btn-outline-primary btn-primary')
			.addClass('btn-warning')
	}
}
function pct_done(response) {
	var pct = +response
	$('.progress-bar').css('width', pct + '%')
		.text(pct + '%')
		init()
	if (pct >= 100) {
		$('#unanswered').hide()
		$('#all').removeClass('d-none')
	}
}

function text(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.text()
}

var url = 'grade/where_act.cfm'
var formData = new URLSearchParams()
formData.set('id', dom.id)
formData.set('actid', $('[name=actid]').val())
var params = {
	method: 'POST',
	body: formData
}
fetch(url, params)
	.then(text)
	.then(pct_done)
	.catch(pgm.caught(url))

