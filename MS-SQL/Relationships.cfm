<cfscript>
param form.actid = 335;
request.container = 'container-fluid';

schema = queryExecute("
	SELECT t.name AS table_name
		,c.column_id
		,c.name AS column_name
		,TYPE_NAME(c.user_type_id) AS type_name
		,CASE WHEN pk.column_id IS NULL THEN 0 ELSE 1 END AS is_pk
	FROM LR.sys.tables t
	JOIN LR.sys.columns c ON c.object_id = t.object_id
	LEFT JOIN (
		SELECT ic.object_id, ic.column_id
		FROM LR.sys.indexes i
		JOIN LR.sys.index_columns ic ON ic.object_id = i.object_id AND ic.index_id = i.index_id
		WHERE i.is_primary_key = 1
	) pk ON pk.object_id = c.object_id AND pk.column_id = c.column_id
	ORDER BY t.name, c.column_id
", {}, {datasource: "lr2026Fall2"});

tables = [];
tableIndex = {};
pkColumn = {};
for (row in schema) {
	if (!structKeyExists(tableIndex, row.table_name)) {
		tableIndex[row.table_name] = arrayLen(tables) + 1;
		arrayAppend(tables, {
			id: row.table_name,
			fields: []
		});
	}
	arrayAppend(tables[tableIndex[row.table_name]].fields, {
		name: row.column_name,
		pk: val(row.is_pk) == 1,
		type: row.type_name
	});
	if (val(row.is_pk) == 1) {
		pkColumn[row.column_name] = row.table_name;
	}
}

pairs = [];
outgoing = {};
for (table in tables) {
	outgoing[table.id] = false;
	for (field in table.fields) {
		if (!field.pk && structKeyExists(pkColumn, field.name) && pkColumn[field.name] != table.id) {
			outgoing[table.id] = true;
			arrayAppend(pairs, [
				pkColumn[field.name] & "." & field.name,
				table.id & "." & field.name
			]);
		}
	}
}

lookups = {};
lookupTables = [];
rows = {};
numberTypes = "bit,tinyint,smallint,int,bigint,decimal,numeric,float,real,money,smallmoney";
for (table in tables) {
	if (outgoing[table.id]) {
		continue;
	}
	modalId = "";
	for (field in table.fields) {
		if (!field.pk && reFindNoCase("name$", field.name)) {
			modalId = lCase(table.id) & "-modal";
			lookups[field.name] = modalId;
		}
	}
	if (!len(modalId) || !reFind("^[A-Za-z_][A-Za-z0-9_]*$", table.id)) {
		continue;
	}
	table.modalId = modalId;
	arrayAppend(lookupTables, table);
	rows[table.id] = queryExecute("SELECT * FROM LR.dbo.#table.id#", {}, {datasource: "lr2026Fall2"});
}

clientTables = [];
for (table in tables) {
	fields = [];
	for (field in table.fields) {
		arrayAppend(fields, {name: field.name, pk: field.pk});
	}
	arrayAppend(clientTables, {id: table.id, fields: fields});
}
relJson = serializeJSON({tables: clientTables, pairs: pairs, lookups: lookups});
relJson = replace(relJson, "##", "\u0023", "all");
relJson = replace(relJson, "</", "<\/", "all");

include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="rel-window">
	<div id="rel-canvas"></div>
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
