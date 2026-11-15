var size = +$('#board').data('size') || 15
var cells = {}
var placements = {}
var dragThisGesture = false

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
			owners: {}
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
		var row = +(info.ROW != null ? info.ROW : info.row)
		var col = +(info.COL != null ? info.COL : info.col)
		var dir = +(info.DIR != null ? info.DIR : info.dir) || 0
		if (isNaN(row) || isNaN(col)) {
			return
		}
		word.attr('data-dir', dir).toggleClass('is-vertical', !!dir)
		paint_word(qid, String(word.data('letters')), row, col, dir, true)
		word.addClass('is-placed')
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
	$('.qname')
		.data('correct', false)
		.on('mousedown', reset_gesture)
		.on('click', rotate_word)
		.draggable({
			helper: drag_helper,
			appendTo: 'body',
			zIndex: 1000,
			distance: 4,
			cursorAt: { left: 20, top: 20 },
			revert: revert_word,
			cursor: 'grabbing',
			start: drag_start,
			drag: drag_move,
			stop: drag_stop
		})
}

function reset_gesture() {
	dragThisGesture = false
}

function bind_board() {
	$('#board .cell').droppable({
		accept: '.qname',
		tolerance: 'pointer',
		drop: drop_word
	})
}

function rotate_word(event) {
	var word = $(this)
	var qid = String(word.data('qid'))
	var letters = String(word.data('letters') || '')
	var placement
	var newDir
	if (dragThisGesture || word.hasClass('ui-draggable-dragging')) {
		return
	}
	event.preventDefault()
	placement = placements[qid]
	newDir = +word.attr('data-dir') ? 0 : 1
	if (!placement) {
		toggle_dir(word)
		return
	}
	unpaint_word(qid)
	if (!can_place(letters, placement.row, placement.col, newDir)) {
		paint_word(qid, letters, placement.row, placement.col, placement.dir, true)
		toggle_dir(word)
		return
	}
	word.attr('data-dir', newDir).toggleClass('is-vertical', !!newDir)
	paint_word(qid, letters, placement.row, placement.col, newDir, false)
	merge_q(qid, placement.row, placement.col, newDir)
		.catch(caught('merge_q.cfm'))
}

function toggle_dir(word) {
	var dir = +word.attr('data-dir') ? 0 : 1
	word.attr('data-dir', dir)
	word.toggleClass('is-vertical', !!dir)
	refresh_helper(word)
}

function refresh_helper(word) {
	var helper = $('.word-helper').last()
	var letters
	var dir
	var i
	if (!helper.length) {
		return
	}
	letters = String(word.data('letters') || '')
	dir = +word.attr('data-dir')
	helper.toggleClass('is-vertical', !!dir).empty()
	for (i = 0; i < letters.length; i++) {
		helper.append($('<span class="helper-letter">').text(letters.charAt(i)))
	}
}

function on_keydown(event) {
	if (event.key !== 'r' && event.key !== 'R') {
		return
	}
	var dragging = $('.qname.is-dragging')
	if (dragging.length) {
		toggle_dir(dragging.first())
		return
	}
	var hovered = $('.qname:hover')
	if (hovered.length) {
		hovered.first().trigger('click')
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

function drag_start(event, ui) {
	var word = $(this)
	var qid = String(word.data('qid'))
	var placement = placements[qid]
	var first = ui.helper.find('.helper-letter').first()
	dragThisGesture = true
	word.data('correct', false).addClass('is-dragging')
	if (first.length) {
		word.draggable('option', 'cursorAt', {
			left: first.outerWidth() / 2,
			top: first.outerHeight() / 2
		})
	}
	if (placement) {
		word.data('origin', {
			letters: placement.letters,
			row: placement.row,
			col: placement.col,
			dir: placement.dir
		})
		unpaint_word(qid)
	} else {
		word.removeData('origin')
	}
}

function drag_move(event, ui) {
	var cell
	dragThisGesture = true
	cell = cell_from_helper(ui.helper)
	if (!cell.length) {
		clear_preview()
		return
	}
	preview_word($(this), +cell.data('row'), +cell.data('col'))
}

function cell_from_helper(helper) {
	var first = helper.find('.helper-letter').first()
	var rect
	var el
	if (!first.length) {
		return $()
	}
	rect = first[0].getBoundingClientRect()
	helper.css('visibility', 'hidden')
	el = document.elementFromPoint(
		rect.left + rect.width / 2,
		rect.top + rect.height / 2
	)
	helper.css('visibility', 'visible')
	return $(el).closest('.cell')
}

function drag_stop() {
	var word = $(this)
	word.removeClass('is-dragging')
	clear_preview()
	if (!word.data('correct')) {
		restore_origin(word)
	}
	word.removeData('origin')
}

function restore_origin(word) {
	var origin = word.data('origin')
	var qid
	if (!origin) {
		return
	}
	qid = String(word.data('qid'))
	word.attr('data-dir', origin.dir).toggleClass('is-vertical', !!origin.dir)
	paint_word(qid, origin.letters, origin.row, origin.col, origin.dir, true)
	word.addClass('is-placed')
}

function revert_word() {
	return !$(this).data('correct')
}

function drop_word(event, ui) {
	var cell = cell_from_helper(ui.helper)
	var word = ui.draggable
	var row
	var col
	var dir = +word.attr('data-dir')
	var letters = String(word.data('letters') || '')
	var qid = String(word.data('qid'))
	var wasPlaced = !!word.data('origin')
	clear_preview()
	if (!cell.length) {
		cell = $(this)
	}
	row = +cell.data('row')
	col = +cell.data('col')
	if (!can_place(letters, row, col, dir)) {
		word.data('correct', false)
		return
	}
	paint_word(qid, letters, row, col, dir, false)
	word.data('correct', true)
	word.addClass('is-placed')
	merge_q(qid, row, col, dir)
		.then(after_merge)
		.catch(caught('merge_q.cfm'))

	function after_merge(response) {
		if (!wasPlaced) {
			show_earned(response)
		}
	}
}

function preview_word(word, row, col) {
	var letters = String(word.data('letters') || '')
	var dir = +word.attr('data-dir')
	var ok = can_place(letters, row, col, dir)
	var i
	var at
	clear_preview()
	for (i = 0; i < letters.length; i++) {
		at = offset_cell(row, col, dir, i)
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

function paint_word(qid, letters, row, col, dir, silent) {
	var i
	var at
	var letter
	placements[qid] = {
		letters: letters,
		row: row,
		col: col,
		dir: dir
	}
	for (i = 0; i < letters.length; i++) {
		at = offset_cell(row, col, dir, i)
		if (!at) {
			continue
		}
		letter = letters.charAt(i)
		at.owners[qid] = letter
		at.letter = letter
		at.el.text(letter).addClass('is-filled')
		if (!silent) {
			at.el.addClass('is-just-placed')
		}
	}
	if (!silent) {
		setTimeout(clear_just_placed, 700)
	}
}

function unpaint_word(qid) {
	var placement = placements[qid]
	var i
	var at
	var ownerIds
	if (!placement) {
		return
	}
	for (i = 0; i < placement.letters.length; i++) {
		at = offset_cell(placement.row, placement.col, placement.dir, i)
		if (!at) {
			continue
		}
		delete at.owners[qid]
		ownerIds = Object.keys(at.owners)
		if (!ownerIds.length) {
			at.letter = ''
			at.el.text('').removeClass('is-filled is-just-placed')
		} else {
			at.letter = at.owners[ownerIds[0]]
			at.el.text(at.letter).addClass('is-filled')
		}
	}
	delete placements[qid]
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
