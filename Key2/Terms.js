function init() {
	console.log('init')
	$('button.btn-warning').removeClass('btn-warning')
		.addClass('btn-outline-primary')

	var rows = $('#qids tbody tr').filter(function() {
		return !this.hasAttribute('data-pollid')
	})
	if (!rows.length) {
		$('#qid').empty()
		$('#wikipedia').addClass('d-none').removeAttr('src')
		$('#wikipedia-link').removeAttr('href')
		$('figcaption').empty()
		$('#qids').removeClass('d-none')
		return
	}
	var row = rows.eq(Math.floor(Math.random() * rows.length))
	app.qid = +row.attr('data-qid')
	app.row = row
	$('#qid').html(row.children('td').eq(2).html())
	picture(row.children('td').eq(1).text(), row.children('td').eq(2).text(), app.qid)
}

function picture(qname, qdesc, qid) {
	console.log('picture')
	$('#wikipedia').addClass('d-none').removeAttr('src')
	$('#wikipedia-link').removeAttr('href')
	$('figcaption').empty()
	var term = qname.replace(/\s*\([^)]*\)\s*$/, '')
	var url = 'https://en.wikipedia.org/api/rest_v1/page/summary/'
		+ encodeURIComponent(term)
	fetch(url, { method: 'get' })
		.then(json_done)
		.then(show_summary)
		.catch(search_picture)

	function show_summary(page) {
		if (app.qid !== qid) return
		if (page.type === 'disambiguation' || !page.thumbnail || !page.thumbnail.source) {
			search_picture()
			return
		}
		show_image(page.thumbnail.source, page.description || '', page.content_urls.desktop.page)
	}
	function search_picture() {
		console.log('search_picture')
		if (app.qid !== qid) return
		var query = '"' + term + '" ' + qdesc
		var searchUrl = 'https://en.wikipedia.org/w/api.php'
			+ '?action=query'
			+ '&generator=search'
			+ '&gsrsearch=' + encodeURIComponent(query)
			+ '&gsrnamespace=0'
			+ '&gsrlimit=10'
			+ '&prop=pageimages|description'
			+ '&piprop=thumbnail'
			+ '&pithumbsize=600'
			+ '&pilimit=10'
			+ '&format=json'
			+ '&formatversion=2'
			+ '&origin=*'
		fetch(searchUrl, { method: 'get' })
			.then(json_done)
			.then(show_search)
			.catch(hide_picture)
	}
	function show_search(data) {
		console.log('show_search')
		if (app.qid !== qid) return
		var pages = []
		if (data.query && data.query.pages) {
			pages = data.query.pages
		}
		pages.sort(by_index)
		var i = 0
		for (; i < pages.length; i++) {
			if (pages[i].thumbnail && pages[i].thumbnail.source) {
				var pageUrl = 'https://en.wikipedia.org/wiki/'
					+ encodeURIComponent(pages[i].title).replace(/%20/g, '_')
				show_image(pages[i].thumbnail.source, pages[i].description || '', pageUrl)
				return
			}
		}
		hide_picture()
	}
	function by_index(a, b) {
		return (a.index || 0) - (b.index || 0)
	}
	function show_image(src, caption, pageUrl) {
		$('#wikipedia-link').attr('href', pageUrl)
		$('#wikipedia').attr('src', src)
			.attr('alt', qname)
			.removeClass('d-none')
		$('figcaption').text(caption)
	}
	function hide_picture() {
		if (app.qid !== qid) return
		$('#wikipedia').addClass('d-none').removeAttr('src')
		$('#wikipedia-link').removeAttr('href')
		$('figcaption').empty()
	}
}

$(document).on('click', 'a.rownum', show_row)
function show_row(event) {
	console.log('show_row')
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
	picture(row.children('td').eq(1).text(), row.children('td').eq(2).text(), app.qid)
}

$(document).on('click', 'button.btn-outline-primary', btn)
function btn() {
	console.log('btn')
	if (+$(this).val() !== app.qid) {
		$(this).removeClass('btn-outline-primary')
			.addClass('btn-warning')
		return
	}
	$(this).removeClass('btn-outline-primary')
		.addClass('btn-primary')
	app.button = $(this)
	var url = 'Poll/merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', app.qid)
	fetch(url, form)
		.then(text_done)
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
init()
