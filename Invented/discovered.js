if ('scrollRestoration' in history) {
	history.scrollRestoration = 'manual'
}
$(window).scrollTop(0)

$('[name=ansname]').on('paste', clean_ansname)
$('[name=ansname]').on('input', preview_ansname)
$(window).on('focus', focus_ansname)

function clean_ansname() {
	setTimeout(strip_image_params, 0)
}

function strip_image_params() {
	var field = $('[name=ansname]')
	var url = field.val().trim()
	if (!/\.(jpg|png|gif)\?/i.test(url)) return
	field.val(url.split('?')[0])
	show_ansname_preview()
}

function preview_ansname() {
	setTimeout(show_ansname_preview, 0)
}

function focus_ansname() {
	$('[name=ansname]').focus()
}

function show_ansname_preview() {
	var url = $('[name=ansname]').val().trim()
	var img = $('#ansnamePreview')
	if (url) {
		img.attr('src', url).removeClass('d-none')
	} else {
		img.addClass('d-none').removeAttr('src')
	}
}
