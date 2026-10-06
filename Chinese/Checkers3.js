(function () {
	const board = document.getElementById('board');
	const status = document.getElementById('status');
	const endBtn = document.getElementById('end');
	if (!board || !status || !endBtn) {
		return;
	}

	const rowCounts = [1, 2, 3, 4, 13, 12, 11, 10, 9, 10, 11, 12, 13, 4, 3, 2, 1];
	const dirs = [[2, 0], [-2, 0], [1, -1], [-1, -1], [1, 1], [-1, 1]];
	const clockwise = ['red', 'yellow', 'green', 'blue', 'purple', 'orange'];
	const opposite = {
		red: 'blue',
		blue: 'red',
		orange: 'green',
		green: 'orange',
		yellow: 'purple',
		purple: 'yellow'
	};
	const label = {
		red: 'Red',
		orange: 'Orange',
		yellow: 'Yellow',
		green: 'Green',
		blue: 'Blue',
		purple: 'Purple'
	};

	const holes = {};
	board.querySelectorAll('.cc-row').forEach(function (rowEl, ri) {
		const row = ri + 1;
		const count = rowCounts[ri];
		rowEl.querySelectorAll('.hole').forEach(function (el, index) {
			const x = 2 * index - (count - 1);
			const key = x + ',' + row;
			el.dataset.key = key;
			holes[key] = {
				el: el,
				key: key,
				home: homeOf(row, index + 1, count)
			};
		});
	});

	let occupants = {};
	let players = [];
	let turn = 0;
	let playerCount = 0;
	let selected = null;
	let chain = false;
	let winner = null;
	let legal = {};
	let dragSource = null;

	function homeOf(row, i, count) {
		if (row <= 4) {
			return 'red';
		}
		if (row >= 14) {
			return 'blue';
		}
		if (row <= 8) {
			const n = 9 - row;
			if (i <= n) {
				return 'orange';
			}
			if (i > count - n) {
				return 'yellow';
			}
		}
		if (row >= 10) {
			const n = row - 9;
			if (i <= n) {
				return 'purple';
			}
			if (i > count - n) {
				return 'green';
			}
		}
		return '';
	}

	function lineup(count) {
		if (count === 2) {
			return ['red', 'blue'];
		}
		if (count === 3) {
			return ['red', 'green', 'purple'];
		}
		if (count === 4) {
			return ['red', 'yellow', 'blue', 'purple'];
		}
		return clockwise.slice();
	}

	function current() {
		return players[turn];
	}

	function neighbor(key, dir) {
		const parts = key.split(',');
		const next = (Number(parts[0]) + dir[0]) + ',' + (Number(parts[1]) + dir[1]);
		return holes[next] || null;
	}

	function inTarget(key, color) {
		return holes[key].home === opposite[color];
	}

	function canLand(fromKey, toKey, color) {
		return !inTarget(fromKey, color) || inTarget(toKey, color);
	}

	function stepTargets(key, color) {
		const found = [];
		dirs.forEach(function (dir) {
			const next = neighbor(key, dir);
			if (!next || occupants[next.key]) {
				return;
			}
			if (canLand(key, next.key, color)) {
				found.push(next.key);
			}
		});
		return found;
	}

	function jumpTargets(key, color) {
		const found = [];
		dirs.forEach(function (dir) {
			const mid = neighbor(key, dir);
			if (!mid || !occupants[mid.key]) {
				return;
			}
			const land = neighbor(mid.key, dir);
			if (!land || occupants[land.key]) {
				return;
			}
			if (canLand(key, land.key, color)) {
				found.push(land.key);
			}
		});
		return found;
	}

	function hasWon(color) {
		let count = 0;
		Object.keys(occupants).forEach(function (key) {
			if (occupants[key] === color && inTarget(key, color)) {
				count += 1;
			}
		});
		return count === 10;
	}

	function anyMove(color) {
		return Object.keys(occupants).some(function (key) {
			if (occupants[key] !== color) {
				return false;
			}
			return stepTargets(key, color).length || jumpTargets(key, color).length;
		});
	}

	function canDrag(key) {
		if (winner || occupants[key] !== current()) {
			return false;
		}
		return !chain || key === selected;
	}

	function clearMarks() {
		legal = {};
		Object.keys(holes).forEach(function (key) {
			holes[key].el.classList.remove('selected', 'legal', 'jump', 'turn', 'drag-over');
		});
	}

	function render() {
		Object.keys(holes).forEach(function (key) {
			const el = holes[key].el;
			const marble = el.querySelector('.marble');
			if (marble) {
				marble.remove();
			}
			const color = occupants[key];
			if (!color) {
				return;
			}
			const span = document.createElement('span');
			span.className = 'marble ' + color;
			span.draggable = canDrag(key);
			el.appendChild(span);
		});
	}

	function showMoves(key) {
		clearMarks();
		selected = key;
		holes[key].el.classList.add('selected');
		if (!chain) {
			Object.keys(occupants).forEach(function (holeKey) {
				if (occupants[holeKey] === current()) {
					holes[holeKey].el.classList.add('turn');
				}
			});
			stepTargets(key, current()).forEach(function (to) {
				legal[to] = 'step';
				holes[to].el.classList.add('legal');
			});
		}
		jumpTargets(key, current()).forEach(function (to) {
			legal[to] = 'jump';
			holes[to].el.classList.add('jump');
		});
	}

	function showTurn() {
		clearMarks();
		selected = null;
		if (winner) {
			return;
		}
		Object.keys(occupants).forEach(function (key) {
			if (occupants[key] === current()) {
				holes[key].el.classList.add('turn');
			}
		});
	}

	function declare(color) {
		winner = color;
		chain = false;
		selected = null;
		endBtn.hidden = true;
		clearMarks();
		render();
		status.textContent = label[color] + ' wins.';
	}

	function finishTurn() {
		const color = current();
		chain = false;
		selected = null;
		endBtn.hidden = true;
		if (hasWon(color)) {
			declare(color);
			return;
		}
		let skipped = 0;
		do {
			turn = (turn + 1) % players.length;
			skipped += 1;
		} while (!anyMove(current()) && skipped <= players.length);
		if (!anyMove(current())) {
			clearMarks();
			render();
			status.textContent = 'No legal moves remain.';
			return;
		}
		render();
		showTurn();
		status.textContent = label[current()] + ' to move.';
	}

	function applyMove(toKey) {
		const kind = legal[toKey];
		const fromKey = selected;
		const color = occupants[fromKey];
		occupants[toKey] = color;
		occupants[fromKey] = '';
		render();
		if (hasWon(color)) {
			declare(color);
			return;
		}
		if (kind === 'jump' && jumpTargets(toKey, color).length) {
			chain = true;
			showMoves(toKey);
			endBtn.hidden = false;
			render();
			holes[toKey].el.classList.add('selected');
			status.textContent = label[color] + ' jumped. Jump again, or end the turn.';
			return;
		}
		finishTurn();
	}

	function startGame(count) {
		playerCount = count;
		players = lineup(count);
		turn = 0;
		winner = null;
		chain = false;
		selected = null;
		dragSource = null;
		endBtn.hidden = true;
		occupants = {};
		Object.keys(holes).forEach(function (key) {
			const home = holes[key].home;
			occupants[key] = players.indexOf(home) >= 0 ? home : '';
		});
		document.querySelectorAll('#players button').forEach(function (button) {
			const on = Number(button.dataset.players) === count;
			button.classList.toggle('btn-secondary', on);
			button.classList.toggle('btn-outline-secondary', !on);
		});
		render();
		showTurn();
		status.textContent = label[current()] + ' to move.';
	}

	document.getElementById('players').addEventListener('click', function (event) {
		const button = event.target.closest('[data-players]');
		if (!button) {
			return;
		}
		startGame(Number(button.dataset.players));
	});

	board.addEventListener('click', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || winner || !playerCount) {
			return;
		}
		const key = hole.dataset.key;
		if (legal[key]) {
			applyMove(key);
			return;
		}
		if (chain) {
			return;
		}
		if (occupants[key] !== current()) {
			selected = null;
			showTurn();
			return;
		}
		showMoves(key);
	});

	board.addEventListener('dragstart', function (event) {
		const marble = event.target.closest('.marble');
		if (!marble) {
			return;
		}
		const key = marble.parentElement.dataset.key;
		if (!canDrag(key)) {
			event.preventDefault();
			return;
		}
		dragSource = key;
		showMoves(key);
		marble.classList.add('dragging');
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData('text/plain', key);
	});

	board.addEventListener('dragend', function (event) {
		const marble = event.target.closest('.marble');
		if (marble) {
			marble.classList.remove('dragging');
		}
		board.querySelectorAll('.drag-over').forEach(function (el) {
			el.classList.remove('drag-over');
		});
		dragSource = null;
	});

	board.addEventListener('dragover', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || !dragSource || !legal[hole.dataset.key]) {
			return;
		}
		event.preventDefault();
		board.querySelectorAll('.drag-over').forEach(function (el) {
			el.classList.remove('drag-over');
		});
		hole.classList.add('drag-over');
	});

	board.addEventListener('drop', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || !dragSource || !legal[hole.dataset.key]) {
			return;
		}
		event.preventDefault();
		const toKey = hole.dataset.key;
		dragSource = null;
		applyMove(toKey);
	});

	endBtn.addEventListener('click', function () {
		if (chain && !winner) {
			finishTurn();
		}
	});

	document.getElementById('flip').addEventListener('click', function () {
		board.classList.toggle('flipped');
	});

	document.getElementById('reset').addEventListener('click', function () {
		board.classList.remove('flipped');
		if (playerCount) {
			startGame(playerCount);
		}
	});

	startGame(2);
})();
