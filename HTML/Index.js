var examples = {
	gettysburg: JSON.parse($('#example-gettysburg').text()),
	headings: [
		'<h1>Heading 1</h1>',
		'<h2>Heading 2</h2>',
		'<h3>Heading 3</h3>',
		'<h4>Heading 4</h4>',
		'<h5>Heading 5</h5>',
		'<h6>Heading 6</h6>',
		'<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>',
		'<hr>',
		'<p>This text is <strong>strong</strong> and this text is <em>emphasized</em>.</p>',
		'<p>Line one<br>Line two</p>'
	].join('\n'),
	anchor: '<a href="https://google.com" target="_blank">Google</a>',
	bootstrap: [
		'<div class="d-flex flex-wrap gap-2">',
		'   <button type="button" class="btn-solid theme-primary">Primary</button>',
		'   <button type="button" class="btn-solid theme-secondary">Secondary</button>',
		'   <button type="button" class="btn-solid theme-success">Success</button>',
		'   <button type="button" class="btn-solid theme-danger">Danger</button>',
		'   <button type="button" class="btn-solid theme-warning">Warning</button>',
		'   <button type="button" class="btn-solid theme-info">Info</button>',
		'</div>',
		'',
		'<div class="d-flex flex-wrap gap-2 mt-2">',
		'   <button type="button" class="btn-solid theme-primary btn-styled">Primary</button>',
		'   <button type="button" class="btn-solid theme-secondary btn-styled">Secondary</button>',
		'   <button type="button" class="btn-solid theme-success btn-styled">Success</button>',
		'   <button type="button" class="btn-solid theme-danger btn-styled">Danger</button>',
		'   <button type="button" class="btn-solid theme-warning btn-styled">Warning</button>',
		'   <button type="button" class="btn-solid theme-info btn-styled">Info</button>',
		'</div>',
		'',
		'<div class="d-flex flex-wrap gap-2 mt-2">',
		'   <button type="button" class="btn-outline theme-primary">Outline primary</button>',
		'   <button type="button" class="btn-outline theme-secondary">Outline secondary</button>',
		'   <button type="button" class="btn-subtle theme-primary">Subtle primary</button>',
		'   <button type="button" class="btn-text theme-primary">Text primary</button>',
		'   <button type="button" class="btn-link">Link</button>',
		'</div>',
		'',
		'<div class="d-flex flex-wrap gap-2 align-items-center mt-2">',
		'   <button type="button" class="btn-solid theme-primary btn-lg">Large</button>',
		'   <button type="button" class="btn-solid theme-primary">Default</button>',
		'   <button type="button" class="btn-solid theme-primary btn-sm">Small</button>',
		'</div>'
	].join('\n')
}

$('.example-link').on('click', load_example)

function load_example(event) {
	event.preventDefault()
	var key = $(this).data('example')
	var html = examples[key]
	if (html === undefined) {
		return
	}
	$('.example-link').removeClass('active')
	$(this).addClass('active')
	$('#htmlSource').val(html)
		.toggleClass('no-wrap', key === 'bootstrap')
	$('.html-preview').html(html)
	return key
}
