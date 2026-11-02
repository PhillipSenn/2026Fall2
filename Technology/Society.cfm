<cfscript>
if (structKeyExists(form, 'catid') && form.catid == form.q_cat) {
	new dbo.proc().usr('poll.on_this_day', form.qid)
}
include '/Inc/header6.cfm'
q = new dbo.proc().usr('poll.rnd_unanswered', form.actid)
wikiImage = {src: '', caption: '', href: ''}
if (q.recordcount) {
	wikiImage = eventImage(q.qname, q.qsort)
}

function eventImage(required string eventText, required numeric eventYear) {
	var found = {src: '', caption: '', href: ''}
	var plain = trim(reReplace(eventText, '<[^>]*>', '', 'all'))
	var pages = []
	var payload = {}
	var best = {}
	var bestLength = 0
	var loose = {}
	var looseLength = 0
	var fallback = {}
	var chosen = {}
	var page = {}
	var title = ''
	try {
		cfhttp(
			url = 'https://en.wikipedia.org/w/api.php?action=query&format=json&formatversion=2&generator=search&gsrnamespace=0&gsrlimit=8&prop=pageimages|info&inprop=url&piprop=thumbnail&pithumbsize=440&pilimit=8&gsrsearch=' & encodeForURL(plain & ' ' & int(eventYear)),
			method = 'get',
			result = 'local.wikiResult',
			timeout = 15,
			useragent = '2026Fall2 TechnologySociety (https://PhillipSenn.dev/2026Fall2/Technology/Society.cfm)'
		);
		if (left(local.wikiResult.statusCode, 3) == '200' && isJSON(local.wikiResult.fileContent)) {
			payload = deserializeJSON(local.wikiResult.fileContent)
			if (isStruct(payload) && structKeyExists(payload, 'query') && isStruct(payload.query) && structKeyExists(payload.query, 'pages') && isArray(payload.query.pages)) {
				pages = payload.query.pages
			}
		}
	} catch (any ignoreWiki) {
		return found
	}
	for (page in pages) {
		if (isStruct(page) && structKeyExists(page, 'thumbnail') && isStruct(page.thumbnail) && structKeyExists(page.thumbnail, 'source')) {
			if (!structKeyExists(fallback, 'title')) {
				fallback = page
			}
			title = ''
			if (structKeyExists(page, 'title')) {
				title = replace(page.title, '_', ' ', 'all')
			}
			if (len(title) && len(plain)) {
				if (find(title, plain) && len(title) > bestLength) {
					best = page
					bestLength = len(title)
				} else if (findNoCase(title, plain) && len(title) > looseLength) {
					loose = page
					looseLength = len(title)
				}
			}
		}
	}
	if (bestLength) {
		chosen = best
	} else if (looseLength) {
		chosen = loose
	} else if (structKeyExists(fallback, 'title')) {
		chosen = fallback
	}
	if (!structKeyExists(chosen, 'title')) {
		return found
	}
	found.src = chosen.thumbnail.source
	found.caption = replace(chosen.title, '_', ' ', 'all')
	if (structKeyExists(chosen, 'fullurl') && len(chosen.fullurl)) {
		found.href = chosen.fullurl
	} else {
		found.href = 'https://en.wikipedia.org/wiki/' & replace(urlEncodedFormat(chosen.title), '%20', '_', 'all')
	}
	if (len(found.caption) && findNoCase(found.caption, plain)) {
		found.caption = ''
	}
	return found
}
</cfscript>

<cfoutput query="act">
<div class="row">
	<div class="lg:col-6 lg:mx-auto">
		<form class="card">
			<cfif q.recordcount>
				<div class="card-header">
					<h1 class="h2 mb-0">#q.qsort#</h1>
				</div>
				<div class="card-body">
					<div class="wiki-copy">
						<cfif len(wikiImage.src)>
							<figure class="wiki-thumb">
								<cfif len(wikiImage.href)><a target="_blank" href="#encodeForHTMLAttribute(wikiImage.href)#"></cfif>
								<img src="#encodeForHTMLAttribute(wikiImage.src)#" alt="#encodeForHTMLAttribute(wikiImage.caption)#" width="220">
								<cfif len(wikiImage.href)></a></cfif>
								<cfif len(wikiImage.caption)>
									<figcaption>#encodeForHTML(wikiImage.caption)#</figcaption>
								</cfif>
							</figure>
						</cfif>
						<p>#q.qname#</p>
                  <div class="btn-group" role="group" aria-label="History">
                     <button type="submit" name="catid" value="346" class="btn-outline theme-primary">Technology</button>
                     <button type="submit" name="catid" value="347" class="btn-outline theme-primary">World History</button>
                  </div>
					</div>
				</div>
				<input hidden id="catid" value="#q.catid#">
			<cfelse>
				<div class="card-header">#actname#</div>
				<div class="card-body">You did it!</div>
			</cfif>
			<input hidden name="actid" value="#form.actid#">
			<input hidden name="id" value="#request.usr.id#">
			<input hidden name="qid" value="#q.qid#">
         <input hidden name="q_cat" value="#q.catid#">
		</form>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
