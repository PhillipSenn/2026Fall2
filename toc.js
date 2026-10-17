var url = new URL(window.location.href)

if (url.searchParams.has('accordion')) {
	$('form.card ul').addClass('list-unstyled')
	$('form.card li > ul').each(each_section)
}

function each_section() {
	var ul = $(this)
	var li = ul.parent()
	var textNode = null
	li.contents().each(find_label)
	if (!textNode) return

	var accordion = $('<div class="accordion">')
	var details = $('<details class="accordion-item">')
	var summary = $('<summary class="accordion-header">')
	var body = $('<div class="accordion-body">')

	summary.text(textNode.textContent.trim())
	$(textNode).remove()
	body.append(ul)
	details.append(summary, body)
	accordion.append(details)
	li.append(accordion)

	function find_label() {
		if (this.nodeType === Node.TEXT_NODE && this.textContent.trim()) {
			textNode = this
			return false
		}
	}
}
