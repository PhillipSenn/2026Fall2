<cfscript>
setting showdebugoutput = false;
cfcontent(type="application/json", reset=true);
param form.sql = "";
param form.fields = "";

payload = runStatement(replace(trim(form.sql), chr(13), "", "all"), form.fields);
writeOutput(serializeJSON(payload));

function runStatement(sql, fields) {
	parsed = parseSql(sql, fields);
	if (!parsed.ok) {
		return {columns: [], rows: []};
	}
	try {
		result = queryExecute(parsed.sql, {}, {datasource: "lr2026Fall2"});
	} catch (any err) {
		return {
			columns: [{name: "Error", numeric: false}],
			rows: [[err.message]]
		};
	}
	return queryPayload(result, parsed.headers);
}

function parseSql(sql, fields) {
	lines = listToArray(sql, chr(10), false);
	ident = "[A-Za-z_][A-Za-z0-9_]*";
	fieldKeys = listToArray(fields);
	headers = [];
	joins = [];
	tables = {};
	if (arrayLen(lines) < 2) {
		return {ok: false};
	}
	if (!reFindNoCase("^select #ident#(,#ident#)*$", trim(lines[1]))) {
		return {ok: false};
	}
	headers = listToArray(reReplaceNoCase(trim(lines[1]), "^select ", ""));
	if (!reFindNoCase("^from #ident#$", trim(lines[2]))) {
		return {ok: false};
	}
	fromTable = listLast(trim(lines[2]), " ");
	tables[fromTable] = true;
	for (i = 3; i <= arrayLen(lines); i++) {
		line = trim(lines[i]);
		if (!len(line)) {
			continue;
		}
		if (!reFindNoCase("^join #ident# on #ident#\.#ident#=#ident#\.#ident#$", line)) {
			return {ok: false};
		}
		match = reMatchNoCase(ident, line);
		arrayAppend(joins, {
			table: match[2],
			leftTable: match[4],
			leftCol: match[5],
			rightTable: match[6],
			rightCol: match[7]
		});
		tables[match[2]] = true;
	}
	if (arrayLen(fieldKeys) != arrayLen(headers)) {
		return {ok: false};
	}
	selectList = [];
	for (i = 1; i <= arrayLen(fieldKeys); i++) {
		parts = listToArray(fieldKeys[i], ".");
		if (arrayLen(parts) != 2 || !reFindNoCase("^#ident#$", parts[1]) || !reFindNoCase("^#ident#$", parts[2])) {
			return {ok: false};
		}
		if (compareNoCase(parts[2], headers[i]) != 0 || !structKeyExists(tables, parts[1])) {
			return {ok: false};
		}
		arrayAppend(selectList, "[" & parts[1] & "].[" & parts[2] & "] AS [" & headers[i] & "]");
	}
	statement = "SELECT " & arrayToList(selectList) & " FROM LR.dbo.[" & fromTable & "] AS [" & fromTable & "]";
	for (join in joins) {
		statement &= " JOIN LR.dbo.[" & join.table & "] AS [" & join.table & "]";
		statement &= " ON [" & join.leftTable & "].[" & join.leftCol & "]=[" & join.rightTable & "].[" & join.rightCol & "]";
	}
	return {ok: true, sql: statement, headers: headers};
}

function queryPayload(result, headers) {
	numberTypes = "bit,tinyint,smallint,int,integer,bigint,decimal,numeric,float,real,money,smallmoney,double";
	meta = getMetaData(result);
	columns = [];
	rows = [];
	index = 1;
	for (col in meta) {
		typeName = "";
		if (structKeyExists(col, "typeName")) {
			typeName = col.typeName;
		} else if (structKeyExists(col, "TypeName")) {
			typeName = col.TypeName;
		}
		arrayAppend(columns, {
			name: headers[index],
			numeric: listFindNoCase(numberTypes, typeName) > 0
		});
		index++;
	}
	for (record = 1; record <= result.recordCount; record++) {
		cells = [];
		for (col in meta) {
			cell = result[col.name][record];
			if (isNull(cell)) {
				arrayAppend(cells, "");
			} else {
				arrayAppend(cells, toString(cell));
			}
		}
		arrayAppend(rows, cells);
	}
	return {columns: columns, rows: rows};
}
</cfscript>
