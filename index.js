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
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', cell.closest('tr').data('actid'))
	form.body.set('actsort', actsort)
	//console.log(url + '?' + form.body.toString())
	fetch(url, form).then(done)
		.catch(caught(url))

	function done(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		cell.data('actsort', actsort)
	}
}
