function size_editor() {
	var editor = $('.editor')
	var top = 0
	if (!editor.length) return 0
	top = editor.offset().top
	editor.css('height', Math.max(window.innerHeight - top, 240) + 'px')
	fit_letter()
	return editor.height()
}
function fit_letter() {
	var el = $('#letter')[0]
	var text = ''
	var family = ''
	var style = 'normal'
	var sample = 200
	var canvas = null
	var ctx = null
	var metrics = null
	var width = 0
	var height = 0
	var size = 0
	if (!el || !el.parentElement.clientHeight || !el.parentElement.clientWidth) return 0
	if ($(el).hasClass('letters')) return fit_glyphs()
	text = el.textContent || 'A'
	family = getComputedStyle(el).fontFamily
	style = getComputedStyle(el).fontStyle || 'normal'
	canvas = fit_letter.canvas || (fit_letter.canvas = document.createElement('canvas'))
	ctx = canvas.getContext('2d')
	ctx.font = style + ' ' + sample + 'px ' + family
	metrics = ctx.measureText(text)
	width = metrics.width
	height = (metrics.actualBoundingBoxAscent || 0) + (metrics.actualBoundingBoxDescent || 0)
	if (!width || !height) return 0
	size = sample * Math.min(el.parentElement.clientWidth / width, el.parentElement.clientHeight / height) * 0.9
	el.style.fontSize = size + 'px'
	el.style.lineHeight = '1'
	place_letter(el, family, size, text, style)
	return size
}
function line_baseline(family, size, text, style) {
	var probe = document.createElement('div')
	var mark = document.createElement('span')
	var box = null
	var base = 0
	probe.style.position = 'absolute'
	probe.style.left = '-9999px'
	probe.style.top = '0'
	probe.style.visibility = 'hidden'
	probe.style.whiteSpace = 'nowrap'
	probe.style.lineHeight = '1'
	probe.style.padding = '0'
	probe.style.margin = '0'
	probe.style.fontSize = size + 'px'
	probe.style.fontStyle = style || 'normal'
	probe.style.fontFamily = family
	probe.textContent = text
	mark.style.display = 'inline-block'
	mark.style.width = '0'
	mark.style.height = '0'
	mark.style.verticalAlign = 'baseline'
	probe.appendChild(mark)
	document.body.appendChild(probe)
	box = probe.getBoundingClientRect()
	base = mark.getBoundingClientRect().top - box.top
	document.body.removeChild(probe)
	return base
}
function place_letter(el, family, size, text, style) {
	var canvas = fit_letter.canvas
	var ctx = canvas.getContext('2d')
	var metrics = null
	var ascent = 0
	var descent = 0
	var ink = 0
	var base = 0
	var pad = 0
	ctx.font = (style || 'normal') + ' ' + size + 'px ' + family
	metrics = ctx.measureText(text)
	ascent = metrics.actualBoundingBoxAscent || 0
	descent = metrics.actualBoundingBoxDescent || 0
	ink = ascent + descent
	if (!ink) return 0
	base = line_baseline(family, size, text, style)
	pad = (el.parentElement.clientHeight - ink) / 2 - (base - ascent)
	el.style.marginTop = pad + 'px'
	return pad
}
function letter_resized() {
	return fit_letter()
}
function text_metrics(text, family, style, size) {
	var canvas = fit_letter.canvas || (fit_letter.canvas = document.createElement('canvas'))
	var ctx = canvas.getContext('2d')
	ctx.font = (style || 'normal') + ' ' + size + 'px ' + family
	return ctx.measureText(text)
}
function letter_chars(text) {
	var chars = []
	var ch = ''
	for (ch of text) chars.push(ch)
	return chars
}
function fitted_size(text, family, style) {
	var frame = $('#letter-frame')[0]
	var sample = 200
	var metrics = null
	var width = 0
	var height = 0
	if (!frame || !frame.clientWidth || !frame.clientHeight) return 0
	metrics = text_metrics(text, family, style, sample)
	width = metrics.width
	height = (metrics.actualBoundingBoxAscent || 0) + (metrics.actualBoundingBoxDescent || 0)
	if (!width || !height) return 0
	return sample * Math.min(frame.clientWidth / width, frame.clientHeight / height) * 0.9
}
function glyph_text() {
	var text = ''
	$('#letter .glyph').each(read_glyph)
	return text
	function read_glyph() {
		text += $(this).text()
	}
}
function append_glyph(ch) {
	var glyph = $('<span class="glyph"></span>')
	var row = $('#letter .letter-row')
	glyph.text(ch)
	if (row.length) row.append(glyph)
	else $('#letter').append(glyph)
	return glyph
}
function fit_row(el) {
	var frame = $('#letter-frame')[0]
	var row = el.find('.letter-row')[0]
	var sample = 200
	var width = 0
	var height = 0
	var size = 0
	var box = null
	if (!row || !frame || !frame.clientWidth || !frame.clientHeight) return 0
	el.css('font-size', sample + 'px')
	box = row.getBoundingClientRect()
	width = box.width
	height = box.height
	if (!width || !height) return 0
	size = sample * Math.min(frame.clientWidth / width, frame.clientHeight / height) * 0.9
	el.css('font-size', size + 'px')
	return size
}
function layout_glyphs(text, focus) {
	var el = $('#letter')
	var node = el[0]
	var chars = letter_chars(text.replace(/\n/g, ''))
	var row = null
	var size = 0
	var i = 0
	if (chars.length < 2) {
		if (el.hasClass('letters')) return join_letter()
		return fit_letter()
	}
	if (layout_glyphs.lock) return 0
	layout_glyphs.lock = true
	el.addClass('letters')
	el.attr('contenteditable', 'false')
	el.attr('tabindex', '0')
	el.removeAttr('data-moved')
	el.removeAttr('data-pinned')
	el.css('margin-top', 0)
	el.empty()
	row = $('<div class="letter-row"></div>')
	el.append(row)
	for (i = 0; i < chars.length; i++) append_glyph(chars[i])
	size = fit_row(el)
	if (!size) {
		el.removeClass('letters')
		el.attr('contenteditable', 'plaintext-only')
		el.removeAttr('tabindex')
		el.text(chars.join(''))
		layout_glyphs.lock = false
		return 0
	}
	fit_glyphs.width = el.innerWidth()
	fit_glyphs.height = el.innerHeight()
	if (focus) node.focus({preventScroll: true})
	layout_glyphs.lock = false
	return chars.length
}
function pin_glyphs() {
	var frame = $('#letter')
	var base = frame.offset()
	var spots = []
	var i = 0
	if (frame.attr('data-pinned')) return 0
	frame.find('.glyph').each(spot_glyph)
	frame.attr('data-pinned', '1')
	for (i = 0; i < spots.length; i++) {
		spots[i].glyph.appendTo(frame)
		spots[i].glyph.addClass('is-pinned').css({left: spots[i].left, top: spots[i].top})
	}
	frame.find('.letter-row').remove()
	return spots.length
	function spot_glyph() {
		var glyph = $(this)
		var off = glyph.offset()
		spots.push({glyph: glyph, left: off.left - base.left, top: off.top - base.top})
	}
}
function scale_glyphs(scaleX, scaleY) {
	$('#letter .glyph').each(scale_glyph)
	return scaleX
	function scale_glyph() {
		var glyph = $(this)
		glyph.css('left', (parseFloat(glyph.css('left')) || 0) * scaleX)
		glyph.css('top', (parseFloat(glyph.css('top')) || 0) * scaleY)
	}
}
function fit_glyphs() {
	var el = $('#letter')
	var text = glyph_text()
	var family = ''
	var style = 'normal'
	var size = 0
	var scaleX = 1
	var scaleY = 1
	var width = 0
	var height = 0
	if (!text) return 0
	if (letter_chars(text).length < 2) return join_letter()
	if (!el.attr('data-moved') && !el.attr('data-pinned')) return layout_glyphs(text, false)
	family = getComputedStyle(el[0]).fontFamily
	style = getComputedStyle(el[0]).fontStyle || 'normal'
	size = fitted_size(text, family, style)
	if (!size) return 0
	width = el.innerWidth()
	height = el.innerHeight()
	if (fit_glyphs.width && fit_glyphs.height && (width !== fit_glyphs.width || height !== fit_glyphs.height)) {
		scaleX = width / fit_glyphs.width
		scaleY = height / fit_glyphs.height
		scale_glyphs(scaleX, scaleY)
	}
	el.css('font-size', size + 'px')
	fit_glyphs.width = width
	fit_glyphs.height = height
	return size
}
function join_letter() {
	var ch = $('#letter .glyph').first().text() || 'A'
	var el = $('#letter')
	el.removeClass('letters')
	el.removeAttr('tabindex')
	el.removeAttr('data-moved')
	el.removeAttr('data-pinned')
	el.attr('contenteditable', 'plaintext-only')
	el.text(ch)
	fit_glyphs.width = 0
	fit_glyphs.height = 0
	return fit_letter()
}
function add_glyph(ch) {
	var el = $('#letter')
	var last = null
	var left = 0
	var top = 0
	var family = ''
	var style = 'normal'
	var size = 0
	if (!el.attr('data-moved')) return layout_glyphs(glyph_text() + ch, true)
	pin_glyphs()
	family = getComputedStyle(el[0]).fontFamily
	style = getComputedStyle(el[0]).fontStyle || 'normal'
	size = fitted_size(glyph_text() + ch, family, style)
	if (size) el.css('font-size', size + 'px')
	last = el.find('.glyph').last()
	left = (parseFloat(last.css('left')) || 0) + last.outerWidth()
	top = parseFloat(last.css('top')) || 0
	append_glyph(ch).addClass('is-pinned').css({left: left, top: top})
	return ch
}
function remove_last_glyph() {
	var glyphs = $('#letter .glyph')
	if (glyphs.length < 2) return join_letter()
	glyphs.last().remove()
	if ($('#letter .glyph').length < 2) return join_letter()
	if (!$('#letter').attr('data-moved')) return layout_glyphs(glyph_text(), true)
	return glyph_text()
}
function raise_glyph(glyph) {
	raise_glyph.z = (raise_glyph.z || 1) + 1
	glyph.css('z-index', raise_glyph.z)
	return raise_glyph.z
}
function glyph_down(response) {
	var glyph = $(this)
	if (response.button !== 0) return 0
	response.preventDefault()
	pin_glyphs()
	if (response.originalEvent && response.originalEvent.isTrusted) glyph[0].setPointerCapture(response.pointerId)
	glyph.addClass('is-dragging')
	raise_glyph(glyph)
	glyph_down.glyph = glyph
	glyph_down.x = response.clientX
	glyph_down.y = response.clientY
	glyph_down.left = parseFloat(glyph.css('left')) || 0
	glyph_down.top = parseFloat(glyph.css('top')) || 0
	glyph_down.moved = false
	glyph.on('pointermove.glyph', glyph_move)
	glyph.on('pointerup.glyph pointercancel.glyph', glyph_up)
	return glyph.text()
}
function glyph_move(response) {
	var glyph = glyph_down.glyph
	var frame = $('#letter')
	var left = glyph_down.left + response.clientX - glyph_down.x
	var top = glyph_down.top + response.clientY - glyph_down.y
	var maxLeft = Math.max(frame.innerWidth() - glyph.outerWidth(), 0)
	var maxTop = Math.max(frame.innerHeight() - glyph.outerHeight(), 0)
	if (Math.abs(response.clientX - glyph_down.x) > 2 || Math.abs(response.clientY - glyph_down.y) > 2) {
		glyph_down.moved = true
	}
	left = Math.min(Math.max(left, 0), maxLeft)
	top = Math.min(Math.max(top, 0), maxTop)
	glyph.css({left: left, top: top})
	return left
}
function glyph_up(response) {
	var glyph = glyph_down.glyph
	glyph.off('pointermove.glyph pointerup.glyph pointercancel.glyph')
	glyph.removeClass('is-dragging')
	if (glyph_down.moved) {
		$('#letter').attr('data-moved', '1')
		return 1
	}
	return layout_glyphs(glyph_text(), true)
}
function letter_input() {
	var text = ''
	if (letter_input.lock || $('#letter').hasClass('letters')) return 0
	text = $('#letter').text()
	if (letter_chars(text.replace(/\n/g, '')).length > 1) {
		letter_input.lock = true
		letter_input.text = text
		setTimeout(split_typed, 0)
		return text
	}
	return fit_letter()
}
function split_typed() {
	var text = $('#letter').hasClass('letters') ? letter_input.text : $('#letter').text()
	layout_glyphs(text, true)
	letter_input.lock = false
	return text
}
function letter_key(response) {
	if (response.key === 'Enter') {
		response.preventDefault()
		return 0
	}
	if (!$('#letter').hasClass('letters')) return
	if (response.key === 'Backspace') {
		response.preventDefault()
		return remove_last_glyph()
	}
	if (response.ctrlKey || response.metaKey || response.altKey) return
	if (response.key.length !== 1) return
	response.preventDefault()
	return add_glyph(response.key)
}
function letter_paste(response) {
	var data = ''
	var i = 0
	var chars = []
	if (!$('#letter').hasClass('letters')) return
	if (response.originalEvent && response.originalEvent.clipboardData) {
		data = response.originalEvent.clipboardData.getData('text') || ''
	}
	data = data.replace(/\n/g, '')
	if (!data) return
	response.preventDefault()
	if (!$('#letter').attr('data-moved')) return layout_glyphs(glyph_text() + data, true)
	chars = letter_chars(data)
	for (i = 0; i < chars.length; i++) add_glyph(chars[i])
	return data
}
function font_stack(button) {
	var family = $(button).attr('data-family')
	var stack = $(button).attr('data-stack')
	var generic = $(button).attr('data-generic') || 'sans-serif'
	if (stack) return stack
	return '"' + family + '", ' + generic
}
function font_link(family) {
	var id = 'gf-' + family.replace(/[^A-Za-z0-9]+/g, '-')
	var link = document.getElementById(id)
	if (link) return link
	link = document.createElement('link')
	link.id = id
	link.rel = 'stylesheet'
	link.href = 'https://fonts.googleapis.com/css2?family=' + encodeURIComponent(family) + '&display=swap'
	return link
}
function load_font(family) {
	var link = font_link(family)
	if (!link.parentNode) document.head.appendChild(link)
	return link.id
}
function begin_font() {
	load_font.pending = (load_font.pending || 0) + 1
	$('#font-list').addClass('is-loading')
	return load_font.pending
}
function end_font() {
	load_font.pending = Math.max((load_font.pending || 1) - 1, 0)
	if (!load_font.pending) $('#font-list').removeClass('is-loading')
	return load_font.pending
}
function font_ready(response) {
	return end_font()
}
function font_failed(response) {
	return end_font()
}
function ignore_font() {
	return 0
}
function font_is_italic(button) {
	return $(button).closest('.font-row').find('.chk-italic').prop('checked')
}
function apply_font(button) {
	var css = font_stack(button)
	var family = $(button).attr('data-family')
	var italic = font_is_italic(button)
	var face = (italic ? 'italic ' : 'normal ') + '100px ' + css
	$('#font-list .btn-font').removeClass('active')
	$(button).addClass('active').css('font-family', css).css('font-style', italic ? 'italic' : 'normal')
	if ($(button).attr('data-source') !== 'builtin') load_font(family)
	$('#letter').css('font-family', css).css('font-style', italic ? 'italic' : 'normal')
	fit_letter()
	document.fonts.load(face).then(fit_letter).catch(ignore_font)
	return family
}
function toggle_italic() {
	var button = $(this).closest('.font-row').find('.btn-font')
	if (button.hasClass('active')) return apply_font(button[0])
	button.css('font-style', this.checked ? 'italic' : 'normal')
	return this.checked
}
function choose_font() {
	return apply_font(this)
}
function paint_font(entry) {
	var button = $(entry.target)
	var family = button.attr('data-family')
	var css = ''
	var link = null
	if (!entry.isIntersecting) return 0
	if (button.attr('data-source') === 'builtin') return 0
	if (button.attr('data-painted')) return 0
	button.attr('data-painted', '1')
	css = font_stack(button)
	button.css('font-family', css)
	link = font_link(family)
	if (link.sheet && document.fonts.check('19px "' + family + '"')) return family
	begin_font()
	if (!link.parentNode) {
		$(link).one('load error', sheet_done)
		document.head.appendChild(link)
		return family
	}
	if (link.sheet) {
		document.fonts.load('19px "' + family + '"').then(font_ready).catch(font_failed)
		return family
	}
	$(link).one('load error', sheet_done)
	return family
	function sheet_done(response) {
		document.fonts.load('19px "' + family + '"').then(font_ready).catch(font_failed)
		return response
	}
}
function watch_fonts(entries) {
	var i = 0
	for (i = 0; i < entries.length; i++) paint_font(entries[i])
}
function init_editor() {
	var active = null
	var observer = null
	if (!$('#letter').length) return
	size_editor()
	active = $('#font-list .btn-font.active')
	if (!active.length) active = $('#font-list .btn-font').first()
	apply_font(active[0])
	active[0].scrollIntoView({block: 'nearest'})
	$('#font-list').on('click', '.btn-font', choose_font)
	$('#font-list').on('change', '.chk-italic', toggle_italic)
	$('#letter').on('input', letter_input)
	$('#letter').on('keydown', letter_key)
	$('#letter').on('paste', letter_paste)
	$('#letter').on('pointerdown', '.glyph', glyph_down)
	$(window).on('resize', size_editor)
	observer = new ResizeObserver(letter_resized)
	observer.observe($('#letter-frame')[0])
	observer = new IntersectionObserver(watch_fonts, {root: $('#font-list')[0], rootMargin: '160px'})
	$('#font-list .btn-font').each(observe_font)
	function observe_font() {
		observer.observe(this)
	}
}
init_editor()
