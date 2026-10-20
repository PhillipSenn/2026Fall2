const dieOne = document.getElementById('dieOne');
const dieTwo = document.getElementById('dieTwo');
const total = document.getElementById('total');
const rollButton = document.getElementById('rollButton');
const rollCountInput = document.getElementById('rollCount');
const speedMode = document.getElementById('speedMode');
const rollStatus = document.getElementById('rollStatus');
const resultCounts = Array(13).fill(0);
let isRolling = false;

function rollDie() {
	return Math.floor(Math.random() * 6) + 1;
}

function randomLandingRotation() {
	const quadrant = Math.floor(Math.random() * 4) * 90;
	return `${quadrant + 25 + Math.floor(Math.random() * 41)}deg`;
}

function displayDie(die, value, label) {
	die.dataset.value = value;
	die.setAttribute('aria-label', `${label}: ${value}`);
	const orientations = {
		1: { x: 0, z: 0 },
		2: { x: 90, z: 0 },
		3: { x: 0, z: -90 },
		4: { x: 0, z: 90 },
		5: { x: -90, z: 0 },
		6: { x: 180, z: 0 }
	};
	die.style.setProperty('--roll-x', `${orientations[value].x}deg`);
	die.style.setProperty('--roll-z', `${orientations[value].z}deg`);
}

function renderResults(highlightValue) {
	const totalRolls = resultCounts.reduce((sum, count) => sum + count, 0);
	document.getElementById('resultsTotal').textContent = totalRolls.toLocaleString();

	document.querySelectorAll('#rollResults [data-total]').forEach((row) => {
		const resultValue = Number(row.dataset.total);
		const percentage = resultCounts[resultValue] / totalRolls * 100;
		const roundedPercentage = Math.round(percentage);
		const bar = row.querySelector('.result-bar');
		const count = row.querySelector('.result-count');
		const percent = row.querySelector('.result-percent');

		bar.style.width = `${percentage}%`;
		bar.setAttribute('aria-valuenow', percentage.toFixed(1));
		bar.setAttribute('aria-label', `Total ${resultValue}: ${percentage.toFixed(1)}%`);
		count.textContent = resultCounts[resultValue].toLocaleString();
		percent.textContent = `${roundedPercentage}%`;
		percent.setAttribute('aria-label', `${resultCounts[resultValue]} rolls, ${roundedPercentage}% of all rolls`);
	});

	document.querySelectorAll('.result-percent').forEach((badge) => {
		badge.classList.remove('theme-primary');
		badge.classList.add('theme-secondary');
	});
	document.querySelectorAll('.result-bar').forEach((bar) => {
		bar.classList.remove('bg-primary');
		bar.classList.add('bg-secondary');
	});
	if (highlightValue) {
		const result = document.querySelector(`#rollResults [data-total="${highlightValue}"] .result-percent`);
		result.classList.remove('theme-secondary');
		result.classList.add('theme-primary');
		const resultBar = document.querySelector(`#rollResults [data-total="${highlightValue}"] .result-bar`);
		resultBar.classList.remove('bg-secondary');
		resultBar.classList.add('bg-primary');
	}
}

function recordResult(value, render = true) {
	resultCounts[value] += 1;
	if (render) {
		renderResults(value);
	}
}

function clearResultHighlight() {
	document.querySelectorAll('.result-percent').forEach((badge) => {
		badge.classList.remove('theme-primary');
		badge.classList.add('theme-secondary');
	});
	document.querySelectorAll('.result-bar').forEach((bar) => {
		bar.classList.remove('bg-primary');
		bar.classList.add('bg-secondary');
	});
}

function wait(milliseconds) {
	return new Promise((resolve) => {
		const timeoutId = window.setTimeout(done, milliseconds);
		speedMode.addEventListener('change', skipIfSpeed);

		function done() {
			speedMode.removeEventListener('change', skipIfSpeed);
			resolve();
		}

		function skipIfSpeed() {
			if (speedMode.checked) {
				window.clearTimeout(timeoutId);
				done();
			}
		}
	});
}

rollButton.addEventListener('click', async () => {
	if (isRolling) {
		return;
	}

	const numberOfRolls = Math.min(100000, Math.max(1, Number(rollCountInput.value) || 1));
	rollCountInput.value = numberOfRolls;
	isRolling = true;
	rollButton.disabled = true;
	rollCountInput.disabled = true;

	let latestTotal = 0;
	let skippedAnyAnimation = false;
	for (let rollNumber = 1; rollNumber <= numberOfRolls; rollNumber += 1) {
		const skipAnimation = speedMode.checked;
		const firstValue = rollDie();
		const secondValue = rollDie();
		rollStatus.textContent = `Rolling ${rollNumber} of ${numberOfRolls}`;

		dieOne.classList.remove('rolling');
		dieTwo.classList.remove('rolling');
		dieOne.style.setProperty('--landing-rotation', randomLandingRotation());
		dieTwo.style.setProperty('--landing-rotation', randomLandingRotation());
		displayDie(dieOne, firstValue, 'Die one');
		displayDie(dieTwo, secondValue, 'Die two');

		if (skipAnimation) {
			skippedAnyAnimation = true;
		} else {
			void dieOne.offsetWidth;
			dieOne.classList.add('rolling');
			dieTwo.classList.add('rolling');
			await wait(730);
		}

		const rollTotal = firstValue + secondValue;
		latestTotal = rollTotal;
		total.textContent = `Total: ${rollTotal}`;
		recordResult(rollTotal, !speedMode.checked);
		dieOne.classList.remove('rolling');
		dieTwo.classList.remove('rolling');

		if (!speedMode.checked && rollNumber < numberOfRolls) {
			await wait(1000);
		}
	}

	if (skippedAnyAnimation || speedMode.checked) {
		renderResults(latestTotal);
	}
	rollStatus.textContent = `${numberOfRolls.toLocaleString()} roll${numberOfRolls === 1 ? '' : 's'} complete`;
	if (numberOfRolls > 1) {
		clearResultHighlight();
	}
	rollCountInput.disabled = false;
	rollButton.disabled = false;
	isRolling = false;
});

const initialFirstValue = rollDie();
const initialSecondValue = rollDie();
dieOne.style.setProperty('--landing-rotation', randomLandingRotation());
dieTwo.style.setProperty('--landing-rotation', randomLandingRotation());
displayDie(dieOne, initialFirstValue, 'Die one');
displayDie(dieTwo, initialSecondValue, 'Die two');
const initialTotal = initialFirstValue + initialSecondValue;
total.textContent = `Total: ${initialTotal}`;
recordResult(initialTotal);
