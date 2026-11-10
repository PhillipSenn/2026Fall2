var examples = {
	headings: {
		css: [
			'h1 {',
			'color: navy;',
			'}'
		].join('\n'),
		a: [
			'<h1>Welcome</h1>',
			'<p>This page has one main heading.</p>',
			'<p>Change the h1 rule and watch both examples update.</p>'
		].join('\n'),
		b: [
			'<h1>Campus News</h1>',
			'<p>A second page with its own heading.</p>',
			'<h1>Upcoming Events</h1>',
			'<p>Both h1 tags share the same CSS rule.</p>'
		].join('\n')
	},
	classname: {
		css: [
			'.highlight {',
			'background-color: yellow;',
			'}'
		].join('\n'),
		a: [
			'<p>Only the <span class="highlight">highlighted words</span> should stand out.</p>',
			'<p>Other text stays normal until you style the class.</p>'
		].join('\n'),
		b: [
			'<p class="highlight">This whole paragraph uses the highlight class.</p>',
			'<p>This paragraph does not.</p>',
			'<ul>',
			'\t<li class="highlight">Class on a list item</li>',
			'\t<li>Plain list item</li>',
			'</ul>'
		].join('\n')
	},
	cascade: {
		css: [
			'div {',
			'color: navy;',
			'font-family: Georgia, serif;',
			'}'
		].join('\n'),
		a: [
			'<div>',
			'<h1>Inside the div</h1>',
			'<p>This paragraph is inside the div, so it picks up the div rules.</p>',
			'<p>Change the div color and both paragraphs change with it.</p>',
			'</div>'
		].join('\n'),
		b: [
			'<div>',
			'<h2>Also inside</h2>',
			'<p>Headings and paragraphs nested in the div inherit from it.</p>',
			'<ul>',
			'<li>List items inherit too</li>',
			'<li>Unless a more specific rule overrides them</li>',
			'</ul>',
			'</div>',
			'<p>This paragraph is outside the div, so the div rules do not apply.</p>'
		].join('\n')
	}
}

var current = examples.headings

$('.example-link').on('click', load_example)

show_html()
apply_css()

function load_example(response) {
	response.preventDefault()
	var key = $(this).data('example')
	var example = examples[key]
	if (example === undefined) {
		return
	}
	current = example
	$('.example-link').removeClass('active')
	$(this).addClass('active')
	$('#cssSource').val(example.css)
	show_html()
	apply_css()
	return key
}

function show_html() {
	$('#htmlSourceA').val(current.a)
	$('#htmlSourceB').val(current.b)
	return current
}

function apply_css() {
	var css = $('#cssSource').val()
	paint_frame($('#previewA')[0], current.a, css)
	paint_frame($('#previewB')[0], current.b, css)
	return css
}

function paint_frame(frame, html, css) {
	var doc = frame.contentDocument
	if (!doc) {
		return
	}
	doc.open()
	doc.write([
		'<!DOCTYPE html>',
		'<html lang="en">',
		'<head>',
		'<meta charset="utf-8">',
		'<style>',
		'body { margin: 0.75rem; font-family: Georgia, serif; line-height: 1.4; }',
		css,
		'</style>',
		'</head>',
		'<body>',
		html,
		'</body>',
		'</html>'
	].join(''))
	doc.close()
	return frame
}
