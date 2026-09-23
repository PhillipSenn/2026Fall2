$(document).on('change',':radio',radio)
function radio() {
	$(this).closest('form').submit()
}

$('.ai').each(each_ai)
function each_ai() {
	var qname = $('#qname').text()
	var ansname = $(this).closest('.form-check')
		.find('.form-check-label')
		.text()

	fetch('serper/images.cfm', {
		method: 'post',
		body: new URLSearchParams({
			qname: qname.trim(),
			ansname: ansname.trim()
		})
	}).then(return_json)
		.then(done)
	
	function done(response) {
//		console.log(response)
		response.images.forEach(each)
	}
	function each(response) {
		console.log(response.title,response.imageUrl)
		$('.ai:first').attr('src',response.imageUrl.split('?')[0])
//			.attr('title',response.title)
			.removeClass('ai')
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
