var flipped = []
var busy = false

$(document).on('click', '.memory-card', flip_card)
$(document).on('keydown', '.memory-card', key_flip)

function key_flip(event) {
	if (event.key !== 'Enter' && event.key !== ' ') {
		return
	}
	event.preventDefault()
	flip_card.call(this)
}

function flip_card() {
	var card = $(this)
	var slot = card.closest('.memory-slot')
	if (busy || card.hasClass('is-flipped') || slot.hasClass('is-shrinking')) {
		return
	}
	card.addClass('is-flipped')
	flipped.push(card)
	if (flipped.length < 2) {
		return
	}
	busy = true
	if (is_match(flipped[0], flipped[1])) {
		setTimeout(resolve_match, 450)
	} else {
		setTimeout(resolve_miss, 1900)
	}
}

function is_match(a, b) {
	return String(a.data('qid')) === String(b.data('qid'))
		&& String(a.data('cat')) !== String(b.data('cat'))
}

function resolve_match() {
	var first = flipped[0]
	var second = flipped[1]
	var firstSlot = first.closest('.memory-slot')
	var secondSlot = second.closest('.memory-slot')
	var qid = second.data('qid')
	prepend_solved(first, second)
	first.addClass('is-matched')
	second.addClass('is-matched')
	setTimeout(shrink_match, 1200)

	function shrink_match() {
		var remaining = $('.memory-slot').not(firstSlot).not(secondSlot)
		var empty = !remaining.length
		var starts = []
		remaining.each(capture_start)
		firstSlot.addClass('is-shrinking')
		secondSlot.addClass('is-shrinking')
		setTimeout(finish_shrink, 350)

		function capture_start() {
			starts.push({
				el: this,
				rect: this.getBoundingClientRect()
			})
		}

		function finish_shrink() {
			firstSlot.remove()
			secondSlot.remove()
			if (!empty) {
				rearrange(starts)
			}
			flipped = []
			merge_q(qid)
				.then(after_merge)
				.catch(merge_failed)

			function after_merge(response) {
				show_earned(response)
				if (empty) {
					$('article > header')
						.first()
						.removeClass('theme-primary theme-subtle')
						.addClass('theme-warning')
						.text('Refreshing...')
					setTimeout(reload_page, 400)
					return
				}
				busy = false
			}

			function merge_failed(error) {
				busy = false
				caught('merge_q.cfm')(error)
			}
		}
	}
}

function prepend_solved(a, b) {
	var picture = String(a.data('cat')) === 'Picture' ? a : b
	var image = String(a.data('cat')) === 'Image' ? a : b
	var qname = String(picture.data('qname') || image.data('qname') || '')
	var invention = String(image.data('invention') || picture.data('invention') || '')
	var pictureSrc = picture.find('img').attr('src') || ''
	var imageSrc = image.find('img').attr('src') || ''
	var row = $('<tr>')
	row.append($('<td>').append($('<a>', {
		href: 'https://www.google.com/search?tbm=isch&q=' + encodeURIComponent((qname + ' ' + invention).trim()),
		target: '_blank'
	}).text(qname)))
	row.append($('<td>').append($('<img>', {
		src: pictureSrc,
		'class': 'img-thumbnail',
		width: 100,
		alt: qname
	})))
	row.append($('<td>').append($('<img>', {
		src: imageSrc,
		'class': 'img-thumbnail',
		width: 100,
		alt: invention
	})))
	row.append($('<td>').text(invention))
	$('#solved-body').prepend(row)
}

function rearrange(starts) {
	var i
	var item
	var end
	var dx
	var dy
	for (i = 0; i < starts.length; i++) {
		item = starts[i]
		if (!item.el.isConnected) {
			continue
		}
		end = item.el.getBoundingClientRect()
		dx = item.rect.left - end.left
		dy = item.rect.top - end.top
		if (!dx && !dy) {
			continue
		}
		item.el.style.transition = 'none'
		item.el.style.transform = 'translate(' + dx + 'px, ' + dy + 'px)'
		item.el.offsetWidth
		item.el.style.transition = ''
		item.el.style.transform = ''
	}
}

function resolve_miss() {
	flipped[0].removeClass('is-flipped')
	flipped[1].removeClass('is-flipped')
	flipped = []
	busy = false
}

function merge_q(qid) {
	var url = 'merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', qid)
	return fetch(url, form).then(text_done)
}

function show_earned(response) {
	var parts = String(response || '').split('|')
	var pct = +parts[0]
	var label = parts[1] || (pct + '%')
	$('.progress-bar').css('width', pct + '%')
		.text(label)
		.attr('aria-valuenow', pct)
	if (pct >= 100) {
		$('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
}

function reload_page() {
	var url = new URL(location.href)
	var level = $('[name=level]').val() || $('#memory-board').data('level') || 'hard'
	url.searchParams.set('level', level)
	location.href = url.toString()
}
