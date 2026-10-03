$(document).on('change',':radio',radio)
function radio() {
	$(this).closest('form').submit()
}

$('.form-check-label').each(each_check_label)
function each_check_label(i) {
	var qname = $('#qname').text().trim()
	var ansname = $(this).text().trim()
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
		if (!response.images) {
			return
		}
		response.images.forEach(each)
	}
	function each(response) {
		var picture = response
		var src = picture_src(picture)
		if (!src) {
			return
		}
		var img = $('<img>', {
			class: 'cursor-pointer',
			alt: picture.title || ansname
		})
		img.attr('referrerpolicy', 'no-referrer')
		img.on('error', image_error)
		img.attr('src', src)
		img.appendTo('#ai_images')

		function image_error() {
			var full = ''
			if (picture.imageUrl) {
				full = picture.imageUrl.split('?')[0]
			}
			if (full && img.attr('src') != full) {
				img.attr('src', full)
				return
			}
			img.off('error')
			img.attr('src', 'NoPictureAvailable.jpg')
		}
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

function picture_src(response) {
	if (response.thumbnailUrl) {
		return response.thumbnailUrl
	}
	if (!response.imageUrl) {
		return ''
	}
	return response.imageUrl.split('?')[0]
}

function return_json(response) {
	return response.json()
}
