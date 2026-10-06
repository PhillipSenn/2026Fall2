var dom = {}
dom.codePoint = $('[name="codePoint"]')

var state = {
	page:0,
	perPage:24,
	start:0,
	end:0,
	list:[]
}

var player = {
	baseEmoji:null,
	finalEmoji:null
}

var skinTones = [
	null,
	0x1F3FB,
	0x1F3FC,
	0x1F3FD,
	0x1F3FE,
	0x1F3FF
]

$(document).ready(init)

function init() {
	dom.container = $('#emojiContainer')
	dom.categories = $('#emojiCategories button')
	dom.skinSection = $('#skinToneSection')
	dom.skinContainer = $('#skinToneContainer')
	dom.selected = $('#selectedCharacter')

	dom.categories.on('click',categoryClick)

	loadCategory(dom.categories.first())
}

function categoryClick() {
	var self = $(this)

	dom.categories.removeClass('active')
	self.addClass('active')

	player.baseEmoji = null
	player.finalEmoji = null
	dom.selected.text('')
	dom.skinSection.attr('hidden',true)

	loadCategory(self)
}

function loadCategory(btn) {
	var startHex = btn.data('start')
	var endHex = btn.data('end')

	state.start = parseInt(startHex,16)
	state.end = parseInt(endHex,16)

	state.page = 0

	state.list = buildEmojiList()

	render()
}

function buildEmojiList() {
	var list = []
	var code
	var emoji

	for(code = state.start; code <= state.end; code = code + 1) {
		emoji = String.fromCodePoint(code)

		if(isValidEmoji(emoji)) {
			list.push(emoji)
		}
	}

	return list
}

function render() {
	dom.container.empty()

	var start = state.page * state.perPage
	var end = start + state.perPage

	var i

	for(i = start; i < end && i < state.list.length; i = i + 1) {
		addEmoji(state.list[i])
	}
	initTooltips()
}

function addEmoji(emoji) {
	var btn = $('<button class="btn btn-light"></button>')

	btn.text(emoji)
	btn.data('emoji',emoji)
	btn.attr('title', getEmojiName(emoji))
	btn.attr('data-bs-toggle', 'tooltip')
	btn.on('click',emojiSelect)

	dom.container.append(btn)
}


function showSkinTonePicker() {
	dom.skinContainer.empty()

	var i
	var emoji

	for(i = 0; i < skinTones.length; i = i + 1) {
		emoji = applySkinTone(player.baseEmoji,skinTones[i])

		addSkinToneButton(emoji,skinTones[i])
	}

	dom.skinSection.removeAttr('hidden')
}

function addSkinToneButton(emoji,tone) {
	var btn = $('<button class="btn btn-light"></button>')

	btn.text(emoji)
	btn.data('tone',tone)

	btn.on('click',skinToneSelect)

	dom.skinContainer.append(btn)
}

function skinToneSelect() {
	var self = $(this)

	var tone = self.data('tone')

	player.finalEmoji = applySkinTone(player.baseEmoji,tone)
	dom.codePoint.val(emojiToCodepoints(player.finalEmoji))
		.text(emojiToCodepoints(player.finalEmoji))
	dom.selected.text(player.finalEmoji)
}

function applySkinTone(baseEmoji,tone) {
	if(!tone) {
		return baseEmoji
	}

	var modifier = String.fromCodePoint(tone)

	return baseEmoji + modifier
}

function supportsSkinTone(emoji) {
	if(!emojiNameLookup || !emojiNameLookup[emoji]) {
		return false
	}

	return emojiNameLookup[emoji].skin_tone_support === true
}

function emojiSelect() {
	var self = $(this)

	var emoji = self.data('emoji')

	player.baseEmoji = emoji

	if(supportsSkinTone(emoji))	{
		player.finalEmoji = applySkinTone(emoji, skinTones[0])
		dom.selected.text(player.finalEmoji)
		showSkinTonePicker()
	} else {
		player.finalEmoji = emoji
		dom.selected.text(player.finalEmoji)
		dom.skinSection.attr('hidden',true)
	}
	dom.codePoint.val(emojiToCodepoints(player.finalEmoji))
		.text(emojiToCodepoints(player.finalEmoji))
}

function isValidEmoji(emoji) {
	if(emoji.trim() === '')	{
		return false
	}
	return true
}

function getEmojiName(emoji) {
    if (!emojiNameLookup || !emojiNameLookup[emoji]) {
        return 'emoji ' + emoji.codePointAt(0).toString(16).toUpperCase()
    }
    return emojiNameLookup[emoji].name || 'emoji ' + emoji.codePointAt(0).toString(16).toUpperCase()
}

var emojiNameLookup = {}

fetch('https://cdn.jsdelivr.net/npm/unicode-emoji-json@0.8.0/data-by-emoji.json')
	.then(function(response){
	  return response.json()
	})
	.then(function(data){
	  emojiNameLookup = data
	
	  // Now that names are loaded, initialize your first emoji category
	  loadCategory(dom.categories.first())
	})
	.catch(function(err){
	  console.error('Failed to load emoji names JSON', err)
	})

function initTooltips() {
    var tooltipList = document.querySelectorAll('[data-bs-toggle="tooltip"]')
    for (var i = 0; i < tooltipList.length; i = i + 1) {
        new bootstrap.Tooltip(tooltipList[i])
    }
}


function emojiToCodepoints(emoji) {
	var points = []

	for (var char of emoji) {
		points.push(char.codePointAt(0).toString(16).toUpperCase())
	}

	return points.join('-')
}
