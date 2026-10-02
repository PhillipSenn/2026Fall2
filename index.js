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

	var body = new URLSearchParams()
	body.set('id', dom.id)
	body.set('actid', cell.closest('tr').data('actid'))
	body.set('actsort', actsort)

	fetch('Act/update_sort.cfm', {
		method: 'POST',
		body: body
	}).then(saved)
		.catch(caught('Act/update_sort.cfm'))

	function saved(response) {
		if (!response.ok) {
			throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		}
		cell.data('actsort', actsort)
	}
}
