var carouselEl = document.getElementById('appsCarousel')
var titleEl = document.getElementById('appsTitle')
var downloadsEl = document.getElementById('appsDownloads')
var total = 0
var answeredCount = 0
var seen = {}
var carouselApi = null
var ignoreSlides = false
var altHeld = false

if (carouselEl && titleEl) {
	total = Number(carouselEl.getAttribute('data-total') || carouselEl.querySelectorAll('.carousel-item').length)
	answeredCount = Number(carouselEl.getAttribute('data-answered-count') || 0)
	String(carouselEl.getAttribute('data-answered') || '').split(',').forEach(mark_seen)
	carouselEl.addEventListener('slid.bs.carousel', on_slide)
	$('#appsSkipForward').on('click', skip_forward)
	$('#appsCats [data-catid]').on('click', cat_click)
	$(document).on('keydown', alt_down)
	$(document).on('keyup', alt_up)
	$(window).on('blur', alt_up)
	update_title()
	update_downloads()
	update_cat()
	update_skip_forward()
}

function first_unanswered_index() {
	var items = carouselEl.querySelectorAll('.carousel-item')
	var i
	var qid
	for (i = 0; i < items.length; i++) {
		qid = String(items[i].getAttribute('data-qid') || '').trim()
		if (qid && !seen[qid]) {
			return i
		}
	}
	return -1
}

function active_index() {
	var active = carouselEl.querySelector('.carousel-item.active')
	return active ? Number(active.getAttribute('data-slide-index') || 1) - 1 : 0
}

function mark_seen(qid) {
	qid = String(qid || '').trim()
	if (qid) {
		seen[qid] = true
	}
}

function on_slide() {
	update_title()
	update_downloads()
	update_cat()
	update_skip_forward()
}

function update_title() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var name = active ? String(active.getAttribute('data-qname') || '').trim() : ''
	var href = active ? String(active.getAttribute('data-href') || '').trim() : ''
	var link
	if (!name) {
		return
	}
	titleEl.textContent = ''
	if (href) {
		link = document.createElement('a')
		link.href = href
		link.target = '_blank'
		link.rel = 'noopener noreferrer'
		link.textContent = name
		titleEl.appendChild(link)
		return
	}
	titleEl.textContent = name
}

function update_downloads() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var downloads = active ? String(active.getAttribute('data-downloads') || '').trim() : ''
	if (downloadsEl && downloads) {
		downloadsEl.textContent = downloads
	}
}

function update_cat() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var catid = active ? String(active.getAttribute('data-catid') || '') : ''
	$('#appsCats [data-catid]').each(each_cat)
	function each_cat() {
		var on = String($(this).attr('data-catid') || '') === catid
		if (altHeld && on) {
			$(this).removeClass('btn-outline theme-primary').addClass('btn-solid theme-success')
		} else {
			$(this).removeClass('btn-solid theme-success').addClass('btn-outline theme-primary')
		}
	}
}

function alt_down(event) {
	if (event.key !== 'Alt' || event.repeat) {
		return
	}
	event.preventDefault()
	altHeld = true
	update_cat()
}

function alt_up(event) {
	if (event.key && event.key !== 'Alt') {
		return
	}
	altHeld = false
	update_cat()
}

function update_skip_forward() {
	var btn = document.getElementById('appsSkipForward')
	var active = carouselEl.querySelector('.carousel-item.active')
	var qid = active ? String(active.getAttribute('data-qid') || '').trim() : ''
	var disabled = !qid || !seen[qid]
	if (!btn) {
		return
	}
	btn.disabled = disabled
	btn.setAttribute('aria-disabled', disabled ? 'true' : 'false')
}

function cat_click() {
	var catid = String($(this).attr('data-catid') || '')
	var active = carouselEl.querySelector('.carousel-item.active')
	var currentCat = active ? String(active.getAttribute('data-catid') || '') : ''
	var current = active_index()
	var items = carouselEl.querySelectorAll('.carousel-item')
	var target = current + 1
	if (catid !== currentCat) {
		return
	}
	view_active()
	if (target >= items.length) {
		return
	}
	jump_to(target)
}

function view_active() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var qid = active ? String(active.getAttribute('data-qid') || '') : ''
	if (!qid || seen[qid]) {
		update_skip_forward()
		return
	}
	seen[qid] = true
	update_skip_forward()
	dec_cat_badge(active)
	merge_q(qid)
}

function dec_cat_badge(active) {
	var catid = active ? String(active.getAttribute('data-catid') || '') : ''
	var badge
	var n
	if (!catid) {
		return
	}
	badge = document.querySelector('#appsCats [data-catid="' + catid + '"] .badge')
	if (!badge) {
		return
	}
	n = Math.max(0, Number(badge.textContent || 0) - 1)
	badge.textContent = String(n)
}

function merge_q(qid) {
	var url = '../Poll/merge_q.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', qid)
	fetch(url, form)
		.then(text_done)
		.then(show_earned)
		.catch(caught(url))
}

function show_earned(response) {
	var pct = +response
	answeredCount += 1
	$('.progress-bar').css('width', pct + '%')
		.text(answeredCount + '/' + total + ' (' + pct + '%)')
		.attr('aria-valuenow', pct)
	if (pct >= 100) {
		$('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
	}
}

function skip_forward() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var currentQid = active ? String(active.getAttribute('data-qid') || '').trim() : ''
	var items = carouselEl.querySelectorAll('.carousel-item')
	var current = active_index() + 1
	var i
	var qid
	var index
	var target = -1
	if (!currentQid || !seen[currentQid]) {
		update_skip_forward()
		return
	}
	for (i = 0; i < items.length; i++) {
		index = Number(items[i].getAttribute('data-slide-index') || (i + 1))
		if (index <= current) {
			continue
		}
		qid = String(items[i].getAttribute('data-qid') || '').trim()
		if (qid && !seen[qid]) {
			target = i
			break
		}
	}
	if (target < 0) {
		target = first_unanswered_index()
	}
	if (target < 0 || target === active_index()) {
		return
	}
	jump_to(target)
}

function jump_to(zeroBased) {
	ignoreSlides = true
	return ensure_carousel().then(moved)
	function moved(carousel) {
		return new Promise(finish_jump)
		function finish_jump(resolve) {
			var done = false
			var safety
			function landed() {
				if (done || active_index() !== zeroBased) {
					return
				}
				done = true
				carouselEl.removeEventListener('slid.bs.carousel', landed)
				window.clearTimeout(safety)
				ignoreSlides = false
				update_title()
				update_downloads()
				update_cat()
				update_skip_forward()
				resolve()
			}
			if (active_index() === zeroBased) {
				ignoreSlides = false
				update_title()
				update_downloads()
				update_cat()
				update_skip_forward()
				resolve()
				return
			}
			carouselEl.addEventListener('slid.bs.carousel', landed)
			safety = window.setTimeout(function() {
				if (done) {
					return
				}
				done = true
				carouselEl.removeEventListener('slid.bs.carousel', landed)
				ignoreSlides = false
				update_title()
				update_downloads()
				update_cat()
				update_skip_forward()
				resolve()
			}, 2000)
			carousel.to(zeroBased)
		}
	}
}

function ensure_carousel() {
	if (carouselApi) {
		return Promise.resolve(carouselApi)
	}
	return import(bootstrap_url()).then(loaded)
	function loaded(mod) {
		carouselApi = mod.Carousel.getOrCreateInstance(carouselEl, {wrap: false})
		return carouselApi
	}
}

function bootstrap_url() {
	var scripts = document.getElementsByTagName('script')
	var i
	for (i = 0; i < scripts.length; i++) {
		if (/bootstrap[^/]*\.js/i.test(scripts[i].src || '')) {
			return scripts[i].src
		}
	}
	return 'https://cdn.jsdelivr.net/npm/bootstrap@6.0.0-alpha.1/dist/js/bootstrap.bundle.js'
}
