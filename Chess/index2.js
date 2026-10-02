(function () {
	const boardEl = document.getElementById('board');
	const statusEl = document.getElementById('status');
	const promoteEl = document.getElementById('promote');
	const startHTML = boardEl.innerHTML;
	const files = 'abcdefgh';
	const glyphs = {
		white: { K: '\u2654', Q: '\u2655', R: '\u2656', B: '\u2657', N: '\u2658', P: '\u2659' },
		black: { K: '\u265A', Q: '\u265B', R: '\u265C', B: '\u265D', N: '\u265E', P: '\u265F' }
	};
	const types = {};
	Object.keys(glyphs).forEach(function (side) {
		Object.keys(glyphs[side]).forEach(function (type) {
			types[glyphs[side][type]] = type;
		});
	});
	const knightDeltas = [[1, 2], [2, 1], [-1, 2], [-2, 1], [1, -2], [2, -1], [-1, -2], [-2, -1]];
	const bishopDirs = [[1, 1], [1, -1], [-1, 1], [-1, -1]];
	const rookDirs = [[1, 0], [-1, 0], [0, 1], [0, -1]];

	let state = freshState();
	let selected = null;
	let selectedMoves = [];
	let dragMoves = [];
	let pending = null;

	function freshState() {
		return {
			turn: 'white',
			castle: { whiteK: true, whiteQ: true, blackK: true, blackQ: true },
			ep: null,
			over: false,
			result: ''
		};
	}

	function parse(square) {
		return { f: files.indexOf(square[0]), r: Number(square[1]) - 1 };
	}

	function name(file, rank) {
		if (file < 0 || file > 7 || rank < 0 || rank > 7) {
			return null;
		}
		return files[file] + (rank + 1);
	}

	function squareEl(square) {
		return boardEl.querySelector('[data-square="' + square + '"]');
	}

	function enemy(side) {
		return side === 'white' ? 'black' : 'white';
	}

	function readBoard() {
		const board = {};
		boardEl.querySelectorAll('.square').forEach(function (square) {
			const piece = square.querySelector('.piece');
			if (!piece) {
				return;
			}
			board[square.dataset.square] = {
				side: piece.classList.contains('white') ? 'white' : 'black',
				type: types[piece.textContent]
			};
		});
		return board;
	}

	function clone(board) {
		const next = {};
		Object.keys(board).forEach(function (square) {
			next[square] = board[square];
		});
		return next;
	}

	function kingSquare(board, side) {
		const squares = Object.keys(board);
		for (let i = 0; i < squares.length; i++) {
			const piece = board[squares[i]];
			if (piece.side === side && piece.type === 'K') {
				return squares[i];
			}
		}
		return null;
	}

	function isAttacked(board, target, bySide) {
		const spot = parse(target);
		for (let i = 0; i < knightDeltas.length; i++) {
			const square = name(spot.f + knightDeltas[i][0], spot.r + knightDeltas[i][1]);
			const piece = square && board[square];
			if (piece && piece.side === bySide && piece.type === 'N') {
				return true;
			}
		}
		for (let df = -1; df <= 1; df++) {
			for (let dr = -1; dr <= 1; dr++) {
				if (!df && !dr) {
					continue;
				}
				const square = name(spot.f + df, spot.r + dr);
				const piece = square && board[square];
				if (piece && piece.side === bySide && piece.type === 'K') {
					return true;
				}
			}
		}
		const pawnDir = bySide === 'white' ? 1 : -1;
		for (let df = -1; df <= 1; df += 2) {
			const square = name(spot.f + df, spot.r - pawnDir);
			const piece = square && board[square];
			if (piece && piece.side === bySide && piece.type === 'P') {
				return true;
			}
		}
		if (rayHits(board, spot, bishopDirs, bySide, ['B', 'Q'])) {
			return true;
		}
		return rayHits(board, spot, rookDirs, bySide, ['R', 'Q']);
	}

	function rayHits(board, spot, dirs, bySide, allowed) {
		for (let i = 0; i < dirs.length; i++) {
			let file = spot.f + dirs[i][0];
			let rank = spot.r + dirs[i][1];
			while (true) {
				const square = name(file, rank);
				if (!square) {
					break;
				}
				const piece = board[square];
				if (piece) {
					if (piece.side === bySide && allowed.indexOf(piece.type) !== -1) {
						return true;
					}
					break;
				}
				file += dirs[i][0];
				rank += dirs[i][1];
			}
		}
		return false;
	}

	function slide(board, from, dirs, moves) {
		const piece = board[from];
		const spot = parse(from);
		dirs.forEach(function (dir) {
			let file = spot.f + dir[0];
			let rank = spot.r + dir[1];
			while (true) {
				const square = name(file, rank);
				if (!square) {
					break;
				}
				const occupant = board[square];
				if (!occupant) {
					moves.push({ to: square });
				} else {
					if (occupant.side !== piece.side) {
						moves.push({ to: square });
					}
					break;
				}
				file += dir[0];
				rank += dir[1];
			}
		});
	}

	function pseudo(board, from) {
		const piece = board[from];
		const spot = parse(from);
		const moves = [];
		if (piece.type === 'N') {
			knightDeltas.forEach(function (delta) {
				const square = name(spot.f + delta[0], spot.r + delta[1]);
				if (!square || (board[square] && board[square].side === piece.side)) {
					return;
				}
				moves.push({ to: square });
			});
		} else if (piece.type === 'B') {
			slide(board, from, bishopDirs, moves);
		} else if (piece.type === 'R') {
			slide(board, from, rookDirs, moves);
		} else if (piece.type === 'Q') {
			slide(board, from, bishopDirs.concat(rookDirs), moves);
		} else if (piece.type === 'K') {
			for (let df = -1; df <= 1; df++) {
				for (let dr = -1; dr <= 1; dr++) {
					if (!df && !dr) {
						continue;
					}
					const square = name(spot.f + df, spot.r + dr);
					if (!square || (board[square] && board[square].side === piece.side)) {
						continue;
					}
					moves.push({ to: square });
				}
			}
			addCastling(board, from, piece, moves);
		} else if (piece.type === 'P') {
			addPawn(board, from, piece, spot, moves);
		}
		return moves;
	}

	function addCastling(board, from, piece, moves) {
		const foe = enemy(piece.side);
		if (isAttacked(board, from, foe)) {
			return;
		}
		if (piece.side === 'white' && from === 'e1') {
			if (state.castle.whiteK && !board.f1 && !board.g1 && board.h1 && board.h1.type === 'R' && board.h1.side === 'white'
				&& !isAttacked(board, 'f1', foe) && !isAttacked(board, 'g1', foe)) {
				moves.push({ to: 'g1', rookFrom: 'h1', rookTo: 'f1' });
			}
			if (state.castle.whiteQ && !board.b1 && !board.c1 && !board.d1 && board.a1 && board.a1.type === 'R' && board.a1.side === 'white'
				&& !isAttacked(board, 'd1', foe) && !isAttacked(board, 'c1', foe)) {
				moves.push({ to: 'c1', rookFrom: 'a1', rookTo: 'd1' });
			}
		}
		if (piece.side === 'black' && from === 'e8') {
			if (state.castle.blackK && !board.f8 && !board.g8 && board.h8 && board.h8.type === 'R' && board.h8.side === 'black'
				&& !isAttacked(board, 'f8', foe) && !isAttacked(board, 'g8', foe)) {
				moves.push({ to: 'g8', rookFrom: 'h8', rookTo: 'f8' });
			}
			if (state.castle.blackQ && !board.b8 && !board.c8 && !board.d8 && board.a8 && board.a8.type === 'R' && board.a8.side === 'black'
				&& !isAttacked(board, 'd8', foe) && !isAttacked(board, 'c8', foe)) {
				moves.push({ to: 'c8', rookFrom: 'a8', rookTo: 'd8' });
			}
		}
	}

	function addPawn(board, from, piece, spot, moves) {
		const dir = piece.side === 'white' ? 1 : -1;
		const startRank = piece.side === 'white' ? 1 : 6;
		const lastRank = piece.side === 'white' ? 7 : 0;
		const one = name(spot.f, spot.r + dir);
		if (one && !board[one]) {
			pushPawn(moves, one, spot.r + dir === lastRank);
			if (spot.r === startRank) {
				const two = name(spot.f, spot.r + dir * 2);
				if (two && !board[two]) {
					moves.push({ to: two });
				}
			}
		}
		[-1, 1].forEach(function (df) {
			const cap = name(spot.f + df, spot.r + dir);
			if (!cap) {
				return;
			}
			if (board[cap] && board[cap].side !== piece.side) {
				pushPawn(moves, cap, spot.r + dir === lastRank);
			} else if (cap === state.ep) {
				moves.push({ to: cap, epCapture: name(spot.f + df, spot.r) });
			}
		});
	}

	function pushPawn(moves, to, promote) {
		if (promote) {
			moves.push({ to: to, promotion: true });
		} else {
			moves.push({ to: to });
		}
	}

	function applyMove(board, from, move) {
		const next = clone(board);
		const piece = next[from];
		delete next[from];
		next[move.to] = move.promotion ? { side: piece.side, type: 'Q' } : piece;
		if (move.epCapture) {
			delete next[move.epCapture];
		}
		if (move.rookFrom) {
			next[move.rookTo] = next[move.rookFrom];
			delete next[move.rookFrom];
		}
		return next;
	}

	function legal(board, from) {
		const piece = board[from];
		if (!piece) {
			return [];
		}
		const foe = enemy(piece.side);
		return pseudo(board, from).filter(function (move) {
			const next = applyMove(board, from, move);
			const king = kingSquare(next, piece.side);
			return king && !isAttacked(next, king, foe);
		});
	}

	function hasMove(board) {
		const squares = Object.keys(board);
		for (let i = 0; i < squares.length; i++) {
			if (board[squares[i]].side === state.turn && legal(board, squares[i]).length) {
				return true;
			}
		}
		return false;
	}

	function updateState(board, from, move) {
		const piece = board[from];
		const next = {
			turn: enemy(piece.side),
			castle: {
				whiteK: state.castle.whiteK,
				whiteQ: state.castle.whiteQ,
				blackK: state.castle.blackK,
				blackQ: state.castle.blackQ
			},
			ep: null,
			over: false,
			result: ''
		};
		if (piece.type === 'K') {
			if (piece.side === 'white') {
				next.castle.whiteK = false;
				next.castle.whiteQ = false;
			} else {
				next.castle.blackK = false;
				next.castle.blackQ = false;
			}
		}
		if (piece.type === 'R') {
			if (from === 'h1') next.castle.whiteK = false;
			if (from === 'a1') next.castle.whiteQ = false;
			if (from === 'h8') next.castle.blackK = false;
			if (from === 'a8') next.castle.blackQ = false;
		}
		const captured = board[move.to];
		if (captured && captured.type === 'R') {
			if (move.to === 'h1') next.castle.whiteK = false;
			if (move.to === 'a1') next.castle.whiteQ = false;
			if (move.to === 'h8') next.castle.blackK = false;
			if (move.to === 'a8') next.castle.blackQ = false;
		}
		if (piece.type === 'P' && Math.abs(parse(from).r - parse(move.to).r) === 2) {
			next.ep = name(parse(from).f, (parse(from).r + parse(move.to).r) / 2);
		}
		return next;
	}

	function clearMarks() {
		boardEl.querySelectorAll('.selected, .legal, .drag-over').forEach(function (square) {
			square.classList.remove('selected', 'legal', 'drag-over');
		});
	}

	function setStatus() {
		if (state.result) {
			statusEl.textContent = state.result;
			return;
		}
		const board = readBoard();
		const who = state.turn === 'white' ? 'White' : 'Black';
		const king = kingSquare(board, state.turn);
		const inCheck = king && isAttacked(board, king, enemy(state.turn));
		if (!hasMove(board)) {
			state.over = true;
			state.result = inCheck
				? (state.turn === 'white' ? 'Black' : 'White') + ' wins by checkmate.'
				: 'Stalemate.';
			statusEl.textContent = state.result;
			return;
		}
		statusEl.textContent = inCheck ? who + ' to move. Check.' : who + ' to move.';
	}

	function showLegal(square) {
		clearMarks();
		selected = square;
		const moves = legal(readBoard(), square.dataset.square);
		selectedMoves = moves;
		square.classList.add('selected');
		moves.forEach(function (move) {
			squareEl(move.to).classList.add('legal');
		});
	}

	function commit(fromEl, move, side) {
		const piece = fromEl.querySelector('.piece');
		const toEl = squareEl(move.to);
		const occupant = toEl.querySelector('.piece');
		if (occupant) {
			occupant.remove();
		}
		if (move.epCapture) {
			const captured = squareEl(move.epCapture).querySelector('.piece');
			if (captured) {
				captured.remove();
			}
		}
		if (move.promotion) {
			piece.textContent = glyphs[side][move.promotion];
		}
		toEl.appendChild(piece);
		if (move.rookFrom) {
			squareEl(move.rookTo).appendChild(squareEl(move.rookFrom).querySelector('.piece'));
		}
	}

	function play(fromEl, move) {
		const from = fromEl.dataset.square;
		const board = readBoard();
		const side = board[from].side;
		state = updateState(board, from, move);
		commit(fromEl, move, side);
		selected = null;
		selectedMoves = [];
		pending = null;
		promoteEl.hidden = true;
		clearMarks();
		setStatus();
	}

	function askPromotion(fromEl, move) {
		pending = { fromEl: fromEl, move: move };
		promoteEl.hidden = false;
		promoteEl.querySelectorAll('button').forEach(function (button) {
			button.textContent = glyphs[state.turn][button.dataset.type];
		});
	}

	boardEl.addEventListener('click', function (event) {
		if (state.over || pending) {
			return;
		}
		const square = event.target.closest('.square');
		if (!square) {
			return;
		}
		if (selected) {
			const move = selectedMoves.find(function (item) {
				return item.to === square.dataset.square;
			});
			if (move) {
				if (move.promotion) {
					askPromotion(selected, move);
				} else {
					play(selected, move);
				}
				return;
			}
		}
		const piece = square.querySelector('.piece');
		if (piece && piece.classList.contains(state.turn)) {
			showLegal(square);
			return;
		}
		selected = null;
		selectedMoves = [];
		clearMarks();
	});

	boardEl.addEventListener('dragstart', function (event) {
		const piece = event.target.closest('.piece');
		if (!piece || state.over || pending || !piece.classList.contains(state.turn)) {
			event.preventDefault();
			return;
		}
		const from = piece.parentElement;
		dragMoves = legal(readBoard(), from.dataset.square);
		selected = null;
		selectedMoves = [];
		clearMarks();
		from.classList.add('selected');
		dragMoves.forEach(function (move) {
			squareEl(move.to).classList.add('legal');
		});
		piece.classList.add('dragging');
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData('text/plain', from.dataset.square);
	});

	boardEl.addEventListener('dragend', function (event) {
		const piece = event.target.closest('.piece');
		if (piece) {
			piece.classList.remove('dragging');
		}
		dragMoves = [];
		if (!pending) {
			clearMarks();
		}
	});

	boardEl.addEventListener('dragover', function (event) {
		const square = event.target.closest('.square');
		if (!square) {
			return;
		}
		const allowed = dragMoves.some(function (move) {
			return move.to === square.dataset.square;
		});
		if (!allowed) {
			return;
		}
		event.preventDefault();
		boardEl.querySelectorAll('.drag-over').forEach(function (el) {
			el.classList.remove('drag-over');
		});
		square.classList.add('drag-over');
	});

	boardEl.addEventListener('drop', function (event) {
		const square = event.target.closest('.square');
		const move = square && dragMoves.find(function (item) {
			return item.to === square.dataset.square;
		});
		if (!move) {
			return;
		}
		event.preventDefault();
		const fromEl = squareEl(event.dataTransfer.getData('text/plain'));
		dragMoves = [];
		if (move.promotion) {
			clearMarks();
			askPromotion(fromEl, move);
		} else {
			play(fromEl, move);
		}
	});

	promoteEl.addEventListener('click', function (event) {
		const button = event.target.closest('button');
		if (!button || !pending) {
			return;
		}
		pending.move.promotion = button.dataset.type;
		play(pending.fromEl, pending.move);
	});

	document.getElementById('flip').addEventListener('click', function () {
		boardEl.classList.toggle('flipped');
	});

	document.getElementById('reset').addEventListener('click', function () {
		boardEl.innerHTML = startHTML;
		boardEl.classList.remove('flipped');
		state = freshState();
		selected = null;
		selectedMoves = [];
		dragMoves = [];
		pending = null;
		promoteEl.hidden = true;
		clearMarks();
		setStatus();
	});

	setStatus();
})();
