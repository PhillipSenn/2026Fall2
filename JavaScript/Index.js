var name = $('#firstname').text().replace(/\\/g, '\\\\').replace(/'/g, "\\'")
var firstnameBr = "'" + name + "<br>'"

var examples = {
	location: [
		'navigator.geolocation.getCurrentPosition(callback)',
		'function callback(response) {',
		"   document.write(response.coords.longitude + '<br>')",
		'   document.write(response.coords.latitude)',
		'}'
	].join('\n'),
	count: [
		'for (var i = 1; i <= 10; i = i + 1) {',
		"   document.write(i + '<br>')",
		'}'
	].join('\n'),
	loop: [
		'for (var i = 1; i <= 100; i = i + 1) {',
		'   document.write(' + firstnameBr + ')',
		'}'
	].join('\n'),
	speak: [
		'var lyrics = [',
		"   'Fair Star of Caroline, our college glorious,',",
		"   'Our college loved by all, to thee we sing.',",
		"   'May she forever shine, clear and bright, victorious.',",
		"   'To her our song of loyalty we bring.',",
		"   'Fling wide the red and black, sing aloud her praises!',",
		"   'This is the song we sing, Lenoir-Rhyne, to thee.',",
		"   'Fair Star of Caroline, our Alma Mater,',",
		"   'Our college best of all in this broad land.',",
		"   'Thou best beloved of every son and every daughter,',",
		"   'Thy children hail thy name on every hand.'",
		"].join(' ')",
		'speechSynthesis.speak(new SpeechSynthesisUtterance(lyrics))',
		'document.write(lyrics)'
	].join('\n')
}

$('.example-link').on('click', load_example)
$('#runBtn').on('click', press_run)

run_js()

function load_example(response) {
	response.preventDefault()
	var key = $(this).data('example')
	var code = examples[key]
	if (code === undefined) {
		return
	}
	speechSynthesis.cancel()
	$('.example-link').removeClass('active')
	$(this).addClass('active')
	$('#jsSource').val(code)
	if (key !== 'speak') {
		run_js()
	}
	return key
}

function press_run(response) {
	response.preventDefault()
	run_js()
	fetch(location.pathname + location.search, {
		method: 'post',
		body: new FormData($('form')[0])
	}).then(text_done).catch(caught(location.pathname))
	return false
}

function run_js() {
	var code = $('#jsSource').val()
	var frame = $('#jsPreview')[0]
	var doc = frame.contentDocument
	if (!doc) {
		return
	}
	speechSynthesis.cancel()
	doc.open()
	doc.write([
		'<!DOCTYPE html>',
		'<html lang="en">',
		'<head>',
		'<meta charset="utf-8">',
		'<style>',
		'body { margin: 0.75rem; font-family: Georgia, serif; line-height: 1.4; }',
		'</style>',
		'</head>',
		'<body>',
		'<script>',
		'try {',
		code,
		'} catch (error) {',
		'document.write(error.message)',
		'}',
		'<\/script>',
		'</body>',
		'</html>'
	].join('\n'))
	doc.close()
	return code
}
