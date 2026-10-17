var questions = []
var questionIndex = 0
var aim = 50
var aimDirection = 0
var aimFrame = 0
var aimStamp = 0

start_sub()

function start_sub() {
	show_reset(+$('.card').has('[name=reset]').attr('data-earned'))
	order_qnames()
	load_questions()
	$(document).on('keydown', on_key)
	$(document).on('keyup', on_keyup)
	$(window).on('blur', stop_aim)
}

function order_qnames() {
	var names = $('#sea .qname').get()
	var i
	names.sort(by_name)
	for (i = 0; i < names.length; i++) {
		$('#sea').append(names[i])
	}
	$('#sea .qname').each(place_qname)
}

function by_name(a, b) {
	return $(a).text().toLowerCase().localeCompare($(b).text().toLowerCase())
}

function shuffle(list) {
	var i = list.length
	var pick
	var swap
	while (i) {
		pick = Math.floor(Math.random() * i)
		i--
		swap = list[i]
		list[i] = list[pick]
		list[pick] = swap
	}
	return list
}

function place_qname(index) {
	var count = $('.qname').length
	var band = 90 / count
	var depth = index * band
	var seconds = 16 + Math.random() * 34
	$(this).css({
		top: depth + '%',
		animationDuration: seconds + 's',
		animationDelay: (-Math.random() * seconds) + 's'
	})
}

function load_questions() {
	$('#questions [data-qid]').each(add_question)
	shuffle(questions)
	show_question()
}

function add_question() {
	questions.push({
		qid: $(this).attr('data-qid'),
		qdesc: $(this).text()
	})
}

function show_question() {
	if (!questions.length) return
	$('#qdesc').text(questions[questionIndex].qdesc)
}

function cycle_question(direction) {
	var count = questions.length
	if (!count) return
	questionIndex = (questionIndex + direction + count) % count
	show_question()
}

function on_key(event) {
	if (event.key === 'ArrowDown') {
		event.preventDefault()
		cycle_question(1)
		return
	}
	if (event.key === 'ArrowUp') {
		event.preventDefault()
		cycle_question(-1)
		return
	}
	if (event.key === 'ArrowLeft' || event.key === 'ArrowRight') {
		event.preventDefault()
		if (event.repeat) return
		aimDirection = event.key === 'ArrowLeft' ? -1 : 1
		aimStamp = 0
		if (!aimFrame) aimFrame = window.requestAnimationFrame(glide_torpedo)
	}
	if (event.key === ' ' && !event.repeat) {
		event.preventDefault()
		fire_torpedo()
	}
}

function on_keyup(event) {
	if (event.key === 'ArrowLeft' && aimDirection < 0) aimDirection = 0
	if (event.key === 'ArrowRight' && aimDirection > 0) aimDirection = 0
}

function stop_aim() {
	aimDirection = 0
}

function glide_torpedo(stamp) {
	var elapsed
	var torpedo
	if (!aimDirection) {
		aimFrame = 0
		aimStamp = 0
		return
	}
	if (!aimStamp) aimStamp = stamp
	elapsed = stamp - aimStamp
	aimStamp = stamp
	torpedo = $('#launcher')
	if (!torpedo.hasClass('fired')) {
		aim = aim + aimDirection * elapsed * 0.035
		if (aim < 2) aim = 2
		if (aim > 98) aim = 98
		torpedo.css('left', aim + '%')
	}
	aimFrame = window.requestAnimationFrame(glide_torpedo)
}

function fire_torpedo() {
	var sea
	var torpedo
	torpedo = $('#launcher')
	if (torpedo.hasClass('fired')) return
	sea = $('#sea')
	torpedo.addClass('fired')
	torpedo.css({
		bottom: 'auto',
		transform: 'none',
		top: sea.height() - 16
	})
	torpedo.animate({ top: -28 }, {
		duration: 900,
		easing: 'linear',
		step: track_torpedo,
		complete: dock_torpedo
	})
}

function finish_shot() {
	var torpedo = $('#launcher')
	if (torpedo.hasClass('spent')) return
	torpedo.addClass('spent')
	torpedo.stop(true)
	window.setTimeout(dock_torpedo, 0)
}

function dock_torpedo() {
	var torpedo = $('#launcher')
	torpedo.stop(true)
	torpedo.removeClass('fired spent')
	torpedo[0].style.top = ''
	torpedo[0].style.bottom = ''
	torpedo[0].style.transform = ''
}

function track_torpedo() {
	var torpedo = $(this)
	var torpedoBox
	var seaBox
	var hit = null
	var hitBottom = -Infinity
	if (torpedo.hasClass('spent')) return
	torpedoBox = this.getBoundingClientRect()
	seaBox = $('#sea')[0].getBoundingClientRect()
	$('.qname').not('.sunk').each(find_hit)
	if (!hit) return
	finish_shot()
	if (hit.attr('data-qid') === current_qid()) {
		flash_right(hit)
		return
	}
	mark_wrong(hit)

	function find_hit() {
		var box = this.getBoundingClientRect()
		if (box.right < seaBox.left || box.left > seaBox.right) return
		if (box.right < torpedoBox.left || box.left > torpedoBox.right) return
		if (box.bottom < torpedoBox.top || box.top > torpedoBox.bottom) return
		if (box.bottom > hitBottom) {
			hit = $(this)
			hitBottom = box.bottom
		}
	}
}

function mark_wrong(el) {
	var timer = el.data('dangerTimer')
	if (timer) {
		window.clearTimeout(timer)
	}
	el.addClass('fg-danger')
	el.data('dangerTimer', window.setTimeout(clear_danger, 15000))
	function clear_danger() {
		el.removeClass('fg-danger')
		el.removeData('dangerTimer')
	}
}

function current_qid() {
	return String(questions[questionIndex].qid)
}

function flash_right(el) {
	var qid = el.attr('data-qid')
	el.removeClass('fg-danger fg-success').addClass('sunk')
	el.empty().append(make_duck())
	el.delay(700).fadeOut(500, remove_qname)
	remove_question(qid)
	merge_q(qid)
}

function make_duck() {
	var colors = ['bg-primary', 'bg-secondary', 'bg-success', 'bg-danger', 'bg-warning', 'bg-info']
	var color = colors[Math.floor(Math.random() * colors.length)]
	var duck = $('<span class="duck"></span>')
	duck.append($('<span class="duck-body"></span>').addClass(color))
	duck.append($('<span class="duck-head"></span>').addClass(color))
	duck.append('<span class="duck-beak"></span>')
	duck.append('<span class="duck-eye"></span>')
	return duck
}

function remove_question(qid) {
	var i
	qid = String(qid)
	for (i = 0; i < questions.length; i++) {
		if (String(questions[i].qid) !== qid) continue
		questions.splice(i, 1)
		if (!questions.length) {
			questionIndex = 0
			$('#qdesc').empty()
		} else if (i < questionIndex) {
			questionIndex--
		} else if (questionIndex >= questions.length) {
			questionIndex = 0
			show_question()
		} else if (i === questionIndex) {
			show_question()
		}
		break
	}
	$('#questions [data-qid="' + qid + '"]').remove()
}

function merge_q(qid) {
	var url = '../Poll/merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', qid)
	fetch(url, form)
		.then(text_done)
		.then(merged)
		.catch(caught(url))
	function merged(response) {
		var pct = +response
		$('.progress-bar').css('width', pct + '%')
			.text(pct + '%')
			.attr('aria-valuenow', pct)
		show_reset(pct)
	}
}

function show_reset(earned) {
	var card = $('.card').has('[name=reset]')
	if (earned < 100 || card.is(':visible')) return
	card.slideDown()
}

function remove_qname() {
	$(this).remove()
}
