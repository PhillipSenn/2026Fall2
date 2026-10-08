const canvas = document.getElementById('myCanvas')
const ctx = canvas.getContext('2d')
const view = {}
function marble(light, mid, dark) {
	return { r: 10, light: light, mid: mid, dark: dark, vx: 0, vy: 0 }
}
const BLUE = ['#d6ecff', '#2b78d6', '#0b2c5c']
const RED = ['#ffd0d0', '#d32626', '#5a0c0c']
const SWATCHES = [
	['#fff3c4', '#e0b000', '#6a5200'],
	['#f4f4f4', '#c8c8c8', '#5c5c5c'],
	['#f0d6ff', '#8a3db8', '#3d1460'],
	['#ffe0c2', '#e07020', '#6a2808'],
	['#d4f5d4', '#2e9b45', '#0d4a1c'],
	['#ffd6ea', '#d63a86', '#6a1240'],
	['#d4f6f4', '#1aa8a0', '#0a4542'],
	['#f6e2c8', '#a56b32', '#4a2c10'],
	['#d6e4ff', '#3a5ad6', '#101848'],
	['#e7f7c2', '#7cb342', '#2f4d0c'],
	['#ffe7a8', '#f0a202', '#6a4a00'],
	['#f8d0d8', '#c45c74', '#5c2430']
]
const COMPUTER_ID = '237DB729-5FCE-4569-A914-CDDB5D2E8422'
const marbles = []
let mine
const MAX_PULL = 58
const POWER = 4.1
const DRAG = 0.82
const STOP = 8
let dragging = false
let pointerId = null
let pull = { x: 0, y: 0 }
let placed = false
let last = 0
let acc = 0
let remotePlay = false
let remoteRest = null
let remoteScores = null
let seenShotNo = 0
let authoredShot = 0
let needSettle = false
let settleSent = false
let announced = false
let rolling = false
let cue = null
let contacts = {}
let scoreDirty = false
let scoresReady = false
const pendingSlides = []
const players = []
let me
let computerPlayer
let computerAiming = false
let computerRelease = 0
let aimMarble = null

function layout() {
	const board = canvas.parentElement
	const aside = document.getElementById('scores')
	const gap = 16
	let parentW = board.clientWidth
	if (aside && aside.offsetTop <= canvas.offsetTop + 4) {
		parentW -= aside.offsetWidth + gap
	}
	if (parentW < 80) {
		return
	}
	const maxH = window.innerHeight * 0.78
	let w = parentW
	let h = w * 1.02
	if (h > maxH) {
		h = maxH
		w = h / 1.02
	}
	canvas.style.width = w + 'px'
	canvas.style.height = h + 'px'
	const dpr = Math.min(window.devicePixelRatio || 1, 2)
	canvas.width = Math.round(w * dpr)
	canvas.height = Math.round(h * dpr)
	ctx.setTransform(dpr, 0, 0, dpr, 0, 0)
	view.w = w
	view.h = h
	view.cx = w / 2
	view.farY = h * 0.1
	view.nearY = h * 0.88
	view.farHalf = w * 0.16
	view.nearHalf = w * 0.46
	view.tableW = 200
	view.tableH = (view.nearY - view.farY) * view.tableW / (view.farHalf + view.nearHalf)
	if (!placed) {
		placeMarbles()
		placed = true
	}
}

function placeMarbles() {
	const gapX = 32
	const cols = Math.max(1, Math.min(marbles.length, Math.floor((view.tableW - 24) / gapX)))
	const rows = Math.ceil(marbles.length / cols) || 1
	const top = view.tableH * 0.22
	const bottom = view.tableH * 0.78
	const stepY = rows > 1 ? Math.min(34, (bottom - top) / (rows - 1)) : 0
	let n = 0
	for (let r = 0; r < rows; r++) {
		const count = Math.min(cols, marbles.length - n)
		const left = (view.tableW - (count - 1) * gapX) / 2
		for (let c = 0; c < count; c++) {
			marbles[n].x = left + c * gapX
			marbles[n].y = top + r * stepY
			marbles[n].vx = 0
			marbles[n].vy = 0
			n++
		}
	}
}

function project(x, y) {
	const t = y / view.tableH
	const ppu = 2 * (view.farHalf + (view.nearHalf - view.farHalf) * t) / view.tableW
	const A = 2 * view.farHalf / view.tableW
	const B = (view.nearHalf - view.farHalf) / (view.tableW * view.tableH)
	return {
		x: view.cx + (x - view.tableW / 2) * ppu,
		y: view.farY + A * y + B * y * y,
		ppu: ppu
	}
}

function unproject(sx, sy) {
	const A = 2 * view.farHalf / view.tableW
	const B = (view.nearHalf - view.farHalf) / (view.tableW * view.tableH)
	const dy = sy - view.farY
	const disc = A * A + 4 * B * dy
	if (disc < 0) {
		return null
	}
	const y = (-A + Math.sqrt(disc)) / (2 * B)
	const t = y / view.tableH
	const ppu = 2 * (view.farHalf + (view.nearHalf - view.farHalf) * t) / view.tableW
	if (ppu <= 0.001) {
		return null
	}
	return {
		x: view.tableW / 2 + (sx - view.cx) / ppu,
		y: y
	}
}

function canvasPoint(ev) {
	const rect = canvas.getBoundingClientRect()
	return { x: ev.clientX - rect.left, y: ev.clientY - rect.top }
}

function moving(m) {
	return Math.hypot(m.vx, m.vy) > STOP
}

function path(points) {
	ctx.beginPath()
	ctx.moveTo(points[0].x, points[0].y)
	for (let i = 1; i < points.length; i++) {
		ctx.lineTo(points[i].x, points[i].y)
	}
	ctx.closePath()
}

function corners(padX, padY) {
	return [
		project(-padX, -padY),
		project(view.tableW + padX, -padY),
		project(view.tableW + padX, view.tableH + padY),
		project(-padX, view.tableH + padY)
	]
}

function bounce(m) {
	const e = 0.64
	if (m.x < m.r) {
		m.x = m.r
		m.vx = Math.abs(m.vx) * e
	}
	if (m.x > view.tableW - m.r) {
		m.x = view.tableW - m.r
		m.vx = -Math.abs(m.vx) * e
	}
	if (m.y < m.r) {
		m.y = m.r
		m.vy = Math.abs(m.vy) * e
	}
	if (m.y > view.tableH - m.r) {
		m.y = view.tableH - m.r
		m.vy = -Math.abs(m.vy) * e
	}
}

function collide(a, b) {
	let dx = b.x - a.x
	let dy = b.y - a.y
	let dist = Math.hypot(dx, dy)
	const min = a.r + b.r
	if (dist === 0) {
		dx = 0.01
		dy = 0
		dist = 0.01
	}
	if (dist >= min) {
		noteContact(a, b, false)
		return
	}
	noteContact(a, b, true)
	const nx = dx / dist
	const ny = dy / dist
	const overlap = min - dist
	a.x -= nx * overlap * 0.5
	a.y -= ny * overlap * 0.5
	b.x += nx * overlap * 0.5
	b.y += ny * overlap * 0.5
	const vn = (a.vx - b.vx) * nx + (a.vy - b.vy) * ny
	if (vn <= 0) {
		return
	}
	const j = -(1 + 0.96) * vn / 2
	a.vx += j * nx
	a.vy += j * ny
	b.vx -= j * nx
	b.vy -= j * ny
}

function integrate(dt) {
	marbles.forEach(function (m) {
		m.x += m.vx * dt
		m.y += m.vy * dt
		const decay = Math.exp(-DRAG * dt)
		m.vx *= decay
		m.vy *= decay
		if (!moving(m)) {
			m.vx = 0
			m.vy = 0
		}
		bounce(m)
	})
	for (let i = 0; i < marbles.length; i++) {
		for (let j = i + 1; j < marbles.length; j++) {
			collide(marbles[i], marbles[j])
		}
		bounce(marbles[i])
	}
}

function drawTable() {
	const wood = corners(15, 7)
	const felt = corners(0, 0)
	const lip = Math.max(14, view.h * 0.032)
	ctx.fillStyle = '#1a1612'
	ctx.fillRect(0, 0, view.w, view.h)

	ctx.beginPath()
	ctx.moveTo(wood[3].x, wood[3].y)
	ctx.lineTo(wood[2].x, wood[2].y)
	ctx.lineTo(wood[2].x + lip * 0.08, wood[2].y + lip)
	ctx.lineTo(wood[3].x - lip * 0.08, wood[3].y + lip)
	ctx.closePath()
	ctx.fillStyle = '#3a2416'
	ctx.fill()

	path(wood)
	const woodTone = ctx.createLinearGradient(0, view.farY, 0, view.nearY)
	woodTone.addColorStop(0, '#8d5b34')
	woodTone.addColorStop(1, '#5a3418')
	ctx.fillStyle = woodTone
	ctx.fill()

	path(felt)
	const feltTone = ctx.createLinearGradient(0, view.farY, 0, view.nearY)
	feltTone.addColorStop(0, '#0d4a28')
	feltTone.addColorStop(0.45, '#146b34')
	feltTone.addColorStop(1, '#24924a')
	ctx.fillStyle = feltTone
	ctx.fill()

	ctx.save()
	path(felt)
	ctx.clip()
	const sheen = ctx.createLinearGradient(view.cx, view.farY, view.cx - view.w * 0.2, view.nearY)
	sheen.addColorStop(0, 'rgba(255,255,255,0.05)')
	sheen.addColorStop(0.45, 'rgba(255,255,255,0)')
	sheen.addColorStop(1, 'rgba(255,255,255,0.14)')
	ctx.fillStyle = sheen
	ctx.fillRect(0, 0, view.w, view.h)
	ctx.restore()

	path(corners(0, 0))
	ctx.strokeStyle = 'rgba(255,255,255,0.16)'
	ctx.lineWidth = 2
	ctx.stroke()
}

function drawAim() {
	const len = Math.hypot(pull.x, pull.y)
	if (len < 1) {
		return
	}
	const dx = -pull.x / len
	const dy = -pull.y / len
	const shot = Math.min(len, MAX_PULL)
	ctx.beginPath()
	for (let i = 0; i <= 16; i++) {
		const p = project(aimMarble.x + dx * shot * i / 16, aimMarble.y + dy * shot * i / 16)
		if (i === 0) {
			ctx.moveTo(p.x, p.y)
		} else {
			ctx.lineTo(p.x, p.y)
		}
	}
	const strength = shot / MAX_PULL
	ctx.strokeStyle = 'rgba(255,255,255,' + (0.35 + strength * 0.6) + ')'
	ctx.lineWidth = 2 + strength * 2
	ctx.setLineDash([7, 6])
	ctx.stroke()
	ctx.setLineDash([])

	const tip = project(aimMarble.x + dx * shot, aimMarble.y + dy * shot)
	const prev = project(aimMarble.x + dx * shot * 0.86, aimMarble.y + dy * shot * 0.86)
	const ang = Math.atan2(tip.y - prev.y, tip.x - prev.x)
	ctx.beginPath()
	ctx.moveTo(tip.x, tip.y)
	ctx.lineTo(tip.x - 12 * Math.cos(ang - 0.45), tip.y - 12 * Math.sin(ang - 0.45))
	ctx.moveTo(tip.x, tip.y)
	ctx.lineTo(tip.x - 12 * Math.cos(ang + 0.45), tip.y - 12 * Math.sin(ang + 0.45))
	ctx.stroke()

	const from = project(aimMarble.x, aimMarble.y)
	const back = project(aimMarble.x + pull.x, aimMarble.y + pull.y)
	ctx.beginPath()
	ctx.moveTo(from.x, from.y)
	ctx.lineTo(back.x, back.y)
	ctx.strokeStyle = 'rgba(255, 214, 90, 0.8)'
	ctx.lineWidth = 3
	ctx.stroke()
}

function shown(m) {
	if ((dragging || computerAiming) && m === aimMarble) {
		return { x: m.x + pull.x, y: m.y + pull.y }
	}
	return { x: m.x, y: m.y }
}

function drawMarble(m) {
	const spot = shown(m)
	const p = project(spot.x, spot.y)
	const rad = Math.max(4, m.r * p.ppu)
	ctx.save()
	ctx.translate(p.x, p.y - rad * 0.12)
	ctx.scale(1, 0.36)
	ctx.beginPath()
	ctx.arc(0, rad * 1.15, rad * 0.9, 0, Math.PI * 2)
	ctx.fillStyle = 'rgba(0,0,0,0.32)'
	ctx.fill()
	ctx.restore()

	const g = ctx.createRadialGradient(
		p.x - rad * 0.34, p.y - rad * 0.4, rad * 0.08,
		p.x + rad * 0.05, p.y + rad * 0.08, rad
	)
	g.addColorStop(0, '#ffffff')
	g.addColorStop(0.2, m.light)
	g.addColorStop(0.58, m.mid)
	g.addColorStop(1, m.dark)
	ctx.beginPath()
	ctx.arc(p.x, p.y, rad, 0, Math.PI * 2)
	ctx.fillStyle = g
	ctx.fill()
	ctx.lineWidth = Math.max(1, rad * 0.06)
	ctx.strokeStyle = 'rgba(255,255,255,0.28)'
	ctx.stroke()
}

function draw() {
	if (!view.w) {
		return
	}
	drawTable()
	if (dragging || computerAiming) {
		drawAim()
	}
	marbles.slice().sort(function (a, b) { return a.y - b.y }).forEach(drawMarble)
	ctx.fillStyle = 'rgba(255,255,255,0.8)'
	ctx.font = '15px Segoe UI, sans-serif'
	ctx.textAlign = 'center'
	if (canPlay()) {
		ctx.fillText('Pull your marble back, then release', view.cx, view.h * 0.05)
	}
}

function noteContact(a, b, touching) {
	const ai = marbles.indexOf(a)
	const bi = marbles.indexOf(b)
	const key = ai < bi ? ai + '-' + bi : bi + '-' + ai
	if (!touching) {
		contacts[key] = false
		return
	}
	if (contacts[key]) {
		return
	}
	contacts[key] = true
	if (rolling) {
		scoreHit(a, b)
	}
}

function strikerOf(a, b) {
	const dx = b.x - a.x
	const dy = b.y - a.y
	const dist = Math.hypot(dx, dy) || 0.01
	const nx = dx / dist
	const ny = dy / dist
	const vn = (a.vx - b.vx) * nx + (a.vy - b.vy) * ny
	if (vn > 0) {
		return a
	}
	return b
}

function scoreHit(a, b) {
	if (remotePlay || !cue) {
		return
	}
	const striker = strikerOf(a, b)
	if (striker.owner) {
		awardPoint(striker.owner)
	}
	if (striker !== cue && cue.owner) {
		awardPoint(cue.owner)
	}
}

function awardPoint(who) {
	who.score += 1
	scoreDirty = true
}

function compareScores(a, b) {
	if (b.score !== a.score) {
		return b.score - a.score
	}
	return a.seat - b.seat
}

function buildScores() {
	const list = document.getElementById('scoreList')
	const rows = list.querySelectorAll('.score-row')
	for (let i = 0; i < rows.length; i++) {
		const name = rows[i].querySelector('.score-name').textContent
		const id = (rows[i].getAttribute('data-id') || '').toUpperCase()
		players.push({
			name: name,
			usrid: rows[i].getAttribute('data-usrid'),
			id: id,
			score: 0,
			seat: i,
			row: rows[i]
		})
		if (id && id === myId().toUpperCase()) {
			me = players[i]
		}
		if (id === COMPUTER_ID) {
			computerPlayer = players[i]
		}
	}
	let swatch = 0
	for (let i = 0; i < players.length; i++) {
		let tone = SWATCHES[swatch % SWATCHES.length]
		if (players[i].name === 'Professor') {
			tone = BLUE
		} else if (players[i] === computerPlayer) {
			tone = RED
		} else {
			swatch++
		}
		const ball = marble(tone[0], tone[1], tone[2])
		ball.owner = players[i]
		players[i].marble = ball
		marbles.push(ball)
	}
	if (me) {
		mine = me.marble
		aimMarble = mine
	}
	paintScores()
}

function colorNames() {
	for (let i = 0; i < players.length; i++) {
		const name = players[i].row.querySelector('.score-name')
		if (name && players[i].marble) {
			name.style.color = players[i].marble.mid
		}
	}
}

function paintScores() {
	const ranked = players.slice()
	ranked.sort(compareScores)
	const oldTop = {}
	if (scoresReady) {
		for (let i = 0; i < players.length; i++) {
			oldTop[players[i].name] = players[i].row.getBoundingClientRect().top
		}
	}
	const list = document.getElementById('scoreList')
	pendingSlides.length = 0
	for (let i = 0; i < ranked.length; i++) {
		const row = ranked[i].row
		list.appendChild(row)
		row.querySelector('.score-rank').textContent = String(i + 1)
		row.querySelector('.score-points').textContent = String(ranked[i].score)
	}
	colorNames()
	if (scoresReady) {
		for (let i = 0; i < ranked.length; i++) {
			const row = ranked[i].row
			const dy = oldTop[ranked[i].name] - row.getBoundingClientRect().top
			if (!dy) {
				continue
			}
			row.style.transition = 'none'
			row.style.transform = 'translateY(' + dy + 'px)'
			pendingSlides.push(row)
		}
	}
	scoresReady = true
	if (pendingSlides.length) {
		requestAnimationFrame(releaseSlides)
	}
}

function releaseSlides() {
	for (let i = 0; i < pendingSlides.length; i++) {
		pendingSlides[i].style.transition = 'transform 0.55s cubic-bezier(.2,.8,.2,1)'
		pendingSlides[i].style.transform = 'translateY(0)'
	}
}

function settled() {
	for (let i = 0; i < marbles.length; i++) {
		if (moving(marbles[i])) {
			return false
		}
	}
	return true
}

function overCue(screen, world) {
	if (!mine) {
		return false
	}
	const p = project(mine.x, mine.y)
	const rad = Math.max(18, mine.r * p.ppu + 12)
	if (Math.hypot(screen.x - p.x, screen.y - p.y) <= rad) {
		return true
	}
	if (!world) {
		return false
	}
	return Math.hypot(world.x - mine.x, world.y - mine.y) <= mine.r + 8
}

function canPlay() {
	return placed && mine && !computerAiming && !remotePlay && settled() && !rolling
}

function launch(marble) {
	const len = Math.hypot(pull.x, pull.y)
	if (len <= 5) {
		return false
	}
	const used = Math.min(len, MAX_PULL)
	marble.vx = -pull.x / len * used * POWER
	marble.vy = -pull.y / len * used * POWER
	return moving(marble)
}

function beginComputerTurn() {
	if (!computerPlayer || !computerPlayer.marble) {
		return
	}
	if (rolling || dragging || remotePlay || computerAiming || !settled()) {
		return
	}
	const ang = Math.random() * Math.PI * 2
	const shotLen = 14 + Math.random() * (MAX_PULL - 14)
	pull = { x: -Math.cos(ang) * shotLen, y: -Math.sin(ang) * shotLen }
	aimMarble = computerPlayer.marble
	computerAiming = true
	clearTimeout(computerRelease)
	computerRelease = setTimeout(releaseComputerShot, 650)
}

function releaseComputerShot() {
	if (!computerAiming) {
		return
	}
	needSettle = true
	settleSent = false
	authoredShot = 0
	if (launch(computerPlayer.marble)) {
		cue = computerPlayer.marble
	}
	computerAiming = false
	aimMarble = mine
	pull = { x: 0, y: 0 }
	rolling = true
	sendShot('')
}

function onDown(ev) {
	if (!canPlay()) {
		return
	}
	const world = unproject(canvasPoint(ev).x, canvasPoint(ev).y)
	if (!world) {
		return
	}
	if (!overCue(canvasPoint(ev), world)) {
		return
	}
	dragging = true
	pointerId = ev.pointerId
	canvas.setPointerCapture(ev.pointerId)
	pull = { x: world.x - mine.x, y: world.y - mine.y }
}

function onMove(ev) {
	const pt = canvasPoint(ev)
	const world = unproject(pt.x, pt.y)
	if (dragging && ev.pointerId === pointerId) {
		if (world) {
			pull = { x: world.x - mine.x, y: world.y - mine.y }
		} else {
			const origin = project(mine.x, mine.y)
			const ppu = origin.ppu || 1
			pull = { x: (pt.x - origin.x) / ppu, y: (pt.y - origin.y) / ppu }
		}
		const len = Math.hypot(pull.x, pull.y)
		if (len > MAX_PULL) {
			pull.x *= MAX_PULL / len
			pull.y *= MAX_PULL / len
		}
	}
	const canGrab = canPlay() && overCue(pt, world)
	canvas.style.cursor = dragging ? 'grabbing' : (canGrab ? 'grab' : 'default')
}

function onUp(ev) {
	if (!dragging || ev.pointerId !== pointerId) {
		return
	}
	if (launch(mine)) {
		cue = mine
		rolling = true
		needSettle = true
		settleSent = false
		authoredShot = 0
		sendShot('')
	}
	dragging = false
	pointerId = null
	pull = { x: 0, y: 0 }
}

canvas.addEventListener('pointerdown', onDown)
canvas.addEventListener('pointermove', onMove)
canvas.addEventListener('pointerup', onUp)
canvas.addEventListener('pointercancel', onUp)
window.addEventListener('resize', layout)
buildScores()
layout()
startSync()

function myId() {
	const input = document.querySelector('input[name=id]')
	if (!input) {
		return ''
	}
	return input.value
}

function packMarbles() {
	const list = []
	for (let i = 0; i < marbles.length; i++) {
		list.push({
			x: marbles[i].x,
			y: marbles[i].y,
			vx: marbles[i].vx,
			vy: marbles[i].vy,
			owner: marbles[i].owner ? marbles[i].owner.name : ''
		})
	}
	return list
}

function packScores() {
	const list = []
	for (let i = 0; i < players.length; i++) {
		list.push({ name: players[i].name, score: players[i].score })
	}
	return list
}

function lowerRow(row) {
	const out = {}
	const keys = Object.keys(row)
	for (let i = 0; i < keys.length; i++) {
		out[keys[i].toLowerCase()] = row[keys[i]]
	}
	return out
}

function field(data, name) {
	if (!data) {
		return ''
	}
	const row = lowerRow(data)
	if (row[name] === undefined || row[name] === null) {
		return ''
	}
	return row[name]
}

function parseLayout(value) {
	if (!value) {
		return null
	}
	if (typeof value === 'string') {
		return JSON.parse(value)
	}
	return value
}

function applyLayout(list) {
	const rows = []
	for (let i = 0; i < list.length; i++) {
		rows.push(lowerRow(list[i]))
	}
	for (let i = 0; i < rows.length && i < marbles.length; i++) {
		marbles[i].x = Number(rows[i].x)
		marbles[i].y = Number(rows[i].y)
		marbles[i].vx = Number(rows[i].vx)
		marbles[i].vy = Number(rows[i].vy)
	}
	contacts = {}
}

function applyScores(list) {
	if (!list) {
		return
	}
	for (let i = 0; i < list.length; i++) {
		const row = lowerRow(list[i])
		for (let j = 0; j < players.length; j++) {
			if (players[j].name === row.name) {
				players[j].score = Number(row.score)
			}
		}
	}
	paintScores()
}

function haltRoll() {
	for (let i = 0; i < marbles.length; i++) {
		marbles[i].vx = 0
		marbles[i].vy = 0
	}
	rolling = false
	cue = null
}

function postSync(fields, done) {
	const body = new URLSearchParams()
	const names = Object.keys(fields)
	for (let i = 0; i < names.length; i++) {
		body.append(names[i], fields[names[i]])
	}
	if (!fields.id) {
		body.append('id', myId())
	}
	fetch('sync.cfm', { method: 'POST', body: body }).then(readSync).then(done).catch(ignoreSync)
	function readSync(response) {
		return response.json()
	}
}

function ignoreSync() {
}

function sendInit() {
	if (announced) {
		return
	}
	announced = true
	postSync({
		op: 'init',
		layout: JSON.stringify(packMarbles()),
		scores: JSON.stringify(packScores())
	}, gotPoll)
}

function sendShot(shooter) {
	postSync({
		op: 'shot',
		shooter: shooter,
		layout: JSON.stringify(packMarbles())
	}, sentShot)
}

function sentShot(data) {
	if (!acceptedSync(data)) {
		needSettle = false
		computerAiming = false
		haltRoll()
		return
	}
	seenShotNo = Number(field(data, 'shotno'))
	authoredShot = seenShotNo
	if (needSettle && !rolling) {
		sendSettle()
	}
}

function sendSettle() {
	if (!authoredShot || settleSent) {
		return
	}
	settleSent = true
	needSettle = false
	postSync({
		op: 'settle',
		shotNo: String(authoredShot),
		layout: JSON.stringify(packMarbles()),
		scores: JSON.stringify(packScores())
	}, ignoreSync)
}

function acceptedSync(data) {
	const value = field(data, 'accepted')
	return value === true || value === 'true' || value === 'YES'
}

function playRemote(data) {
	const shot = parseLayout(field(data, 'shot'))
	if (!shot) {
		return
	}
	clearTimeout(computerRelease)
	computerAiming = false
	applyLayout(shot)
	remotePlay = true
	rolling = true
	dragging = false
	if (String(field(data, 'status')) === 'idle') {
		remoteRest = parseLayout(field(data, 'marbles'))
		remoteScores = parseLayout(field(data, 'scores'))
	} else {
		remoteRest = null
		remoteScores = null
	}
}

function finishRemote() {
	remotePlay = false
	rolling = false
	if (remoteRest) {
		applyLayout(remoteRest)
		haltRoll()
	}
	if (remoteScores) {
		applyScores(remoteScores)
	}
	remoteRest = null
	remoteScores = null
}

function gotPoll(data) {
	const shotNo = Number(field(data, 'shotno'))
	const status = String(field(data, 'status'))
	const layout = parseLayout(field(data, 'marbles'))
	if (!layout || layout.length !== marbles.length) {
		sendInit()
		return
	}
	if (!shotNo && !field(data, 'marbles')) {
		sendInit()
		return
	}
	if (shotNo > seenShotNo && shotNo !== authoredShot && !rolling) {
		seenShotNo = shotNo
		playRemote(data)
		return
	}
	if (shotNo > seenShotNo) {
		seenShotNo = shotNo
	}
	if (!rolling && !remotePlay && !dragging && !computerAiming && status === 'idle') {
		applyLayout(layout)
		haltRoll()
		applyScores(parseLayout(field(data, 'scores')))
		maybeComputer(data)
	}
}

function maybeComputer(data) {
	if (myId().toUpperCase() !== COMPUTER_ID) {
		return
	}
	if (Number(field(data, 'idlefor')) < 30) {
		return
	}
	beginComputerTurn()
}

function pollGame() {
	postSync({ op: 'poll' }, gotPoll)
}

function startSync() {
	pollGame()
	setInterval(pollGame, 2000)
}

function frame(now) {
	if (!last) {
		last = now
	}
	const dt = Math.min(0.05, (now - last) / 1000)
	last = now
	acc += dt
	while (acc >= 1 / 120) {
		integrate(1 / 120)
		acc -= 1 / 120
	}
	if (scoreDirty) {
		scoreDirty = false
		paintScores()
	}
	if (rolling && settled() && !computerAiming) {
		rolling = false
		cue = null
		if (remotePlay) {
			finishRemote()
		} else {
			sendSettle()
		}
	}
	draw()
	requestAnimationFrame(frame)
}
requestAnimationFrame(frame)
