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
	var sample = 200
	var canvas = null
	var ctx = null
	var metrics = null
	var width = 0
	var height = 0
	var size = 0
	if (!el || !el.parentElement.clientHeight || !el.parentElement.clientWidth) return 0
	text = el.textContent || 'A'
	family = getComputedStyle(el).fontFamily
	canvas = fit_letter.canvas || (fit_letter.canvas = document.createElement('canvas'))
	ctx = canvas.getContext('2d')
	ctx.font = sample + 'px ' + family
	metrics = ctx.measureText(text)
	width = metrics.width
	height = (metrics.actualBoundingBoxAscent || 0) + (metrics.actualBoundingBoxDescent || 0)
	if (!width || !height) return 0
	size = sample * Math.min(el.parentElement.clientWidth / width, el.parentElement.clientHeight / height) * 0.9
	el.style.fontSize = size + 'px'
	el.style.lineHeight = '1'
	place_letter(el, family, size, text)
	return size
}
function line_baseline(family, size, text) {
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
function place_letter(el, family, size, text) {
	var canvas = fit_letter.canvas
	var ctx = canvas.getContext('2d')
	var metrics = null
	var ascent = 0
	var descent = 0
	var ink = 0
	var base = 0
	var pad = 0
	ctx.font = size + 'px ' + family
	metrics = ctx.measureText(text)
	ascent = metrics.actualBoundingBoxAscent || 0
	descent = metrics.actualBoundingBoxDescent || 0
	ink = ascent + descent
	if (!ink) return 0
	base = line_baseline(family, size, text)
	pad = (el.parentElement.clientHeight - ink) / 2 - (base - ascent)
	el.style.marginTop = pad + 'px'
	return pad
}
function letter_resized() {
	return fit_letter()
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
function apply_font(button) {
	var css = font_stack(button)
	var family = $(button).attr('data-family')
	$('#font-list .btn-font').removeClass('active')
	$(button).addClass('active').css('font-family', css)
	if ($(button).attr('data-source') !== 'builtin') load_font(family)
	$('#letter').css('font-family', css)
	fit_letter()
	document.fonts.load('100px ' + css).then(fit_letter).catch(ignore_font)
	return family
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
	$('#letter').on('input', fit_letter)
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
