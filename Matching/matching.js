var picked = null

$(document).on('click', '#questions button, #answers button', function () {
	var button = $(this)
	if (button.prop('disabled')) {
		return
	}
	if (!picked || sameColumn(picked, button)) {
		select(button)
		return
	}
	if (String(picked.data('ansid')) === String(button.data('ansid'))) {
		var ansid = button.data('ansid')
		lock(picked)
		lock(button)
		picked = null
		var url = '../guess/merge_ans.cfm'
		var form = {}
		form.body = new URLSearchParams()
		form.body.set('id', dom.id)
		form.body.set('ansid', ansid)
		fetch(url, form)
			.then(text_done)
			.then(showEarned)
			.catch(caught(url))
		if (!$('#questions button:not(:disabled)').length) {
			$('.card-header').text('All shortcuts matched.')
		}
		return
	}
	flash(button)
})

function sameColumn(a, b) {
	return a.parent().attr('id') === b.parent().attr('id')
}

function select(button) {
	var column = button.parent()
	column.find('button:not(:disabled)')
		.removeClass('btn-primary')
		.addClass(resting(column))
	button.removeClass('btn-outline-primary btn-outline-secondary btn-danger')
		.addClass('btn-primary')
	picked = button
}

function lock(button) {
	button.prop('disabled', true)
		.removeClass('btn-primary btn-outline-primary btn-outline-secondary btn-danger')
		.addClass('btn-success')
}

function flash(button) {
	var column = button.parent()
	button.removeClass('btn-outline-primary btn-outline-secondary')
		.addClass('btn-danger')
	setTimeout(function () {
		if (!button.prop('disabled')) {
			button.removeClass('btn-danger').addClass(resting(column))
		}
	}, 600)
}

function resting(column) {
	if (column.attr('id') === 'questions') {
		return 'btn-outline-primary'
	}
	return 'btn-outline-secondary'
}

function showEarned(text) {
	var pct = parseFloat(text)
	$('.progress-bar').css('width', pct + '%')
		.attr('aria-valuenow', pct)
		.text(pct + '%')
	if (pct >= 100) {
		$('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
}
