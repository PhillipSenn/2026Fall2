var slots = []
var index = 0
var audio

$('.card-body a').each(blankTerm)

if (!slots.length) {
	enableNext()
} else {
	placeCursor()
}

window.addEventListener('keydown', onKey, true)

function blankTerm() {
	var text = $(this).text()
	var blank = $('<span class="blank letter-spacing">')

	for (var i = 0; i < text.length; i++) {
		var ch = text.charAt(i)
		if (/\s/.test(ch)) {
			blank.append(document.createTextNode(ch))
		} else {
			var slot = $('<span class="slot">')
				.text('_')
				.attr('data-letter', ch)
			blank.append(slot)
			slots.push(slot)
		}
	}

	$(this)
		.replaceWith(blank)
}

function onKey(event) {
	if (index >= slots.length) {
		return
	}
	if (event.metaKey || event.ctrlKey || event.altKey || event.key.length !== 1) {
		return
	}
	event.preventDefault()

	var slot = slots[index]
	var expected = slot.attr('data-letter')

	if (event.key.toLowerCase() === expected.toLowerCase()) {
		slot
			.text(expected)
			.removeClass('hint')
			.addClass('solved')
		index++
		placeCursor()
	} else {
		bonk()
		slot
			.text(expected)
			.addClass('hint')
	}
}

function placeCursor() {
	$('.slot').removeClass('current')
	if (index < slots.length) {
		slots[index].addClass('current')
		return
	}
	enableNext()
}

function enableNext() {
	$('[name=qid]')
		.removeClass('btn-outline-success')
		.addClass('btn-success')
		.prop('disabled', false)
}

function bonk() {
	var ctx = audio || (audio = new AudioContext())
	if (ctx.state === 'suspended') {
		ctx.resume()
	}
	var now = ctx.currentTime
	var osc = ctx.createOscillator()
	var gain = ctx.createGain()
	osc.type = 'square'
	osc.frequency.setValueAtTime(180, now)
	osc.frequency.exponentialRampToValueAtTime(70, now + 0.12)
	gain.gain.setValueAtTime(0.18, now)
	gain.gain.exponentialRampToValueAtTime(0.001, now + 0.16)
	osc.connect(gain)
	gain.connect(ctx.destination)
	osc.start(now)
	osc.stop(now + 0.16)
}
