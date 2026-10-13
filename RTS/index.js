const canvas = document.getElementById('rtsCanvas')
const context = canvas.getContext('2d')
const miniMap = document.getElementById('miniMap')
const miniContext = miniMap.getContext('2d')
const status = document.getElementById('rtsStatus')
const scene = document.querySelector('.rts-demo')

const world = { width: 2600, height: 6200 }
const view = { width: 0, height: 0, x: 900, y: 2650 }
const explorer = { x: 1300, y: 3100, targetX: 1300, targetY: 3100, walking: false }
const pointer = { x: -9999, y: -9999, active: false }
const decorations = []
let lastTime = 0
let clickMarker = null

function random(seed) {
	const value = Math.sin(seed * 981.73) * 10000
	return value - Math.floor(value)
}

function addDecorations() {
	for (let i = 0; i < 480; i++) {
		const roll = random(i + 1)
		decorations.push({
			type: roll < 0.53 ? 'tree' : (roll < 0.74 ? 'rock' : (roll < 0.9 ? 'shrub' : 'animal')),
			x: 70 + random(i * 3 + 6) * (world.width - 140),
			y: 70 + random(i * 7 + 11) * (world.height - 140),
			size: 10 + random(i * 13 + 4) * 20,
			direction: random(i * 17 + 2) * Math.PI * 2,
			phase: random(i * 19 + 8) * Math.PI * 2,
			fleeTime: 0
		})
	}
	decorations.push(
		{ type: 'house', x: 1560, y: 2800, size: 66 },
		{ type: 'house', x: 1765, y: 2960, size: 52 },
		{ type: 'farm', x: 1420, y: 2870, size: 90 }
	)
}

function resize() {
	const rect = scene.getBoundingClientRect()
	const dpr = Math.min(window.devicePixelRatio || 1, 2)
	view.width = rect.width
	view.height = rect.height
	canvas.width = Math.round(view.width * dpr)
	canvas.height = Math.round(view.height * dpr)
	context.setTransform(dpr, 0, 0, dpr, 0, 0)
	const mapRect = miniMap.getBoundingClientRect()
	miniMap.width = Math.round(mapRect.width * dpr)
	miniMap.height = Math.round(mapRect.height * dpr)
	miniContext.setTransform(dpr, 0, 0, dpr, 0, 0)
	clampCamera()
}

function clampCamera() {
	view.x = Math.max(0, Math.min(world.width - view.width, view.x))
	view.y = Math.max(0, Math.min(world.height - view.height, view.y))
}

function inView(item, padding) {
	return item.x + padding > view.x && item.x - padding < view.x + view.width &&
		item.y + padding > view.y && item.y - padding < view.y + view.height
}

function drawGround() {
	context.fillStyle = '#6f914c'
	context.fillRect(0, 0, view.width, view.height)

	const left = Math.floor(view.x / 80) * 80
	const top = Math.floor(view.y / 80) * 80
	for (let x = left; x < view.x + view.width + 80; x += 80) {
		for (let y = top; y < view.y + view.height + 80; y += 80) {
			const tone = random(x * 0.13 + y * 0.71)
			context.fillStyle = tone > 0.67 ? 'rgba(209, 208, 113, 0.09)' : 'rgba(49, 91, 39, 0.07)'
			context.fillRect(Math.round(x - view.x), Math.round(y - view.y), 80, 80)
		}
	}

	drawWater()

	context.strokeStyle = 'rgba(104, 77, 38, 0.2)'
	context.lineWidth = 23
	context.beginPath()
	context.moveTo(-view.x + 40, 3550 - view.y)
	context.bezierCurveTo(530 - view.x, 3400 - view.y, 960 - view.x, 3670 - view.y, 1530 - view.x, 3450 - view.y)
	context.bezierCurveTo(1880 - view.x, 3310 - view.y, 2220 - view.x, 3500 - view.y, world.width - view.x, 3260 - view.y)
	context.stroke()
	context.strokeStyle = 'rgba(220, 191, 114, 0.2)'
	context.lineWidth = 7
	context.stroke()
}

function riverPath(target) {
	target.beginPath()
	target.moveTo(760, -50)
	target.bezierCurveTo(940, 650, 530, 1120, 790, 1840)
	target.bezierCurveTo(1080, 2630, 500, 3170, 770, 4050)
	target.bezierCurveTo(950, 4660, 580, 5470, 890, world.height + 80)
}

function drawWater() {
	context.save()
	context.translate(-view.x, -view.y)

	// The broad, pale edge is shallow water; the narrow dark channel is deep.
	riverPath(context)
	context.strokeStyle = '#75b5a7'
	context.lineWidth = 166
	context.lineCap = 'round'
	context.stroke()
	riverPath(context)
	context.strokeStyle = '#256c91'
	context.lineWidth = 82
	context.stroke()

	context.fillStyle = '#75b5a7'
	context.beginPath()
	context.ellipse(1910, 4850, 320, 225, -0.22, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#256c91'
	context.beginPath()
	context.ellipse(1910, 4850, 234, 153, -0.22, 0, Math.PI * 2)
	context.fill()
	drawWaterTexture()
	context.restore()
}

function riverXAt(y) {
	if (y < 1840) {
		return 760 + Math.sin(y / 245) * 135
	}
	if (y < 4050) {
		return 790 + Math.sin((y - 1840) / 230) * 180
	}
	return 770 + Math.sin((y - 4050) / 270) * 155
}

function drawWaterTexture() {
	const start = Math.max(0, Math.floor((view.y - 130) / 46) * 46)
	const end = Math.min(world.height, view.y + view.height + 130)
	context.strokeStyle = 'rgba(210, 244, 237, 0.34)'
	context.lineWidth = 2
	context.lineCap = 'round'
	for (let y = start; y < end; y += 46) {
		const center = riverXAt(y)
		for (let lane = -1; lane <= 1; lane++) {
			const x = center + lane * 25 + Math.sin(y * 0.07 + lane) * 9
			context.beginPath()
			context.moveTo(x - 10, y)
			context.quadraticCurveTo(x, y - 3, x + 11, y)
			context.stroke()
		}
	}

	context.save()
	context.beginPath()
	context.ellipse(1910, 4850, 232, 151, -0.22, 0, Math.PI * 2)
	context.clip()
	for (let y = 4650; y < 5050; y += 30) {
		for (let x = 1660; x < 2160; x += 48) {
			context.beginPath()
			context.moveTo(x, y)
			context.quadraticCurveTo(x + 11, y - 4, x + 23, y)
			context.stroke()
		}
	}
	context.restore()
}

function drawTree(item) {
	const x = item.x - view.x
	const y = item.y - view.y
	const size = item.size
	context.fillStyle = 'rgba(30, 43, 19, 0.22)'
	context.beginPath()
	context.ellipse(x + size * 0.22, y + size * 0.32, size * 0.75, size * 0.28, 0, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#644523'
	context.fillRect(x - size * 0.11, y - size * 0.05, size * 0.22, size * 0.84)
	context.fillStyle = '#315b2d'
	context.beginPath()
	context.arc(x, y - size * 0.35, size * 0.66, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#4b7a37'
	context.beginPath()
	context.arc(x - size * 0.28, y - size * 0.52, size * 0.37, 0, Math.PI * 2)
	context.arc(x + size * 0.3, y - size * 0.54, size * 0.4, 0, Math.PI * 2)
	context.fill()
}

function drawRock(item) {
	const x = item.x - view.x
	const y = item.y - view.y
	const size = item.size * 0.7
	context.fillStyle = 'rgba(26, 38, 18, 0.18)'
	context.beginPath()
	context.ellipse(x + 3, y + size * 0.4, size, size * 0.36, 0, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#8e907e'
	context.beginPath()
	context.moveTo(x - size, y + size * 0.35)
	context.lineTo(x - size * 0.65, y - size * 0.42)
	context.lineTo(x + size * 0.3, y - size * 0.6)
	context.lineTo(x + size, y + size * 0.22)
	context.closePath()
	context.fill()
	context.strokeStyle = '#5e685d'
	context.lineWidth = 2
	context.stroke()
}

function drawShrub(item) {
	const x = item.x - view.x
	const y = item.y - view.y
	context.fillStyle = '#4e7330'
	context.beginPath()
	context.arc(x - item.size * 0.3, y, item.size * 0.52, 0, Math.PI * 2)
	context.arc(x + item.size * 0.28, y + 2, item.size * 0.47, 0, Math.PI * 2)
	context.fill()
}

function drawAnimal(item, now) {
	const x = item.x - view.x
	const y = item.y - view.y
	const size = item.size * 0.7
	const gait = item.fleeTime > 0 ? Math.sin(now / 75 + item.phase) * size * 0.18 : 0
	context.save()
	context.translate(x, y)
	context.fillStyle = 'rgba(28, 37, 15, 0.18)'
	context.beginPath()
	context.ellipse(0, size * 0.92, size * 1.18, size * 0.24, 0, 0, Math.PI * 2)
	context.fill()

	// A raised neck, narrow muzzle, long legs, and antlers make this read as deer.
	context.strokeStyle = '#6d4026'
	context.lineWidth = Math.max(1.3, size * 0.14)
	context.lineCap = 'round'
	context.beginPath()
	context.moveTo(-size * 0.58, size * 0.24)
	context.lineTo(-size * 0.68 - gait, size * 1.06)
	context.moveTo(-size * 0.12, size * 0.32)
	context.lineTo(-size * 0.2 + gait, size * 1.1)
	context.moveTo(size * 0.42, size * 0.28)
	context.lineTo(size * 0.52 - gait, size * 1.06)
	context.moveTo(size * 0.68, size * 0.14)
	context.lineTo(size * 0.75 + gait, size * 0.92)
	context.stroke()
	context.strokeStyle = '#292019'
	context.lineWidth = Math.max(1.5, size * 0.18)
	context.beginPath()
	context.moveTo(-size * 0.68 - gait, size * 1.06)
	context.lineTo(-size * 0.8 - gait, size * 1.09)
	context.moveTo(-size * 0.2 + gait, size * 1.1)
	context.lineTo(-size * 0.31 + gait, size * 1.13)
	context.moveTo(size * 0.52 - gait, size * 1.06)
	context.lineTo(size * 0.4 - gait, size * 1.09)
	context.moveTo(size * 0.75 + gait, size * 0.92)
	context.lineTo(size * 0.64 + gait, size * 0.96)
	context.stroke()

	context.fillStyle = '#ad7041'
	context.beginPath()
	context.ellipse(-size * 0.15, 0, size * 1.02, size * 0.52, 0, 0, Math.PI * 2)
	context.fill()
	context.beginPath()
	context.moveTo(size * 0.55, -size * 0.15)
	context.lineTo(size * 0.8, -size * 1.18)
	context.lineTo(size * 1.12, -size * 1.06)
	context.lineTo(size * 0.92, size * 0.03)
	context.closePath()
	context.fill()
	context.beginPath()
	context.ellipse(size * 1.03, -size * 1.18, size * 0.4, size * 0.27, -0.1, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#efd4ad'
	context.beginPath()
	context.ellipse(-size * 0.92, -size * 0.12, size * 0.26, size * 0.2, 0, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#3b261b'
	context.beginPath()
	context.moveTo(size * 1.04, -size * 1.42)
	context.lineTo(size * 0.9, -size * 1.72)
	context.lineTo(size * 1.18, -size * 1.47)
	context.closePath()
	context.moveTo(size * 1.27, -size * 1.35)
	context.lineTo(size * 1.45, -size * 1.56)
	context.lineTo(size * 1.34, -size * 1.23)
	context.closePath()
	context.fill()
	context.strokeStyle = '#604229'
	context.lineWidth = Math.max(1, size * 0.1)
	context.beginPath()
	context.moveTo(size * 0.83, -size * 1.36)
	context.lineTo(size * 0.65, -size * 1.76)
	context.lineTo(size * 0.52, -size * 1.9)
	context.moveTo(size * 0.65, -size * 1.67)
	context.lineTo(size * 0.39, -size * 1.67)
	context.moveTo(size * 1.1, -size * 1.38)
	context.lineTo(size * 0.98, -size * 1.73)
	context.lineTo(size * 1.13, -size * 1.9)
	context.moveTo(size * 0.99, -size * 1.63)
	context.lineTo(size * 1.23, -size * 1.68)
	context.stroke()
	context.fillStyle = '#1f1712'
	context.beginPath()
	context.arc(size * 1.2, -size * 1.22, Math.max(1, size * 0.08), 0, Math.PI * 2)
	context.fill()
	context.restore()
}

function drawHouse(item) {
	const x = item.x - view.x
	const y = item.y - view.y
	const size = item.size
	context.fillStyle = 'rgba(28, 34, 16, 0.22)'
	context.fillRect(x - size * 0.56, y + size * 0.42, size * 1.3, size * 0.25)
	context.fillStyle = '#b8834d'
	context.fillRect(x - size * 0.5, y - size * 0.12, size, size * 0.64)
	context.fillStyle = '#57321e'
	context.beginPath()
	context.moveTo(x - size * 0.68, y - size * 0.1)
	context.lineTo(x, y - size * 0.72)
	context.lineTo(x + size * 0.68, y - size * 0.1)
	context.closePath()
	context.fill()
	context.fillStyle = '#382317'
	context.fillRect(x - size * 0.12, y + size * 0.18, size * 0.24, size * 0.34)
}

function drawFarm(item) {
	const x = item.x - view.x
	const y = item.y - view.y
	const size = item.size
	context.fillStyle = 'rgba(208, 181, 82, 0.42)'
	context.fillRect(x - size, y - size * 0.52, size * 2, size * 1.04)
	context.strokeStyle = 'rgba(126, 100, 41, 0.52)'
	context.lineWidth = 3
	for (let line = -3; line <= 3; line++) {
		context.beginPath()
		context.moveTo(x - size, y + line * size * 0.14)
		context.lineTo(x + size, y + line * size * 0.14)
		context.stroke()
	}
}

function drawDecorations(now) {
	decorations.forEach(function (item) {
		if (!inView(item, item.size * 2)) {
			return
		}
		if (item.type === 'tree') drawTree(item)
		if (item.type === 'rock') drawRock(item)
		if (item.type === 'shrub') drawShrub(item)
		if (item.type === 'animal') drawAnimal(item, now)
		if (item.type === 'house') drawHouse(item)
		if (item.type === 'farm') drawFarm(item)
	})
}

function drawMarker(now) {
	if (!clickMarker) return
	const age = (now - clickMarker.time) / 1000
	if (age > 1.1) {
		clickMarker = null
		return
	}
	const x = clickMarker.x - view.x
	const y = clickMarker.y - view.y
	const radius = 8 + age * 22
	context.strokeStyle = 'rgba(255, 238, 130, ' + (1 - age / 1.1) + ')'
	context.lineWidth = 2
	context.beginPath()
	context.arc(x, y, radius, 0, Math.PI * 2)
	context.stroke()
}

function drawExplorer(now) {
	const x = explorer.x - view.x
	const y = explorer.y - view.y
	const bob = explorer.walking ? Math.sin(now / 105) * 0.9 : 0
	const stride = explorer.walking ? Math.sin(now / 105) * 2.8 : 0
	context.save()
	context.translate(x, y + bob)
	context.scale(1.22, 1.22)

	context.fillStyle = 'rgba(22, 29, 14, 0.28)'
	context.beginPath()
	context.ellipse(0, 16, 13, 4.6, 0, 0, Math.PI * 2)
	context.fill()

	// Individually shaded trousers and boots make the lower body read as legs.
	context.strokeStyle = '#4e4436'
	context.lineWidth = 5
	context.lineCap = 'round'
	context.beginPath()
	context.moveTo(-3.7, 6)
	context.lineTo(-3.7 - stride, 14.5)
	context.moveTo(3.7, 6)
	context.lineTo(3.7 + stride, 14.5)
	context.stroke()
	context.strokeStyle = '#28231e'
	context.lineWidth = 4.5
	context.beginPath()
	context.moveTo(-3.7 - stride, 14.5)
	context.lineTo(-5.1 - stride, 16.1)
	context.moveTo(3.7 + stride, 14.5)
	context.lineTo(5.1 + stride, 16.1)
	context.stroke()

	// A shaped leather tunic, darker side seam, and belt add body proportions.
	context.fillStyle = '#a94b32'
	context.beginPath()
	context.moveTo(-8, -8.5)
	context.quadraticCurveTo(0, -10, 8, -8.5)
	context.lineTo(6.3, 7)
	context.lineTo(-6.3, 7)
	context.closePath()
	context.fill()
	context.strokeStyle = '#693020'
	context.lineWidth = 1.3
	context.stroke()
	context.fillStyle = 'rgba(255, 209, 128, 0.2)'
	context.fillRect(-5.5, -7, 2, 8)
	context.fillStyle = '#c79b42'
	context.fillRect(-6.4, 2.2, 12.8, 1.9)
	context.fillStyle = '#73582f'
	context.fillRect(-1, 2.1, 2, 2.1)

	// Sleeves, forearms, and hands are kept close to the torso as they swing.
	context.strokeStyle = '#8d3f2b'
	context.lineWidth = 4.7
	context.beginPath()
	context.moveTo(-7.2, -5.8)
	context.lineTo(-9.7, -0.5 - stride * 0.28)
	context.moveTo(7.2, -5.8)
	context.lineTo(9.7, -0.5 + stride * 0.28)
	context.stroke()
	context.strokeStyle = '#d39b69'
	context.lineWidth = 3.5
	context.beginPath()
	context.moveTo(-9.7, -0.5 - stride * 0.28)
	context.lineTo(-8.2, 5.5 - stride * 0.42)
	context.moveTo(9.7, -0.5 + stride * 0.28)
	context.lineTo(8.2, 5.5 + stride * 0.42)
	context.stroke()

	// Neck, face, hair, and a small eye highlight keep the figure upright and human.
	context.fillStyle = '#c98d5e'
	context.fillRect(-2.8, -12, 5.6, 5)
	context.fillStyle = '#d29a68'
	context.beginPath()
	context.arc(0, -16.5, 6.8, 0, Math.PI * 2)
	context.fill()
	context.fillStyle = '#493220'
	context.beginPath()
	context.arc(0, -19.2, 7.2, Math.PI, Math.PI * 2)
	context.lineTo(6.3, -15)
	context.lineTo(4.5, -16)
	context.closePath()
	context.fill()
	context.fillStyle = '#372419'
	context.fillRect(-3.7, -18, 2.4, 0.8)
	context.fillRect(1.3, -18, 2.4, 0.8)
	context.beginPath()
	context.arc(-2.4, -16.2, 1, 0, Math.PI * 2)
	context.arc(2.4, -16.2, 1, 0, Math.PI * 2)
	context.fill()
	context.strokeStyle = '#a56749'
	context.lineWidth = 0.8
	context.beginPath()
	context.moveTo(0, -16)
	context.lineTo(-0.5, -14.2)
	context.lineTo(0.5, -14.2)
	context.stroke()
	context.strokeStyle = '#85402f'
	context.lineWidth = 1
	context.beginPath()
	context.arc(0, -12.8, 1.7, 0.15, Math.PI - 0.15)
	context.stroke()
	context.restore()
}

function drawMiniMap() {
	const rect = miniMap.getBoundingClientRect()
	const width = rect.width
	const height = rect.height
	const scaleX = width / world.width
	const scaleY = height / world.height
	miniContext.clearRect(0, 0, width, height)
	miniContext.fillStyle = '#6f914c'
	miniContext.fillRect(0, 0, width, height)

	miniContext.save()
	miniContext.scale(scaleX, scaleY)
	riverPath(miniContext)
	miniContext.strokeStyle = '#75b5a7'
	miniContext.lineWidth = 166
	miniContext.stroke()
	riverPath(miniContext)
	miniContext.strokeStyle = '#256c91'
	miniContext.lineWidth = 82
	miniContext.stroke()
	miniContext.fillStyle = '#75b5a7'
	miniContext.beginPath()
	miniContext.ellipse(1910, 4850, 320, 225, -0.22, 0, Math.PI * 2)
	miniContext.fill()
	miniContext.fillStyle = '#256c91'
	miniContext.beginPath()
	miniContext.ellipse(1910, 4850, 234, 153, -0.22, 0, Math.PI * 2)
	miniContext.fill()
	miniContext.restore()

	miniContext.strokeStyle = '#e8cf73'
	miniContext.lineWidth = 1.5
	miniContext.strokeRect(view.x * scaleX, view.y * scaleY, view.width * scaleX, view.height * scaleY)
	miniContext.fillStyle = '#f4d66d'
	miniContext.beginPath()
	miniContext.arc(explorer.x * scaleX, explorer.y * scaleY, 3, 0, Math.PI * 2)
	miniContext.fill()
}

function update(dt) {
	const edge = 58
	if (pointer.active) {
		let dx = 0
		let dy = 0
		if (pointer.x < edge) dx = -(edge - pointer.x) / edge
		if (pointer.x > view.width - edge) dx = (pointer.x - (view.width - edge)) / edge
		if (pointer.y < edge) dy = -(edge - pointer.y) / edge
		if (pointer.y > view.height - edge) dy = (pointer.y - (view.height - edge)) / edge
		if (dx || dy) {
			const length = Math.hypot(dx, dy) || 1
			const speed = 570
			view.x += dx / length * speed * dt
			view.y += dy / length * speed * dt
			clampCamera()
		}
	}

	const dx = explorer.targetX - explorer.x
	const dy = explorer.targetY - explorer.y
	const distance = Math.hypot(dx, dy)
	explorer.walking = distance > 1
	if (explorer.walking) {
		const travel = Math.min(distance, 190 * dt)
		explorer.x += dx / distance * travel
		explorer.y += dy / distance * travel
	}
	updateDeer(dt)
}

function updateDeer(dt) {
	decorations.forEach(function (item) {
		if (item.type !== 'animal') {
			return
		}
		const dx = item.x - explorer.x
		const dy = item.y - explorer.y
		const distance = Math.hypot(dx, dy)
		const noticeRange = 300
		const nearness = Math.max(0, 1 - distance / noticeRange)
		const fleeChancePerSecond = 0.12 + nearness * 1.05
		if (distance < noticeRange && item.fleeTime <= 0 && Math.random() < fleeChancePerSecond * dt) {
			item.direction = Math.atan2(dy, dx) + (random(item.x + item.y) - 0.5) * 0.35
			item.fleeTime = 1.8
		}
		if (item.fleeTime <= 0) {
			return
		}
		item.fleeTime -= dt
		const speed = 118
		item.x += Math.cos(item.direction) * speed * dt
		item.y += Math.sin(item.direction) * speed * dt
		if (item.x < 45 || item.x > world.width - 45 || item.y < 45 || item.y > world.height - 45) {
			item.direction += Math.PI * 0.72
			item.x = Math.max(45, Math.min(world.width - 45, item.x))
			item.y = Math.max(45, Math.min(world.height - 45, item.y))
		}
	})
}

function render(now) {
	context.clearRect(0, 0, view.width, view.height)
	drawGround()
	drawDecorations(now)
	drawMarker(now)
	drawExplorer(now)
	drawMiniMap()
}

function frame(now) {
	if (!lastTime) lastTime = now
	const dt = Math.min(0.05, (now - lastTime) / 1000)
	lastTime = now
	update(dt)
	render(now)
	requestAnimationFrame(frame)
}

function canvasPoint(event) {
	const rect = canvas.getBoundingClientRect()
	return { x: event.clientX - rect.left, y: event.clientY - rect.top }
}

// Track the pointer at the window level. This preserves the most recent
// edge direction when it leaves the terrain or moves over the overview.
window.addEventListener('pointermove', function (event) {
	const point = canvasPoint(event)
	pointer.x = point.x
	pointer.y = point.y
	pointer.active = true
})

canvas.addEventListener('pointerdown', function (event) {
	const point = canvasPoint(event)
	explorer.targetX = Math.max(0, Math.min(world.width, view.x + point.x))
	explorer.targetY = Math.max(0, Math.min(world.height, view.y + point.y))
	clickMarker = { x: explorer.targetX, y: explorer.targetY, time: performance.now() }
	status.textContent = 'Moving to destination'
})

miniMap.addEventListener('pointerdown', function (event) {
	const rect = miniMap.getBoundingClientRect()
	const pointX = (event.clientX - rect.left) / rect.width * world.width
	const pointY = (event.clientY - rect.top) / rect.height * world.height
	view.x = pointX - view.width / 2
	view.y = pointY - view.height / 2
	clampCamera()
	status.textContent = 'Camera moved'
	event.preventDefault()
})

window.addEventListener('resize', resize)
addDecorations()
resize()
requestAnimationFrame(frame)
