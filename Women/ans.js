$(document).on('paste', '.ans-url', paste_ansname)
$(document).on('change', '.ans-url', save_ansname)
$(document).on('focus', '.ans-url', select_ansname)

function select_ansname() {
	this.select()
}

function paste_ansname() {
	setTimeout(save_from_input, 0, $(this))
}

function save_ansname() {
	save_from_input($(this))
}

function save_from_input(input) {
	var ansname = strip_image_params(String(input.val() || '').trim())
	var ansid = input.data('ansid')
	var row = input.closest('tr')
	if (!ansname || !ansid) {
		return
	}
	input.val(ansname)
	row.find('.ans-preview').attr('src', ansname)
	var url = 'ans.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', app.actid)
	form.body.set('ansid', ansid)
	form.body.set('ansname', ansname)
	form.body.set('ajax', '1')
	fetch(url, form)
		.then(text_done)
		.then(saved_ok)
		.catch(caught(url))

	function saved_ok(response) {
		if (String(response || '').trim() === 'ok') {
			row.addClass('table-success')
			setTimeout(clear_saved, 800)
		}
	}

	function clear_saved() {
		row.removeClass('table-success')
	}
}

function strip_image_params(url) {
	return url.replace(/(\.(?:jpe?g|png|gif|webp|avif|svg))([?#].*)$/i, '$1')
}
