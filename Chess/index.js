(function () {
	const board = document.getElementById('board');
	const startHTML = board.innerHTML;
	let selected = null;
	let dragSource = null;

	function clearMarks() {
		board.querySelectorAll('.selected, .drag-over').forEach(function (square) {
			square.classList.remove('selected', 'drag-over');
		});
	}

	function movePiece(from, to) {
		if (!from || !to || from === to) {
			return;
		}
		const piece = from.querySelector('.piece');
		if (!piece) {
			return;
		}
		const occupant = to.querySelector('.piece');
		if (occupant) {
			occupant.remove();
		}
		to.appendChild(piece);
	}

	board.addEventListener('click', function (event) {
		const square = event.target.closest('.square');
		if (!square) {
			return;
		}
		if (selected) {
			movePiece(selected, square);
			selected = null;
			clearMarks();
			return;
		}
		if (square.querySelector('.piece')) {
			selected = square;
			clearMarks();
			square.classList.add('selected');
		}
	});

	board.addEventListener('dragstart', function (event) {
		const piece = event.target.closest('.piece');
		if (!piece) {
			return;
		}
		dragSource = piece.parentElement;
		selected = null;
		clearMarks();
		piece.classList.add('dragging');
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData('text/plain', piece.parentElement.dataset.square);
	});

	board.addEventListener('dragend', function (event) {
		const piece = event.target.closest('.piece');
		if (piece) {
			piece.classList.remove('dragging');
		}
		dragSource = null;
		clearMarks();
	});

	board.addEventListener('dragover', function (event) {
		const square = event.target.closest('.square');
		if (!square || !dragSource) {
			return;
		}
		event.preventDefault();
		board.querySelectorAll('.drag-over').forEach(function (el) {
			el.classList.remove('drag-over');
		});
		if (square !== dragSource) {
			square.classList.add('drag-over');
		}
	});

	board.addEventListener('drop', function (event) {
		const square = event.target.closest('.square');
		if (!square || !dragSource) {
			return;
		}
		event.preventDefault();
		movePiece(dragSource, square);
		dragSource = null;
		clearMarks();
	});

	document.getElementById('flip').addEventListener('click', function () {
		board.classList.toggle('flipped');
	});

	document.getElementById('reset').addEventListener('click', function () {
		board.innerHTML = startHTML;
		board.classList.remove('flipped');
		selected = null;
		dragSource = null;
	});
})();
