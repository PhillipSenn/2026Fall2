$('.btn-link[type="button"]')
	.on('mousedown', incorrectDown) // mouseenter
	.on('mouseup mouseleave', incorrectUp)

function incorrectDown() {
	$(this).addClass('text-danger')
}

function incorrectUp() {
	$(this).removeClass('text-danger')
}

$('.btn-link:not([type="button"])')
	.on('mousedown', correctDown)

function correctDown() {
	$(this).removeClass('btn-link')
		.addClass('btn-success')
}

$('input[type=checkbox]').on('change', checkbox)

function checkbox() {
	$('label[for="' + this.id + '"]').toggleClass('text-success', this.checked)
	var answers = $('input[name=ansids]').length
	var checked = $('input[name=ansids]:checked').length

	if (checked === answers) {
		$(this).closest('form').submit()
	}
}

$('input[type=checkbox][tabindex=-1]').on('click', preventDefault)

function preventDefault(e) {
	e.preventDefault()
}

if (rowNumber.innerHTML) {
	var text = $('.progress-bar').text()
	$('.progress-bar').css('width', text)
		.append(' (' + rowNumber.innerHTML + ' / ' + questions.innerHTML + ')')
}

$(document).on('click','.bi-volume-up',volumeUp)
function volumeUp() {
	$('[name=Speech]').val(0)
	speechSynthesis.cancel()
	$(this).removeClass('bi-volume-up')
		.addClass('bi-volume-mute')
}
$(document).on('click','.bi-volume-mute',volumeMute)
$(document).on('change','#voiceName',volumeMute)
function volumeMute() {
	$('[name=Speech]').val(1)
	$('.bi-volume-mute').removeClass('bi-volume-mute')
		.addClass('bi-volume-up')
	var text = $('#qdesc').text().trim()
	text = text.replace('According to this module,', '').trim()
	var svc = new SpeechSynthesisUtterance(text)

	app.voiceName = $('#voiceName').val()
	var voices = speechSynthesis.getVoices()
	var voice
	$.each(voices, findVoice)
	function findVoice(index,obj) {
		if (obj.name == app.voiceName) {
			voice = obj
		}
	}
	svc.voice = voice
	
	svc.rate = +$('[name=SpeechRate]').val()
	svc.pitch = +$('[name=SpeechPitch]').val()
	svc.volume = +$('[name=SpeechVolume]').val()
	speechSynthesis.cancel()
	speechSynthesis.speak(svc)
}

var aloud = +$('[name=SpeechSynthesisUtterance]').val()
if (aloud) {
	setTimeout(volumeMute,1000)
}

$(document).on('click','.ansid',ansid)
function ansid() {
	var ansid = +$(this).val()
	get_text('guess/merge_ans.cfm?ansid=' + ansid)
}

var voices = []
speechSynthesis.onvoiceschanged = loadVoices
loadVoices()

function loadVoices() {
	voices = speechSynthesis.getVoices()
	app.voiceName = $('#voiceName').val()
	$('#voiceName').empty()
	$.each(voices, addVoice)

}
function addVoice(i, voice) {
	var option = document.createElement('option')
	option.value = voice.name
	option.textContent = voice.name + ' (' + voice.lang + ')'
	if (voice.name === app.voiceName) {
		option.selected = true
	}
	$('#voiceName').append(option)
}

