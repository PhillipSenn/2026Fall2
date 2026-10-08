var url = 'groq.cfm'
var form = {}
form.body = new URLSearchParams()
form.body.set('id', dom.id)
form.body.set('qname','Subject: ' + $('#catname').text() + '. Question: ' + $('#qname').text())

fetch(url,form)
	.then(text_done)
	.then(sendToWikipedia)
	.catch(caught(url))

function sendToWikipedia(answer) {
	if (answer) {
		$('#ansname').html(answer)
	}
	var url = 'Wikipedia.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id',dom.id)
	form.body.set('qname', $('#qname').text())
	form.body.set('ansname', answer)
	form.body.set('ansname', '')
	console.log(url,form.body.toString())
	fetch(url,form)
		.then(json_done)
		.then(showWikipediaResponse)	
		.catch(caught(url))
}


function showWikipediaResponse(response) {
	console.log(response)
	var image = response.image || response.IMAGE
	if (image) {
		$('#imgname').html('<img src="' + image + '" class="img-fluid img-thumbnail">')
	}
}