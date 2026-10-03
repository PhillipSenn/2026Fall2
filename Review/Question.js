$(document).on('change',':radio',radio)
function radio() {
	$(this).closest('form').submit()
}

$('.form-check-label').each(each_check_label)
function each_check_label(i) {
	var qname = $('#qname').text().trim()
	var ansname = $(this).text()
console.log(qname)
console.log(ansname)
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
		console.log(26,response)
		response.images.forEach(each)
	}
	function each(response) {
//		console.log(response.imageUrl)
		$('<img>', { class: 'cursor-pointer', src: response.imageUrl.split('?')[0], width: 100 }).appendTo('#ai_images')
	}

}

$(document).on('click','img.cursor-pointer',cursor_pointer)
function cursor_pointer() {
	var self = $(this)
	fetch('Q/update_desc.cfm', {
		method: 'post',
		body: new URLSearchParams({
			qid: $('#qid').val(),
			qdesc: self.attr('src')
		})
	}).then(done)
	function done() {
		$('.cursor-pointer').attr('hidden',true)
		self.attr('hidden',false)
	}
}

function return_json(response) {
	return response.json()
}
