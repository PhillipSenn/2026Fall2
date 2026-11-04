var watched = []
var startSecond = +$('#startSecond').text() || 0
var videoId = $('#videoId').text()
var player
var tickTimer
var duration = 0
var requiredSeconds = 0
var gradeUrl = '../Grade/merge_act.cfm'

loadYouTubeApi()
$(window).on('pagehide', saveGradeBeacon)
$(window).on('blur', pauseOnBlur)
$(document).on('visibilitychange', pauseWhenHidden)

function pausePlayer() {
	if (!player || !player.pauseVideo) {
		return
	}
	player.pauseVideo()
}

function pauseWhenHidden() {
	if (!document.hidden) {
		return
	}
	pausePlayer()
}

function pauseOnBlur() {
	setTimeout(pauseUnlessPlayerFocused, 0)
}

function pauseUnlessPlayerFocused() {
	if (document.activeElement && document.activeElement.tagName === 'IFRAME') {
		return
	}
	pausePlayer()
}

function loadYouTubeApi() {
	if (window.YT && YT.Player) {
		onYouTubeIframeAPIReady()
		return
	}
	window.onYouTubeIframeAPIReady = onYouTubeIframeAPIReady
	$.getScript('https://www.youtube.com/iframe_api')
}

function onYouTubeIframeAPIReady() {
	player = new YT.Player('player', {
		videoId: videoId,
		playerVars: {
			start: startSecond,
			rel: 0,
			modestbranding: 1
		},
		events: {
			onReady: onPlayerReady,
			onStateChange: onPlayerStateChange
		}
	})
}

function onPlayerReady(response) {
	duration = player.getDuration() || 0
	requiredSeconds = Math.max(0, Math.floor(duration) - startSecond)
	updateProgress()
	updateSummary()
}

function onPlayerStateChange(response) {
	if (response.data === YT.PlayerState.PLAYING) {
		duration = player.getDuration() || duration
		requiredSeconds = Math.max(0, Math.floor(duration) - startSecond)
		window.focus()
		startTick()
		return
	}
	stopTick()
	if (response.data === YT.PlayerState.ENDED) {
		markSecond(Math.floor(duration) - 1)
		updateProgress()
		updateSummary()
		saveGrade()
	}
}

function progressPercent() {
	if (requiredSeconds <= 0) {
		return 0
	}
	return Math.min(100, Math.floor(watchedInRange() / requiredSeconds * 100))
}

function gradeBody() {
	var body = new URLSearchParams()
	body.set('id', app.id)
	body.set('actid', app.actid)
	body.set('earned', progressPercent())
	return body
}

function saveGrade() {
	var form = {}
	form.body = gradeBody()
	fetch(gradeUrl, form)
		.then(text_done)
		.then(showEarned)
		.catch(caught(gradeUrl))
}

function saveGradeBeacon() {
	navigator.sendBeacon(
		gradeUrl,
		new Blob([gradeBody().toString()], {type: 'application/x-www-form-urlencoded'})
	)
}

function showEarned(response) {
	var earned = +response
	var bar = $('.progress-bar')

	if (isNaN(earned)) {
		return response
	}
	bar.css('width', earned + '%')
		.attr('aria-valuenow', earned)
		.text(earned ? earned + '%' : '')
	if (earned >= 100) {
		bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
	return response
}

function startTick() {
	if (tickTimer) {
		return
	}
	tick()
	tickTimer = setInterval(tick, 1000)
}

function stopTick() {
	if (!tickTimer) {
		return
	}
	clearInterval(tickTimer)
	tickTimer = 0
}

function tick() {
	var second

	if (!player || !player.getCurrentTime) {
		return
	}
	second = Math.floor(player.getCurrentTime())
	markSecond(second)
	updateProgress()
	updateSummary()
}

function markSecond(second) {
	if (second < startSecond) {
		return
	}
	if (duration && second >= Math.floor(duration)) {
		return
	}
	if (watched.indexOf(second) !== -1) {
		return
	}
	watched.push(second)
	watched.sort(sortNumbers)
}

function sortNumbers(a, b) {
	return a - b
}

function updateProgress() {
	var bar = $('.progress-bar')
	var pct = progressPercent()

	bar.css('width', pct + '%')
		.attr('aria-valuenow', pct)
		.text(pct ? pct + '%' : '')
	if (pct >= 100) {
		bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
}

function watchedInRange() {
	var count = 0
	var i
	var second

	for (i = 0; i < watched.length; i++) {
		second = watched[i]
		if (second >= startSecond && second < Math.floor(duration)) {
			count++
		}
	}
	return count
}

function updateSummary() {
	var ranges = watchedRanges()
	var body = $('#watchedSummary')
	var i
	var range
	var rows = ''

	for (i = 0; i < ranges.length; i++) {
		range = ranges[i]
		rows += '<tr>'
			+ '<td>' + formatTime(range.from) + '</td>'
			+ '<td>' + formatTime(range.to) + '</td>'
			+ '</tr>'
	}
	body.html(rows)
}

function formatTime(totalSeconds) {
	var minutes = Math.floor(totalSeconds / 60)
	var seconds = totalSeconds % 60
	if (seconds < 10) {
		return minutes + ':0' + seconds
	}
	return minutes + ':' + seconds
}

function watchedRanges() {
	var ranges = []
	var i
	var second
	var range

	for (i = 0; i < watched.length; i++) {
		second = watched[i]
		if (second < startSecond) {
			continue
		}
		if (duration && second >= Math.floor(duration)) {
			continue
		}
		if (!range || second !== range.to + 1) {
			range = {
				from: second,
				to: second,
				seconds: 1
			}
			ranges.push(range)
			continue
		}
		range.to = second
		range.seconds++
	}
	return ranges
}
