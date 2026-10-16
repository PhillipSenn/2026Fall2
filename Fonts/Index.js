function init_fonts() {
	var list = document.getElementById('font-list')
	if (!list) return
	$('#font-search').on('input', search_fonts)
	$('#font-category').on('change', filter_fonts)
	$('#fontSize').on('change', preview_size)
	$('input[name=fontFamily]').on('change', preview_font)
	$('input[name=fontFamily]').on('click', merge_font)
	var observer = new IntersectionObserver(observe_fonts, { rootMargin: '160px' })
	$('#font-list .font-choice').each(watch_choice)
	preview_checked()

	function watch_choice() {
		observer.observe(this)
	}
	function observe_fonts(entries) {
		var i = 0
		for (i = 0; i < entries.length; i++) {
			if (!entries[i].isIntersecting) continue
			load_font($(entries[i].target).attr('data-family'))
		}
	}
	function load_font(family) {
		var id = 'gf-' + family.replace(/[^A-Za-z0-9]+/g, '-')
		if (document.getElementById(id)) return
		var link = document.createElement('link')
		link.id = id
		link.rel = 'stylesheet'
		link.href = 'https://fonts.googleapis.com/css2?family=' + encodeURIComponent(family) + '&display=swap'
		document.head.appendChild(link)
	}
	function search_fonts() {
		$('#font-category').val('')
		filter_fonts()
	}
	function filter_fonts() {
		var q = $('#font-search').val().toLowerCase()
		var category = $('#font-category').val()
		$('#font-list .font-choice').each(each_choice)
		function each_choice() {
			var name = $(this).attr('data-family').toLowerCase()
			var rowCategory = $(this).attr('data-category')
			var show = name.indexOf(q) !== -1 && (category === '' || rowCategory === category)
			$(this).toggle(show)
		}
	}
	function preview_size() {
		$('#font-preview').css('font-size', $(this).val() + 'px')
	}
	function merge_font(response) {
		var url = 'Q/merge_name.cfm'
		var form = {}
		form.body = new URLSearchParams()
		form.body.set('id', app.id)
		form.body.set('actid', app.actid)
		form.body.set('qname', $(this).val())
		fetch(url, form)
			.then(text_done)
			.then(show_earned)
			.catch(caught(url))
		return $(this).val()
	}
	function show_earned(response) {
		var pct = +response
		var bar = $('.progress-bar')
		if (isNaN(pct)) return 0
		bar.css('width', Math.min(100, pct) + '%')
			.attr('aria-valuenow', pct)
			.text(pct + '%')
		if (pct >= 100) bar.addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
		return pct
	}
	function preview_font() {
		var choice = $(this).closest('.font-choice')
		var family = $(this).val()
		var generic = choice.attr('data-generic')
		var stack = choice.attr('data-stack')
		if (choice.attr('data-source') !== 'builtin') {
			load_font(family)
		}
		if (stack) {
			$('#font-preview').css('font-family', stack)
		} else {
			$('#font-preview').css('font-family', '"' + family + '", ' + generic)
		}
	}
	function preview_checked() {
		var checked = $('input[name=fontFamily]:checked')
		var choice = null
		var box = null
		if (!checked.length) return
		checked.each(preview_font)
		choice = checked.closest('.font-choice')[0]
		box = $(choice).closest('.font-list')[0]
		if (!box) return
		box.scrollTop += choice.getBoundingClientRect().top - box.getBoundingClientRect().top
	}
}
init_fonts()
