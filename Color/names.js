var remaining = $('.color-swatch').length

sort_names()
$('.color-name')
	.data('correct', false)
	.draggable({
		helper: 'clone',
		appendTo: 'body',
		zIndex: 1000,
		revert: revert_name
	})
$('.color-swatch').droppable({
	accept: '.color-name',
	tolerance: 'pointer',
	over: over_swatch,
	out: out_swatch,
	drop: drop_name
})

function sort_names() {
	var items = $('#names li').get()
	items.sort(by_name)
	$('#names').append(items)
}

function by_name(a, b) {
	var aText = $(a).text().toLowerCase()
	var bText = $(b).text().toLowerCase()
	return aText.localeCompare(bText)
}

function revert_name() {
	return !$(this).data('correct')
}

function over_swatch() {
	$(this).addClass('color-over')
}

function out_swatch() {
	$(this).removeClass('color-over')
}

function drop_name(event, ui) {
	var swatch = $(this)
	var name = ui.draggable
	swatch.removeClass('color-over')
	if (String(name.data('qid')) !== String(swatch.data('qid'))) {
		name.data('correct', false)
		reveal_swatch(swatch)
		return
	}
	name.data('correct', true)
	swatch.droppable('disable')
	name.draggable('disable')
	merge_q(name.data('qid'))
	remaining -= 1
	clearTimeout(swatch.data('labelTimer'))
	swatch.removeData('labelTimer')
	if (!swatch.find('.color-label').length) {
		swatch.append($('<span class="color-label">').text(swatch.attr('data-qdesc')))
	}
	setTimeout(slide_away, 1000)
	function slide_away() {
		name.closest('li').add(swatch).slideUp('slow', after_slide)
	}
	function after_slide() {
		$(this).remove()
		if (remaining <= 0 && !$('.color-swatch').length) {
			$('#color-names').trigger('submit')
		}
	}
}

function reveal_swatch(swatch) {
	var label = swatch.find('.color-label')
	clearTimeout(swatch.data('labelTimer'))
	if (!label.length) {
		label = $('<span class="color-label">').text(swatch.attr('data-qdesc'))
		swatch.append(label)
	}
	swatch.data('labelTimer', setTimeout(hide_label, 2000))
	function hide_label() {
		label.remove()
		swatch.removeData('labelTimer')
	}
}

function merge_q(qid) {
	var url = '../Poll/merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', qid)
	fetch(url, form)
		.then(text_done)
		.then(show_earned)
		.catch(caught(url))
}

function show_earned(response) {
	var pct = +response
	$('.progress-bar').css('width', pct + '%')
		.text(pct + '%')
		.attr('aria-valuenow', pct)
	if (pct >= 100) {
		$('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
}
