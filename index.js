$('td[contenteditable]').on('focus', rememberSort)
	.on('blur', saveSort)
	.on('keydown', leaveSort)

function rememberSort() {
	$(this).data('actsort', $(this).text().trim())
}

function leaveSort(event) {
	if (event.key !== 'Enter') {
		return
	}
	event.preventDefault()
	this.blur()
}

function saveSort() {
	var cell = $(this)
	var actsort = cell.text().trim()

	if (actsort === String(cell.data('actsort'))) {
		return
	}
	var url = 'Act/update_sort.cfm'
	var formData = new URLSearchParams()
	formData.set('id', dom.id)
	formData.set('actid', cell.closest('tr').data('actid'))
	formData.set('actsort', actsort)
	console.log(url + '?' + formData.toString())
	fetch(url, {
		method: 'POST',
		body: formData
	}).then(done)
		.catch(caught(url))

	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		cell.data('actsort', actsort)
	}
}
