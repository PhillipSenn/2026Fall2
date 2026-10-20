<cfscript>
setting showdebugoutput=false;

form.q = form.qname
	& ' site:en.wikipedia.org';

requestBody = serializeJSON({
	'q' = form.q,
	'num' = 10
})

cfhttp(
	url='https://google.serper.dev/search',
	method='POST',
	charset='utf-8',
	result='result'
) {
	cfhttpparam(
		type='header',
		name='X-API-KEY',
		value='3f47dd9628ea832607ddba08beb2cd7de24ad10e'
	);

	cfhttpparam(
		type='header',
		name='Content-Type',
		value='application/json'
	);

	cfhttpparam(
		type='body',
		value=requestBody
	);
}

search = deserializeJSON(result.fileContent)
articles = []
if (structKeyExists(search, 'organic')) {
	for (item in search.organic) {
		if (!structKeyExists(item, 'link')) {
			continue
		}
		title = wikipediaArticle(item.link)
		if (!len(title)) {
			continue
		}
		arrayAppend(articles, {
			'link' = item.link,
			'title' = title
		})
		if (arrayLen(articles) == 5) {
			break
		}
	}
}

images = []
if (arrayLen(articles)) {
	titles = []
	for (article in articles) {
		arrayAppend(titles, article.title)
	}
	cfhttp(
		url='https://en.wikipedia.org/w/api.php',
		method='get',
		result='wiki',
		charset='utf-8'
	) {
		cfhttpparam(type='url', name='action', value='query');
		cfhttpparam(type='url', name='format', value='json');
		cfhttpparam(type='url', name='formatversion', value='2');
		cfhttpparam(type='url', name='prop', value='pageimages');
		cfhttpparam(type='url', name='piprop', value='original');
		cfhttpparam(type='url', name='redirects', value='1');
		cfhttpparam(type='url', name='titles', value=arrayToList(titles, '|'));
	}
	wikiData = deserializeJSON(wiki.fileContent)
	byTitle = {}
	if (structKeyExists(wikiData, 'query') && structKeyExists(wikiData.query, 'pages')) {
		for (page in wikiData.query.pages) {
			if (!structKeyExists(page, 'title') || val(page.ns) != 0) {
				continue
			}
			if (!structKeyExists(page, 'original')) {
				continue
			}
			byTitle[lCase(page.title)] = page.original.source
		}
		if (structKeyExists(wikiData.query, 'redirects')) {
			for (item in wikiData.query.redirects) {
				target = lCase(item.to)
				if (structKeyExists(byTitle, target)) {
					byTitle[lCase(item.from)] = byTitle[target]
				}
			}
		}
	}
	for (article in articles) {
		key = lCase(article.title)
		if (!structKeyExists(byTitle, key)) {
			continue
		}
		arrayAppend(images, {
			'link' = article.link,
			'imageUrl' = byTitle[key]
		})
	}
}

parts = []
for (image in images) {
	arrayAppend(parts, '{"link":' & serializeJSON(image.link) & ',"imageUrl":' & serializeJSON(image.imageUrl) & '}')
}
writeOutput('{"images":[' & arrayToList(parts, ',') & ']}')

function wikipediaArticle(link) {
	prefix = 'https://en.wikipedia.org/wiki/'
	if (left(link, len(prefix)) != prefix) {
		return ''
	}
	slug = right(link, len(link) - len(prefix))
	if (!len(slug) || find(':', slug) || find('/', slug) || find('?', slug) || find(chr(35), slug)) {
		return ''
	}
	return replace(urlDecode(slug), '_', ' ', 'all')
}
</cfscript>
