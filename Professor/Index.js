dom.progress_bar = $('.progress-bar')
var score = +dom.progress_bar.attr('aria-valuenow')
document.addEventListener('keydown', handle_keydown)
document.addEventListener('keyup', handle_keyup)

function handle_keydown(response) {
	var keyCode = arrow_key_code(response)
	if (!keyCode) {
		return
	}
	response.preventDefault()
	$('#which-key').text(keyCode)
	key[keyCode] = true
}

function handle_keyup(response) {
	var keyCode = arrow_key_code(response)
	if (!keyCode) {
		return
	}
	response.preventDefault()
	key[keyCode] = false
}

function arrow_key_code(response) {
	var arrow_keys = {
		ArrowLeft: 37,
		ArrowUp: 38,
		ArrowRight: 39,
		ArrowDown: 40
	}
	return arrow_keys[response.key] || 0
}

function update_score() {
	score += 1
	if (score > 100) {
		dom.progress_bar.text(score + '%')
	} else {
		var url = 'Grade/merge_act.cfm'
		var form = {}
		form.body = new URLSearchParams()
		form.body.set('id', app.id)
		form.body.set('actid', app.actid)
		form.body.set('earned',score)
		fetch(url, form)
			.then(text_done)
			.then(done)
			.catch(caught(url))
	}
}

function done(response) {
	response = +response
	dom.progress_bar.attr('style','width:' + response + '%')
		.attr('aria-valuenow',response)
		.text(response + '%')
}


function resizeCanvas() {
	canvas.width = canvas.clientWidth
	canvas.height = canvas.clientHeight
}
addEventListener('resize', resizeCanvas)
resizeCanvas()

