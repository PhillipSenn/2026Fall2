$(document).on('change', '#databases .rank', rank_changed)
$(document).on('wheel', '#databases .rank', rank_wheel)

function rank_wheel(response) {
	response.target.blur()
}

function rank_changed(response) {
	var input = $(response.target)
	var rank = input.val().trim()
	sort_databases()
	if (rank !== '' && !/^[1-9]\d*$/.test(rank)) return
	if ((input.attr('data-saved') || '') === rank) return
	merge_q(input, rank)
}

function sort_databases() {
	var body = $('#databases tbody')
	var rows = body.children().get()
	rows.sort(compare_rows)
	$.each(rows, append_row)
	function compare_rows(a, b) {
		var aRank = rank_of(a)
		var bRank = rank_of(b)
		if (aRank === null && bRank === null) return name_of(a).localeCompare(name_of(b), undefined, {sensitivity: 'base'})
		if (aRank === null) return 1
		if (bRank === null) return -1
		if (aRank !== bRank) return aRank - bRank
		return name_of(a).localeCompare(name_of(b), undefined, {sensitivity: 'base'})
	}
	function append_row() {
		body.append(this)
	}
}

function rank_of(row) {
	var value = $(row).find('.rank').val().trim()
	if (!/^[1-9]\d*$/.test(value)) return null
	return +value
}

function name_of(row) {
	return $(row).attr('data-qname')
}

function merge_q(input, rank) {
	var url = 'Poll/merge_top5.cfm'
	var form = {}
	form.body = new URLSearchParams()
	form.body.set('id', app.id)
	form.body.set('qid', input.closest('[data-qid]').attr('data-qid'))
	form.body.set('pollname', rank)
	fetch(url, form)
		.then(text_done)
		.then(merged)
		.catch(caught(url))
	function merged(response) {
		var pct = +response
		input.attr('data-saved', rank)
		$('.progress-bar').css('width', pct + '%')
			.text(pct + '%')
			.attr('aria-valuenow', pct)
	}
}
