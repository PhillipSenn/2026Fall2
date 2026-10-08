function get_text(url) {
	var response = fetch(url).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.text()
	}
}

function get_json(url) {
	var response = fetch(url).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.json()
	}
}

function post_text(url, form) {
	var response = fetch(url, {
		 method: 'POST'
		,headers: { 'Content-Type': 'application/json' }
		,body: JSON.stringify(form)
	}).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.text()
	}
}

function post_json(url, form) {
	var response = fetch(url, {
		 method: 'POST'
		,headers: { 'Content-Type': 'application/json' }
		,body: JSON.stringify(form)
	}).then(done)
		.catch(caught(url))
	return response
	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		return response.json()
	}
}
