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

app.qid = +$('[name=qid]').val()
app.height = $('.container.sticky-top').outerHeight()

function init() {
	$('html, body').animate({
		scrollTop: $('.btn-outline-primary:first').offset().top - app.height
	}, 1000)
	var formData = new FormData()
	formData.append('term', $('[name=qname]').val())
	formData.append('definition', $('[name=qdesc]').val())
	
	fetch('image.cfm', {method: 'POST',body: formData})
		.then(pgm.json)
		.then(done)
		.catch(pgm.caught)
	
	function done(response) {
		console.log(response)
		$('#searchTerm').html(response.searchTerm)
		if (response.imageURL) {
			$('#myImage').attr('src', response.imageURL)
				.attr('hidden',false)
			$('#wikiURL').attr('href',response.wikiURL)
			$('figcaption').html(response.wikiTitle)
		}
		$('.spinner-border').addClass('d-none')
		setTimeout(scrollTop,1000)
	}
}

function scrollTop() {
	$('.keyTerm' + app.qid).removeClass('btn-outline-primary')
		.addClass('btn-primary')
	$('html, body').animate({
		scrollTop: $('.keyTerm' + app.qid).offset().top - app.height
	}, 1500)
}


$(document).on('click','button.btn-outline-primary',btn)
$(document).on('click','button.btn-primary',btn)
function btn(myEvent) {
	if (+$(this).val() === app.qid) {
		$(this).removeClass('d-block')
			.hide('slow')
		$('#slider').slideUp('slow','swing',nextQuestion)
		get_text('Poll/merge_q.cfm?qid=' + app.qid)
			.then(done)
	} else {
		$(this).removeClass('btn-outline-primary btn-primary')
			.addClass('btn-warning')
	}
}
function done(response) {
	var pct = +response
	$('.progress-bar').css('width', pct + '%')
		.text(pct + '%')
	if (pct >= 100) {
		$('#all').removeClass('d-none')
	}
}


function nextQuestion() {
	$('#myImage').attr('hidden',true)
	$('figcaption').empty()
	$('#searchTerm').empty()
	// Pop the next description off the list
	var next = {}
	next.qid = $('.qid').first()
	next.qname = $('.qname').first()
	next.qdesc = $('.qdesc').first()
	app.qid = +next.qid.text()
	$('[name=qid]').val(app.qid)
	$('[name=qname]').val(next.qname.text())
	$('[name=qdesc]').val(next.qdesc.text())
	$('#slider').slideDown('slow')
	$('.h3').text(next.qdesc.text())
	next.qid.remove()
	next.qname.remove()
	next.qdesc.remove()
	$('.spinner-border').removeClass('d-none')
	init()
}

init()
