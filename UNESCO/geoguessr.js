var map = null
var mapReady = false
var poiPositions = []
var poiMarkers = []
var studentMarker = null
var guessMarkers = []
var guessPaths = []

if ('scrollRestoration' in history) {
	history.scrollRestoration = 'manual'
}
$(window).scrollTop(0)

;(function () {
	bindPanel('#desc-panel', '#desc-open', '#desc-close', '#desc-backdrop')
	bindPanel('#results-panel', '#results-open', '#results-close', '#desc-backdrop')

	function bindPanel(panelSel, openSel, closeSel, backdropSel) {
		var panel = $(panelSel)
		var backdrop = $(backdropSel)
		var openBtn = $(openSel)
		var closeBtn = $(closeSel)
		if (!panel.length || !backdrop.length || !openBtn.length || !closeBtn.length) {
			return
		}

		openBtn.on('click', openPanel)
		closeBtn.on('click', closePanel)
		backdrop.on('click', closeAllPanels)
		backdrop.on('wheel', closeAllPanels)
		backdrop.on('mousedown', onBackdropMouseDown)
		$(document).on('keydown', onKeydown)

		function onBackdropMouseDown(event) {
			if (event.button === 1) {
				closeAllPanels()
			}
		}

		function openPanel() {
			closeAllPanels()
			panel.addClass('is-open').attr('aria-hidden', 'false')
			openBtn.attr('aria-expanded', 'true')
			backdrop.prop('hidden', false)
		}

		function closePanel() {
			panel.removeClass('is-open').attr('aria-hidden', 'true')
			openBtn.attr('aria-expanded', 'false')
			if (!$('.desc-panel.is-open').length) {
				backdrop.prop('hidden', true)
			}
		}

		function onKeydown(event) {
			if (event.key === 'Escape' && panel.hasClass('is-open')) {
				closePanel()
			}
		}
	}

	function closeAllPanels() {
		$('.desc-panel.is-open').each(function () {
			var panel = $(this)
			var openBtn = $('[aria-controls="' + panel.attr('id') + '"]')
			panel.removeClass('is-open').attr('aria-hidden', 'true')
			openBtn.attr('aria-expanded', 'false')
		})
		$('#desc-backdrop').prop('hidden', true)
	}

	window.openResultsPanel = function () {
		closeAllPanels()
		$('#results-panel').addClass('is-open').attr('aria-hidden', 'false')
		$('#results-open').attr('aria-expanded', 'true')
		$('#desc-backdrop').prop('hidden', false)
	}
})()

function initMap() {
	if (mapReady) {
		return
	}
	if (!$('#map').length) {
		return
	}

	mapReady = true
	poiPositions = []
	poiMarkers = []

	map = new google.maps.Map($('#map')[0], {
		center: { lat: 20, lng: 0 },
		zoom: 2,
		minZoom: 2,
		gestureHandling: 'greedy',
		streetViewControl: false,
		fullscreenControl: true,
		mapTypeControl: true
	})

	$('#poi tbody tr').each(addPoiMarker)
	map.addListener('click', mapClicked)
}

function addPoiMarker() {
	var cells = $(this).find('td')
	var lat = parseFloat(cells.eq(0).text())
	var lng = parseFloat(cells.eq(1).text())
	var iso2 = String(cells.eq(2).text()).trim()

	if (isNaN(lat) || isNaN(lng)) {
		return
	}

	var position = { lat: lat, lng: lng }
	poiPositions.push(position)

	poiMarkers.push(new google.maps.Marker({
		position: position,
		map: null,
		title: iso2 || (lat + ', ' + lng)
	}))
}

function mapClicked(event) {
	var position = event.latLng

	if (studentMarker) {
		return
	}

	studentMarker = new google.maps.Marker({
		position: position,
		map: map,
		draggable: false,
		optimized: false,
		icon: {
			path: google.maps.SymbolPath.CIRCLE,
			scale: 0
		},
		label: {
			text: iconFromCodePoint($('#codePoint').text()),
			fontSize: '28px'
		},
		title: 'Your guess'
	})

	showPoiMarkers()
	saveGuess(position)
}

function showPoiMarkers() {
	var i
	for (i = 0; i < poiMarkers.length; i++) {
		poiMarkers[i].setMap(map)
	}
}

function saveGuess(position) {
	var url = 'UG/merge_row.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('rowid', $('#rowid').text())
	form.body.set('lat', position.lat())
	form.body.set('lng', position.lng())
	fetch(url, form)
		.then(json_done)
		.then(showGuessResults)
		.catch(caught(url))
}

function showGuessResults(response) {
	var rows = queryRows(response)
	var results = []
	var i
	var row
	var lat
	var lng
	var closest
	var miles

	clearGuessOverlays()

	for (i = 0; i < rows.length; i++) {
		row = rows[i]
		lat = parseFloat(row.ug_lat)
		lng = parseFloat(row.ug_lng)
		if (isNaN(lat) || isNaN(lng)) {
			continue
		}
		closest = findClosestPoi(lat, lng)
		if (!closest) {
			continue
		}
		miles = distanceMiles(lat, lng, closest.lat, closest.lng)
		results.push({
			firstname: row.firstname || '',
			ugdate: row.ugdate || '',
			miles: miles,
			codePoint: row.codePoint || row.codepoint || '',
			lat: lat,
			lng: lng,
			closest: closest
		})
		drawGuessPath(lat, lng, closest)
		if (!isCurrentStudent(row)) {
			addGuessMarker(lat, lng, row)
		}
	}

	results.sort(byMiles)
	fillResultsTable(results)
	openResultsPanel()
}

function isCurrentStudent(row) {
	var mine = String($('#codePoint').text()).trim().toUpperCase()
	var theirs = String(row.codePoint || row.codepoint || '').trim().toUpperCase()
	return mine && theirs && mine === theirs
}

function clearGuessOverlays() {
	var i
	for (i = 0; i < guessPaths.length; i++) {
		guessPaths[i].setMap(null)
	}
	for (i = 0; i < guessMarkers.length; i++) {
		guessMarkers[i].setMap(null)
	}
	guessPaths = []
	guessMarkers = []
}

function drawGuessPath(lat, lng, closest) {
	guessPaths.push(new google.maps.Polyline({
		path: [
			{ lat: lat, lng: lng },
			closest
		],
		geodesic: true,
		strokeColor: '#00AEEF',
		strokeOpacity: 1,
		strokeWeight: 3,
		map: map
	}))
}

function addGuessMarker(lat, lng, row) {
	guessMarkers.push(new google.maps.Marker({
		position: { lat: lat, lng: lng },
		map: map,
		optimized: false,
		icon: {
			path: google.maps.SymbolPath.CIRCLE,
			scale: 0
		},
		label: {
			text: iconFromCodePoint(row.codePoint || row.codepoint),
			fontSize: '28px'
		},
		title: row.firstname || ''
	}))
}

function fillResultsTable(results) {
	var tbody = $('#results tbody')
	var i
	tbody.empty()
	for (i = 0; i < results.length; i++) {
		tbody.append(
			$('<tr>').append(
				$('<td>').text(results[i].firstname),
				$('<td>').text(formatGuessDate(results[i].ugdate)),
				$('<td class="text-end">').text(Math.round(results[i].miles).toLocaleString())
			)
		)
	}
}

function formatGuessDate(value) {
	var date
	if (!value) {
		return ''
	}
	date = new Date(value)
	if (isNaN(date.getTime())) {
		return String(value)
	}
	return date.toLocaleString(undefined, {
		month: 'short',
		day: 'numeric',
		hour: 'numeric',
		minute: '2-digit'
	})
}

function byMiles(a, b) {
	return a.miles - b.miles
}

function queryRows(response) {
	var columns
	var data
	var rows
	var i
	var j
	var row
	if (!response) {
		return []
	}
	if (Array.isArray(response)) {
		return response
	}
	columns = response.COLUMNS || response.columns
	data = response.DATA || response.data
	if (!columns || !data) {
		return []
	}
	rows = []
	for (i = 0; i < data.length; i++) {
		row = {}
		for (j = 0; j < columns.length; j++) {
			row[columns[j]] = data[i][j]
			row[String(columns[j]).toLowerCase()] = data[i][j]
		}
		rows.push(row)
	}
	return rows
}

function findClosestPoi(lat, lng) {
	var closest = null
	var closestDistance = Infinity
	var i
	var position
	var distance

	for (i = 0; i < poiPositions.length; i++) {
		position = poiPositions[i]
		distance = distanceMeters(lat, lng, position.lat, position.lng)
		if (distance < closestDistance) {
			closestDistance = distance
			closest = position
		}
	}

	return closest
}

function distanceMeters(lat1, lng1, lat2, lng2) {
	var toRad = Math.PI / 180
	var dLat = (lat2 - lat1) * toRad
	var dLng = (lng2 - lng1) * toRad
	var a = Math.sin(dLat / 2) * Math.sin(dLat / 2) +
		Math.cos(lat1 * toRad) * Math.cos(lat2 * toRad) *
		Math.sin(dLng / 2) * Math.sin(dLng / 2)
	return 6371000 * 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
}

function distanceMiles(lat1, lng1, lat2, lng2) {
	return distanceMeters(lat1, lng1, lat2, lng2) / 1609.344
}

function iconFromCodePoint(codePoint) {
	var parts = String(codePoint || '').split('-')
	var chars = ''
	var i
	var point
	for (i = 0; i < parts.length; i++) {
		point = parseInt(parts[i], 16)
		if (!isNaN(point)) {
			chars += String.fromCodePoint(point)
		}
	}
	if (!chars) {
		chars = String.fromCodePoint(0x1F4CD)
	}
	return chars
}

function googleMapsError() {
	$('#map').text('Google Maps failed to load.')
}

if (typeof googleMapsLoaded !== 'undefined' && googleMapsLoaded) {
	initMap()
}
