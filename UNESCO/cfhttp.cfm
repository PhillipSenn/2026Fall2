<cfscript>
string function elText(required any parent, required string selector) {
	els = parent.select(selector);
	if (els.size() == 0) {
		return '';
	}
	return els.first().text() ?: '';
}

string function elHtml(required any parent, required string selector) {
	els = parent.select(selector);
	if (els.size() == 0) {
		return '';
	}
	return els.first().html() ?: '';
}

array function csvList(required string value) {
	result = [];
	for (part in listToArray(value, ',')) {
		part = trim(part);
		if (len(part)) {
			result.append(part);
		}
	}
	return result;
}

ds = 'lr2026Fall2';
xmlPath = getDirectoryFromPath(getCurrentTemplatePath()) & 'UNESCO.xml';

if (!fileExists(xmlPath)) {
	writeOutput('Missing ' & encodeForHTML(xmlPath));
	abort;
}

fileContent = fileRead(xmlPath, 'utf-8');
queryPos = findNoCase('<query', fileContent);
if (!queryPos) {
	writeOutput('UNESCO.xml does not contain a &lt;query&gt; root.');
	abort;
}
fileContent = mid(fileContent, queryPos, len(fileContent) - queryPos + 1);
// Jsoup's HTML parser does not honor XML self-closing tags for unknown elements.
fileContent = reReplaceNoCase(fileContent, '<([A-Za-z][A-Za-z0-9:_-]*)([^>/]*)/>', '<\1\2></\1>', 'all');

doc = createObject('java', 'org.jsoup.Jsoup').parse(fileContent);
xmlRows = doc.select('query > row');

categoryByName = {};
for (q in queryExecute('SELECT categoryid, categoryname FROM UNESCO.dbo.category', {}, {datasource: ds})) {
	categoryByName[q.categoryname] = q.categoryid;
}

regionByName = {};
for (q in queryExecute('SELECT regionid, regionname FROM UNESCO.dbo.region', {}, {datasource: ds})) {
	regionByName[q.regionname] = q.regionid;
}

countryByName = {};
for (q in queryExecute('SELECT countryid, countryname FROM UNESCO.dbo.country', {}, {datasource: ds})) {
	countryByName[q.countryname] = q.countryid;
}

iso2ById = {};
for (q in queryExecute('SELECT iso2id FROM UNESCO.dbo.iso2', {}, {datasource: ds})) {
	iso2ById[uCase(q.iso2id)] = true;
}

queryExecute('DELETE FROM UNESCO.dbo.poi', {}, {datasource: ds});
queryExecute('DELETE FROM UNESCO.dbo.states', {}, {datasource: ds});
queryExecute('DELETE FROM UNESCO.dbo.regions', {}, {datasource: ds});
queryExecute('DELETE FROM UNESCO.dbo.iso', {}, {datasource: ds});
queryExecute('DELETE FROM UNESCO.dbo.[row]', {}, {datasource: ds});

rowCount = 0;
poiCount = 0;
regionsCount = 0;
statesCount = 0;
isoCount = 0;
missing = [];

for (xmlRow in xmlRows) {
	rowid = val(elText(xmlRow, 'id_number'));
	if (!rowid) {
		continue;
	}

	categoryName = trim(elText(xmlRow, 'category'));
	rowCategory = structKeyExists(categoryByName, categoryName) ? categoryByName[categoryName] : javacast('null', '');

	dangerText = trim(elText(xmlRow, 'danger'));
	dangerBit = (dangerText == '1' || left(dangerText, 1) == 'Y') ? 1 : 0;

	dateInscribedText = trim(elText(xmlRow, 'date_inscribed'));
	dateInscribed = len(dateInscribedText) && isNumeric(dateInscribedText) ? val(dateInscribedText) : javacast('null', '');

	extensionBit = val(elText(xmlRow, 'extension')) ? 1 : 0;
	transnationalText = trim(elText(xmlRow, 'transnational'));
	if (!len(transnationalText)) {
		transnationalText = trim(elText(xmlRow, 'transboundary'));
	}
	transnationalBit = val(transnationalText) ? 1 : 0;

	imageUrl = left(trim(elText(xmlRow, 'image_url')), 255);
	shortDescription = elHtml(xmlRow, 'short_description');
	sitename = elText(xmlRow, 'site');

	queryExecute(
		"INSERT INTO UNESCO.dbo.[row] (
			rowid, image_url, row_category, danger, date_inscribed,
			extension, short_description, sitename, transnational
		) VALUES (
			:rowid, :image_url, :row_category, :danger, :date_inscribed,
			:extension, :short_description, :sitename, :transnational
		)",
		{
			rowid: {value: rowid, cfsqltype: 'cf_sql_integer'},
			image_url: {value: imageUrl, cfsqltype: 'cf_sql_varchar', null: !len(imageUrl)},
			row_category: {value: rowCategory, cfsqltype: 'cf_sql_integer', null: isNull(rowCategory)},
			danger: {value: dangerBit, cfsqltype: 'cf_sql_bit'},
			date_inscribed: {value: dateInscribed, cfsqltype: 'cf_sql_integer', null: isNull(dateInscribed)},
			extension: {value: extensionBit, cfsqltype: 'cf_sql_bit'},
			short_description: {value: shortDescription, cfsqltype: 'cf_sql_longnvarchar', null: !len(shortDescription)},
			sitename: {value: sitename, cfsqltype: 'cf_sql_longnvarchar', null: !len(sitename)},
			transnational: {value: transnationalBit, cfsqltype: 'cf_sql_bit'}
		},
		{datasource: ds}
	);
	rowCount++;

	for (code in csvList(elText(xmlRow, 'iso_code'))) {
		iso2 = uCase(code);
		if (len(iso2) != 2) {
			continue;
		}
		if (!structKeyExists(iso2ById, iso2)) {
			missing.append('iso2 #iso2# (row #rowid#)');
			continue;
		}
		queryExecute(
			'INSERT INTO UNESCO.dbo.iso (iso_row, iso2) VALUES (:iso_row, :iso2)',
			{
				iso_row: {value: rowid, cfsqltype: 'cf_sql_integer'},
				iso2: {value: iso2, cfsqltype: 'cf_sql_char'}
			},
			{datasource: ds}
		);
		isoCount++;
	}

	for (poiNode in xmlRow.select('geolocations > poi')) {
		latText = trim(elText(poiNode, 'latitude'));
		lngText = trim(elText(poiNode, 'longitude'));
		if (!len(latText) || !isNumeric(latText) || !len(lngText) || !isNumeric(lngText)) {
			continue;
		}
		poiIso2 = uCase(trim(elText(poiNode, 'iso2')));
		if (len(poiIso2) && len(poiIso2) != 2) {
			poiIso2 = '';
		}
		if (len(poiIso2) && !structKeyExists(iso2ById, poiIso2)) {
			missing.append('poi iso2 #poiIso2# (row #rowid#)');
			poiIso2 = '';
		}
		queryExecute(
			'INSERT INTO UNESCO.dbo.poi (poi_row, lat, lng, iso2) VALUES (:poi_row, :lat, :lng, :iso2)',
			{
				poi_row: {value: rowid, cfsqltype: 'cf_sql_integer'},
				lat: {value: latText, cfsqltype: 'cf_sql_decimal', scale: 10},
				lng: {value: lngText, cfsqltype: 'cf_sql_decimal', scale: 10},
				iso2: {value: poiIso2, cfsqltype: 'cf_sql_char', null: !len(poiIso2)}
			},
			{datasource: ds}
		);
		poiCount++;
	}

	regionText = elText(xmlRow, 'regions');
	if (!len(trim(regionText))) {
		regionText = elText(xmlRow, 'region');
	}
	for (regionName in csvList(regionText)) {
		if (!structKeyExists(regionByName, regionName)) {
			missing.append('region #regionName# (row #rowid#)');
			continue;
		}
		queryExecute(
			'INSERT INTO UNESCO.dbo.regions (regions_row, regions_region) VALUES (:regions_row, :regions_region)',
			{
				regions_row: {value: rowid, cfsqltype: 'cf_sql_integer'},
				regions_region: {value: regionByName[regionName], cfsqltype: 'cf_sql_integer'}
			},
			{datasource: ds}
		);
		regionsCount++;
	}

	for (countryName in csvList(elText(xmlRow, 'states'))) {
		if (!structKeyExists(countryByName, countryName)) {
			missing.append('country #countryName# (row #rowid#)');
			continue;
		}
		queryExecute(
			'INSERT INTO UNESCO.dbo.states (states_row, states_country) VALUES (:states_row, :states_country)',
			{
				states_row: {value: rowid, cfsqltype: 'cf_sql_integer'},
				states_country: {value: countryByName[countryName], cfsqltype: 'cf_sql_integer'}
			},
			{datasource: ds}
		);
		statesCount++;
	}
}

writeOutput('<p>Imported #rowCount# rows, #poiCount# poi, #regionsCount# regions, #statesCount# states, #isoCount# iso.</p>');
if (arrayLen(missing)) {
	writeOutput('<p>Missing lookups:</p><ul>');
	for (item in missing) {
		writeOutput('<li>' & encodeForHTML(item) & '</li>');
	}
	writeOutput('</ul>');
}
</cfscript>
