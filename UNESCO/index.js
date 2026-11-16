$('#filter-category').on('change', filter_sites)
$('.sort-col').on('click', sort_column)

var sortKey = ''
var sortAsc = true

function sort_column() {
	var key = $(this).attr('data-sort')
	if (sortKey === key) {
		sortAsc = !sortAsc
	} else {
		sortKey = key
		sortAsc = key === 'rowid'
	}
	var $tbody = $('#sites tbody')
	var rows = $tbody.children('tr').get()
	rows.sort(compare_rows)
	$tbody.append(rows)
}

function compare_rows(a, b) {
	var aVal = Number($(a).attr('data-' + sortKey))
	var bVal = Number($(b).attr('data-' + sortKey))
	return sortAsc ? aVal - bVal : bVal - aVal
}

function filter_sites() {
	var categoryid = $('#filter-category').val()

	$('#sites tbody tr').each(function () {
		var $row = $(this)
		var show = !categoryid || $row.attr('data-categoryid') === categoryid
		$row.toggle(show)
	})
}
