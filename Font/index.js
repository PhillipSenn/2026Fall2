var selected = 'A'
var glyphs = {}
var originals = font_originals()

function font_originals() {
	return {
		' ': ['00000', '00000', '00000', '00000', '00000', '00000', '00000'],
		'!': ['00100', '00100', '00100', '00100', '00100', '00000', '00100'],
		'"': ['01010', '01010', '01010', '00000', '00000', '00000', '00000'],
		"'": ['00100', '00100', '01000', '00000', '00000', '00000', '00000'],
		'(': ['00100', '01000', '10000', '10000', '10000', '01000', '00100'],
		')': ['00100', '00010', '00001', '00001', '00001', '00010', '00100'],
		',': ['00000', '00000', '00000', '00000', '01100', '01100', '01000'],
		'-': ['00000', '00000', '00000', '11111', '00000', '00000', '00000'],
		'.': ['00000', '00000', '00000', '00000', '00000', '01100', '01100'],
		':': ['00000', '01100', '01100', '00000', '01100', '01100', '00000'],
		';': ['00000', '01100', '01100', '00000', '01100', '00100', '01000'],
		'?': ['01110', '10001', '00001', '00010', '00100', '00000', '00100'],
		'0': ['01110', '10001', '10011', '10101', '11001', '10001', '01110'],
		'1': ['00100', '01100', '00100', '00100', '00100', '00100', '01110'],
		'2': ['01110', '10001', '00001', '00010', '00100', '01000', '11111'],
		'3': ['11110', '00001', '00001', '01110', '00001', '00001', '11110'],
		'4': ['00010', '00110', '01010', '10010', '11111', '00010', '00010'],
		'5': ['11111', '10000', '10000', '11110', '00001', '10001', '01110'],
		'6': ['01110', '10000', '10000', '11110', '10001', '10001', '01110'],
		'7': ['11111', '00001', '00010', '00100', '01000', '01000', '01000'],
		'8': ['01110', '10001', '10001', '01110', '10001', '10001', '01110'],
		'9': ['01110', '10001', '10001', '01111', '00001', '00001', '01110'],
		'A': ['01110', '10001', '10001', '11111', '10001', '10001', '10001'],
		'B': ['11110', '10001', '10001', '11110', '10001', '10001', '11110'],
		'C': ['01111', '10000', '10000', '10000', '10000', '10000', '01111'],
		'D': ['11110', '10001', '10001', '10001', '10001', '10001', '11110'],
		'E': ['11111', '10000', '10000', '11110', '10000', '10000', '11111'],
		'F': ['11111', '10000', '10000', '11110', '10000', '10000', '10000'],
		'G': ['01110', '10001', '10000', '10111', '10001', '10001', '01111'],
		'H': ['10001', '10001', '10001', '11111', '10001', '10001', '10001'],
		'I': ['01110', '00100', '00100', '00100', '00100', '00100', '01110'],
		'J': ['00111', '00010', '00010', '00010', '10010', '10010', '01100'],
		'K': ['10001', '10010', '10100', '11000', '10100', '10010', '10001'],
		'L': ['10000', '10000', '10000', '10000', '10000', '10000', '11111'],
		'M': ['10001', '11011', '10101', '10101', '10001', '10001', '10001'],
		'N': ['10001', '11001', '10101', '10011', '10001', '10001', '10001'],
		'O': ['01110', '10001', '10001', '10001', '10001', '10001', '01110'],
		'P': ['11110', '10001', '10001', '11110', '10000', '10000', '10000'],
		'Q': ['01110', '10001', '10001', '10001', '10101', '10010', '01101'],
		'R': ['11110', '10001', '10001', '11110', '10100', '10010', '10001'],
		'S': ['01111', '10000', '10000', '01110', '00001', '00001', '11110'],
		'T': ['11111', '00100', '00100', '00100', '00100', '00100', '00100'],
		'U': ['10001', '10001', '10001', '10001', '10001', '10001', '01110'],
		'V': ['10001', '10001', '10001', '10001', '10001', '01010', '00100'],
		'W': ['10001', '10001', '10001', '10101', '10101', '10101', '01010'],
		'X': ['10001', '10001', '01010', '00100', '01010', '10001', '10001'],
		'Y': ['10001', '10001', '01010', '00100', '00100', '00100', '00100'],
		'Z': ['11111', '00001', '00010', '00100', '01000', '10000', '11111'],
		'a': ['00000', '00000', '01110', '00001', '01111', '10001', '01111'],
		'b': ['10000', '10000', '11110', '10001', '10001', '10001', '11110'],
		'c': ['00000', '00000', '01111', '10000', '10000', '10000', '01111'],
		'd': ['00001', '00001', '01111', '10001', '10001', '10001', '01111'],
		'e': ['00000', '00000', '01110', '10001', '11111', '10000', '01111'],
		'f': ['00110', '01001', '01000', '11100', '01000', '01000', '01000'],
		'g': ['00000', '01111', '10001', '10001', '01111', '00001', '01110'],
		'h': ['10000', '10000', '10110', '11001', '10001', '10001', '10001'],
		'i': ['00100', '00000', '01100', '00100', '00100', '00100', '01110'],
		'j': ['00010', '00000', '00110', '00010', '00010', '10010', '01100'],
		'k': ['10000', '10000', '10010', '10100', '11000', '10100', '10010'],
		'l': ['01100', '00100', '00100', '00100', '00100', '00100', '01110'],
		'm': ['00000', '00000', '11010', '10101', '10101', '10001', '10001'],
		'n': ['00000', '00000', '10110', '11001', '10001', '10001', '10001'],
		'o': ['00000', '00000', '01110', '10001', '10001', '10001', '01110'],
		'p': ['00000', '00000', '11110', '10001', '11110', '10000', '10000'],
		'q': ['00000', '00000', '01111', '10001', '01111', '00001', '00001'],
		'r': ['00000', '00000', '10110', '11001', '10000', '10000', '10000'],
		's': ['00000', '00000', '01111', '10000', '01110', '00001', '11110'],
		't': ['01000', '01000', '11100', '01000', '01000', '01001', '00110'],
		'u': ['00000', '00000', '10001', '10001', '10001', '10011', '01101'],
		'v': ['00000', '00000', '10001', '10001', '10001', '01010', '00100'],
		'w': ['00000', '00000', '10001', '10001', '10101', '10101', '01010'],
		'x': ['00000', '00000', '10001', '01010', '00100', '01010', '10001'],
		'y': ['00000', '00000', '10001', '10001', '01111', '00001', '01110'],
		'z': ['00000', '00000', '11111', '00010', '00100', '01000', '11111']
	}
}
function blank_glyph() {
	return ['00000', '00000', '00000', '00000', '00000', '00000', '00000']
}
function valid_glyph(rows) {
	var i = 0
	if (!rows || rows.length !== 7) return false
	for (i = 0; i < 7; i++) {
		if (typeof rows[i] !== 'string' || rows[i].length !== 5) return false
		if (rows[i].replace(/[01]/g, '').length) return false
	}
	return true
}
function same_glyph(left, right) {
	var i = 0
	if (!right) return false
	for (i = 0; i < 7; i++) {
		if (left[i] !== right[i]) return false
	}
	return true
}
function binary(code) {
	var bits = code.toString(2)
	while (bits.length < 7) bits = '0' + bits
	return bits
}
function load_saved() {
	var raw = ''
	var saved = {}
	var code = 0
	var ch = ''
	glyphs = {}
	try {
		raw = localStorage.getItem('font-editor') || ''
		if (raw) saved = JSON.parse(raw)
	} catch (ignore) {
		saved = {}
	}
	for (code = 32; code <= 126; code++) {
		ch = String.fromCharCode(code)
		if (valid_glyph(saved[ch])) glyphs[ch] = saved[ch].slice()
		else if (originals[ch]) glyphs[ch] = originals[ch].slice()
		else glyphs[ch] = blank_glyph()
	}
}
function save_glyphs() {
	var changed = {}
	var ch = ''
	var base = null
	for (ch in glyphs) {
		base = originals[ch] || blank_glyph()
		if (!same_glyph(glyphs[ch], base)) changed[ch] = glyphs[ch]
	}
	localStorage.setItem('font-editor', JSON.stringify(changed))
}
function show_code() {
	var code = selected.charCodeAt(0)
	var label = selected === ' ' ? 'space' : selected
	$('#glyph-code').text(label + '   ' + code + '   ' + binary(code))
}
function mark_strip() {
	$('#char-strip .btn-char').removeClass('active')
	$('#char-strip .btn-char').each(mark_one)
	function mark_one() {
		if ($(this).attr('data-char') === selected) $(this).addClass('active')
	}
}
function draw_grid() {
	var grid = $('#glyph-grid')
	var r = 0
	var c = 0
	var cell = null
	grid.empty()
	for (r = 0; r < 7; r++) {
		for (c = 0; c < 5; c++) {
			cell = $('<button type="button" class="btn-cell"></button>')
			cell.attr('data-row', r)
			cell.attr('data-col', c)
			cell.attr('aria-label', 'Row ' + (r + 1) + ' column ' + (c + 1))
			if (glyphs[selected][r].charAt(c) === '1') cell.addClass('on')
			cell.on('click', toggle_cell)
			grid.append(cell)
		}
	}
	show_code()
	mark_strip()
}
function draw_strip() {
	var strip = $('#char-strip')
	var code = 32
	var btn = null
	var ch = ''
	strip.empty()
	for (code = 32; code <= 126; code++) {
		ch = String.fromCharCode(code)
		btn = $('<button type="button" class="btn-char"></button>')
		btn.attr('data-char', ch)
		btn.text(ch)
		btn.on('click', select_char)
		strip.append(btn)
	}
}
function paint_glyph(el, rows) {
	var r = 0
	var c = 0
	var dot = null
	for (r = 0; r < 7; r++) {
		for (c = 0; c < 5; c++) {
			dot = $('<span class="sample-dot"></span>')
			if (rows[r].charAt(c) === '1') dot.addClass('on')
			el.append(dot)
		}
	}
}
function make_glyph(ch) {
	var el = $('<div class="sample-glyph"></div>')
	var rows = glyphs[ch]
	el.attr('data-char', ch)
	if (!rows) {
		el.addClass('missing')
		rows = blank_glyph()
	}
	paint_glyph(el, rows)
	el.on('click', select_preview)
	return el
}
function draw_word(word, text) {
	var i = 0
	for (i = 0; i < text.length; i++) {
		if (text.charAt(i) === '\r') continue
		word.append(make_glyph(text.charAt(i)))
	}
}
function draw_preview() {
	var text = $('#sample-text').val().replace(/\r/g, '')
	var preview = $('#sample-preview')
	var lines = text.split('\n')
	var words = []
	var line = 0
	var i = 0
	var word = null
	preview.empty()
	for (line = 0; line < lines.length; line++) {
		if (line) preview.append('<div class="sample-break"></div>')
		words = lines[line].split(' ')
		for (i = 0; i < words.length; i++) {
			word = $('<span class="sample-word"></span>')
			draw_word(word, words[i])
			preview.append(word)
		}
	}
}
function toggle_cell() {
	var row = +$(this).attr('data-row')
	var col = +$(this).attr('data-col')
	var chars = glyphs[selected][row].split('')
	chars[col] = chars[col] === '1' ? '0' : '1'
	glyphs[selected][row] = chars.join('')
	$(this).toggleClass('on', chars[col] === '1')
	save_glyphs()
	draw_preview()
	return chars[col]
}
function select_char() {
	selected = $(this).attr('data-char')
	draw_grid()
	return selected
}
function select_preview() {
	var ch = $(this).attr('data-char')
	if (!glyphs[ch]) return ch
	selected = ch
	draw_grid()
	return selected
}
function clear_glyph() {
	glyphs[selected] = blank_glyph()
	save_glyphs()
	draw_grid()
	draw_preview()
	return selected
}
function reset_glyph() {
	if (originals[selected]) glyphs[selected] = originals[selected].slice()
	else glyphs[selected] = blank_glyph()
	save_glyphs()
	draw_grid()
	draw_preview()
	return selected
}
function preview_size() {
	var size = $(this).val()
	$('#sample-preview').css('--dot', size + 'px')
	return size
}
function key_select(response) {
	var ch = response.key
	if ($(response.target).is('textarea, input, select')) return
	if (!glyphs[ch]) return
	selected = ch
	draw_grid()
	return selected
}
function init_font() {
	if (!$('#glyph-grid').length) return
	load_saved()
	draw_strip()
	draw_grid()
	draw_preview()
	$('#glyph-clear').on('click', clear_glyph)
	$('#glyph-reset').on('click', reset_glyph)
	$('#sample-text').on('input', draw_preview)
	$('#pixel-size').on('change', preview_size)
	$(document).on('keydown', key_select)
}
init_font()
