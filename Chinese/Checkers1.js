(function () {
	const board = document.getElementById('board');
	if (!board) {
		return;
	}
	const startHTML = board.innerHTML;
	let selected = null;
	let dragSource = null;

	function clearMarks() {
		board.querySelectorAll('.selected, .drag-over').forEach(function (hole) {
			hole.classList.remove('selected', 'drag-over');
		});
	}

	function moveMarble(from, to) {
		if (!from || !to || from === to) {
			return;
		}
		const marble = from.querySelector('.marble');
		if (!marble || to.querySelector('.marble')) {
			return;
		}
		to.appendChild(marble);
	}

	board.addEventListener('click', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole) {
			return;
		}
		if (selected && !hole.querySelector('.marble')) {
			moveMarble(selected, hole);
			selected = null;
			clearMarks();
			return;
		}
		selected = hole.querySelector('.marble') ? hole : null;
		clearMarks();
		if (selected) {
			selected.classList.add('selected');
		}
	});

	board.addEventListener('dragstart', function (event) {
		const marble = event.target.closest('.marble');
		if (!marble) {
			return;
		}
		dragSource = marble.parentElement;
		selected = null;
		clearMarks();
		marble.classList.add('dragging');
		event.dataTransfer.effectAllowed = 'move';
		event.dataTransfer.setData('text/plain', dragSource.dataset.square);
	});

	board.addEventListener('dragend', function (event) {
		const marble = event.target.closest('.marble');
		if (marble) {
			marble.classList.remove('dragging');
		}
		dragSource = null;
		clearMarks();
	});

	board.addEventListener('dragover', function (event) {
		const hole = event.target.closest('.hole');
		if (!hole || !dragSource || hole === dragSource || hole.querySelector('.marble')) {
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
		if (!hole || !dragSource) {
			return;
		}
		event.preventDefault();
		moveMarble(dragSource, hole);
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
