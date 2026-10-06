dom.terms = $('#terms')

$('.card-body a').each(each)

var terms = dom.terms.find('li').get()

if (!terms.length) {
	$('[name=qid]').removeClass('btn-outline-success')
		.addClass('btn-success')
		.prop('disabled',false)
	$('.col-4').hide()
}

terms.sort(sortTerms)
dom.terms.append(terms)

function sortTerms(a,b) {
	var aText = $(a).text().trim().toLowerCase()
	var bText = $(b).text().trim().toLowerCase()

	return aText.localeCompare(bText)
}

function each() {
	var text = $(this).text().trim()

	$(this)
		.attr('data-answer',text)
		.text(text.replace(/[^\s]/g,'_'))
		.addClass('letter-spacing text-decoration-none drop-term')

	dom.terms.append(
		$('<li>').append(
			$(this)
				.clone()
				.text(text)
				.removeClass('drop-term letter-spacing')
				.addClass('drag-term')
		)
	)
}

$('.drag-term')
	.data('correct',false)
	.draggable({
		helper: 'clone',
		revert: revertTerm
	})

function revertTerm() {
	return !$(this).data('correct')
}

$('.drop-term').droppable({
	accept: '.drag-term',
	over: overTerm,
	out: outTerm,
	drop: dropTerm
})

function overTerm() {
	$(this).addClass('bg-warning-subtle border border-warning rounded')
}

function outTerm() {
	$(this).removeClass('bg-warning-subtle border border-warning rounded')
}

function dropTerm(event,ui) {
	var dragged = ui.draggable.text().trim()
	var correct = $(this).attr('data-answer')

	$(this).removeClass('bg-warning-subtle border border-warning rounded')

	if (dragged === correct) {
		ui.draggable.data('correct',true)

		$(this)
			.text(correct)
			.removeClass('letter-spacing')
			.droppable('disable')

		ui.draggable.closest('li').slideUp('slow',done)
		function done() {
			ui.draggable.closest('li').remove()
			if (dom.terms.find('li').length === 0) {
				$('[name=qid]').removeClass('btn-outline-success')
					.addClass('btn-success')
					.prop('disabled',false)
					
				$('.col-4 .card-header').addClass('bg-success-subtle').text('Next!')
				setTimeout(slideup,1000)
			}
		}
	} else {
		ui.draggable.data('correct',false)
	}
}


function slideup() {
	$('.col-4').slideUp('slow')
}

window.addEventListener('keydown', showClue, true)
window.addEventListener('keyup', hideClue, true)
window.addEventListener('blur', hideClue)

function showClue(event) {
	if (!altKey(event) || event.repeat) {
		return
	}
	event.preventDefault()
	var next = $('.drop-term').filter(unsolved).first()
	if (!next.length || next.attr('data-blank')) {
		return
	}
	next.attr('data-blank', next.text())
	next.text(next.attr('data-answer'))
}

function hideClue(event) {
	if (event && event.type === 'keyup' && !altKey(event)) {
		return
	}
	if (event && event.type === 'keyup') {
		event.preventDefault()
	}
	$('.drop-term').each(restoreClue)
}

function restoreClue() {
	var term = $(this)
	var blank = term.attr('data-blank')
	if (!blank) {
		return
	}
	term.removeAttr('data-blank')
	if (term.droppable('option', 'disabled')) {
		return
	}
	term.text(blank)
}

function altKey(event) {
	return event.key === 'Alt'
		|| event.key === 'AltGraph'
		|| event.code === 'AltLeft'
		|| event.code === 'AltRight'
}

function unsolved() {
	return !$(this).droppable('option', 'disabled')
}