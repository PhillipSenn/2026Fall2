$('select.grpname').on('change', saveGrp)
$('select.catname').on('change', saveCat)

function saveGrp() {
	var select = $(this)
	var url = 'Act/update_grp.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', select.closest('tr').data('actid'))
	form.body.set('grpid', select.val())
	fetch(url, form).then(text_done)
		.catch(caught(url))
}

function saveCat() {
	var select = $(this)
	var url = 'Act/update_cat.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', select.closest('tr').data('actid'))
	form.body.set('catid', select.val())
	fetch(url, form).then(text_done)
		.catch(caught(url))
}


$('td.actsort').on('focus', rememberSort)
	.on('blur', saveSort)
	.on('keydown', leaveSort)

$('td.isHidden').on('focus', rememberIsHidden)
	.on('blur', saveIsHidden)
	.on('keydown', leaveSort)

function rememberSort() {
	$(this).data('actsort', $(this).text())
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
	var actsort = cell.text()

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
	fetch(url, form).then(text_done)
		.then(done)
		.catch(caught(url))

	function done(response) {
//		if (!response.ok) {
			//throw new Error('HTTP ' + response.status + ' ' + response.statusText)
		//}
		cell.data('actsort', actsort)
	}
}

function rememberIsHidden() {
	$(this).data('isHidden', $(this).text())
}

function saveIsHidden() {
	var cell = $(this)
	var isHidden = cell.text()

	if (isHidden === String(cell.data('isHidden'))) {
		return
	}
	var url = 'Act/update_hidden.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('actid', cell.closest('tr').data('actid'))
	form.body.set('isHidden', isHidden)

	fetch(url, form).then(text_done)
		.then(done)
		.catch(caught(url))

	function done(response) {
		cell.data('isHidden', isHidden)
	}
}

