$(document).on('change',':radio',radio)
function radio() {
	$(this).closest('form').submit()
}

var url = 'serper/images.cfm'
var form = {}
form.body = new URLSearchParams()
form.body.set('id',app.id)
form.body.set('qname', $('#qname').text())

fetch(url,form).then(json_done)
	.then(done)
	.catch(caught(url))

function done(response) {
	response.images.forEach(each)
}
function each(response) {
	var link = $('<a>', { href: response.link, target: '_blank' })
	$('<img>', { class: 'cursor-pointer', src: response.imageUrl.split('?')[0], width: 100 }).appendTo(link)
	link.appendTo('#ai_images')
}

$(document).on('click','img.cursor-pointer',cursor_pointer)
function cursor_pointer() {
	var self = $(this)
	var url = 'Q/update_desc.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id',app.id)
	form.body.set('qid', $('#qid').val())
	form.body.set('qdesc', self.attr('src'))
	fetch(url,form).then(done)
	function done() {
		$('#qdesc').attr('src',self.attr('src'))
//		$('.cursor-pointer').attr('hidden',true)
//		self.attr('hidden',false)
	}
}

