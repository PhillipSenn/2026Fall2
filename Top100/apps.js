var carouselEl = document.getElementById('appsCarousel')
var counterEl = document.getElementById('appsCounter')
var total = 0
var answeredCount = 0
var seen = {}
var carouselApi = null
var SKIP = 10
var ignoreSlides = false

if (carouselEl && counterEl) {
	total = Number(carouselEl.getAttribute('data-total') || carouselEl.querySelectorAll('.carousel-item').length)
	answeredCount = Number(carouselEl.getAttribute('data-answered-count') || 0)
	String(carouselEl.getAttribute('data-answered') || '').split(',').forEach(mark_seen)
	carouselEl.addEventListener('slid.bs.carousel', on_slide)
	$('#appsSkipBack').on('click', skip_back)
	$('#appsSkipForward').on('click', skip_forward)
	update_counter()
	resume_start()
}

function resume_start() {
	var target = first_unanswered_index()
	if (target < 0) {
		target = 0
	}
	if (active_index() !== target) {
		jump_to(target)
		return
	}
	view_active()
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
	update_counter()
	if (ignoreSlides) {
		return
	}
	view_active()
}

function update_counter() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var index = active ? Number(active.getAttribute('data-slide-index') || 1) : 1
	counterEl.textContent = index + ' / ' + total
}

function view_active() {
	var active = carouselEl.querySelector('.carousel-item.active')
	var qid = active ? String(active.getAttribute('data-qid') || '') : ''
	if (!qid || seen[qid]) {
		return
	}
	seen[qid] = true
	merge_q(qid)
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

function skip_back() {
	var index = active_index() + 1
	var target = Math.max(1, index - SKIP)
	if (target === index) {
		return
	}
	jump_to(target - 1)
}

function skip_forward() {
	var items = carouselEl.querySelectorAll('.carousel-item')
	var current = active_index() + 1
	var i
	var qid
	var index
	var target = -1
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
				update_counter()
				view_active()
				resolve()
			}
			if (active_index() === zeroBased) {
				ignoreSlides = false
				update_counter()
				view_active()
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
				update_counter()
				if (active_index() === zeroBased) {
					view_active()
				}
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
		carouselApi = mod.Carousel.getOrCreateInstance(carouselEl)
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
