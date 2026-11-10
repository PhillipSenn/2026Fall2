$('[name=ansname]').on('paste input', preview_ansname)
$(window).on('focus', focus_ansname)

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
