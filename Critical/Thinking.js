$(document).on('paste','[name=pollname]',nopaste)
$(document).on('input','[name=pollname]',gradeLevel)
gradeLevel()

function nopaste(response) {
	response.preventDefault()
	var header = $(this).closest('.card').children('.card-header')
	if (!header.data('label')) {
		header.data('label', header.text())
	}
	header.text('Paste has been disabled')
		.removeClass('bg-primary-subtle')
		.addClass('bg-danger-subtle')
	clearTimeout(nopaste.timer)
	nopaste.timer = setTimeout(restore, 2000)

	function restore() {
		header.text(header.data('label'))
			.removeClass('bg-danger-subtle')
			.addClass('bg-primary-subtle')
	}
}

function gradeLevel() {
	var text = $('[name=pollname]').val()
	var grade = fleschKincaid(text)
	var save = canSave(grade)
	$('#Flesch-Kincaid').text(grade)
	$('#save')
		.prop('disabled', !save)
		.toggleClass('btn-primary', save)
		.toggleClass('btn-outline-primary', !save)
}

function canSave(grade) {
	var level = parseFloat(grade)
	return level >= 4 && level <= 8
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