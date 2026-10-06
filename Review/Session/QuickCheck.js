var formData = new URLSearchParams()
formData.set('id', dom.id)
formData.set('qname','Subject: ' + $('#catname').text() + '. Question: ' + $('#qname').text().trim())

fetch('groq.cfm', {
	method: 'POST',
	headers: {
		'Content-Type': 'application/x-www-form-urlencoded'
	},
	body: formData
})
.then(getGroqResponse)
.catch(handleError)

function getGroqResponse(response) {
	return response.text().then(sendToWikipedia)
}

function sendToWikipedia(answer) {
	if (answer) {
		$('#ansname').html(answer)
	}
	var formData = new URLSearchParams()
	formData.set('id',dom.id)
	formData.set('qname', qname)
	formData.set('ansname', answer)
	fetch('Wikipedia.cfm', {
		method: 'POST',
		headers: {
			'Content-Type': 'application/x-www-form-urlencoded'
		},
		body: formData
	})
	.then(getWikipediaResponse)
	.catch(handleError)

}

function getWikipediaResponse(response) {
	return response.json().then(showWikipediaResponse)
}

function showWikipediaResponse(response) {
	if (response.image) {
		$('#imgname').html('<img src="' + response.image + '" class="img-fluid img-thumbnail">')
	}
}

function handleError(error) {
	console.error(error)
}