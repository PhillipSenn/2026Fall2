$('form').on('input change', clear_msg_header)
$('#pollname').on('input', pollname_input)

function clear_msg_header() {
	var $header = $('article > header.theme-danger')
	if (!$header.length) {
		return
	}
	$header
		.removeClass('theme-danger')
		.addClass('theme-primary')
		.text($header.data('qname'))
	if (window.history && history.replaceState) {
		var url = new URL(location.href)
		url.searchParams.delete('msg')
		history.replaceState(null, '', url)
	}
}

function pollname_input() {
	var url = $(this).val()
	if (!url) {
		return
	}

	var $img = $('#img_placeholder img')
	if (!$img.length) {
		$img = $('<img>', {
			'class': 'img-thumbnail',
			width: 280
		}).appendTo('#img_placeholder')
	}
	$img.attr('src', url)
}
