var originalGrade
var originalResponse
var isAdmin = +$('#isAdmin').val() || 0
if (isAdmin < 1) {
	$(document).on('paste','[name=pollname]',nopaste)
}
$(document).on('input','[name=pollname]',gradeLevel)
$(document).on('click','#askAI',askAI)
gradeLevel()
askOriginal()

function nopaste(response) {
	response.preventDefault()
	var header = $(this).closest('.card').children('.card-header')
	if (!header.data('label')) {
		header.data('label', header.text())
	}
	header.text('Paste has been disabled')
		.removeClass('bg-subtle-primary')
		.addClass('bg-danger-subtle')
	clearTimeout(nopaste.timer)
	nopaste.timer = setTimeout(restore, 2000)

	function restore() {
		header.text(header.data('label'))
			.removeClass('bg-danger-subtle')
			.addClass('bg-subtle-primary')
	}
}

function gradeLevel() {
	var text = $('[name=pollname]').val()
	$('#Flesch-Kincaid').text(fleschKincaid(text))
	setSave(false)
}

function setSave(save) {
	$('#save')
		.prop('disabled', !save)
		.toggleClass('btn-primary', save)
		.toggleClass('btn-outline-primary', !save)
}

function canSave(grade, meaningPreserved) {
	if (originalGrade == null) {
		return false
	}
	return parseFloat(grade) < originalGrade && meaningPreserved
}

function originalText() {
	return $('#original').val()
}

function sameAsOriginal(pollname) {
	return pollname.trim() === originalText().trim()
}

function postGroq(pollname) {
	var url = 'groq.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qname', originalText())
	form.body.set('pollname', pollname)
	return fetch(url, form)
		.then(json_done)
		.catch(caught(url))
}

function askOriginal() {
	$('#askAI').prop('disabled', true)
	$('#original-grade').text('Asking AI...')
	postGroq(originalText())
		.then(showOriginal)
		.then(enableAsk)
}

function showOriginal(response) {
	if (!response) {
		return
	}
	originalResponse = response
	originalGrade = parseFloat(response.grade)
	$('#original-grade').text(originalGrade)
}

function askAI(response) {
	var pollname = $('[name=pollname]').val()
	response.preventDefault()
	setSave(false)
	$('#askAI').prop('disabled', true)
	$('#ai-grade').text('')
	$('#ai-meaning').text('')
	setTone($('#ai-grade').parent(), null)
	setTone($('#ai-meaning').parent(), null)
	$('#ai-reason').text('Asking AI...')
	$('#ai-words').text('')
	$('#ai-feedback').removeAttr('hidden')
	if (sameAsOriginal(pollname) && originalResponse) {
		showAI(originalResponse)
		enableAsk()
		return
	}
	postGroq(pollname)
		.then(showAI)
		.then(enableAsk)
}

function leftoverWords(words, pollname) {
	var kept = []
	var i = 0
	if (!words || !words.length) {
		return kept
	}
	for (i = 0; i < words.length; i++) {
		if (wordInText(words[i], pollname)) {
			kept.push(words[i])
		}
	}
	return kept
}

function wordInText(word, text) {
	var escaped = String(word).replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
	return new RegExp('\\b' + escaped + '\\b', 'i').test(text)
}

function showAI(response) {
	var words
	if (!response) {
		return
	}
	words = leftoverWords(response.difficultWords, $('[name=pollname]').val())
	if (!words.length) {
		words = 'none'
	} else {
		words = words.join(', ')
	}
	$('#ai-grade').text(response.grade)
	$('#ai-meaning').text(response.meaningPreserved ? 'Yes' : 'No')
	setTone($('#ai-grade').parent(), parseFloat(response.grade) < originalGrade)
	setTone($('#ai-meaning').parent(), !!response.meaningPreserved)
	$('#ai-reason').text(response.reason)
	$('#ai-words').text(words)
	setSave(canSave(response.grade, response.meaningPreserved))
}

function setTone(el, pass) {
	$(el)
		.removeClass('text-success text-danger')
		.toggleClass('text-success', pass === true)
		.toggleClass('text-danger', pass === false)
}

function enableAsk() {
	$('#askAI').prop('disabled', false)
}

function fleschKincaid(text) {
	var words = wordList(text)
	var sentences = sentenceCount(text)
	var syllables = 0
	var i = 0
	var grade = 0
	if (!words.length) {
		return ''
	}
	for (i = 0; i < words.length; i++) {
		syllables += syllableCount(words[i])
	}
	grade = 0.39 * (words.length / sentences) + 11.8 * (syllables / words.length) - 15.59
	return grade.toFixed(1)
}

function wordList(text) {
	return text.match(/[A-Za-z]+(?:'[A-Za-z]+)?/g) || []
}

function sentenceCount(text) {
	var sentences = text.match(/[^.!?]+[.!?]+/g)
	var trimmed = text.trim()
	if (!trimmed) {
		return 0
	}
	if (!sentences) {
		return 1
	}
	if (!/[.!?]$/.test(trimmed)) {
		return sentences.length + 1
	}
	return sentences.length
}

function syllableCount(word) {
	var groups = []
	word = word.toLowerCase().replace(/[^a-z]/g, '')
	if (!word) {
		return 0
	}
	if (word.length <= 3) {
		return 1
	}
	word = word.replace(/(?:[^laeiouy]es|ed|[^laeiouy]e)$/, '')
	word = word.replace(/^y/, '')
	groups = word.match(/[aeiouy]{1,}/g)
	if (!groups) {
		return 1
	}
	if (/ian$/.test(word)) {
		return groups.length + 1
	}
	return groups.length
}