function init() {
	$('button.btn-warning').removeClass('btn-warning')
		.addClass('btn-outline-primary')

	var rows = $('#qids tbody tr').filter(function() {
		return !this.hasAttribute('data-pollid')
	})
	if (!rows.length) {
		$('#qid').empty()
		$('#wikipedia').addClass('d-none').removeAttr('src')
		$('figcaption').empty()
		$('#qids').removeClass('d-none')
		return
	}
	var row = rows.eq(Math.floor(Math.random() * rows.length))
	app.qid = +row.attr('data-qid')
	app.row = row
	$('#qid').html(row.children('td').eq(2).html())
	picture(row.children('td').eq(1).text(), app.qid)
}

function picture(qname, qid) {
	$('#wikipedia').addClass('d-none').removeAttr('src')
	$('figcaption').empty()
	var url = 'https://en.wikipedia.org/api/rest_v1/page/summary/'
		+ encodeURIComponent(qname.trim())
	fetch(url)
		.then(done_json)
		.then(show_picture)
		.catch(hide_picture)

	function show_picture(page) {
		if (app.qid !== qid) return
		if (!page.thumbnail || !page.thumbnail.source) return
		$('#wikipedia').attr('src', page.thumbnail.source)
			.attr('alt', qname)
			.removeClass('d-none')
		$('figcaption').text(page.description || '')
	}
	function hide_picture() {
		if (app.qid !== qid) return
		$('#wikipedia').addClass('d-none').removeAttr('src')
		$('figcaption').empty()
	}
}

$(document).on('click', 'a.rownum', show_row)
function show_row(event) {
	event.preventDefault()
	var row = $(this).closest('tr')
	app.qid = +row.attr('data-qid')
	app.row = row
	$('#qid').html(row.children('td').eq(2).html())
	$('#qids').addClass('d-none')
	$('.col-4 button').addClass('d-none')
	$('.col-4 button').filter(function() {
		return +$(this).val() === app.qid
	}).removeClass('d-none btn-warning btn-primary')
		.addClass('btn-outline-primary')
		.show()
	picture(row.children('td').eq(1).text(), app.qid)
}

$(document).on('click', 'button.btn-outline-primary', btn)
function btn() {
	if (+$(this).val() !== app.qid) {
		$(this).removeClass('btn-outline-primary')
			.addClass('btn-warning')
		return
	}
	$(this).removeClass('btn-outline-primary')
		.addClass('btn-primary')
	app.button = $(this)
	var url = 'Poll/merge_q.cfm'
	var formData = new URLSearchParams()
	formData.set('id', dom.id)
	formData.set('qid', app.qid)
	var params = {
		method: 'POST',
		body: formData
	}
	fetch(url, params)
		.then(done_text)
		.then(done)
		.catch(caught(url))
}

function done(response) {
	app.button.hide('slow')
	var pct = +response
	$('.progress-bar').css('width', pct + '%')
		.text(pct + '%')
	app.row.attr('data-pollid', pct)
	init()
	if (pct >= 100) {
		$('#qids').removeClass('d-none')
	}
}

function done_text(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.text()
}

function done_json(response) {
	if (!response.ok) {
		throw new Error('HTTP ' + response.status + ' ' + response.statusText)
	}
	return response.json()
}

init()
