var draggedAns = ''
var accepted = false
var dragOrigin = null
var dragGrab = null
var dragPoint = null
var dragTimer = null

if (history.scrollRestoration) {
	history.scrollRestoration = 'manual'
}
window.scrollTo(0, 0)

$('.pix-choice').on('dragstart', dragstart_pix)
$('.pix-choice').on('drag', track_pix)
$('.pix-choice').on('dragend', dragend_pix)
$(document).on('dragover', track_pix)
$('.card-footer').on('dragover', dragover_pix)
$('.card-footer').on('dragleave', dragleave_pix)
$('.card-footer').on('drop', drop_pix)

function dragstart_pix(event) {
	var rect = this.getBoundingClientRect()
	accepted = false
	dragOrigin = { left: rect.left, top: rect.top, width: rect.width, height: rect.height }
	dragGrab = {
		x: event.originalEvent.clientX - rect.left,
		y: event.originalEvent.clientY - rect.top
	}
	dragPoint = { x: event.originalEvent.clientX, y: event.originalEvent.clientY }
	draggedAns = $(this).attr('data-ansid')
	$(this).addClass('pix-dragging')
	event.originalEvent.dataTransfer.setData('text/plain', draggedAns)
	event.originalEvent.dataTransfer.effectAllowed = 'move'
	dragTimer = setInterval(scroll_pix, 16)
}

function scroll_pix() {
	var edge = 90
	var y
	var step
	if (!dragPoint) {
		return
	}
	y = dragPoint.y
	if (y < edge) {
		step = Math.ceil((edge - y) / 3)
		window.scrollBy(0, -step)
	} else if (y > window.innerHeight - edge) {
		step = Math.ceil((y - (window.innerHeight - edge)) / 3)
		window.scrollBy(0, step)
	}
}

function track_pix(event) {
	var point = event.originalEvent
	if (!point.clientX && !point.clientY) {
		return
	}
	dragPoint = { x: point.clientX, y: point.clientY }
}

function dragend_pix() {
	clearInterval(dragTimer)
	$('.card-footer').removeClass('pix-over')
	if (accepted) {
		$(this).removeClass('pix-dragging')
	} else {
		revert_pix(this)
	}
	draggedAns = ''
}

function revert_pix(img) {
	var ghost
	if (!dragOrigin || !dragPoint || !dragGrab) {
		$(img).removeClass('pix-dragging')
		return
	}
	ghost = $(img).clone()
	ghost.removeClass('pix-choice pix-dragging').addClass('pix-ghost').removeAttr('data-ansid')
	ghost.css({
		position: 'fixed',
		left: (dragPoint.x - dragGrab.x) + 'px',
		top: (dragPoint.y - dragGrab.y) + 'px',
		width: dragOrigin.width + 'px',
		height: dragOrigin.height + 'px',
		margin: 0
	})
	$('body').append(ghost)
	ghost[0].offsetWidth
	ghost.css({
		left: dragOrigin.left + 'px',
		top: dragOrigin.top + 'px'
	})
	ghost.one('transitionend', remove_ghost)
	setTimeout(remove_ghost, 500)
	function remove_ghost() {
		ghost.remove()
		$(img).removeClass('pix-dragging')
	}
}

function dragover_pix(event) {
	if (draggedAns !== $(this).attr('data-ansid')) {
		return
	}
	event.preventDefault()
	$(this).addClass('pix-over')
}

function dragleave_pix(event) {
	var next = event.relatedTarget || event.originalEvent.relatedTarget
	if (next && this.contains(next)) {
		return
	}
	$(this).removeClass('pix-over')
}

function drop_pix(event) {
	var footer = $(this)
	var ansid = event.originalEvent.dataTransfer.getData('text/plain') || draggedAns
	event.preventDefault()
	if (ansid !== footer.attr('data-ansid')) {
		return
	}
	accepted = true
	var img = $('.pix-choice[data-ansid="' + ansid + '"]')
	img.attr('draggable', 'false')
	$('.pix-hint').remove()
	footer.removeClass('pix-over').addClass('pix-filled').append(img)
	return merge_ans(ansid)
}

function merge_ans(ansid) {
	var form = $('#pix')
	form.find('[name=ansid]').val(ansid)
	form.trigger('submit')
}
