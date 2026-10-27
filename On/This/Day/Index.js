$('a[href]').each(externalLink)
$('.otd').on('click', '.otd-sidebar button[name="section"], .otd-sidebar a.btn', waitForPage)

var dayGrid = document.querySelector('.day-grid')
if (dayGrid) {
	var shownMonth = Number(dayGrid.dataset.month)
	$('.accordion').on('mouseover', '.yearFound', showYear)
		.on('mouseout', '.yearFound', hideYear)
}

function showYear() {
	$('.yearFound').removeClass('is-active')
	$(this).addClass('is-active')
	layoutYear(Number(this.dataset.year))
}

function hideYear(event) {
	if (event.relatedTarget && $(event.relatedTarget).closest('.yearFound').length) {
		return
	}
	$('.yearFound').removeClass('is-active')
}

function layoutYear(year) {
	var label = document.querySelector('.day-year')
	if (label) {
		label.textContent = year < 0 ? Math.abs(year) + ' BC' : String(year)
	}
	var buttons = Array.from(dayGrid.querySelectorAll('a'))
	var lead = new Date(year, shownMonth - 1, 1).getDay()
	var count = new Date(year, shownMonth, 0).getDate()
	var extra = dayGrid.querySelector('.day-extra')
	if (!extra) {
		extra = document.createElement('div')
		extra.className = 'day-extra'
		extra.hidden = true
	}
	buttons.forEach(function (button) {
		dayGrid.appendChild(button)
	})
	dayGrid.querySelectorAll('.btn-group').forEach(function (group) {
		group.remove()
	})
	dayGrid.appendChild(extra)
	var group = null
	buttons.forEach(function (button, index) {
		var day = index + 1
		if (day > count) {
			extra.appendChild(button)
			return
		}
		var column = (lead + day - 1) % 7
		if (!group || column === 0) {
			group = document.createElement('div')
			group.className = 'btn-group'
			group.setAttribute('role', 'group')
			if (day === 1 && lead > 0) {
				group.style.setProperty('--day-lead', String(lead))
			}
			dayGrid.appendChild(group)
		}
		group.appendChild(button)
	})
}

function waitForPage() {
	var control = $(this)
	var label = String(control.attr('aria-label') || control.attr('title') || control.text()).replace(/^\s+|\s+$/g, '')
	$('.otd-sidebar .is-waiting').removeClass('is-waiting').removeAttr('aria-busy')
	control.addClass('is-waiting').attr('aria-busy', 'true')
	$('.otd').addClass('is-loading')
	$('.otd-main').attr('aria-busy', 'true')
	$('.otd-status').text('Loading ' + label + '…')
}

function externalLink() {
	var url
	try {
		url = new URL(this.href)
	} catch (error) {
		return
	}
	if (url.protocol !== 'http:' && url.protocol !== 'https:') {
		return
	}
	if (url.hostname.toLowerCase() === location.hostname.toLowerCase()) {
		return
	}
	this.target = '_blank'
	this.rel = 'noopener noreferrer'
}
