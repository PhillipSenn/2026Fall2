var size = +$('#board').data('size') || 35
var cells = {}
var placed = {}

init_cells()
load_placed()
sort_words()
bind_words()
bind_board()
$(document).on('keydown', on_keydown)

function init_cells() {
	$('#board .cell').each(each_cell)
	function each_cell() {
		var cell = $(this)
		var row = +cell.data('row')
		var col = +cell.data('col')
		cells[key(row, col)] = {
			el: cell,
			letter: '',
			count: 0
		}
	}
}

function load_placed() {
	var raw = $('#placed-json').text()
	var map
	try {
		map = JSON.parse(raw || '{}')
	} catch (error) {
		map = {}
	}
	$('.qname').each(restore_word)
	function restore_word() {
		var word = $(this)
		var qid = String(word.data('qid'))
		var info = map[qid]
		if (!info) {
			return
		}
		placed[qid] = true
		word.addClass('is-placed').closest('li').addClass('is-placed')
		if (info.ROW == null && info.row == null) {
			return
		}
		var row = +(info.ROW != null ? info.ROW : info.row)
		var col = +(info.COL != null ? info.COL : info.col)
		var dir = +(info.DIR != null ? info.DIR : info.dir)
		if (isNaN(row) || isNaN(col)) {
			return
		}
		paint_word(String(word.data('letters')), row, col, dir, true)
	}
}

function sort_words() {
	var items = $('#words li').get()
	items.sort(by_name)
	$('#words').append(items)
}

function by_name(a, b) {
	var aText = $(a).text().toLowerCase()
	var bText = $(b).text().toLowerCase()
	return aText.localeCompare(bText)
}

function bind_words() {
	$('.qname').not('.is-placed')
		.on('click', rotate_word)
		.draggable({
			helper: drag_helper,
			appendTo: 'body',
			zIndex: 1000,
			revert: 'invalid',
			cursor: 'grabbing',
			start: drag_start,
			stop: drag_stop
		})
}

function bind_board() {
	$('#board .cell').droppable({
		accept: '.qname',
		tolerance: 'pointer',
		over: over_cell,
		out: out_cell,
		drop: drop_word
	})
}

function rotate_word(event) {
	if ($(this).hasClass('ui-draggable-dragging')) {
		return
	}
	event.preventDefault()
	toggle_dir($(this))
}

function toggle_dir(word) {
	var dir = +word.attr('data-dir') ? 0 : 1
	word.attr('data-dir', dir)
	word.toggleClass('is-vertical', !!dir)
}

function on_keydown(event) {
	if (event.key !== 'r' && event.key !== 'R') {
		return
	}
	var dragging = $('.qname.ui-draggable-dragging')
	if (dragging.length) {
		toggle_dir(dragging)
		dragging.draggable('option', 'helper', drag_helper)
		return
	}
	var hovered = $('.qname:hover').not('.is-placed')
	if (hovered.length) {
		toggle_dir(hovered.first())
	}
}

function drag_helper() {
	var word = $(this)
	var letters = String(word.data('letters') || '')
	var dir = +word.attr('data-dir')
	var helper = $('<div class="word-helper">').toggleClass('is-vertical', !!dir)
	var i
	for (i = 0; i < letters.length; i++) {
		helper.append($('<span class="helper-letter">').text(letters.charAt(i)))
	}
	return helper
}

function drag_start() {
	$(this).addClass('is-dragging')
}

function drag_stop() {
	$(this).removeClass('is-dragging')
	clear_preview()
}

function over_cell(event, ui) {
	var cell = $(this)
	var word = ui.draggable
	preview_word(word, +cell.data('row'), +cell.data('col'))
}

function out_cell() {
	clear_preview()
}

function drop_word(event, ui) {
	var cell = $(this)
	var word = ui.draggable
	var row = +cell.data('row')
	var col = +cell.data('col')
	var dir = +word.attr('data-dir')
	var letters = String(word.data('letters') || '')
	var qid = word.data('qid')
	clear_preview()
	if (!can_place(letters, row, col, dir)) {
		return
	}
	paint_word(letters, row, col, dir, false)
	placed[String(qid)] = true
	word.draggable('disable')
	word.addClass('is-placed').closest('li').slideUp('slow', after_slide)
	merge_q(qid, row, col, dir)
		.then(show_earned)
		.catch(caught('merge_q.cfm'))

	function after_slide() {
		$(this).addClass('is-placed')
	}
}

function preview_word(word, row, col) {
	var letters = String(word.data('letters') || '')
	var dir = +word.attr('data-dir')
	var ok = can_place(letters, row, col, dir)
	var i
	clear_preview()
	for (i = 0; i < letters.length; i++) {
		var at = offset_cell(row, col, dir, i)
		if (!at) {
			continue
		}
		at.el.addClass(ok ? 'is-preview-ok' : 'is-preview-bad')
	}
}

function clear_preview() {
	$('#board .cell').removeClass('is-preview-ok is-preview-bad')
}

function can_place(letters, row, col, dir) {
	var i
	var at
	var letter
	if (!letters.length) {
		return false
	}
	for (i = 0; i < letters.length; i++) {
		at = offset_cell(row, col, dir, i)
		if (!at) {
			return false
		}
		letter = letters.charAt(i)
		if (at.letter && at.letter !== letter) {
			return false
		}
	}
	return true
}

function paint_word(letters, row, col, dir, silent) {
	var i
	var at
	for (i = 0; i < letters.length; i++) {
		at = offset_cell(row, col, dir, i)
		if (!at) {
			continue
		}
		at.letter = letters.charAt(i)
		at.count += 1
		at.el.text(at.letter).addClass('is-filled')
		if (!silent) {
			at.el.addClass('is-just-placed')
		}
	}
	if (!silent) {
		setTimeout(clear_just_placed, 700)
	}
}

function clear_just_placed() {
	$('#board .cell').removeClass('is-just-placed')
}

function offset_cell(row, col, dir, i) {
	var r = dir ? row + i : row
	var c = dir ? col : col + i
	if (r < 0 || c < 0 || r >= size || c >= size) {
		return null
	}
	return cells[key(r, c)]
}

function key(row, col) {
	return row + ':' + col
}

function merge_q(qid, row, col, dir) {
	var url = 'merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', qid)
	form.body.set('row', row)
	form.body.set('col', col)
	form.body.set('dir', dir)
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
