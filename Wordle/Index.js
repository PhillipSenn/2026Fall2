var MAX_GUESSES = 6
var game = {
	qid: 0,
	answer: '',
	len: 0,
	row: 0,
	col: 0,
	guess: '',
	done: false,
	busy: false,
	keyState: {}
}

init()

function init() {
	var root = $('#wordle')
	if (!root.length) {
		return
	}
	game.qid = +root.data('qid')
	game.answer = String(root.data('answer') || '').toUpperCase()
	game.len = +root.data('len') || game.answer.length
	build_board()
	build_keyboard()
	$(document).on('click', '.wordle-key', key_click)
	$(document).on('keydown', type_key)
	$('#next').on('click', next_puzzle)
}

function build_board() {
	var board = $('#board').empty()
	var r
	var c
	var row
	for (r = 0; r < MAX_GUESSES; r++) {
		row = $('<div class="wordle-row">')
		for (c = 0; c < game.len; c++) {
			row.append($('<div class="wordle-tile">').attr('data-row', r).attr('data-col', c))
		}
		board.append(row)
	}
	$('#wordle')[0].style.setProperty('--wordle-len', String(game.len))
}

function build_keyboard() {
	var rows = [
		'QWERTYUIOP',
		'ASDFGHJKL',
		'ZXCVBNM'
	]
	var keyboard = $('#keyboard').empty()
	rows.forEach(each_row)
	keyboard.find('.wordle-row').eq(2)
		.prepend(key_button('ENTER', 'Enter', 'wordle-key-wide'))
		.append(key_button('⌫', 'Backspace', 'wordle-key-wide'))

	function each_row(letters) {
		var row = $('<div class="wordle-row">')
		letters.split('').forEach(each_letter)
		keyboard.append(row)
		function each_letter(letter) {
			row.append(key_button(letter, letter, ''))
		}
	}
}

function key_button(label, value, extraClass) {
	return $('<button type="button" class="wordle-key ' + extraClass + '">')
		.text(label)
		.attr('data-key', value)
}

function key_click() {
	handle_key(String($(this).data('key') || ''))
}

function type_key(event) {
	if ($(event.target).is('input, textarea, button[name=reset]')) {
		return
	}
	if (event.key === 'Enter' && $('#next').hasClass('btn-solid')) {
		event.preventDefault()
		$('#next').trigger('click')
		return
	}
	if (game.done || $(event.target).is('#next')) {
		return
	}
	if (event.key === 'Enter') {
		event.preventDefault()
		handle_key('Enter')
		return
	}
	if (event.key === 'Backspace') {
		event.preventDefault()
		handle_key('Backspace')
		return
	}
	if (/^[a-zA-Z]$/.test(event.key)) {
		handle_key(event.key.toUpperCase())
	}
}

function handle_key(key) {
	if (game.done || game.busy) {
		return
	}
	if (key === 'Enter') {
		submit_guess()
		return
	}
	if (key === 'Backspace') {
		backspace()
		return
	}
	if (/^[A-Z]$/.test(key) && game.col < game.len) {
		set_tile(game.row, game.col, key)
		game.guess += key
		game.col += 1
	}
}

function set_tile(row, col, letter) {
	tile(row, col).text(letter).addClass('is-filled')
}

function clear_tile(row, col) {
	tile(row, col).text('').removeClass('is-filled')
}

function tile(row, col) {
	return $('.wordle-tile[data-row="' + row + '"][data-col="' + col + '"]')
}

function backspace() {
	if (game.col <= 0) {
		return
	}
	game.col -= 1
	game.guess = game.guess.slice(0, -1)
	clear_tile(game.row, game.col)
}

function submit_guess() {
	if (game.guess.length !== game.len) {
		set_status('Need ' + game.len + ' letters.')
		shake_row(game.row)
		return
	}
	game.busy = true
	reveal_row(game.guess, after_reveal)

	function after_reveal() {
		update_keyboard(game.guess)
		if (game.guess === game.answer) {
			game.done = true
			mark_solved()
			merge_q(game.qid).then(after_merge).catch(merge_failed)
			return
		}
		game.row += 1
		game.col = 0
		game.guess = ''
		game.busy = false
		if (game.row >= MAX_GUESSES) {
			set_status('The answer was ' + game.answer + '.')
			game.done = true
		}
	}

	function after_merge(response) {
		show_earned(response)
		game.busy = false
	}

	function merge_failed(error) {
		game.busy = false
		caught('merge_q.cfm')(error)
	}
}

function reveal_row(guess, done) {
	var pool = game.answer.split('')
	var marks = []
	var i
	for (i = 0; i < game.len; i++) {
		if (guess.charAt(i) === game.answer.charAt(i)) {
			marks[i] = 'correct'
			pool[i] = ''
		}
	}
	for (i = 0; i < game.len; i++) {
		if (marks[i]) {
			continue
		}
		var letter = guess.charAt(i)
		var at = pool.indexOf(letter)
		if (at === -1) {
			marks[i] = 'absent'
		} else {
			marks[i] = 'present'
			pool[at] = ''
		}
	}
	animate_tiles(0)

	function animate_tiles(index) {
		if (index >= game.len) {
			done()
			return
		}
		tile(game.row, index).addClass('is-' + marks[index])
		setTimeout(next_tile, 180)
		function next_tile() {
			animate_tiles(index + 1)
		}
	}
}

function update_keyboard(guess) {
	var i
	for (i = 0; i < game.len; i++) {
		var letter = guess.charAt(i)
		var state = tile(game.row, i).hasClass('is-correct')
			? 'correct'
			: tile(game.row, i).hasClass('is-present')
				? 'present'
				: 'absent'
		rank_key(letter, state)
	}
}

function rank_key(letter, state) {
	var rank = {absent: 1, present: 2, correct: 3}
	var current = game.keyState[letter]
	if (current && rank[current] >= rank[state]) {
		return
	}
	game.keyState[letter] = state
	$('.wordle-key[data-key="' + letter + '"]')
		.removeClass('is-absent is-present is-correct')
		.addClass('is-' + state)
}

function shake_row(row) {
	var el = $('.wordle-row').eq(row)
	el.addClass('is-shake')
	setTimeout(clear_shake, 500)
	function clear_shake() {
		el.removeClass('is-shake')
	}
}

function set_status(text) {
	$('#status').text(text)
}

function mark_solved() {
	$('#qdesc-card').remove()
	$('#next')
		.removeClass('btn-outline theme-primary')
		.addClass('btn-solid theme-success')
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

function next_puzzle() {
	location.reload()
}
