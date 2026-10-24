(function () {
	const relData = JSON.parse(document.getElementById('rel-data').textContent);
	const tables = (relData.tables || relData.TABLES).map(readTable);
	const pairs = relData.pairs || relData.PAIRS;

	function readTable(table) {
		return {
			id: table.id || table.ID,
			fields: (table.fields || table.FIELDS).map(readField)
		};
	}

	function readField(field) {
		const pk = field.pk !== undefined ? field.pk : field.PK;
		return {
			name: field.name || field.NAME,
			pk: pk === true || pk === 1 || pk === 'true',
			ansid: field.ansid !== undefined ? field.ansid : field.ANSID
		};
	}

	const partners = new Map();
	pairs.forEach(function (pair) {
		pair.forEach(function (key, index) {
			const other = pair[1 - index];
			if (!partners.has(key)) {
				partners.set(key, []);
			}
			partners.get(key).push(other);
		});
	});

	const joins = new Map();
	const canvas = document.getElementById('rel-canvas');
	const sidebar = document.getElementById('rel-fields');
	const headerTitle = $('.card-header').text();
	let ghost = null;
	let headerNotice = null;
	let resultRequest = 0;
	const svg = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
	const joinLayer = document.createElementNS('http://www.w3.org/2000/svg', 'g');
	const rubber = document.createElementNS('http://www.w3.org/2000/svg', 'line');
	rubber.setAttribute('class', 'rel-line');
	svg.appendChild(joinLayer);
	svg.appendChild(rubber);
	canvas.appendChild(svg);

	let drag = null;

	function fieldKey(tableId, fieldName) {
		return tableId + '.' + fieldName;
	}

	function joinId(a, b) {
		return [a, b].sort().join('|');
	}

	function renderTables() {
		tables.forEach(function (table) {
			const box = document.createElement('div');
			box.className = 'rel-table';
			box.dataset.table = table.id;
			box.style.left = table.x + 'px';
			box.style.top = table.y + 'px';

			const title = document.createElement('div');
			title.className = 'rel-title';
			title.appendChild(document.createTextNode(table.id));
			const modalIcon = modalButton(table.id);
			if (modalIcon) {
				title.appendChild(modalIcon);
			}
			title.addEventListener('pointerdown', onTitlePointerDown);
			box.appendChild(title);

			table.fields.forEach(function (field) {
				const key = fieldKey(table.id, field.name);
				const foreign = !field.pk && partners.has(key);
				const row = document.createElement('div');
				row.className = 'rel-field' + (field.pk ? ' is-pk' : '') + (foreign ? ' is-fk' : '');
				row.dataset.key = key;
				row.dataset.ansid = field.ansid;
				row.setAttribute('aria-label', field.name);
				row.appendChild(keyIcon(field.pk));
				row.appendChild(document.createTextNode(field.name));
				if (field.pk || foreign) {
					row.setAttribute('role', 'button');
					row.addEventListener('pointerdown', onFieldPointerDown);
				} else {
					row.classList.add('is-column');
					row.setAttribute('role', 'button');
					row.addEventListener('pointerdown', onColumnPointerDown);
				}
				box.appendChild(row);
			});

			canvas.appendChild(box);
		});
		selectTable(canvas.querySelector('.rel-table'));
	}

	function keyIcon(show) {
		const svgIcon = document.createElementNS('http://www.w3.org/2000/svg', 'svg');
		svgIcon.setAttribute('class', 'rel-key');
		svgIcon.setAttribute('viewBox', '0 0 16 16');
		svgIcon.setAttribute('width', '14');
		svgIcon.setAttribute('height', '14');
		if (show) {
			svgIcon.innerHTML = '<path fill="#c59b08" d="M6.2 7.2a3.2 3.2 0 1 1 1.7-1.1l.1.1 4.2 4.2-.9.9-1.1-1.1-.9.9-1.1-1.1-.8.8-1.4-1.2.9-.8-.7-.7zM4.6 4.2a1.6 1.6 0 1 0 0 3.2 1.6 1.6 0 0 0 0-3.2z"/>';
		}
		return svgIcon;
	}

	function isPartner(sourceKey, fieldKeyName) {
		const list = partners.get(sourceKey);
		return !!(list && list.indexOf(fieldKeyName) !== -1);
	}

	function selectTable(box) {
		canvas.querySelectorAll('.rel-table').forEach(function (el) {
			el.classList.toggle('is-selected', el === box);
		});
	}

	function localPoint(clientX, clientY) {
		const rect = canvas.getBoundingClientRect();
		return {
			x: clientX - rect.left + canvas.scrollLeft,
			y: clientY - rect.top + canvas.scrollTop
		};
	}

	function fieldBox(key) {
		return canvas.querySelector('[data-key="' + CSS.escape(key) + '"]');
	}

	function anchor(el, towardX) {
		const canvasRect = canvas.getBoundingClientRect();
		const rect = el.getBoundingClientRect();
		const left = rect.left - canvasRect.left + canvas.scrollLeft;
		const right = rect.right - canvasRect.left + canvas.scrollLeft;
		const midX = (left + right) / 2;
		return {
			x: towardX < midX ? left : right,
			y: rect.top + rect.height / 2 - canvasRect.top + canvas.scrollTop
		};
	}

	function drawJoins() {
		joinLayer.replaceChildren();
		joins.forEach(drawJoin);
	}

	function drawJoin(pair) {
		const from = fieldBox(pair[0]);
		const to = fieldBox(pair[1]);
		let fromRect = null;
		let toRect = null;
		let start = null;
		let end = null;
		let gap = null;
		if (!from || !to) {
			return;
		}
		fromRect = from.getBoundingClientRect();
		toRect = to.getBoundingClientRect();
		start = anchor(from, toRect.left + toRect.width / 2);
		end = anchor(to, fromRect.left + fromRect.width / 2);
		gap = markGap(start, end);
		appendLine(pointAlong(start, end, gap.line), pointAlong(end, start, gap.line));
		joinLayer.appendChild(relationMark(pointAlong(start, end, gap.mark), manySide(from)));
		joinLayer.appendChild(relationMark(pointAlong(end, start, gap.mark), manySide(to)));
	}

	function manySide(field) {
		return field.classList.contains('is-fk');
	}

	function markGap(start, end) {
		const length = Math.hypot(end.x - start.x, end.y - start.y);
		if (length < 40) {
			return {mark: 0, line: 0};
		}
		return {mark: 11, line: 18};
	}

	function pointAlong(from, to, distance) {
		const dx = to.x - from.x;
		const dy = to.y - from.y;
		const length = Math.hypot(dx, dy) || 1;
		return {
			x: from.x + dx / length * distance,
			y: from.y + dy / length * distance
		};
	}

	function appendLine(start, end) {
		const line = document.createElementNS('http://www.w3.org/2000/svg', 'line');
		line.setAttribute('class', 'rel-line');
		line.setAttribute('x1', start.x);
		line.setAttribute('y1', start.y);
		line.setAttribute('x2', end.x);
		line.setAttribute('y2', end.y);
		joinLayer.appendChild(line);
	}

	function relationMark(point, many) {
		const text = document.createElementNS('http://www.w3.org/2000/svg', 'text');
		text.setAttribute('class', 'rel-mark' + (many ? ' is-many' : ' is-one'));
		text.setAttribute('x', point.x);
		text.setAttribute('y', point.y);
		text.appendChild(document.createTextNode(many ? '\u221e' : '1'));
		return text;
	}

	function hideRubber() {
		rubber.removeAttribute('x1');
		rubber.removeAttribute('y1');
		rubber.removeAttribute('x2');
		rubber.removeAttribute('y2');
	}

	function clearFieldState() {
		canvas.querySelectorAll('.rel-field').forEach(function (el) {
			el.classList.remove('is-source', 'is-target', 'is-hot', 'is-muted');
		});
	}

	function showPairState(sourceKey) {
		canvas.querySelectorAll('.rel-field').forEach(function (el) {
			el.classList.remove('is-source', 'is-target', 'is-hot', 'is-muted');
			if (el.dataset.key === sourceKey) {
				el.classList.add('is-source');
			} else if (isPartner(sourceKey, el.dataset.key)) {
				el.classList.add('is-target');
			} else {
				el.classList.add('is-muted');
			}
		});
	}

	function fieldFromPoint(clientX, clientY) {
		const el = document.elementFromPoint(clientX, clientY);
		return el ? el.closest('.rel-field') : null;
	}

	function moveRubber(clientX, clientY) {
		const source = fieldBox(drag.key);
		const over = fieldFromPoint(clientX, clientY);
		canvas.querySelectorAll('.is-hot').forEach(function (el) {
			el.classList.remove('is-hot');
		});
		let end;
		if (over && isPartner(drag.key, over.dataset.key)) {
			over.classList.add('is-hot');
			const overRect = over.getBoundingClientRect();
			const startGuess = anchor(source, overRect.left + overRect.width / 2);
			end = anchor(over, startGuess.x);
		} else {
			end = localPoint(clientX, clientY);
		}
		const start = anchor(source, end.x);
		rubber.setAttribute('x1', start.x);
		rubber.setAttribute('y1', start.y);
		rubber.setAttribute('x2', end.x);
		rubber.setAttribute('y2', end.y);
	}

	function onFieldPointerDown(event) {
		if (event.button !== 0 || !(event.currentTarget.classList.contains('is-pk') || event.currentTarget.classList.contains('is-fk'))) {
			return;
		}
		event.preventDefault();
		event.stopPropagation();
		drag = {
			type: 'relate',
			key: event.currentTarget.dataset.key,
			pointerId: event.pointerId
		};
		event.currentTarget.setPointerCapture(event.pointerId);
		showPairState(drag.key);
		moveRubber(event.clientX, event.clientY);
	}

	function onTitlePointerDown(event) {
		if (event.button !== 0 || drag) {
			return;
		}
		event.preventDefault();
		const table = event.currentTarget.closest('.rel-table');
		const rect = table.getBoundingClientRect();
		drag = {
			type: 'table',
			table: table,
			pointerId: event.pointerId,
			dx: event.clientX - rect.left,
			dy: event.clientY - rect.top
		};
		table.setPointerCapture(event.pointerId);
		selectTable(table);
	}

	function onPointerMove(event) {
		if (!drag || event.pointerId !== drag.pointerId) {
			return;
		}
		if (drag.type === 'relate') {
			moveRubber(event.clientX, event.clientY);
			return;
		}
		if (drag.type === 'column') {
			moveGhost(event.clientX, event.clientY);
			markSidebar(event.clientX, event.clientY);
			return;
		}
		const rect = canvas.getBoundingClientRect();
		const x = Math.max(0, event.clientX - rect.left - drag.dx + canvas.scrollLeft);
		const y = Math.max(0, event.clientY - rect.top - drag.dy + canvas.scrollTop);
		drag.table.style.left = x + 'px';
		drag.table.style.top = y + 'px';
		sizeSurface();
		drawJoins();
	}

	function sizeSurface() {
		let width = canvas.clientWidth;
		let height = canvas.clientHeight;
		canvas.querySelectorAll('.rel-table').forEach(measureTable);
		svg.style.width = width + 'px';
		svg.style.height = height + 'px';

		function measureTable(table) {
			width = Math.max(width, table.offsetLeft + table.offsetWidth + 24);
			height = Math.max(height, table.offsetTop + table.offsetHeight + 24);
		}
	}

	function onPointerUp(event) {
		if (!drag || event.pointerId !== drag.pointerId) {
			return;
		}
		if (drag.type === 'relate') {
			const over = fieldFromPoint(event.clientX, event.clientY);
			if (over && isPartner(drag.key, over.dataset.key)) {
				joins.set(joinId(drag.key, over.dataset.key), [drag.key, over.dataset.key]);
				saveRelationship(drag.key, over.dataset.key);
				writeSql();
			}
			hideRubber();
			clearFieldState();
			drawJoins();
		} else if (drag.type === 'column') {
			const key = drag.key;
			const over = pointInSidebar(event.clientX, event.clientY);
			const accepted = over && canDropField(key);
			sidebar.classList.remove('is-hot', 'is-blocked');
			if (accepted) {
				addChip(key);
				removeGhost();
			} else {
				revertGhost(key);
				if (over) {
					showNoRelationship();
				}
			}
		}
		drag = null;
	}

	function onColumnPointerDown(event) {
		if (event.button !== 0 || drag) {
			return;
		}
		event.preventDefault();
		event.stopPropagation();
		drag = {
			type: 'column',
			key: event.currentTarget.dataset.key,
			pointerId: event.pointerId
		};
		event.currentTarget.setPointerCapture(event.pointerId);
		showGhost(fieldName(drag.key), event.clientX, event.clientY);
		markSidebar(event.clientX, event.clientY);
	}

	function showGhost(key, clientX, clientY) {
		ghost = document.createElement('div');
		ghost.className = 'rel-ghost';
		ghost.appendChild(document.createTextNode(key));
		document.body.appendChild(ghost);
		moveGhost(clientX, clientY);
	}

	function moveGhost(clientX, clientY) {
		ghost.style.left = (clientX + 12) + 'px';
		ghost.style.top = (clientY + 12) + 'px';
	}

	function removeGhost() {
		if (ghost) {
			ghost.remove();
			ghost = null;
		}
	}

	function showNoRelationship() {
		clearTimeout(headerNotice);
		$('.card-header').removeClass('theme-primary theme-subtle').addClass('bg-subtle-danger').text('No relationship built');
		headerNotice = setTimeout(restoreHeader, 3000);
	}

	function restoreHeader() {
		$('.card-header').removeClass('bg-subtle-danger').addClass('theme-primary theme-subtle').text(headerTitle);
		headerNotice = null;
	}

	function revertGhost(key) {
		const field = fieldBox(key);
		const moving = ghost;
		if (!moving || !field) {
			removeGhost();
			return;
		}
		const rect = field.getBoundingClientRect();
		const current = moving.getBoundingClientRect();
		if (Math.abs(current.left - rect.left) < 2 && Math.abs(current.top - rect.top) < 2) {
			removeGhost();
			return;
		}
		moving.classList.add('is-reverting');
		moving.style.left = rect.left + 'px';
		moving.style.top = rect.top + 'px';
		moving.addEventListener('transitionend', finishRevert);

		function finishRevert(event) {
			if (event.propertyName !== 'left') {
				return;
			}
			moving.removeEventListener('transitionend', finishRevert);
			if (ghost === moving) {
				removeGhost();
			}
		}
	}

	function markSidebar(clientX, clientY) {
		const over = pointInSidebar(clientX, clientY);
		const allowed = over && canDropField(drag.key);
		sidebar.classList.toggle('is-hot', allowed);
		sidebar.classList.toggle('is-blocked', over && !allowed);
	}

	function pointInSidebar(clientX, clientY) {
		const rect = sidebar.getBoundingClientRect();
		return clientX >= rect.left && clientX <= rect.right && clientY >= rect.top && clientY <= rect.bottom;
	}

	function fieldName(key) {
		return key.slice(key.indexOf('.') + 1);
	}

	function tableName(key) {
		return key.slice(0, key.indexOf('.'));
	}

	function canDropField(key) {
		const selected = [];
		const allowed = {};
		let grew = true;
		sidebar.querySelectorAll('.rel-chip').forEach(readChip);
		if (!selected.length) {
			return true;
		}
		selected.forEach(allowTable);
		while (grew) {
			grew = false;
			joins.forEach(allowJoined);
		}
		return !!allowed[tableName(key)];

		function readChip(chip) {
			selected.push(tableName(chip.dataset.key));
		}

		function allowTable(name) {
			allowed[name] = true;
		}

		function allowJoined(pair) {
			const left = tableName(pair[0]);
			const right = tableName(pair[1]);
			if (allowed[left] && !allowed[right]) {
				allowed[right] = true;
				grew = true;
			}
			if (allowed[right] && !allowed[left]) {
				allowed[left] = true;
				grew = true;
			}
		}
	}

	function addChip(key) {
		if (sidebar.querySelector('.rel-chip[data-key="' + CSS.escape(key) + '"]')) {
			return;
		}
		const chip = document.createElement('div');
		const label = document.createElement('span');
		const remove = document.createElement('button');
		chip.className = 'rel-chip';
		chip.dataset.key = key;
		label.appendChild(document.createTextNode(fieldName(key)));
		remove.type = 'button';
		remove.className = 'rel-chip-remove';
		remove.setAttribute('aria-label', 'Remove ' + fieldName(key));
		remove.appendChild(document.createTextNode('\u00d7'));
		remove.addEventListener('click', onRemoveChip);
		chip.appendChild(label);
		chip.appendChild(remove);
		sidebar.appendChild(chip);
		syncHint();
		writeSql();
	}

	function onRemoveChip(event) {
		event.currentTarget.closest('.rel-chip').remove();
		syncHint();
		writeSql();
	}

	function writeSql() {
		const chips = [];
		const sql = sqlText(readChips());
		$('#sql-stmt').text(sql);
		loadResults(sql, readChips());

		function readChips() {
			chips.length = 0;
			sidebar.querySelectorAll('.rel-chip').forEach(readChip);
			return chips;
		}

		function readChip(chip) {
			chips.push(chip.dataset.key);
		}
	}

	function loadResults(sql, chips) {
		const requestId = ++resultRequest;
		if (!sql) {
			clearResults();
			return;
		}
		const url = 'results.cfm';
		const form = {};
		form.body = new URLSearchParams();
		form.body.set('id', app.id);
		form.body.set('sql', sql);
		form.body.set('fields', chips.join(','));
		fetch(url, form)
			.then(json_done)
			.then(show)
			.catch(caught(url));

		function show(response) {
			if (requestId === resultRequest) {
				showResults(response);
			}
			return response;
		}
	}

	function clearResults() {
		document.getElementById('rel-results').replaceChildren();
	}

	function showResults(response) {
		const columns = response.columns || response.COLUMNS || [];
		const records = response.rows || response.ROWS || [];
		const table = document.getElementById('rel-results');
		const thead = document.createElement('thead');
		const tbody = document.createElement('tbody');
		const headRow = document.createElement('tr');
		columns.forEach(addHead);
		thead.appendChild(headRow);
		records.forEach(addRecord);
		table.replaceChildren(thead, tbody);

		function addHead(column) {
			const th = document.createElement('th');
			if (isNumeric(column)) {
				th.className = 'text-end';
			}
			th.appendChild(document.createTextNode(columnName(column)));
			headRow.appendChild(th);
		}

		function addRecord(record) {
			const tr = document.createElement('tr');
			record.forEach(addCell);
			tbody.appendChild(tr);

			function addCell(value, index) {
				const td = document.createElement('td');
				if (columns[index] && isNumeric(columns[index])) {
					td.className = 'text-end';
				}
				td.appendChild(document.createTextNode(value));
				tr.appendChild(td);
			}
		}
	}

	function columnName(column) {
		if (column.name !== undefined) {
			return column.name;
		}
		return column.NAME;
	}

	function isNumeric(column) {
		const numeric = column.numeric !== undefined ? column.numeric : column.NUMERIC;
		return numeric === true || numeric === 1 || numeric === 'true' || numeric === 'YES';
	}

	function sqlText(chips) {
		const fields = [];
		const tables = [];
		const included = {};
		const lines = [];
		if (!chips.length) {
			return '';
		}
		chips.forEach(collect);
		lines.push('select ' + fields.join(','));
		lines.push('from ' + tables[0]);
		included[tables[0]] = true;
		tables.forEach(addTable);
		return lines.join('\n');

		function collect(key) {
			const table = tableName(key);
			fields.push(fieldName(key));
			if (tables.indexOf(table) === -1) {
				tables.push(table);
			}
		}

		function addTable(table) {
			if (included[table]) {
				return;
			}
			joinPath(included, table).forEach(appendJoin);
		}

		function appendJoin(step) {
			lines.push('join ' + step.table + ' on ' + step.left + '=' + step.right);
			included[step.table] = true;
		}
	}

	function joinPath(included, target) {
		const seen = {};
		const queue = [];
		let current = null;
		Object.keys(included).forEach(seed);
		while (queue.length) {
			current = queue.shift();
			if (current.table === target) {
				return current.steps;
			}
			joins.forEach(consider);
		}
		return [];

		function seed(name) {
			seen[name] = true;
			queue.push({table: name, steps: []});
		}

		function consider(pair) {
			const leftTable = tableName(pair[0]);
			const rightTable = tableName(pair[1]);
			if (leftTable === current.table && !seen[rightTable]) {
				enqueue(rightTable, pair[0], pair[1]);
			}
			if (rightTable === current.table && !seen[leftTable]) {
				enqueue(leftTable, pair[1], pair[0]);
			}
		}

		function enqueue(table, left, right) {
			const steps = current.steps.slice();
			seen[table] = true;
			steps.push({table: table, left: left, right: right});
			queue.push({table: table, steps: steps});
		}
	}

	function syncHint() {
		sidebar.querySelector('.rel-fields-hint').hidden = !!sidebar.querySelector('.rel-chip');
	}

	function saveRelationship(sourceKey, targetKey) {
		const ansid = foreignAnsId(sourceKey, targetKey);
		if (!ansid) {
			return;
		}
		const url = '../guess/merge_relationships.cfm';
		const form = {};
		form.body = new URLSearchParams();
		form.body.set('id', app.id);
		form.body.set('ansid', ansid);
		fetch(url, form)
			.then(text_done)
			.then(showEarned)
			.catch(caught(url));
	}

	function foreignAnsId(sourceKey, targetKey) {
		const source = fieldBox(sourceKey);
		const target = fieldBox(targetKey);
		if (source && source.classList.contains('is-fk')) {
			return source.dataset.ansid;
		}
		if (target && target.classList.contains('is-fk')) {
			return target.dataset.ansid;
		}
		return '';
	}

	function showEarned(response) {
		const pct = parseFloat(response);
		$('.progress-bar').css('width', pct + '%')
			.attr('aria-valuenow', pct)
			.text(pct + '%');
		if (pct >= 100) {
			$('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold');
		}
		return response;
	}

	function modalButton(tableId) {
		const modalId = tableId.toLowerCase() + '-modal';
		if (!document.getElementById(modalId)) {
			return null;
		}
		const icon = document.createElement('i');
		icon.className = 'bi bi-table float-end';
		icon.setAttribute('role', 'button');
		icon.setAttribute('aria-label', 'Show ' + tableId);
		icon.addEventListener('pointerdown', onModalPointerDown);
		icon.addEventListener('click', onModalClick);
		return icon;
	}

	function onModalPointerDown(event) {
		event.stopPropagation();
	}

	function onModalClick(event) {
		const tableId = event.currentTarget.closest('.rel-table').dataset.table;
		showLookupModal(tableId.toLowerCase() + '-modal');
	}

	function showLookupModal(id) {
		if (!(window.bootstrap && bootstrap.Dialog)) {
			document.addEventListener('bootstrap-ready', openWhenReady);
			return;
		}
		bootstrap.Dialog.getOrCreateInstance(document.getElementById(id)).show();

		function openWhenReady() {
			document.removeEventListener('bootstrap-ready', openWhenReady);
			showLookupModal(id);
		}
	}

	document.addEventListener('pointermove', onPointerMove);
	document.addEventListener('pointerup', onPointerUp);
	document.addEventListener('pointercancel', onPointerUp);

	layoutTables();
	renderTables();
	sizeSurface();
	drawJoins();

	function layoutTables() {
		const columns = [[], [], []];
		const incoming = {};
		const y = [28, 28, 28];
		const x = [36, 340, 660];
		let bottom = 0;
		pairs.forEach(markIncoming);
		tables.forEach(assignColumn);
		columns.forEach(placeColumn);
		if (bottom + 24 > canvas.clientHeight) {
			canvas.style.height = (bottom + 24) + 'px';
		}

		function markIncoming(pair) {
			incoming[pair[0].split('.')[0]] = true;
		}

		function assignColumn(table) {
			let hasOutgoing = false;
			table.fields.forEach(checkField);
			if (!hasOutgoing) {
				columns[2].push(table);
			} else if (incoming[table.id]) {
				columns[0].push(table);
			} else {
				columns[1].push(table);
			}

			function checkField(field) {
				if (!field.pk && partners.has(fieldKey(table.id, field.name))) {
					hasOutgoing = true;
				}
			}
		}

		function placeColumn(column, index) {
			column.forEach(placeTable);

			function placeTable(table) {
				const height = 28 + table.fields.length * 22;
				table.x = x[index];
				table.y = y[index];
				y[index] += height + 18;
				bottom = Math.max(bottom, table.y + height);
			}
		}
	}
})();
