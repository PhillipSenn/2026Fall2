<cfscript>
request.title = 'Dice Roller';
request.progress.bar = false;
include '/Inc/header.cfm';
</cfscript>

<section class="py-5 text-center" aria-labelledby="dice-heading">
	<h1 id="dice-heading" class="mb-4">Dice Roller</h1>
	<div class="dice-pair d-flex justify-content-center gap-4 mb-4" aria-live="polite">
		<div id="dieOne" class="die" role="img" aria-label="Die one: 1">
			<span class="pip pip-1"></span>
			<span class="pip pip-2"></span>
			<span class="pip pip-3"></span>
			<span class="pip pip-4"></span>
			<span class="pip pip-5"></span>
			<span class="pip pip-6"></span>
			<span class="pip pip-7"></span>
			<span class="pip pip-8"></span>
			<span class="pip pip-9"></span>
		</div>
		<div id="dieTwo" class="die" role="img" aria-label="Die two: 1">
			<span class="pip pip-1"></span>
			<span class="pip pip-2"></span>
			<span class="pip pip-3"></span>
			<span class="pip pip-4"></span>
			<span class="pip pip-5"></span>
			<span class="pip pip-6"></span>
			<span class="pip pip-7"></span>
			<span class="pip pip-8"></span>
			<span class="pip pip-9"></span>
		</div>
	</div>
	<p id="total" class="fs-4 mb-4">Total: 2</p>
	<button id="rollButton" type="button" class="btn btn-primary btn-lg">Roll Dice</button>
</section>

<style>
	.die {
		display: grid;
		position: relative;
		grid-template: repeat(3, 1fr) / repeat(3, 1fr);
		width: 5.25rem;
		height: 5.25rem;
		padding: 0.5rem;
		background: linear-gradient(135deg, #fff 0%, #f8f9fa 45%, #d5d9dd 100%);
		border: 2px solid #7b848c;
		border-radius: 0.55rem;
		box-shadow:
			inset 0.2rem 0.2rem 0.35rem rgb(255 255 255 / 90%),
			inset -0.2rem -0.2rem 0.45rem rgb(33 37 41 / 20%);
		transform-style: preserve-3d;
		transform: rotateX(24deg) rotateY(-32deg);
	}

	.dice-pair {
		gap: 6.5rem !important;
		padding: 5.75rem 3rem 1.25rem 1.5rem;
		perspective: 50rem;
	}

	.die::before,
	.die::after {
		position: absolute;
		content: "";
		border: 2px solid #69727a;
	}

	.die::before {
		top: -5.25rem;
		left: -2px;
		width: 5.25rem;
		height: 5.25rem;
		border-left: 0;
		border-radius: 0.55rem 0.55rem 0 0;
		background:
			radial-gradient(circle at 26% 28%, #1d2125 0 0.32rem, transparent 0.36rem),
			radial-gradient(circle at 74% 72%, #1d2125 0 0.32rem, transparent 0.36rem),
			linear-gradient(135deg, #eef1f3, #a3abb2);
		transform: rotateX(90deg);
		transform-origin: center bottom;
	}

	.die::after {
		top: -2px;
		right: -5.25rem;
		width: 5.25rem;
		height: 5.25rem;
		border-top: 0;
		border-radius: 0 0.55rem 0.55rem 0;
		background:
			radial-gradient(circle at 28% 25%, #15191c 0 0.32rem, transparent 0.36rem),
			radial-gradient(circle at 72% 50%, #15191c 0 0.32rem, transparent 0.36rem),
			radial-gradient(circle at 28% 75%, #15191c 0 0.32rem, transparent 0.36rem),
			linear-gradient(135deg, #aab2b8, #59636b);
		transform: rotateY(90deg);
		transform-origin: left center;
	}

	.die.rolling {
		animation: roll 0.65s ease-in-out;
	}

	.die.rolling:last-child {
		animation-delay: 0.08s;
	}

	@keyframes roll {
		0% {
			transform: rotateX(24deg) rotateY(-32deg) rotateZ(0deg) scale(1);
		}
		35% {
			transform: rotateX(210deg) rotateY(170deg) rotateZ(150deg) scale(1.12);
		}
		70% {
			transform: rotateX(332deg) rotateY(310deg) rotateZ(300deg) scale(0.95);
		}
		100% {
			transform: rotateX(384deg) rotateY(328deg) rotateZ(360deg) scale(1);
		}
	}

	.pip {
		display: none;
		width: 1.25rem;
		height: 1.25rem;
		margin: auto;
		background: radial-gradient(circle at 35% 30%, #495057, #111 65%);
		border-radius: 50%;
		box-shadow: inset 0.08rem 0.08rem 0.1rem rgb(255 255 255 / 20%), 0.06rem 0.08rem 0.1rem rgb(0 0 0 / 45%);
	}

	.die[data-value="1"] .pip-5,
	.die[data-value="2"] .pip-1,
	.die[data-value="2"] .pip-9,
	.die[data-value="3"] .pip-1,
	.die[data-value="3"] .pip-5,
	.die[data-value="3"] .pip-9,
	.die[data-value="4"] .pip-1,
	.die[data-value="4"] .pip-3,
	.die[data-value="4"] .pip-7,
	.die[data-value="4"] .pip-9,
	.die[data-value="5"] .pip-1,
	.die[data-value="5"] .pip-3,
	.die[data-value="5"] .pip-5,
	.die[data-value="5"] .pip-7,
	.die[data-value="5"] .pip-9,
	.die[data-value="6"] .pip-1,
	.die[data-value="6"] .pip-3,
	.die[data-value="6"] .pip-4,
	.die[data-value="6"] .pip-6,
	.die[data-value="6"] .pip-7,
	.die[data-value="6"] .pip-9 {
		display: block;
	}

	@media (prefers-reduced-motion: reduce) {
		.die.rolling,
		.die.rolling:last-child {
			animation: none;
		}
	}

	@media (max-width: 575.98px) {
		.die {
			width: 4rem;
			height: 4rem;
		}

		.die::before,
		.die::after {
			width: 4rem;
			height: 4rem;
		}

		.die::before {
			top: -4rem;
		}

		.die::after {
			right: -4rem;
		}

		.dice-pair {
			gap: 4.75rem !important;
			padding-top: 4.5rem;
		}

		.pip {
			width: 0.9rem;
			height: 0.9rem;
		}
	}
</style>

<script>
	const dieOne = document.getElementById('dieOne');
	const dieTwo = document.getElementById('dieTwo');
	const total = document.getElementById('total');
	const rollButton = document.getElementById('rollButton');
	let isRolling = false;

	function rollDie() {
		return Math.floor(Math.random() * 6) + 1;
	}

	function displayDie(die, value, label) {
		die.dataset.value = value;
		die.setAttribute('aria-label', `${label}: ${value}`);
	}

	rollButton.addEventListener('click', () => {
		if (isRolling) {
			return;
		}

		isRolling = true;
		rollButton.disabled = true;
		const firstValue = rollDie();
		const secondValue = rollDie();

		dieOne.classList.remove('rolling');
		dieTwo.classList.remove('rolling');
		void dieOne.offsetWidth;
		dieOne.classList.add('rolling');
		dieTwo.classList.add('rolling');

		displayDie(dieOne, firstValue, 'Die one');
		displayDie(dieTwo, secondValue, 'Die two');
		window.setTimeout(() => {
			total.textContent = `Total: ${firstValue + secondValue}`;
			dieOne.classList.remove('rolling');
			dieTwo.classList.remove('rolling');
			rollButton.disabled = false;
			isRolling = false;
		}, 730);
	});

	displayDie(dieOne, 1, 'Die one');
	displayDie(dieTwo, 1, 'Die two');
</script>

<cfinclude template="/Inc/footer.cfm">
