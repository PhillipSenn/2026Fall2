var sent = false

$('.btn-group').on('click', 'button', chooseHistory)

function chooseHistory(event) {
	var button = $(this)
	var form = button.closest('form')
	var correct = button.val() == $('#catid').val()
	event.preventDefault()
	if (sent) return
	sent = true
	if (correct) {
		button.attr('class', 'btn-solid theme-success btn-styled hover-lift')
	} else {
		button.attr('class', 'btn-solid theme-danger btn-styled')
	}
	$('.btn-group button').removeAttr('name')
	form.append($('<input>', {
		type: 'hidden',
		name: 'catid',
		value: button.val()
	}))
	window.setTimeout(submitChoice, 700)
	function submitChoice() {
		form.trigger('submit')
	}
}
