(function () {
	const relData = JSON.parse(document.getElementById('rel-data').textContent);
	const tables = (relData.tables || relData.TABLES).map(readTable);
	const pairs = relData.pairs || relData.PAIRS;
	const lookups = relData.lookups || relData.LOOKUPS;

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
			pk: pk === true || pk === 1 || pk === 'true'
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
			title.textContent = table.id;
			title.addEventListener('pointerdown', onTitlePointerDown);
			box.appendChild(title);

			table.fields.forEach(function (field) {
				const key = fieldKey(table.id, field.name);
				const foreign = !field.pk && partners.has(key);
				const row = document.createElement('div');
				row.className = 'rel-field' + (field.pk ? ' is-pk' : '') + (foreign ? ' is-fk' : '');
				row.dataset.key = key;
				row.setAttribute('aria-label', field.name);
				row.appendChild(keyIcon(field.pk));
				row.appendChild(document.createTextNode(field.name));
				if (field.pk || foreign) {
					row.setAttribute('role', 'button');
					row.addEventListener('pointerdown', onFieldPointerDown);
				}
				if (lookups[field.name]) {
					row.classList.add('is-lookup');
					row.setAttribute('role', 'button');
					row.addEventListener('click', function () {
						showLookupModal(lookups[field.name]);
					});
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
		joins.forEach(function (pair) {
			const from = fieldBox(pair[0]);
			const to = fieldBox(pair[1]);
			if (!from || !to) {
				return;
			}
			const fromRect = from.getBoundingClientRect();
			const toRect = to.getBoundingClientRect();
			const start = anchor(from, toRect.left + toRect.width / 2);
			const end = anchor(to, fromRect.left + fromRect.width / 2);
			const line = document.createElementNS('http://www.w3.org/2000/svg', 'line');
			line.setAttribute('class', 'rel-line');
			line.setAttribute('x1', start.x);
			line.setAttribute('y1', start.y);
			line.setAttribute('x2', end.x);
			line.setAttribute('y2', end.y);
			joinLayer.appendChild(line);
		});
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
		const rect = canvas.getBoundingClientRect();
		const x = Math.max(0, event.clientX - rect.left - drag.dx + canvas.scrollLeft);
		const y = Math.max(0, event.clientY - rect.top - drag.dy + canvas.scrollTop);
		drag.table.style.left = x + 'px';
		drag.table.style.top = y + 'px';
		drawJoins();
	}

	function onPointerUp(event) {
		if (!drag || event.pointerId !== drag.pointerId) {
			return;
		}
		if (drag.type === 'relate') {
			const over = fieldFromPoint(event.clientX, event.clientY);
			if (over && isPartner(drag.key, over.dataset.key)) {
				joins.set(joinId(drag.key, over.dataset.key), [drag.key, over.dataset.key]);
			}
			hideRubber();
			clearFieldState();
			drawJoins();
		}
		drag = null;
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
