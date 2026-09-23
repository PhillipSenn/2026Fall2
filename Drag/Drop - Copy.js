dom.terms = $('#terms')

$('.card-body a').each(each)
var terms = dom.terms.find('li').get()
if (!terms.length) {
	$('[name=qid]').prop('disabled',false)
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

$('.drag-term').draggable({
	helper: 'clone',
	revert: revertTerm
})

function revertTerm() {
	return $(this).closest('li').length > 0
}

$('.drop-term').droppable({
	accept: '.drag-term',
	hoverClass: 'bg-warning-subtle border border-warning rounded',
	drop: dropTerm
})

function dropTerm(event,ui) {
	var dragged = ui.draggable.text().trim()
	var correct = $(this).attr('data-answer')

	if (dragged === correct) {
		$(this).text(correct)
			.removeClass('letter-spacing')
			.droppable('disable')
		ui.draggable.closest('li').remove()
		if (dom.terms.find('li').length === 0) {
			$('[name=qid]').prop('disabled',false)
		}
	} else {
		console.log('Incorrect')
	}
}