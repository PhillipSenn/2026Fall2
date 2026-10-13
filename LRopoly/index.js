var STORAGE_KEY = 'lropoly-spaces'

pgm.load_spaces = function() {
	var saved = localStorage.getItem(STORAGE_KEY)
	var spaces
	if (!saved) {
		return
	}
	try {
		spaces = JSON.parse(saved)
	} catch (error) {
		return
	}
	$('.space').each(apply_saved)
	if (spaces.logo) {
		$('#logo').text(spaces.logo)
	}
	function apply_saved() {
		var id = $(this).attr('data-id')
		var item = spaces[id]
		if (!item) {
			return
		}
		if (item.name != null) {
			$(this).find('.space-name').text(item.name)
		}
		if (item.price != null && $(this).find('.space-price').length) {
			$(this).find('.space-price').text(item.price)
		}
	}
}

pgm.save_spaces = function(response) {
	var spaces = {}
	$('.space').each(collect_space)
	spaces.logo = $('#logo').text()
	localStorage.setItem(STORAGE_KEY, JSON.stringify(spaces))
	return response
	function collect_space() {
		spaces[$(this).attr('data-id')] = {
			name: $(this).find('.space-name').text(),
			price: $(this).find('.space-price').text()
		}
	}
}

pgm.reset_spaces = function(response) {
	$('.space').each(restore_default)
	$('#logo').text($('#logo').attr('data-default-name'))
	pgm.save_spaces(response)
	return response
	function restore_default() {
		$(this).find('.space-name').text($(this).attr('data-default-name') || '')
		if ($(this).find('.space-price').length) {
			$(this).find('.space-price').text($(this).attr('data-default-price') || '')
		}
	}
}

pgm.keydown_edit = function(response) {
	if (response.key === 'Enter') {
		response.preventDefault()
		$(this).blur()
	}
	return response.key
}

pgm.paste_plain = function(response) {
	response.preventDefault()
	var clip = response.originalEvent.clipboardData
	var text = clip.getData('text/plain')
	document.execCommand('insertText', false, text)
	return text
}

$('#board').on('focusout input', '.space-name, .space-price, #logo', pgm.save_spaces)
$('#board').on('keydown', '.space-name, .space-price, #logo', pgm.keydown_edit)
$('#board').on('paste', '.space-name, .space-price, #logo', pgm.paste_plain)
$('#reset').on('click', pgm.reset_spaces)
pgm.load_spaces()
