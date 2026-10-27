<cfscript>
param form.actid = 341;
request.title = 'On this day'
include '/Inc/header6.cfm'
flush;

monthNames = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']
monthAbbreviations = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
weekdays = ['Su', 'Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa']
monthNumber = month(now())
dayNumber = day(now())
if (structKeyExists(form, 'month') && isNumeric(form.month)) {
	monthNumber = val(form.month)
}
if (structKeyExists(form, 'day') && isNumeric(form.day)) {
	dayNumber = val(form.day)
}
if (monthNumber < 1 || monthNumber > 12) {
	monthNumber = month(now())
}
daysInShownMonth = daysInMonth(createDate(2000, monthNumber, 1))
firstWeekday = dayOfWeek(createDate(year(now()), monthNumber, 1))
if (dayNumber < 1) {
	dayNumber = 1
}
if (dayNumber > daysInShownMonth) {
	dayNumber = daysInShownMonth
}
dayQuestion = queryExecute(
	"SELECT qid FROM q WHERE q_act = :actid AND qsort = :qsort",
	{
		actid: {value: form.actid, cfsqltype: "cf_sql_integer"},
		qsort: {value: dayOfYear(createDate(2000, monthNumber, dayNumber)), cfsqltype: "cf_sql_integer"}
	},
	{datasource: "lr2026Fall2"}
)
if (dayQuestion.recordCount && structKeyExists(request, 'usr')) {
	usr('poll.on_this_day', dayQuestion.qid)
}
if (structKeyExists(cookie, 'OTD' & val(form.actid))) {
	cfcookie(name='OTD' & val(form.actid), value='', expires='now')
}
shown = createDate(2000, monthNumber, dayNumber)
previousDay = dateAdd('d', -1, shown)
nextDay = dateAdd('d', 1, shown)
heading = monthNames[monthNumber] & ' ' & dayNumber
feedFilters = [
	{key: 'events', title: 'Events'},
	{key: 'births', title: 'Births'},
	{key: 'deaths', title: 'Deaths'},
	{key: 'holidays', title: 'Holidays'}
]
listFilters = [
	{key: 'selected', title: 'Selected'},
	{key: 'all', title: 'All'}
]
sectionFilters = []
arrayAppend(sectionFilters, feedFilters, true)
arrayAppend(sectionFilters, listFilters, true)
allowedSections = {}
for (filter in sectionFilters) {
	allowedSections[filter.key] = true
}
sectionFilter = 'selected'
if (structKeyExists(form, 'section') && structKeyExists(allowedSections, lCase(trim(form.section)))) {
	sectionFilter = lCase(trim(form.section))
}

function dateQuery(monthValue, dayValue, sectionValue) {
	var parts = ['month=' & monthValue, 'day=' & dayValue, 'section=' & sectionValue]
	if (val(form.actid)) {
		arrayAppend(parts, 'actid=' & val(form.actid))
	}
	return 'Index.cfm?' & arrayToList(parts, '&')
}

function feedItems(feed, key) {
	if (isStruct(feed) && structKeyExists(feed, key) && isArray(feed[key])) {
		return feed[key]
	}
	return []
}

function itemYear(item) {
	if (isStruct(item) && structKeyExists(item, 'year') && isNumeric(item.year)) {
		return val(item.year)
	}
	return 999999
}

function chronological(rows) {
	var indexed = []
	var sorted = []
	var i = 1
	for (i = 1; i <= arrayLen(rows); i++) {
		arrayAppend(indexed, {item: rows[i], index: i, year: itemYear(rows[i])})
	}
	var left = 1
	for (left = 1; left <= arrayLen(indexed); left++) {
		var right = left + 1
		for (right = left + 1; right <= arrayLen(indexed); right++) {
			if (indexed[right].year < indexed[left].year || (indexed[right].year == indexed[left].year && indexed[right].index < indexed[left].index)) {
				var moved = indexed[left]
				indexed[left] = indexed[right]
				indexed[right] = moved
			}
		}
	}
	var entry = ''
	for (entry in indexed) {
		arrayAppend(sorted, entry.item)
	}
	return sorted
}

function viewKey(title) {
	return lCase(replace(trim(title), '_', ' ', 'all'))
}

function pageArticle(page) {
	if (isStruct(page) && structKeyExists(page, 'title')) {
		return page.title
	}
	return ''
}

function subjectPage(item) {
	var pages = itemPages(item)
	if (arrayLen(pages) && isStruct(pages[1])) {
		return pages[1]
	}
	return {}
}

function readViews(batch, scores) {
	var encoded = []
	var viewResult = ''
	var payload = {}
	var pages = {}
	var list = []
	var title = ''
	var titlesUrl = ''
	for (title in batch) {
		if (len(titlesUrl)) {
			titlesUrl &= '|'
		}
		titlesUrl &= encodeForURL(replace(title, ' ', '_', 'all'))
	}
	try {
		cfhttp(
			url = 'https://en.wikipedia.org/w/api.php?action=query&prop=pageviews&format=json&titles=' & titlesUrl,
			method = 'get',
			result = 'viewResult',
			timeout = 30,
			useragent = '2026Fall2 OnThisDay (https://PhillipSenn.dev/2026Fall2/On/This/Day/)'
		);
	} catch (any ignoreViews) {
		return false
	}
	if (left(viewResult.statusCode, 3) != '200' || !isJSON(viewResult.fileContent)) {
		return false
	}
	payload = deserializeJSON(viewResult.fileContent)
	if (!isStruct(payload) || !structKeyExists(payload, 'query') || !isStruct(payload.query) || !structKeyExists(payload.query, 'pages')) {
		return false
	}
	pages = payload.query.pages
	if (isArray(pages)) {
		list = pages
	} else if (isStruct(pages)) {
		var pageId = ''
		for (pageId in pages) {
			arrayAppend(list, pages[pageId])
		}
	}
	var wikiPage = ''
	for (wikiPage in list) {
		if (!isStruct(wikiPage) || !structKeyExists(wikiPage, 'title')) {
			continue
		}
		var total = 0
		if (structKeyExists(wikiPage, 'pageviews') && isStruct(wikiPage.pageviews)) {
			var day = ''
			for (day in wikiPage.pageviews) {
				if (isNumeric(wikiPage.pageviews[day])) {
					total += val(wikiPage.pageviews[day])
				}
			}
		}
		scores[viewKey(wikiPage.title)] = total
	}
}

function popularity(rows) {
	var scores = {}
	var titles = []
	var seen = {}
	var batch = []
	var title = ''
	var key = ''
	var item = ''
	for (item in rows) {
		title = pageArticle(subjectPage(item))
		key = viewKey(title)
		if (len(key) && !structKeyExists(seen, key)) {
			seen[key] = true
			arrayAppend(titles, title)
		}
	}
	for (title in titles) {
		arrayAppend(batch, title)
		if (arrayLen(batch) == 40) {
			readViews(batch, scores)
			batch = []
		}
	}
	if (arrayLen(batch)) {
		readViews(batch, scores)
	}
	return scores
}

function itemViews(item, scores) {
	var key = viewKey(pageArticle(subjectPage(item)))
	if (len(key) && structKeyExists(scores, key)) {
		return scores[key]
	}
	return 0
}

function byPopularity(rows) {
	var scores = popularity(rows)
	var indexed = []
	var sorted = []
	var i = 1
	for (i = 1; i <= arrayLen(rows); i++) {
		arrayAppend(indexed, {item: rows[i], index: i, views: itemViews(rows[i], scores)})
	}
	var left = 1
	for (left = 1; left <= arrayLen(indexed); left++) {
		var right = left + 1
		for (right = left + 1; right <= arrayLen(indexed); right++) {
			if (indexed[right].views > indexed[left].views || (indexed[right].views == indexed[left].views && indexed[right].index < indexed[left].index)) {
				var moved = indexed[left]
				indexed[left] = indexed[right]
				indexed[right] = moved
			}
		}
	}
	var entry = ''
	for (entry in indexed) {
		arrayAppend(sorted, entry.item)
	}
	return sorted
}

function orderedItems(rows, key) {
	if (key == 'holidays') {
		return byPopularity(rows)
	}
	return chronological(rows)
}

function itemPages(item) {
	if (isStruct(item) && structKeyExists(item, 'pages') && isArray(item.pages)) {
		return item.pages
	}
	return []
}

function itemText(item) {
	if (isStruct(item) && structKeyExists(item, 'text')) {
		return item.text
	}
	return ''
}

function yearLabel(yearValue) {
	var yearNumber = int(val(yearValue))
	if (yearNumber < 0) {
		return abs(yearNumber) & ' BC'
	}
	return yearNumber
}

function chatQuestion(item, sectionKey) {
	var text = trim(itemText(item))
	if (structKeyExists(item, 'year') && isNumeric(item.year)) {
		var label = yearLabel(item.year)
		if (sectionKey == 'births') {
			return 'Born ' & label & ', ' & text
		}
		if (sectionKey == 'deaths') {
			if (right(text, 1) == '.') {
				text = left(text, len(text) - 1)
			}
			return text & ' died ' & label & '.'
		}
		return 'In ' & label & ', ' & text
	}
	return text
}

askServices = [
	{title: 'ChatGPT', href: 'https://chatgpt.com/?q='},
	{title: 'Claude', href: 'https://claude.ai/new?q='},
	{title: 'Perplexity', href: 'https://www.perplexity.ai/search?q='},
	{title: 'Grok', href: 'https://grok.com/?q='},
	{title: 'DeepSeek', href: 'https://chat.deepseek.com/?q='},
	{title: 'Google AI', href: 'https://www.google.com/search?udm=50&q='},
	{title: 'duck.ai', href: 'https://duck.ai/chat?q='}
]

function askLinks(item, sectionKey) {
	var question = encodeForURL(chatQuestion(item, sectionKey))
	var html = ''
	var service = ''
	for (service in askServices) {
		html &= '<a class="menu-item" href="' & encodeForHTMLAttribute(service.href & question) & '">' & encodeForHTML(service.title) & '</a>'
	}
	return html
}

function choosePage(item) {
	var text = itemText(item)
	var best = {}
	var bestLength = 0
	var loose = {}
	var looseLength = 0
	var title = ''
	var wikiPage = ''
	for (wikiPage in itemPages(item)) {
		if (!isStruct(wikiPage)) {
			continue
		}
		title = pageTitle(wikiPage)
		if (!len(title) || !len(text)) {
			continue
		}
		if (find(title, text) && len(title) > bestLength) {
			best = wikiPage
			bestLength = len(title)
		} else if (findNoCase(title, text) && len(title) > looseLength) {
			loose = wikiPage
			looseLength = len(title)
		}
	}
	if (bestLength) {
		return best
	}
	if (looseLength) {
		return loose
	}
	if (arrayLen(itemPages(item)) && isStruct(itemPages(item)[1])) {
		return itemPages(item)[1]
	}
	return {}
}

function rangesOverlap(ranges, startAt, endAt) {
	var range = ''
	for (range in ranges) {
		if (startAt <= range.endAt && endAt >= range.startAt) {
			return true
		}
	}
	return false
}

function samePlace(left, right) {
	if (!len(left) || !len(right)) {
		return false
	}
	return lCase(left) == lCase(right)
}

function linkedText(item, imageUrl) {
	var text = itemText(item)
	var matches = []
	var title = ''
	var exact = false
	var wikiPage = ''
	for (wikiPage in itemPages(item)) {
		if (!isStruct(wikiPage)) {
			continue
		}
		title = pageTitle(wikiPage)
		if (!len(title) || !len(pageUrl(wikiPage)) || !len(text) || samePlace(pageUrl(wikiPage), imageUrl)) {
			continue
		}
		exact = find(title, text) > 0
		if (exact || findNoCase(title, text)) {
			arrayAppend(matches, {
				title: title,
				url: pageUrl(wikiPage),
				titleLength: len(title),
				exact: exact
			})
		}
	}
	var hasExact = false
	var match = ''
	for (match in matches) {
		if (match.exact) {
			hasExact = true
			break
		}
	}
	var ranges = []
	var needle = ''
	var pos = 0
	var startAt = 1
	var sorted = []
	var candidate = ''
	for (candidate in matches) {
		if (hasExact && !candidate.exact) {
			continue
		}
		arrayAppend(sorted, candidate)
	}
	var i = 1
	for (i = 1; i <= arrayLen(sorted); i++) {
		var j = i + 1
		for (j = i + 1; j <= arrayLen(sorted); j++) {
			if (sorted[j].titleLength > sorted[i].titleLength) {
				var swap = sorted[i]
				sorted[i] = sorted[j]
				sorted[j] = swap
			}
		}
	}
	var haystack = text
	if (!hasExact) {
		haystack = lCase(text)
	}
	var link = ''
	for (link in sorted) {
		needle = hasExact ? link.title : lCase(link.title)
		startAt = 1
		while (true) {
			pos = find(needle, haystack, startAt)
			if (!pos) {
				break
			}
			if (!rangesOverlap(ranges, pos, pos + len(needle) - 1)) {
				arrayAppend(ranges, {
					startAt: pos,
					endAt: pos + len(needle) - 1,
					url: link.url
				})
			}
			startAt = pos + len(needle)
		}
	}
	var left = 1
	for (left = 1; left <= arrayLen(ranges); left++) {
		var right = left + 1
		for (right = left + 1; right <= arrayLen(ranges); right++) {
			if (ranges[right].startAt < ranges[left].startAt) {
				var moved = ranges[left]
				ranges[left] = ranges[right]
				ranges[right] = moved
			}
		}
	}
	if (!arrayLen(ranges)) {
		var fallback = pageUrl(choosePage(item))
		if (len(fallback) && len(text) && !samePlace(fallback, imageUrl)) {
			return '<a href="' & encodeForHTMLAttribute(fallback) & '">' & encodeForHTML(text) & '</a>'
		}
		return encodeForHTML(text)
	}
	var html = ''
	var cursor = 1
	var range = ''
	for (range in ranges) {
		if (range.startAt > cursor) {
			html &= encodeForHTML(mid(text, cursor, range.startAt - cursor))
		}
		html &= '<a href="' & encodeForHTMLAttribute(range.url) & '">' & encodeForHTML(mid(text, range.startAt, range.endAt - range.startAt + 1)) & '</a>'
		cursor = range.endAt + 1
	}
	if (cursor <= len(text)) {
		html &= encodeForHTML(mid(text, cursor, len(text) - cursor + 1))
	}
	return html
}

function yearPage(yearValue) {
	var yearNumber = int(val(yearValue))
	if (yearNumber < 0) {
		return 'https://en.wikipedia.org/wiki/' & abs(yearNumber) & '_BC'
	}
	return 'https://en.wikipedia.org/wiki/' & yearNumber
}

function pageUrl(page) {
	if (isStruct(page) && structKeyExists(page, 'content_urls') && isStruct(page.content_urls) && structKeyExists(page.content_urls, 'desktop') && isStruct(page.content_urls.desktop) && structKeyExists(page.content_urls.desktop, 'page')) {
		return page.content_urls.desktop.page
	}
	if (isStruct(page) && structKeyExists(page, 'titles') && isStruct(page.titles) && structKeyExists(page.titles, 'canonical') && len(page.titles.canonical)) {
		return 'https://en.wikipedia.org/wiki/' & page.titles.canonical
	}
	return ''
}

function pageTitle(page) {
	if (isStruct(page) && structKeyExists(page, 'titles') && isStruct(page.titles) && structKeyExists(page.titles, 'normalized') && len(page.titles.normalized)) {
		return page.titles.normalized
	}
	if (isStruct(page) && structKeyExists(page, 'title')) {
		return replace(page.title, '_', ' ', 'all')
	}
	return ''
}

function pageImage(page) {
	if (isStruct(page) && structKeyExists(page, 'thumbnail') && isStruct(page.thumbnail) && structKeyExists(page.thumbnail, 'source')) {
		return page.thumbnail.source
	}
	return ''
}

function stripComments(markup) {
	var text = ''
	var cursor = 1
	var length = len(markup)
	while (cursor <= length) {
		var openAt = find('<!--', markup, cursor)
		if (!openAt) {
			return text & mid(markup, cursor, length - cursor + 1)
		}
		text &= mid(markup, cursor, openAt - cursor)
		var closeAt = find('-->', markup, openAt + 4)
		if (!closeAt) {
			return text & mid(markup, openAt, length - openAt + 1)
		}
		cursor = closeAt + 3
	}
	return text
}

function wikiLabels(markup) {
	var text = ''
	var cursor = 1
	var length = len(markup)
	while (cursor <= length) {
		var openAt = find('[[', markup, cursor)
		if (!openAt) {
			return text & mid(markup, cursor, length - cursor + 1)
		}
		var closeAt = find(']]', markup, openAt + 2)
		if (!closeAt) {
			return text & mid(markup, cursor, length - cursor + 1)
		}
		var inside = mid(markup, openAt + 2, closeAt - openAt - 2)
		if (find('[', inside) || find(']', inside)) {
			text &= mid(markup, cursor, openAt - cursor + 1)
			cursor = openAt + 1
			continue
		}
		text &= mid(markup, cursor, openAt - cursor)
		var pipeAt = find('|', inside)
		if (pipeAt) {
			text &= mid(inside, pipeAt + 1, len(inside) - pipeAt)
		} else {
			text &= inside
		}
		cursor = closeAt + 2
	}
	return text
}

function oneSpace(markup) {
	var text = ''
	var previousSpace = false
	var length = len(markup)
	var i = 1
	for (i = 1; i <= length; i++) {
		var character = mid(markup, i, 1)
		var space = character == ' ' || character == chr(9) || character == chr(10) || character == chr(13) || character == chr(12) || character == chr(11)
		if (space) {
			if (!previousSpace) {
				text &= ' '
			}
			previousSpace = true
		} else {
			text &= character
			previousSpace = false
		}
	}
	return text
}

function plainCaption(markup) {
	var text = stripComments(markup)
	text = wikiLabels(text)
	text = replace(text, "'''", '', 'all')
	text = replace(text, "''", '', 'all')
	text = replace(text, '&nbsp;', ' ', 'all')
	return trim(oneSpace(text))
}

function mainPageImage(wiki) {
	var marker = '{{main page image/otd|file:'
	var startAt = find(marker, lCase(wiki))
	var found = {fileName: '', caption: '', endAt: 0}
	if (!startAt) {
		return found
	}
	var cursor = startAt + len(marker)
	var length = len(wiki)
	var fileName = ''
	while (cursor <= length) {
		var character = mid(wiki, cursor, 1)
		if (character == '|' || character == '}') {
			break
		}
		fileName &= character
		cursor++
	}
	if (!len(fileName) || cursor > length || mid(wiki, cursor, 1) != '|') {
		return found
	}
	cursor++
	var caption = ''
	while (cursor <= length) {
		var character = mid(wiki, cursor, 1)
		if (character == '}') {
			break
		}
		caption &= character
		cursor++
	}
	if (!len(caption) || mid(wiki, cursor, 2) != '}}') {
		return found
	}
	found.fileName = fileName
	found.caption = caption
	found.endAt = cursor + 2
	return found
}

function picturedYear(block) {
	var cursor = 1
	var length = len(block)
	while (cursor <= length) {
		var starAt = find('*', block, cursor)
		if (!starAt) {
			return 0
		}
		var i = starAt + 1
		while (i <= length && (mid(block, i, 1) == ' ' || mid(block, i, 1) == chr(9))) {
			i++
		}
		if (mid(block, i, 2) == '[[') {
			var digits = ''
			var digitAt = i + 2
			while (digitAt <= length && len(digits) < 4 && find(mid(block, digitAt, 1), '0123456789')) {
				digits &= mid(block, digitAt, 1)
				digitAt++
			}
			if (len(digits) >= 3 && mid(block, digitAt, 2) == ']]') {
				var lineEnd = length + 1
				var newline = find(chr(10), block, digitAt)
				var carriage = find(chr(13), block, digitAt)
				if (newline) {
					lineEnd = newline
				}
				if (carriage && (!newline || carriage < newline)) {
					lineEnd = carriage
				}
				var rest = mid(block, digitAt + 2, lineEnd - digitAt - 2)
				if (find('pictured', rest)) {
					return val(digits)
				}
			}
		}
		cursor = starAt + 1
	}
	return 0
}

function fileThumb(fileName) {
	var safe = replace(trim(fileName), ' ', '_', 'all')
	return 'https://en.wikipedia.org/wiki/Special:FilePath/' & encodeForURL(safe) & '?width=240'
}

function filePage(fileName) {
	var safe = replace(trim(fileName), ' ', '_', 'all')
	return 'https://en.wikipedia.org/wiki/File:' & encodeForURL(safe)
}

otdPicture = {year: 0, src: '', caption: '', href: ''}
wikiMessage = ''
if (sectionFilter == 'all' || sectionFilter == 'selected') {
	try {
		cfhttp(
			url = 'https://en.wikipedia.org/w/index.php?title=' & encodeForURL('Wikipedia:Selected_anniversaries/' & monthNames[monthNumber] & '_' & dayNumber) & '&action=raw',
			method = 'get',
			result = 'wikiResult',
			timeout = 30,
			useragent = '2026Fall2 OnThisDay (https://PhillipSenn.dev/2026Fall2/On/This/Day/)'
		);
		if (left(wikiResult.statusCode, 3) == '200') {
			wiki = wikiResult.fileContent
			imageFound = mainPageImage(wiki)
			if (len(imageFound.fileName)) {
				block = mid(wiki, imageFound.endAt, len(wiki) - imageFound.endAt + 1)
				blockEnd = findNoCase('{{Born and died', block)
				if (!blockEnd) {
					blockEnd = findNoCase('{{SelAnnivFooter', block)
				}
				if (blockEnd) {
					block = left(block, blockEnd - 1)
				}
				yearFound = picturedYear(stripComments(block))
				if (yearFound) {
					otdPicture.year = yearFound
					otdPicture.src = fileThumb(imageFound.fileName)
					otdPicture.caption = plainCaption(imageFound.caption)
					otdPicture.href = filePage(imageFound.fileName)
				}
			}
		}
	} catch (any ignoreWiki) {
		wikiMessage = 'Could not reach Wikipedia for the pictured anniversary.'
	}
}

errorMessage = ''
feed = {}
try {
	cfhttp(
		url = 'https://en.wikipedia.org/api/rest_v1/feed/onthisday/' & sectionFilter & '/' & right('0' & monthNumber, 2) & '/' & right('0' & dayNumber, 2),
		method = 'get',
		result = 'httpResult',
		timeout = 30,
		useragent = '2026Fall2 OnThisDay (https://PhillipSenn.dev/2026Fall2/On/This/Day/)'
	);
	if (left(httpResult.statusCode, 3) == '200' && isJSON(httpResult.fileContent)) {
		feed = deserializeJSON(httpResult.fileContent)
	} else {
		errorMessage = 'Wikipedia did not return events for this date.'
	}
} catch (any exception) {
	errorMessage = 'Could not reach Wikipedia.'
}

sections = [
	{key: 'selected', title: 'Selected', open: true},
	{key: 'events', title: 'Events', open: true},
	{key: 'births', title: 'Births', open: false},
	{key: 'deaths', title: 'Deaths', open: false},
	{key: 'holidays', title: 'Holidays', open: true}
]
visibleSections = []
for (section in sections) {
	if (sectionFilter == 'all' || section.key == sectionFilter) {
		if (sectionFilter != 'all') {
			section.open = true
		}
		arrayAppend(visibleSections, section)
	}
}
</cfscript>

<cfoutput>
<div class="otd">
<aside class="otd-sidebar">
	<form class="otd-sections" method="get" action="Index.cfm">
		<div class="btn-group" role="group" aria-label="Feeds">
			<cfloop array="#feedFilters#" index="filter">
				<button name="section" value="#filter.key#"<cfif filter.key neq sectionFilter> class="btn-outline theme-secondary"</cfif>>#filter.title#</button>
			</cfloop>
		</div>
		<div class="btn-group" role="group" aria-label="Selection">
			<cfloop array="#listFilters#" index="filter">
				<button name="section" value="#filter.key#"<cfif filter.key neq sectionFilter> class="btn-outline theme-secondary"</cfif>>#filter.title#</button>
			</cfloop>
			<a class="btn btn-outline theme-secondary" href="#dateQuery(month(previousDay), day(previousDay), sectionFilter)#">Previous</a>
			<a class="btn btn-outline theme-secondary" href="#dateQuery(month(nextDay), day(nextDay), sectionFilter)#">Next</a>
		</div>
		<input hidden name="month" value="#monthNumber#">
		<input hidden name="day" value="#dayNumber#">
		<cfif val(form.actid)>
			<input hidden name="actid" value="#val(form.actid)#">
		</cfif>
	</form>
	<div>
		<div class="month-grid" role="group" aria-label="Month">
				<cfloop from="1" to="12" index="monthOption">
					<cfif monthOption mod 4 eq 1>
						<div class="btn-group" role="group">
					</cfif>
					<cfset monthDay = min(dayNumber, daysInMonth(createDate(2000, monthOption, 1)))>
					<a class="btn<cfif monthOption neq monthNumber> btn-outline theme-secondary</cfif>" href="#dateQuery(monthOption, monthDay, sectionFilter)#" title="#monthNames[monthOption]#" aria-label="#monthNames[monthOption]#">#monthAbbreviations[monthOption]#</a>
					<cfif monthOption mod 4 eq 0>
						</div>
					</cfif>
				</cfloop>
		</div>
	</div>
	<div>
		<div class="day-year">#year(now())#</div>
		<div class="day-week mb-1">
				<cfloop array="#weekdays#" index="weekdayName">
					<span>#weekdayName#</span>
				</cfloop>
			</div>
			<div class="day-grid" role="group" aria-label="Day" data-year="#year(now())#" data-month="#monthNumber#">
				<cfloop from="1" to="#daysInShownMonth#" index="dayOption">
					<cfset dayColumn = ((firstWeekday - 1 + dayOption - 1) mod 7) + 1>
					<cfif dayOption eq 1 or dayColumn eq 1>
						<div class="btn-group" role="group"<cfif dayOption eq 1 and firstWeekday gt 1> style="--day-lead: #firstWeekday - 1#"</cfif>>
					</cfif>
					<a class="btn<cfif dayOption neq dayNumber> btn-outline theme-secondary</cfif>" href="#dateQuery(monthNumber, dayOption, sectionFilter)#">#dayOption#</a>
					<cfif dayColumn eq 7 or dayOption eq daysInShownMonth>
						</div>
					</cfif>
				</cfloop>
		</div>
	</div>
</aside>
<div class="otd-main">
	<div class="card mb-3">
		<cfif len(errorMessage) || len(wikiMessage)>
			<div class="card-body">
				<cfif len(wikiMessage)><p class="mb-0">#encodeForHTML(wikiMessage)#</p></cfif>
				<cfif len(errorMessage)><p class="mb-0">#encodeForHTML(errorMessage)#</p></cfif>
			</div>
		</cfif>
	</div>

<cfif !len(errorMessage)>
	<div class="accordion">
		<cfloop array="#visibleSections#" index="section">
			<cfset rows = orderedItems(feedItems(feed, section.key), section.key)>
			<details class="accordion-item" name="on-this-day"<cfif section.open> open</cfif>>
				<summary class="accordion-header">#section.title# (#arrayLen(rows)#)</summary>
				<div class="accordion-body">
					<cfif !arrayLen(rows)>
						<p class="mb-0">Nothing listed.</p>
					<cfelse>
						<ul class="list-group list-group-flush">
							<cfloop array="#rows#" index="item">
								<cfset page = choosePage(item)>
								<cfset image = pageImage(page)>
								<cfset imageCaption = pageTitle(page)>
								<cfset imageUrl = pageUrl(page)>
								<cfif section.key == 'selected' && otdPicture.year && structKeyExists(item, 'year') && val(item.year) == otdPicture.year && findNoCase('pictured', itemText(item))>
									<cfset image = otdPicture.src>
									<cfset imageCaption = otdPicture.caption>
									<cfset imageUrl = otdPicture.href>
								</cfif>
								<li class="list-group-item otd-entry">
									<div class="d-flex gap-3 align-items-start">
										<cfif len(image)>
											<figure class="mb-0">
												<cfif len(imageUrl)><a href="#encodeForHTMLAttribute(imageUrl)#"></cfif>
												<img src="#encodeForHTMLAttribute(image)#" alt="#encodeForHTMLAttribute(imageCaption)#" width="120">
												<cfif len(imageUrl)></a></cfif>
												<cfif len(imageCaption) && !findNoCase(imageCaption, itemText(item))>
													<figcaption>#encodeForHTML(imageCaption)#</figcaption>
												</cfif>
											</figure>
										</cfif>
										<div class="otd-copy flex-grow-1">
											<cfif structKeyExists(item, 'year') && isNumeric(item.year)>
												<a class="yearFound" data-year="#item.year#" href="#yearPage(item.year)#"><strong>#yearLabel(item.year)#.</strong></a>
											</cfif>
											<span style="white-space: pre-line">#linkedText(item, len(image) ? imageUrl : '')#</span>
										</div>
										<div class="ask-ai align-self-end">
											<button type="button" class="ask-toggle" data-bs-toggle="menu" data-bs-placement="top-end" aria-expanded="false">Ask</button>
											<div class="menu">#askLinks(item, section.key)#</div>
										</div>
									</div>
								</li>
							</cfloop>
						</ul>
					</cfif>
				</div>
			</details>
		</cfloop>
	</div>
</cfif>
</div>
</div>
<a class="nav-link" href="https://en.wikipedia.org/wiki/Wikipedia:Selected_anniversaries/#monthNames[monthNumber]#_#dayNumber#">#heading#</a>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
