$(document).on('change',':radio',radio)
function radio() {
	$(this).closest('form').submit()
}

if (!$('#qdesc').length) {
	$('.form-check-label').each(each_check_label)
}
function each_check_label(i) {
	var qname = $('#qname').text().trim()
	var ansname = $(this).text()
	var formData = new URLSearchParams()
	formData.set('id',dom.id)
	formData.set('qname', qname)
	formData.set('ansname', ansname)

	fetch('serper/images.cfm', {
		method: 'post',
		body: formData
	}).then(return_json)
		.then(done)
	
	function done(response) {
		response.images.forEach(each)
	}
	function each(response) {
		$('<img>', { class: 'cursor-pointer', src: response.imageUrl.split('?')[0], width: 100 }).appendTo('#ai_images')
	}

}

$(document).on('click','img.cursor-pointer',cursor_pointer)
function cursor_pointer() {
	var self = $(this)
	var formData = new URLSearchParams()
	formData.set('id',dom.id)
	formData.set('qid', $('#qid').val())
	formData.set('qdesc', self.attr('src'))
	fetch('Q/update_desc.cfm', {
		method: 'post',
		body: formData
	}).then(done)
	function done() {
		$('.cursor-pointer').attr('hidden',true)
		self.attr('hidden',false)
	}
}

function return_json(response) {
	return response.json()
}
