<cfscript>
param form.actid = 336;
request.container = 'container-fluid';

ans = new dbo.proc().usr('ans.where_act', form.actid);
ordered = queryExecute(
	"SELECT qname, ansname, ansid FROM ans ORDER BY qname, ansid",
	{},
	{dbtype: "query"}
);

tables = [];
tableIndex = {};
pkColumn = {};
for (row in ordered) {
	if (!structKeyExists(tableIndex, row.qname)) {
		tableIndex[row.qname] = arrayLen(tables) + 1;
		arrayAppend(tables, {
			id: row.qname,
			fields: []
		});
	}
	isPk = compareNoCase(row.ansname, row.qname & "id") == 0;
	arrayAppend(tables[tableIndex[row.qname]].fields, {
		name: row.ansname,
		pk: isPk,
		type: "",
		ansid: row.ansid
	});
	if (isPk) {
		pkColumn[lCase(row.ansname)] = {
			table: row.qname,
			name: row.ansname
		};
	}
}

liveColumns = queryExecute(
	"SELECT TABLE_NAME, COLUMN_NAME FROM LR.INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo'",
	{},
	{datasource: "lr2026Fall2"}
);
columnExists = {};
for (row in liveColumns) {
	columnExists[lCase(row.TABLE_NAME) & "." & lCase(row.COLUMN_NAME)] = true;
}
kept = [];
for (table in tables) {
	fields = [];
	for (field in table.fields) {
		if (structKeyExists(columnExists, lCase(table.id) & "." & lCase(field.name))) {
			arrayAppend(fields, field);
		}
	}
	if (arrayLen(fields)) {
		table.fields = fields;
		arrayAppend(kept, table);
	}
}
tables = kept;
pkColumn = {};
for (table in tables) {
	for (field in table.fields) {
		if (field.pk) {
			pkColumn[lCase(field.name)] = {
				table: table.id,
				name: field.name
			};
		}
	}
}

pairs = [];
outgoing = {};
for (table in tables) {
	outgoing[table.id] = false;
	for (field in table.fields) {
		key = lCase(field.name);
		if (!field.pk && structKeyExists(pkColumn, key) && pkColumn[key].table != table.id) {
			outgoing[table.id] = true;
			arrayAppend(pairs, [
				pkColumn[key].table & "." & pkColumn[key].name,
				table.id & "." & field.name
			]);
		}
	}
}

lookupTables = [];
rows = {};
numberTypes = "bit,tinyint,smallint,int,integer,bigint,decimal,numeric,float,real,money,smallmoney,double";
for (table in tables) {
	if (!reFind("^[A-Za-z_][A-Za-z0-9_]*$", table.id)) {
		continue;
	}
	modalId = lCase(table.id) & "-modal";
	columns = [];
	for (field in table.fields) {
		if (reFind("^[A-Za-z_][A-Za-z0-9_]*$", field.name)) {
			arrayAppend(columns, "[" & field.name & "]");
		}
	}
	if (!arrayLen(columns)) {
		continue;
	}
	table.modalId = modalId;
	arrayAppend(lookupTables, table);
	rows[table.id] = queryExecute(
		"SELECT #arrayToList(columns)# FROM LR.dbo.#table.id#",
		{},
		{datasource: "lr2026Fall2"}
	);
	for (col in getMetaData(rows[table.id])) {
		typeName = "";
		if (structKeyExists(col, "typeName")) {
			typeName = col.typeName;
		} else if (structKeyExists(col, "TypeName")) {
			typeName = col.TypeName;
		}
		for (field in table.fields) {
			if (compareNoCase(field.name, col.name) == 0) {
				field.type = typeName;
			}
		}
	}
}

clientTables = [];
for (table in tables) {
	fields = [];
	for (field in table.fields) {
		arrayAppend(fields, {name: field.name, pk: field.pk, ansid: field.ansid});
	}
	arrayAppend(clientTables, {id: table.id, fields: fields});
}
relJson = serializeJSON({tables: clientTables, pairs: pairs});
relJson = replace(relJson, "##", "\u0023", "all");
relJson = replace(relJson, "</", "<\/", "all");

include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header theme-primary theme-subtle">
	</div>
	<div class="card-body p-0">
		<div class="row g-0">
			<div id="rel-canvas" class="col-12 lg:col-8"></div>
			<div class="rel-side col-12 lg:col-4">
				<div id="rel-fields" aria-label="Fields">
					<p class="rel-fields-hint">Drop fields here</p>
				</div>
				<div id="sql-stmt"></div>
			</div>
		</div>
	</div>
	<div class="card-footer">
		<table id="rel-results"></table>
	</div>
</div>
<script type="application/json" id="rel-data">#relJson#</script>
<cfloop array="#lookupTables#" index="table">
	<cfset lookup = rows[table.id]>
	<dialog class="dialog" id="#table.modalId#" aria-labelledby="#table.modalId#-title">
		<div class="dialog-header">
			<h5 class="dialog-title" id="#table.modalId#-title">#encodeForHTML(table.id)#</h5>
			<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
		</div>
		<div class="dialog-body">
			<table>
				<thead>
					<tr>
						<cfloop array="#table.fields#" index="field">
							<th<cfif field.pk or listFindNoCase(numberTypes, field.type)> class="text-end"</cfif>>#encodeForHTML(field.name)#</th>
						</cfloop>
					</tr>
				</thead>
				<tbody>
					<cfloop query="lookup">
						<tr>
							<cfloop array="#table.fields#" index="field">
								<cfset cell = lookup[field.name][lookup.currentRow]>
								<td<cfif field.pk or listFindNoCase(numberTypes, field.type)> class="text-end"</cfif>><cfif !isNull(cell)>#encodeForHTML(cell)#</cfif></td>
							</cfloop>
						</tr>
					</cfloop>
				</tbody>
			</table>
		</div>
	</dialog>
</cfloop>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
