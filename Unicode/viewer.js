var NAMES_URL = 'https://cdn.jsdelivr.net/gh/unicode-org/unicodetools@main/unicodetools/data/ucd/dev/UnicodeData.txt'
var BLOCKS_URL = 'https://cdn.jsdelivr.net/gh/unicode-org/unicodetools@main/unicodetools/data/ucd/dev/Blocks.txt'
var BASES_URL = 'https://cdn.jsdelivr.net/gh/unicode-org/unicodetools@main/unicodetools/data/ucd/dev/emoji/emoji-data.txt'
var TONES = [0, 0x1F3FB, 0x1F3FC, 0x1F3FD, 0x1F3FE, 0x1F3FF]

var GRID_MAX = 1024
var WINDOW = 128
var TEXT = [
	'fg-primary',
	'fg-accent',
	'fg-secondary',
	'fg-success',
	'fg-info',
	'fg-warning',
	'fg-danger',
	'fg-inverse',
	'fg-black',
	'fg-white',
	'fg-body',
	'fg-1',
	'fg-2',
	'fg-3',
	'fg-4',
	'fg-bg',
	'fg-reset',
	'fg-emphasis-primary',
	'fg-emphasis-accent',
	'fg-emphasis-secondary',
	'fg-emphasis-success',
	'fg-emphasis-info',
	'fg-emphasis-warning',
	'fg-emphasis-danger',
	'fg-emphasis-inverse'
]

var CATEGORY = {
	Lu: 'Letter, uppercase',
	Ll: 'Letter, lowercase',
	Lt: 'Letter, titlecase',
	Lm: 'Letter, modifier',
	Lo: 'Letter, other',
	Mn: 'Mark, nonspacing',
	Mc: 'Mark, spacing combining',
	Me: 'Mark, enclosing',
	Nd: 'Number, decimal digit',
	Nl: 'Number, letter',
	No: 'Number, other',
	Pc: 'Punctuation, connector',
	Pd: 'Punctuation, dash',
	Ps: 'Punctuation, open',
	Pe: 'Punctuation, close',
	Pi: 'Punctuation, initial quote',
	Pf: 'Punctuation, final quote',
	Po: 'Punctuation, other',
	Sm: 'Symbol, math',
	Sc: 'Symbol, currency',
	Sk: 'Symbol, modifier',
	So: 'Symbol, other',
	Zs: 'Separator, space',
	Zl: 'Separator, line',
	Zp: 'Separator, paragraph',
	Cc: 'Other, control',
	Cf: 'Other, format',
	Cs: 'Other, surrogate',
	Co: 'Other, private use',
	Cn: 'Other, not assigned'
}

var C0 = ['NUL','SOH','STX','ETX','EOT','ENQ','ACK','BEL','BS','HT','LF','VT','FF','CR','SO','SI','DLE','DC1','DC2','DC3','DC4','NAK','SYN','ETB','CAN','EM','SUB','ESC','FS','GS','RS','US']

var HANGUL_L = ['G','GG','N','D','DD','R','M','B','BB','S','SS','','J','JJ','C','K','T','P','H']
var HANGUL_V = ['A','AE','YA','YAE','EO','E','YEO','YE','O','WA','WAE','OE','YO','U','WEO','WE','WI','YU','EU','YI','I']
var HANGUL_T = ['','G','GG','GS','N','NJ','NH','D','L','LG','LM','LB','LS','LT','LP','LH','M','B','BS','S','SS','NG','J','C','K','T','P','H']

app.names = {}
app.nameCategories = {}
app.ranges = []
app.blocks = []
app.namesReady = false
app.blocksReady = false
app.namesFailed = false
app.blocksFailed = false
app.points = []
app.selected = 0
app.tone = 0
app.bases = {}
app.gridStart = -1
app.gridEnd = -1
app.degrees = 0
app.glyphShift = {x: 0, y: 0}
app.rotating = false
app.search = ''
app.matchGrid = false

pgm.hex = function(number, width) {
	var text = number.toString(16).toUpperCase()
	while (text.length < width) {
		text = '0' + text
	}
	return text
}

pgm.is_surrogate = function(point) {
	return point >= 0xD800 && point <= 0xDFFF
}

pgm.control_label = function(point) {
	if (point >= 0 && point < 32) return C0[point]
	if (point === 0x7F) return 'DEL'
	if (point >= 0x80 && point <= 0x9F) return pgm.hex(point, 2)
	if (pgm.is_surrogate(point)) return 'SUR'
	return ''
}

pgm.safe_glyph = function(point) {
	if (point < 0 || point > 0x10FFFF) return ''
	if (pgm.is_surrogate(point)) return ''
	return String.fromCodePoint(point)
}

pgm.hangul_name = function(point) {
	var index
	var choseong
	var jungseong
	var jongseong
	if (point < 0xAC00 || point > 0xD7A3) return ''
	index = point - 0xAC00
	jongseong = index % 28
	jungseong = Math.floor(index / 28) % 21
	choseong = Math.floor(index / 588)
	return 'HANGUL SYLLABLE ' + HANGUL_L[choseong] + HANGUL_V[jungseong] + HANGUL_T[jongseong]
}

pgm.range_for = function(point) {
	var i
	var range
	for (i = 0; i < app.ranges.length; i = i + 1) {
		range = app.ranges[i]
		if (point >= range.start && point <= range.end) return range
	}
	return null
}

pgm.range_name = function(label, point) {
	var prefix = label.toUpperCase()
	if (label.indexOf('CJK Ideograph') === 0) prefix = 'CJK UNIFIED IDEOGRAPH'
	if (label.indexOf('Private Use') === 0) prefix = 'PRIVATE USE'
	if (label.indexOf('Tangut Ideograph') === 0) prefix = 'TANGUT IDEOGRAPH'
	return prefix + '-' + pgm.hex(point, 4)
}

pgm.character_name = function(point) {
	var hangul = pgm.hangul_name(point)
	var range
	if (pgm.is_surrogate(point)) return 'SURROGATE'
	if (hangul) return hangul
	if (app.names[point]) return app.names[point]
	range = pgm.range_for(point)
	if (range) return pgm.range_name(range.label, point)
	if (!app.namesReady) return 'Loading name…'
	if (app.namesFailed) return 'Name unavailable'
	return 'not assigned'
}

pgm.category_of = function(point) {
	var code
	var range
	if (pgm.hangul_name(point)) return 'Lo'
	if (app.nameCategories[point]) return app.nameCategories[point]
	range = pgm.range_for(point)
	if (range) return range.category
	if (pgm.is_surrogate(point)) return 'Cs'
	if (!app.namesReady) return ''
	return 'Cn'
}

pgm.category_label = function(point) {
	var code = pgm.category_of(point)
	if (!code) return 'Loading category…'
	if (CATEGORY[code]) return code + ' ' + CATEGORY[code]
	return code
}

pgm.find_block = function(point) {
	var i
	var block
	for (i = 0; i < app.blocks.length; i = i + 1) {
		block = app.blocks[i]
		if (point >= block.start && point <= block.end) return block
	}
	return null
}

pgm.block_label = function(point) {
	var block
	if (!app.blocksReady) {
		if (app.blocksFailed) return 'Block unavailable'
		return 'Loading block…'
	}
	block = pgm.find_block(point)
	if (block) return block.name
	return 'No block'
}

pgm.plane_name = function(point) {
	var plane = point >> 16
	if (plane === 0) return ''
	if (plane === 1) return '1 Supplementary Multilingual Plane'
	if (plane === 2) return '2 Supplementary Ideographic Plane'
	if (plane === 3) return '3 Tertiary Ideographic Plane'
	if (plane === 14) return '14 Supplementary Special-purpose Plane'
	if (plane === 15 || plane === 16) return plane + ' Private Use Plane'
	return plane + ' Unassigned'
}

pgm.utf8 = function(point) {
	var bytes = []
	if (pgm.is_surrogate(point) || point < 0 || point > 0x10FFFF) return ''
	if (point <= 0x7F) {
		bytes.push(point)
	} else if (point <= 0x7FF) {
		bytes.push(0xC0 | (point >> 6))
		bytes.push(0x80 | (point & 0x3F))
	} else if (point <= 0xFFFF) {
		bytes.push(0xE0 | (point >> 12))
		bytes.push(0x80 | ((point >> 6) & 0x3F))
		bytes.push(0x80 | (point & 0x3F))
	} else {
		bytes.push(0xF0 | (point >> 18))
		bytes.push(0x80 | ((point >> 12) & 0x3F))
		bytes.push(0x80 | ((point >> 6) & 0x3F))
		bytes.push(0x80 | (point & 0x3F))
	}
	return pgm.hex_list(bytes, 2)
}

pgm.utf16 = function(point) {
	var units
	var high
	if (pgm.is_surrogate(point) || point < 0 || point > 0x10FFFF) return ''
	if (point <= 0xFFFF) return pgm.hex(point, 4)
	high = point - 0x10000
	units = [0xD800 + (high >> 10), 0xDC00 + (high & 0x3FF)]
	return pgm.hex_list(units, 4)
}

pgm.hex_list = function(values, width) {
	var text = ''
	var i
	for (i = 0; i < values.length; i = i + 1) {
		if (i) text = text + ' '
		text = text + pgm.hex(values[i], width)
	}
	return text
}

pgm.display_glyph = function(point) {
	var glyph = pgm.safe_glyph(point)
	var category = pgm.category_of(point)
	if (!glyph) return ''
	if (category === 'Mn' || category === 'Me' || (point >= 0x0300 && point <= 0x036F)) {
		return String.fromCodePoint(0x25CC) + glyph
	}
	return glyph
}

pgm.cell_text = function(point) {
	var label = pgm.control_label(point)
	if (label) return label
	return pgm.display_glyph(point)
}

pgm.window_for = function(point) {
	var found = pgm.find_block(point)
	var start
	var end
	if (!found) {
		start = point - (point % WINDOW)
		return {name: '', start: start, end: start + WINDOW - 1}
	}
	if (found.end - found.start + 1 <= GRID_MAX) return found
	start = point - (point % WINDOW)
	if (start < found.start) start = found.start
	end = start + WINDOW - 1
	if (end > found.end) end = found.end
	return {name: found.name, start: start, end: end}
}

pgm.add_row = function(table, label, value) {
	var row = $('<tr></tr>')
	$('<th scope="row"></th>').text(label).appendTo(row)
	$('<td></td>').text(value).appendTo(row)
	table.append(row)
	return value
}

pgm.add_span = function(table, value) {
	var row = $('<tr></tr>')
	$('<td colspan="2"></td>').text(value).appendTo(row)
	table.append(row)
	return value
}

pgm.render_detail = function() {
	var detail = $('#detail')
	var point = app.points[app.selected]
	var wrap = $('<div class="table-responsive"></div>')
	var table = $('<table class="table table-bordered table-sm mb-0"></table>')
	detail.empty()
	if (point == null) return ''
	pgm.add_span(table, pgm.character_name(point))
	pgm.add_row(table, 'Code point', 'U+' + pgm.hex(point, 4))
	pgm.add_row(table, 'Category', pgm.category_label(point))
	pgm.add_row(table, 'Block', pgm.block_label(point))
	if (pgm.plane_name(point)) pgm.add_row(table, 'Plane', pgm.plane_name(point))
	pgm.add_row(table, 'UTF-8', pgm.utf8(point))
	pgm.add_row(table, 'UTF-16', pgm.utf16(point))
	pgm.add_row(table, 'HTML Decimal', '&#' + point + ';')
	pgm.add_row(table, 'HTML hexadecimal', '&#x' + pgm.hex(point, 4) + ';')
	if (app.tone && pgm.supports_tone(point)) {
		pgm.add_row(table, 'Skin tone', pgm.character_name(app.tone) + ' (U+' + pgm.hex(app.tone, 4) + ')')
	}
	wrap.append(table)
	detail.append(wrap)
	return point
}

pgm.render_rendered = function() {
	var rendered = $('#rendered')
	var point = app.points[app.selected]
	var label
	if (point == null) {
		rendered.attr('hidden', true).removeClass('is-control').text('')
		return ''
	}
	rendered.removeAttr('hidden').removeClass('is-control')
	label = pgm.control_label(point)
	if (label) {
		rendered.addClass('is-control').text(label)
		pgm.center_glyph()
		pgm.apply_rotation()
		return label
	}
	rendered.text(pgm.glyph_with_tone(point))
	pgm.center_glyph()
	pgm.apply_rotation()
	return rendered.text()
}

pgm.supports_tone = function(point) {
	return app.bases[point] === true
}

pgm.glyph_with_tone = function(point) {
	var glyph = pgm.safe_glyph(point)
	if (!app.tone || !pgm.supports_tone(point)) return pgm.display_glyph(point)
	return glyph + String.fromCodePoint(app.tone)
}

pgm.render_tones = function() {
	var holder = $('#tones')
	var point = app.points[app.selected]
	var i
	var tone
	var button
	pgm.clear_tips(holder)
	holder.empty()
	if (point == null || !pgm.supports_tone(point)) {
		holder.attr('hidden', true)
		return 0
	}
	holder.removeAttr('hidden')
	for (i = 0; i < TONES.length; i = i + 1) {
		tone = TONES[i]
		button = $('<button type="button" class="btn btn-outline theme-secondary"></button>')
		button.attr('data-tone', tone)
		button.attr('title', pgm.character_name(tone || point))
		button.text(tone ? pgm.safe_glyph(point) + String.fromCodePoint(tone) : pgm.safe_glyph(point))
		if (tone === app.tone) button.removeClass('btn-outline theme-secondary').addClass('active btn-solid theme-primary')
		holder.append(button)
		pgm.hover_tip(button[0])
	}
	return TONES.length
}

pgm.click_tone = function(response) {
	app.tone = +$(this).attr('data-tone')
	pgm.render_rendered()
	pgm.render_detail()
	pgm.render_tones()
	return pgm.save_unicode()
}

pgm.mark_grid = function() {
	var point = app.points[app.selected]
	$('#grid button').removeClass('active btn-solid theme-primary').addClass('btn-outline theme-secondary')
	$('#grid button').filter(is_point).removeClass('btn-outline theme-secondary').addClass('active btn-solid theme-primary')
	return point
	function is_point() {
		return +$(this).attr('data-point') === point
	}
}

pgm.mark_blocks = function(point) {
	$('#blocks button').removeClass('active').attr('aria-pressed', 'false')
	$('#blocks button').filter(contains_point).addClass('active').attr('aria-pressed', 'true')
	return point
	function contains_point() {
		return point >= +$(this).attr('data-start') && point <= +$(this).attr('data-end')
	}
}

pgm.render_grid = function(block) {
	var grid = $('#grid')
	var point
	var button
	if (!block) return 0
	if (app.gridStart === block.start && app.gridEnd === block.end && grid.children().length) {
	pgm.mark_grid()
	pgm.mark_blocks(block.start)
	if (app.matchGrid) pgm.mark_grid_matches()
	return block.start
}
	pgm.clear_tips(grid)
	grid.empty()
	app.gridStart = block.start
	app.gridEnd = block.end
	for (point = block.start; point <= block.end; point = point + 1) {
		if (pgm.is_surrogate(point)) continue
		button = $('<button type="button" class="btn btn-outline theme-secondary"></button>')
		button.attr('data-point', point)
		button.attr('title', pgm.character_name(point))
		button.text(pgm.cell_text(point))
		if (pgm.control_label(point)) button.addClass('is-control')
		grid.append(button)
		pgm.hover_tip(button[0])
	}
	pgm.mark_grid()
	pgm.mark_blocks(block.start)
	if (app.matchGrid) pgm.mark_grid_matches()
	return block.end - block.start + 1
}

pgm.render_all = function() {
	var point = app.points[app.selected]
	pgm.render_rendered()
	pgm.render_tones()
	pgm.render_detail()
	if (point == null) return 0
	pgm.render_grid(pgm.window_for(point))
	return point
}

pgm.show_point = function(point) {
	app.points = [point]
	app.selected = 0
	app.tone = 0
	app.degrees = 0
	pgm.render_all()
	return point
}

pgm.click_cell = function(response) {
	pgm.show_point(+$(this).attr('data-point'))
	return pgm.save_unicode()
}

pgm.hover_tip = function(element) {
	if (typeof bootstrap === 'undefined' || !bootstrap.Tooltip) return element
	new bootstrap.Tooltip(element, {trigger: 'hover'})
	return element
}

pgm.clear_tips = function(holder) {
	if (typeof bootstrap === 'undefined' || !bootstrap.Tooltip) return holder
	holder.find('[title], [data-bs-original-title]').each(dispose_tip)
	return holder
	function dispose_tip() {
		var tip = bootstrap.Tooltip.getInstance(this)
		if (tip) tip.dispose()
	}
}

pgm.modifier_string = function() {
	var point = app.points[app.selected]
	if (point == null || !app.tone || !pgm.supports_tone(point)) return ''
	return 'U+' + pgm.hex(app.tone, 4)
}

pgm.save_unicode = function() {
	var point = app.points[app.selected]
	var url = 'Q/merge_unicode.cfm'
	var form = {}
	if (point == null) return 0
	form.body = new FormData()
	form.body.set('id', app.id)
	form.body.set('actid', app.actid)
	form.body.set('qsort', point)
	form.body.set('pollname', pgm.modifier_string())
	fetch(url, form).then(text_done).then(pgm.show_earned).catch(caught(url))
	return point
}

pgm.show_earned = function(response) {
	var pct = +response
	var bar = $('.progress-bar')
	if (isNaN(pct)) return 0
	bar.css('width', Math.min(100, pct) + '%')
		.attr('aria-valuenow', pct)
		.text(pct + '%')
	if (pct >= 100) bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	return pct
}

pgm.build_colors = function() {
	var holder = $('#colors')
	var i
	var button
	holder.empty()
	for (i = 0; i < TEXT.length; i = i + 1) {
		button = $('<button type="button"></button>')
		button.addClass(TEXT[i])
		button.attr('data-text', TEXT[i])
		$('<span></span>').text('.' + TEXT[i]).appendTo(button)
		holder.append(button)
	}
	return TEXT.length
}

pgm.click_color = function(response) {
	var button = $(this)
	var name = button.attr('data-text')
	var rendered = $('#rendered')
	var i
	$('#colors button').removeClass('active')
	button.addClass('active')
	for (i = 0; i < TEXT.length; i = i + 1) rendered.removeClass(TEXT[i])
	rendered.addClass(name)
	return name
}

pgm.click_block = function(response) {
	app.matchGrid = $(this).hasClass('is-match')
	pgm.show_point(+$(this).attr('data-start'))
	if (!app.matchGrid) $('#grid button').removeClass('is-match')
	return app.matchGrid
}

pgm.mark_block_matches = function() {
	var query = app.search.toLowerCase()
	var starts = {}
	var point
	var name
	var block
	var cached
	var i
	var range
	$('#blocks button').removeClass('is-match')
	if (!query) return 0
	$('#blocks button').each(mark_block)
	cached = null
	for (point in app.names) {
		if (!Object.prototype.hasOwnProperty.call(app.names, point)) continue
		point = +point
		name = app.names[point].toLowerCase()
		if (name.indexOf(query) === -1 && pgm.category_label(point).toLowerCase().indexOf(query) === -1) continue
		if (!cached || point < cached.start || point > cached.end) cached = pgm.find_block(point)
		if (cached) starts[cached.start] = true
	}
	for (i = 0; i < app.ranges.length; i = i + 1) {
		range = app.ranges[i]
		name = pgm.range_name(range.label, range.start).toLowerCase()
		if (name.indexOf(query) === -1 && pgm.category_label(range.start).toLowerCase().indexOf(query) === -1) continue
		block = pgm.find_block(range.start)
		if (block) starts[block.start] = true
	}
	if (pgm.category_label(0xAC00).toLowerCase().indexOf(query) !== -1) {
		block = pgm.find_block(0xAC00)
		if (block) starts[block.start] = true
	}
	$('#blocks button').each(mark_start)
	return $('#blocks button.is-match').length
	function mark_block() {
		var button = $(this)
		if (button.text().toLowerCase().indexOf(query) !== -1) button.addClass('is-match')
	}
	function mark_start() {
		var button = $(this)
		if (starts[+button.attr('data-start')]) button.addClass('is-match')
	}
}

pgm.mark_grid_matches = function() {
	var query = app.search.toLowerCase()
	$('#grid button').removeClass('is-match')
	if (!app.matchGrid || !query) return 0
	$('#grid button').each(mark_cell)
	return $('#grid button.is-match').length
	function mark_cell() {
		var button = $(this)
		var point = +button.attr('data-point')
		var text = button.text().toLowerCase()
		var name = pgm.character_name(point).toLowerCase()
		var category = pgm.category_label(point).toLowerCase()
		if (text.indexOf(query) !== -1 || name.indexOf(query) !== -1 || category.indexOf(query) !== -1) button.addClass('is-match')
	}
}

pgm.search_blocks = function(response) {
	app.search = $(this).val().replace(/^\s+|\s+$/g, '')
	app.matchGrid = false
	$('#grid button').removeClass('is-match')
	return pgm.mark_block_matches()
}

pgm.build_blocks = function() {
	var i
	var block
	var button
	var holder = $('#blocks')
	holder.empty()
	for (i = 0; i < app.blocks.length; i = i + 1) {
		if (app.blocks[i].name === 'Miscellaneous Symbols and Pictographs') {
			block = app.blocks.splice(i, 1)[0]
			app.blocks.splice(1, 0, block)
			break
		}
	}
	for (i = 0; i < app.blocks.length; i = i + 1) {
		block = app.blocks[i]
		if (block.start >= 0xD800 && block.end <= 0xDFFF) continue
		button = $('<button type="button" class="btn btn-outline theme-primary"></button>')
		button.attr('data-start', block.start)
		button.attr('data-end', block.end)
		button.attr('aria-pressed', 'false')
		button.attr('title', 'U+' + pgm.hex(block.start, 4) + '–U+' + pgm.hex(block.end, 4))
		button.text(block.name)
		holder.append(button)
	}
	if (app.gridStart >= 0) pgm.mark_blocks(app.gridStart)
	if (app.search) pgm.mark_block_matches()
	return holder.children().length
}

pgm.parse_names = function(text) {
	var lines = text.split('\n')
	var i
	var fields
	var point
	var name
	var pending = null
	for (i = 0; i < lines.length; i = i + 1) {
		fields = lines[i].replace(/\r$/, '').split(';')
		if (fields.length < 3) continue
		point = parseInt(fields[0], 16)
		if (isNaN(point)) continue
		name = fields[1]
		if (name.indexOf(', First>') !== -1) {
			pending = {
				start: point,
				label: name.replace(/^</, '').replace(/, First>$/, ''),
				category: fields[2]
			}
			continue
		}
		if (name.indexOf(', Last>') !== -1 && pending) {
			app.ranges.push({
				start: pending.start,
				end: point,
				label: pending.label,
				category: pending.category
			})
			pending = null
			continue
		}
		if (name === '<control>') name = fields[10] || 'CONTROL'
		app.names[point] = name
		app.nameCategories[point] = fields[2]
	}
	app.namesReady = true
	pgm.render_rendered()
	pgm.render_tones()
	pgm.render_detail()
	pgm.refresh_grid()
	if (app.search) pgm.mark_block_matches()
	return lines.length
}

pgm.refresh_grid = function() {
	var start = app.gridStart
	var end = app.gridEnd
	app.gridStart = -1
	app.gridEnd = -1
	if (start < 0) return 0
	return pgm.render_grid({name: '', start: start, end: end})
}

pgm.parse_blocks = function(text) {
	var lines = text.split('\n')
	var i
	var line
	var parts
	var range
	for (i = 0; i < lines.length; i = i + 1) {
		line = lines[i].replace(/^\s+|\s+$/g, '')
		if (!line || line.charAt(0) === '#') continue
		parts = line.split(';')
		if (parts.length < 2) continue
		range = parts[0].split('..')
		if (range.length < 2) continue
		app.blocks.push({
			start: parseInt(range[0], 16),
			end: parseInt(range[1], 16),
			name: parts[1].replace(/^\s+|\s+$/g, '')
		})
	}
	app.blocksReady = true
	pgm.build_blocks()
	pgm.render_detail()
	return app.blocks.length
}

pgm.names_failed = function(error) {
	app.namesReady = true
	app.namesFailed = true
	pgm.render_detail()
	return error
}

pgm.parse_bases = function(text) {
	var lines = text.split('\n')
	var i
	var line
	var parts
	var range
	var start
	var end
	var point
	for (i = 0; i < lines.length; i = i + 1) {
		line = lines[i]
		if (!line || line.charAt(0) === '#') continue
		if (line.indexOf('Emoji_Modifier_Base') === -1) continue
		parts = line.split(';')
		range = parts[0].replace(/^\s+|\s+$/g, '').split('..')
		start = parseInt(range[0], 16)
		end = range.length > 1 ? parseInt(range[1], 16) : start
		for (point = start; point <= end; point = point + 1) {
			app.bases[point] = true
		}
	}
	pgm.render_tones()
	return i
}

pgm.bases_failed = function(error) {
	pgm.render_tones()
	return error
}

pgm.blocks_failed = function(error) {
	app.blocksReady = true
	app.blocksFailed = true
	pgm.render_detail()
	return error
}

pgm.load_text = function(url, done, failed) {
	fetch(url, {method: 'get'}).then(text_done).then(done).catch(failed)
	return url
}

pgm.rotate_degrees = function(response) {
	var rect = $('#rotate')[0].getBoundingClientRect()
	var centerX = rect.left + rect.width / 2
	var centerY = rect.top + rect.height / 2
	var dx = response.clientX - centerX
	var dy = response.clientY - centerY
	var degrees = Math.round(Math.atan2(dx, -dy) * 180 / Math.PI)
	if (degrees < 0) degrees = degrees + 360
	return pgm.snap_degrees(degrees)
}

pgm.snap_degrees = function(degrees) {
	var points = [0, 90, 180, 270]
	var i
	var point
	var distance
	for (i = 0; i < points.length; i = i + 1) {
		point = points[i]
		distance = Math.abs(degrees - point)
		if (distance > 180) distance = 360 - distance
		if (distance <= 5) return point
	}
	return degrees
}

pgm.center_glyph = function() {
	var element = document.getElementById('rendered')
	var text = element.textContent
	var style
	var probe
	var rect
	var baseY
	var pad
	var canvas
	var ctx
	var image
	var minX
	var minY
	var maxX
	var maxY
	var x
	var y
	var index
	var found
	var originX
	var originY
	app.glyphShift = {x: 0, y: 0}
	if (!text) return app.glyphShift
	element.style.transform = 'none'
	probe = document.createElement('span')
	probe.style.cssText = 'display:inline-block;width:0;height:0;vertical-align:baseline'
	element.appendChild(probe)
	rect = element.getBoundingClientRect()
	baseY = probe.getBoundingClientRect().top - rect.top
	probe.remove()
	style = getComputedStyle(element)
	pad = Math.ceil(parseFloat(style.fontSize) * 2)
	canvas = document.createElement('canvas')
	canvas.width = Math.ceil(rect.width) + pad * 2
	canvas.height = pad * 3
	ctx = canvas.getContext('2d')
	ctx.font = style.font
	ctx.textBaseline = 'alphabetic'
	ctx.fillStyle = '#000'
	ctx.fillText(text, pad, pad)
	image = ctx.getImageData(0, 0, canvas.width, canvas.height).data
	minX = canvas.width
	minY = canvas.height
	maxX = 0
	maxY = 0
	found = false
	for (y = 0; y < canvas.height; y = y + 1) {
		for (x = 0; x < canvas.width; x = x + 1) {
			index = (y * canvas.width + x) * 4
			if (image[index + 3] <= 16) continue
			found = true
			if (x < minX) minX = x
			if (y < minY) minY = y
			if (x > maxX) maxX = x
			if (y > maxY) maxY = y
		}
	}
	if (!found) return app.glyphShift
	originX = parseFloat(style.borderLeftWidth) + parseFloat(style.paddingLeft) + ((minX + maxX) / 2 - pad)
	originY = baseY + ((minY + maxY) / 2 - pad)
	app.glyphShift = {
		x: rect.width / 2 - originX,
		y: rect.height / 2 - originY
	}
	return app.glyphShift
}

pgm.apply_rotation = function() {
	var dial = $('#rotate')
	var label = app.degrees + ' degrees'
	var tip
	var inner
	var shift = app.glyphShift
	$('#rendered').css('transform', 'rotate(' + app.degrees + 'deg) translate(' + shift.x + 'px, ' + shift.y + 'px)')
	dial.css('--degrees', app.degrees + 'deg')
	dial.attr('aria-valuenow', app.degrees)
	dial.attr('data-bs-original-title', label)
	tip = typeof bootstrap !== 'undefined' && bootstrap.Tooltip ? bootstrap.Tooltip.getInstance(dial[0]) : null
	if (tip && tip.tip) {
		inner = tip.tip.querySelector('.tooltip-inner')
		if (inner) inner.textContent = label
	}
	return app.degrees
}

pgm.clear_selection = function() {
	var selection = window.getSelection()
	if (selection && selection.removeAllRanges) selection.removeAllRanges()
	return ''
}

pgm.block_select = function(response) {
	response.preventDefault()
	return false
}

pgm.rotate_down = function(response) {
	var event = response.originalEvent || response
	app.rotating = true
	$('body').addClass('is-rotating')
	$('#rotate').addClass('is-dragging')
	$(document).on('selectstart', pgm.block_select)
	pgm.clear_selection()
	if (response.currentTarget.setPointerCapture && event.pointerId != null) {
		response.currentTarget.setPointerCapture(event.pointerId)
	}
	response.preventDefault()
	app.degrees = pgm.rotate_degrees(response)
	return pgm.apply_rotation()
}

pgm.rotate_move = function(response) {
	if (!app.rotating) return app.degrees
	response.preventDefault()
	pgm.clear_selection()
	app.degrees = pgm.rotate_degrees(response)
	return pgm.apply_rotation()
}

pgm.rotate_up = function(response) {
	app.rotating = false
	$('body').removeClass('is-rotating')
	$('#rotate').removeClass('is-dragging')
	$(document).off('selectstart', pgm.block_select)
	pgm.clear_selection()
	return app.degrees
}

pgm.rotate_key = function(response) {
	var step = 15
	if (response.key === 'ArrowRight' || response.key === 'ArrowDown') app.degrees = (app.degrees + step) % 360
	else if (response.key === 'ArrowLeft' || response.key === 'ArrowUp') app.degrees = (app.degrees - step + 360) % 360
	else return app.degrees
	response.preventDefault()
	return pgm.apply_rotation()
}

pgm.init = function() {
	$('#rotate').on('pointerdown', pgm.rotate_down)
	$('#rotate').on('pointermove', pgm.rotate_move)
	$('#rotate').on('pointerup pointercancel', pgm.rotate_up)
	$('#rotate').on('keydown', pgm.rotate_key)
	$('#block-search').on('input', pgm.search_blocks)
	$('#blocks').on('click', 'button', pgm.click_block)
	$('#grid').on('click', 'button', pgm.click_cell)
	$('#colors').on('click', 'button', pgm.click_color)
	pgm.build_colors()
	$('#tones').on('click', 'button', pgm.click_tone)
	pgm.load_text(NAMES_URL, pgm.parse_names, pgm.names_failed)
	pgm.load_text(BLOCKS_URL, pgm.parse_blocks, pgm.blocks_failed)
	pgm.load_text(BASES_URL, pgm.parse_bases, pgm.bases_failed)
	return pgm.show_point(0x41)
}

pgm.init()
