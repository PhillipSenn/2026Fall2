$(document).on('paste','[name=pollname]',nopaste)

function nopaste(response) {
	response.preventDefault()
	var header = $(this).closest('.card').children('.card-header')
	if (!header.data('label')) {
		header.data('label', header.text())
	}
	header.text('Paste has been disabled')
		.removeClass('bg-primary-subtle')
		.addClass('bg-danger-subtle')
	clearTimeout(nopaste.timer)
	nopaste.timer = setTimeout(restore, 2000)

	function restore() {
		header.text(header.data('label'))
			.removeClass('bg-danger-subtle')
			.addClass('bg-primary-subtle')
	}
}