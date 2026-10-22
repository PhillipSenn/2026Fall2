var score = +$('.progress-bar').attr('aria-valuenow')
function update_score() {
	score += 1
	if (score > 100) {
		dom.progress_bar.text(score + '%')
	} else {
		var form = {}
		form.actid = dom.actid.int()
		form.earned = score
		post_text('Grade/merge_earned.cfm',form)
			.then(done)
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

