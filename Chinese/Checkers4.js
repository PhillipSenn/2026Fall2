(function () {
	const board = document.getElementById('board');
	const status = document.getElementById('status');
	if (!board || !status) {
		return;
	}

	const seatOrder = ['bottom', 'bottomLeft', 'topLeft', 'top', 'topRight', 'bottomRight'];
	const seatHome = {
		bottom: 'blue',
		bottomLeft: 'purple',
		topLeft: 'orange',
		top: 'red',
		topRight: 'yellow',
		bottomRight: 'green'
	};
	const oppositeSeat = {
		bottom: 'top',
		top: 'bottom',
		bottomLeft: 'topRight',
		topRight: 'bottomLeft',
		topLeft: 'bottomRight',
		bottomRight: 'topLeft'
	};
	const openingColors = ['blue', 'purple', 'orange', 'red', 'yellow', 'green'];
	let colors = openingColors.slice();
	const human = 'bottom';
	const rowCounts = [1, 2, 3, 4, 13, 12, 11, 10, 9, 10, 11, 12, 13, 4, 3, 2, 1];
	const dirs = [[2, 0], [-2, 0], [1, -1], [-1, -1], [1, 1], [-1, 1]];
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

	const goalDist = {};
	seatOrder.forEach(function (seat) {
		const targetHome = seatHome[oppositeSeat[seat]];
		const dist = {};
		const queue = [];
		Object.keys(holes).forEach(function (key) {
			if (holes[key].home === targetHome) {
				dist[key] = 0;
				queue.push(key);
			}
		});
		for (let i = 0; i < queue.length; i++) {
			const key = queue[i];
			dirs.forEach(function (dir) {
				const next = neighbor(key, dir);
				if (!next || dist[next.key] !== undefined) {
					return;
				}
				dist[next.key] = dist[key] + 1;
				queue.push(next.key);
			});
		}
		goalDist[seat] = dist;
	});

	let occupants = {};
	let players = [];
	let turn = 0;
	let playerCount = 0;
	let selected = null;
	let winner = null;
	let legal = {};
	let dragSource = null;
	let dragPath = null;
	let dragKind = null;
	let busy = false;
	let timer = null;
	let moveId = 0;
	let ignoreClick = false;
	const tempo = {};

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
		if (count === 1) {
			return ['bottom'];
		}
		if (count === 2) {
			return ['bottom', 'top'];
		}
		if (count === 3) {
			return ['bottom', 'topLeft', 'topRight'];
		}
		if (count === 4) {
			return ['bottom', 'bottomLeft', 'top', 'topRight'];
		}
		return seatOrder.slice();
	}

	function colorOf(seat) {
		return colors[seatOrder.indexOf(seat)];
	}

	function current() {
		return players[turn];
	}

	function neighbor(key, dir) {
		const parts = key.split(',');
		const next = (Number(parts[0]) + dir[0]) + ',' + (Number(parts[1]) + dir[1]);
		return holes[next] || null;
	}

	function inTarget(key, seat) {
		return holes[key].home === seatHome[oppositeSeat[seat]];
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

	function yourTurn() {
		return !busy && !winner && current() === human;
	}

	function canDrag(key) {
		if (!yourTurn() || occupants[key] !== human) {
			return false;
		}
		return true;
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
			span.className = 'marble ' + colorOf(color);
			span.draggable = canDrag(key);
			el.appendChild(span);
		});
	}

	function showMoves(key) {
		clearMarks();
		selected = key;
		holes[key].el.classList.add('selected');
		Object.keys(occupants).forEach(function (holeKey) {
			if (occupants[holeKey] === human) {
				holes[holeKey].el.classList.add('turn');
			}
		});
		stepTargets(key, human).forEach(function (to) {
			legal[to] = 'step';
			holes[to].el.classList.add('legal');
		});
		jumpTargets(key, human).forEach(function (to) {
			legal[to] = 'jump';
			holes[to].el.classList.add('jump');
		});
	}

	function showTurn() {
		clearMarks();
		selected = null;
		if (!yourTurn()) {
			return;
		}
		Object.keys(occupants).forEach(function (key) {
			if (occupants[key] === human) {
				holes[key].el.classList.add('turn');
			}
		});
	}

	function declare(color) {
		winner = color;
		busy = false;
		selected = null;
		if (timer) {
			clearTimeout(timer);
			timer = null;
		}
		clearMarks();
		render();
		status.textContent = color === human ? 'You win.' : label[color] + ' wins.';
	}

	function finishTurn() {
		const color = current();
		selected = null;
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
			busy = false;
			clearMarks();
			render();
			status.textContent = 'No legal moves remain.';
			return;
		}
		if (current() === human) {
			busy = false;
		}
		render();
		if (current() === human) {
			showTurn();
			status.textContent = players.length === 1 ? 'Try a move.' : 'Your turn.';
			return;
		}
		status.textContent = label[colorOf(current())] + ' is moving.';
		scheduleComputer();
	}

	function applyMove(toKey) {
		const fromKey = selected;
		const color = occupants[fromKey];
		occupants[toKey] = color;
		occupants[fromKey] = '';
		render();
		if (hasWon(color)) {
			declare(color);
			return;
		}
		finishTurn();
	}

	function better(candidate, best) {
		if (!best || candidate.gain !== best.gain) {
			return !best || candidate.gain > best.gain;
		}
		if (candidate.fromDist !== best.fromDist) {
			return candidate.fromDist > best.fromDist;
		}
		return candidate.jumps > best.jumps;
	}

	function bestMove(color) {
		let best = null;
		function consider(from, path, jumps) {
			const to = path[path.length - 1];
			const fromDist = goalDist[color][from];
			const candidate = {
				from: from,
				path: path,
				gain: fromDist - goalDist[color][to],
				fromDist: fromDist,
				jumps: jumps
			};
			if (better(candidate, best)) {
				best = candidate;
			}
		}
		function walk(origin, key, path) {
			if (path.length >= 12) {
				return;
			}
			jumpTargets(key, color).forEach(function (to) {
				if (to === origin || path.indexOf(to) !== -1) {
					return;
				}
				const next = path.concat(to);
				consider(origin, next, next.length);
				const savedFrom = occupants[key];
				const savedTo = occupants[to];
				occupants[key] = '';
				occupants[to] = color;
				walk(origin, to, next);
				occupants[key] = savedFrom;
				occupants[to] = savedTo;
			});
		}
		Object.keys(occupants).forEach(function (from) {
			if (occupants[from] !== color) {
				return;
			}
			stepTargets(from, color).forEach(function (to) {
				consider(from, [to], 0);
			});
			walk(from, from, []);
		});
		return best;
	}

	function scheduleComputer() {
		if (timer) {
			clearTimeout(timer);
			timer = null;
		}
		if (winner || current() === human) {
			busy = false;
			return;
		}
		busy = true;
		const id = moveId;
		const pace = tempo[current()] || 1;
		const think = Math.round((350 + Math.random() * 1900) * pace);
		timer = setTimeout(function () {
			timer = null;
			if (id !== moveId) {
				return;
			}
			computerStep(id);
		}, think);
	}

	function computerStep(id) {
		if (id !== moveId || winner || current() === human) {
			return;
		}
		const color = current();
		const move = bestMove(color);
		if (!move) {
			finishTurn();
			return;
		}
		busy = true;
		let from = move.from;
		function hop(index) {
			if (id !== moveId || winner) {
				return;
			}
			const to = move.path[index];
			glide(from, to, color, function (ok) {
				if (!ok || id !== moveId || winner) {
					return;
				}
				from = to;
				if (hasWon(color)) {
					declare(color);
					return;
				}
				if (index + 1 < move.path.length) {
				timer = setTimeout(function () {
					hop(index + 1);
				}, Math.round((150 + Math.random() * 700) * (tempo[color] || 1)));
					return;
				}
				timer = setTimeout(function () {
					timer = null;
					if (id !== moveId) {
						return;
					}
					finishTurn();
				}, 400);
			});
		}
		hop(0);
	}

	function glide(fromKey, toKey, color, done) {
		const id = moveId;
		const pace = tempo[color] || 1;
		const ms = Math.round((280 + Math.random() * 1100) * pace);
		occupants[fromKey] = '';
		render();
		clearMarks();
		const boardBox = board.getBoundingClientRect();
		const fromBox = holes[fromKey].el.getBoundingClientRect();
		const toBox = holes[toKey].el.getBoundingClientRect();
		const flyer = document.createElement('span');
		flyer.className = 'marble flying ' + colorOf(color);
		flyer.dataset.from = fromKey;
		flyer.dataset.owner = color;
		flyer.style.transition = 'left ' + ms + 'ms ease-in-out, top ' + ms + 'ms ease-in-out';
		const size = fromBox.width * 0.76;
		flyer.style.width = size + 'px';
		flyer.style.height = size + 'px';
		function place(box) {
			flyer.style.left = (box.left - boardBox.left + (box.width - size) / 2) + 'px';
			flyer.style.top = (box.top - boardBox.top + (box.height - size) / 2) + 'px';
		}
		place(fromBox);
		board.appendChild(flyer);
		requestAnimationFrame(function () {
			requestAnimationFrame(function () {
				place(toBox);
			});
		});
		timer = setTimeout(function () {
			flyer.remove();
			if (id !== moveId) {
				done(false);
				return;
			}
			occupants[toKey] = color;
			render();
			holes[toKey].el.classList.add('selected');
			done(true);
		}, ms + 60);
	}

	function stopMotion() {
		moveId += 1;
		if (timer) {
			clearTimeout(timer);
			timer = null;
		}
		board.querySelectorAll('.marble.flying').forEach(function (flyer) {
			if (flyer.dataset.from && !occupants[flyer.dataset.from]) {
				occupants[flyer.dataset.from] = flyer.dataset.owner;
			}
			flyer.remove();
		});
	}

	function placePlayers() {
		occupants = {};
		Object.keys(holes).forEach(function (key) {
			const home = holes[key].home;
			let seat = '';
			players.forEach(function (player) {
				if (seatHome[player] === home) {
					seat = player;
				}
			});
			occupants[key] = seat;
		});
	}

	function assignTempos() {
		players.forEach(function (seat) {
			if (seat === human) {
				return;
			}
			tempo[seat] = 0.45 + Math.random() * 1.6;
		});
	}

	function startGame(count) {
		stopMotion();
		playerCount = count;
		colors = openingColors.slice();
		players = lineup(count);
		assignTempos();
		turn = 0;
		winner = null;
		selected = null;
		dragSource = null;
		dragPath = null;
		dragKind = null;
		busy = false;
		placePlayers();
		document.querySelectorAll('#players button').forEach(function (button) {
			const on = Number(button.dataset.players) === count;
			button.classList.toggle('btn-secondary', on);
			button.classList.toggle('btn-outline-secondary', !on);
		});
		render();
		showTurn();
		status.textContent = count === 1 ? 'Try a move.' : 'Your turn.';
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
		if (!hole || !yourTurn()) {
			return;
		}
		const key = hole.dataset.key;
		if (ignoreClick) {
			return;
		}
		if (legal[key]) {
			applyMove(key);
			return;
		}
		if (occupants[key] !== human) {
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
		dragPath = [key];
		dragKind = null;
		showMoves(key);
		marble.classList.add('dragging');
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData('text/plain', key);
	});

	function jumpsFrom(origin, tip) {
		const color = occupants[origin];
		if (tip === origin) {
			return jumpTargets(origin, color);
		}
		const savedOrigin = occupants[origin];
		const savedTip = occupants[tip];
		occupants[origin] = '';
		occupants[tip] = color;
		const next = jumpTargets(tip, color);
		occupants[origin] = savedOrigin;
		occupants[tip] = savedTip;
		return next;
	}

	function paintDrag() {
		const origin = dragPath[0];
		const tip = dragPath[dragPath.length - 1];
		const color = occupants[origin];
		clearMarks();
		selected = origin;
		holes[origin].el.classList.add('selected');
		if (dragPath.length === 1) {
			stepTargets(origin, color).forEach(function (to) {
				legal[to] = 'step';
				holes[to].el.classList.add('legal');
			});
			jumpTargets(origin, color).forEach(function (to) {
				legal[to] = 'jump';
				holes[to].el.classList.add('jump');
			});
			return;
		}
		dragPath.slice(1).forEach(function (key) {
			legal[key] = dragKind === 'step' ? 'step' : 'stop';
			if (dragKind !== 'step') {
				holes[key].el.classList.add('jump');
			}
		});
		holes[tip].el.classList.add('drag-over');
		if (dragKind === 'jump') {
			jumpsFrom(origin, tip).forEach(function (to) {
				legal[to] = 'jump';
				holes[to].el.classList.add('jump');
			});
		}
	}

	board.addEventListener('dragend', function (event) {
		const marble = event.target.closest('.marble');
		if (marble) {
			marble.classList.remove('dragging');
		}
		board.querySelectorAll('.drag-over').forEach(function (el) {
			el.classList.remove('drag-over');
		});
		dragSource = null;
		dragPath = null;
		dragKind = null;
	});

	board.addEventListener('dragover', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || !dragPath) {
			return;
		}
		const key = hole.dataset.key;
		const tip = dragPath[dragPath.length - 1];
		if (key === tip) {
			event.preventDefault();
			return;
		}
		if (key === dragPath[0]) {
			dragPath = [dragPath[0]];
			dragKind = null;
			paintDrag();
			event.preventDefault();
			return;
		}
		const earlier = dragPath.indexOf(key);
		if (earlier > 0) {
			dragPath = dragPath.slice(0, earlier + 1);
			paintDrag();
			event.preventDefault();
			return;
		}
		if (legal[key] === 'jump') {
			dragKind = 'jump';
			dragPath.push(key);
			paintDrag();
			event.preventDefault();
			return;
		}
		if (legal[key] === 'step') {
			dragKind = 'step';
			dragPath = [dragPath[0], key];
			paintDrag();
			event.preventDefault();
		}
	});

	board.addEventListener('drop', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || !dragPath) {
			return;
		}
		const key = hole.dataset.key;
		if (key !== dragPath[dragPath.length - 1] && !legal[key]) {
			return;
		}
		if (legal[key] === 'jump' && dragPath[dragPath.length - 1] !== key) {
			dragPath.push(key);
		}
		if (legal[key] === 'step') {
			dragPath = [dragPath[0], key];
		}
		const dest = dragPath[dragPath.length - 1];
		const origin = dragPath[0];
		event.preventDefault();
		dragSource = null;
		dragPath = null;
		ignoreClick = true;
		setTimeout(function () {
			ignoreClick = false;
		}, 0);
		if (dest === origin) {
			return;
		}
		selected = origin;
		applyMove(dest);
	});

	document.getElementById('flip').addEventListener('click', function () {
		colors.unshift(colors.pop());
		render();
		board.querySelectorAll('.marble.flying').forEach(function (flyer) {
			flyer.className = 'marble flying ' + colorOf(flyer.dataset.owner);
		});
	});

	document.getElementById('reset').addEventListener('click', function () {
		if (playerCount) {
			startGame(playerCount);
		}
	});

	startGame(1);
})();
