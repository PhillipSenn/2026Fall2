var termChaseConfig = {
   endpoint: '../Poll/merge_q.cfm',
   revealAfter: 5,
   questions: loadQuestions()
}

function loadQuestions() {
   var questions = []
   var choices = []
   $('#questions tr').each(readQuestion)
   questions.forEach(assignChoices)
   return questions

   function readQuestion() {
      var cells = $(this).children('td')
      var term = acronym(cells.eq(1).text().trim())
      questions.push({
         id: cells.eq(0).text().trim(),
         term: term,
         definition: cells.eq(2).text().trim(),
         choices: []
      })
      choices.push(term)
   }

   function assignChoices(question) {
      question.choices = choices.slice()
   }
}

function acronym(qname) {
   var open = qname.indexOf('(')
   var close = qname.indexOf(')', open + 1)
   var inside
   var before
   if (open < 0 || close < 0) return qname
   inside = qname.slice(open + 1, close).trim()
   if (isAcronym(inside)) return inside
   before = qname.slice(0, open).trim()
   if (isAcronym(before)) return before
   return qname
}

function isAcronym(text) {
   var capitals = 0
   var words = 1
   var i
   var letter
   if (!text || text.length > 20) return false
   for (i = 0; i < text.length; i++) {
      letter = text.charAt(i)
      if (letter >= 'A' && letter <= 'Z') capitals++
      if (letter === ' ') words++
   }
   return capitals >= 2 && words <= 3
}

function createTermChase(config) {
   var canvas = document.getElementById('maze')
   var ctx = canvas.getContext('2d')
   var definition = document.getElementById('definition')
   var hint = document.getElementById('termHint')
   var roundLabel = document.getElementById('roundNumber')
   var muteButton = document.getElementById('soundToggle')
   var cols = 21
   var rows = 23
   var cell = 32
   var map = []
   var dirs = [{ x: 1, y: 0 }, { x: 0, y: 1 }, { x: -1, y: 0 }, { x: 0, y: -1 }]
   var goalPositions = []
   var playerStart = { x: 1, y: 1 }
   var ghostStarts = []
   var root = document.getElementById('manGame')
   var remaining = document.getElementById('ghostCount')
   var modal = document.getElementById('completeModal')
   var playerColor = ''
   var wallColor = ''
   var collisionGrace = 0
   var player
   var ghosts
   var goals = []
   var phase = 'ready'
   var round = 0
   var elapsed = 0
   var revealed = false
   var lastTime = 0
   var accumulator = 0
   var stepTime = 1 / 120
   var audioContext = null
   var muted = false
   var soundClock = 0
   var soundStep = 0
   var animationTime = 0
   var wrongCooldown = 0
   var pointerStart = null
   var resumePhase = 'running'
   var solvedTerms = []
   var inputUnlockAt = 0
   var speed = 1

   function makeMap() {
      var guard = 0
      carveMaze()
      addLoops()
      placeGoals()
      while (goalPositions.length < 4 && guard < 30) {
         punchGoal()
         placeGoals()
         guard++
      }
      playerStart = pickPlayer(openCells())
      ghostStarts = pickGhosts(openCells(), playerStart)
   }

   function carveMaze() {
      var x, y
      var grid = []
      var stack = []
      var current
      var neighbors
      var next
      for (y = 0; y < rows; y++) {
         map[y] = []
         grid[y] = []
         for (x = 0; x < cols; x++) map[y][x] = 1
      }
      for (y = 1; y < rows; y += 2) {
         for (x = 1; x < cols; x += 2) {
            map[y][x] = 0
            grid[y][x] = { x: x, y: y, seen: false }
         }
      }
      current = grid[1][1]
      current.seen = true
      stack.push(current)
      while (stack.length) {
         current = stack[stack.length - 1]
         neighbors = unseenNeighbors(current, grid)
         if (!neighbors.length) {
            stack.pop()
            continue
         }
         next = neighbors[Math.floor(Math.random() * neighbors.length)]
         map[(current.y + next.y) / 2][(current.x + next.x) / 2] = 0
         next.seen = true
         stack.push(next)
      }
   }

   function unseenNeighbors(cell, grid) {
      var list = []
      var steps = [{ x: 2, y: 0 }, { x: -2, y: 0 }, { x: 0, y: 2 }, { x: 0, y: -2 }]
      var i, nx, ny, neighbor
      for (i = 0; i < steps.length; i++) {
         nx = cell.x + steps[i].x
         ny = cell.y + steps[i].y
         if (nx <= 0 || ny <= 0 || nx >= cols - 1 || ny >= rows - 1) continue
         neighbor = grid[ny][nx]
         if (neighbor && !neighbor.seen) list.push(neighbor)
      }
      return list
   }

   function addLoops() {
      var x, y
      for (y = 1; y < rows - 1; y += 2) {
         for (x = 2; x < cols - 1; x += 2) {
            if (Math.random() < 0.28) map[y][x] = 0
         }
      }
      for (y = 2; y < rows - 1; y += 2) {
         for (x = 1; x < cols - 1; x += 2) {
            if (Math.random() < 0.28) map[y][x] = 0
         }
      }
   }

   function placeGoals() {
      var spots = goalSpots()
      var i
      goalPositions = []
      shuffleSpots(spots)
      for (i = 0; i < spots.length && goalPositions.length < 4; i++) {
         if (goalFits(spots[i])) goalPositions.push(spots[i])
      }
   }

   function goalSpots() {
      var spots = []
      var x, y
      for (y = 1; y < rows - 2; y++) {
         for (x = 1; x < cols - 3; x++) {
            if (map[y][x] === 0 && map[y][x + 1] === 0 && map[y][x + 2] === 0) spots.push({ x: x, y: y })
         }
      }
      return spots
   }

   function goalFits(spot) {
      var i, goal
      for (i = 0; i < goalPositions.length; i++) {
         goal = goalPositions[i]
         if (Math.abs(goal.y - spot.y) < 2 && Math.abs(goal.x - spot.x) < 4) return false
      }
      return true
   }

   function punchGoal() {
      var y = 1 + 2 * Math.floor(Math.random() * ((rows - 3) / 2))
      var x = 1 + 2 * Math.floor(Math.random() * ((cols - 4) / 2))
      map[y][x] = 0
      map[y][x + 1] = 0
      map[y][x + 2] = 0
   }

   function shuffleSpots(list) {
      var i = list.length
      var pick
      var swap
      while (i) {
         pick = Math.floor(Math.random() * i)
         i--
         swap = list[i]
         list[i] = list[pick]
         list[pick] = swap
      }
   }

   function openCells() {
      var cells = []
      var x, y
      for (y = 1; y < rows - 1; y++) {
         for (x = 1; x < cols - 1; x++) {
            if (map[y][x] === 0 && !onGoal(x, y)) cells.push({ x: x, y: y })
         }
      }
      return cells
   }

   function onGoal(x, y) {
      var i, goal
      for (i = 0; i < goalPositions.length; i++) {
         goal = goalPositions[i]
         if (y === goal.y && x >= goal.x && x <= goal.x + 2) return true
      }
      return false
   }

   function pickPlayer(cells) {
      var best = cells[0]
      var bestScore = scorePlayer(best)
      var i, score
      for (i = 1; i < cells.length; i++) {
         score = scorePlayer(cells[i])
         if (score < bestScore) {
            best = cells[i]
            bestScore = score
         }
      }
      return { x: best.x, y: best.y }
   }

   function scorePlayer(spot) {
      return Math.abs(spot.x - (cols - 1) / 2) + (rows - 2 - spot.y) * 3
   }

   function pickGhosts(cells, start) {
      var list = cells.slice()
      var chosen = []
      var i
      list.sort(byCenter)
      for (i = 0; i < list.length && chosen.length < 4; i++) {
         if (sameCell(list[i], start)) continue
         if (Math.abs(list[i].x - start.x) + Math.abs(list[i].y - start.y) < 6) continue
         chosen.push({ x: list[i].x, y: list[i].y })
      }
      if (chosen.length < 4) {
         chosen = []
         for (i = 0; i < list.length && chosen.length < 4; i++) {
            if (sameCell(list[i], start)) continue
            chosen.push({ x: list[i].x, y: list[i].y })
         }
      }
      return chosen
   }

   function byCenter(a, b) {
      return centerDistance(a) - centerDistance(b)
   }

   function centerDistance(spot) {
      return Math.abs(spot.x - (cols - 1) / 2) + Math.abs(spot.y - (rows - 1) / 2)
   }

   function sameCell(a, b) {
      return a.x === b.x && a.y === b.y
   }

   function themeColor(name, fallback) {
      // Read a real themed button so the canvas follows header6.cfm's theme.
      var probe = document.createElement('button')
      var color, token
      probe.type = 'button'
      probe.className = 'theme-' + name + ' btn-solid btn-styled'
      probe.tabIndex = -1
      probe.setAttribute('aria-hidden', 'true')
      probe.style.cssText = 'position:fixed;left:-10000px;visibility:hidden'
      document.body.appendChild(probe)
      color = window.getComputedStyle(probe).backgroundColor
      token = window.getComputedStyle(document.documentElement).getPropertyValue('--bs-' + name).trim()
      probe.parentNode.removeChild(probe)
      if (color && color !== 'rgba(0, 0, 0, 0)' && color !== 'transparent' && color !== 'rgb(239, 239, 239)' && color !== 'rgb(240, 240, 240)') return color
      return token || fallback
   }

   function fitGame() {
      var top, chromeBottom = 0, i, rect
      var chrome = document.querySelectorAll('.navbar, .progress, .progress-bar')
      // Normal-flow headers already precede the game. Reserve fixed/sticky headers too.
      root.style.marginTop = '0px'
      top = Math.max(0, root.getBoundingClientRect().top)
      for (i = 0; i < chrome.length; i++) {
         if (root.contains(chrome[i])) continue
         rect = chrome[i].getBoundingClientRect()
         if (rect.height > 0 && rect.top < window.innerHeight / 2 && rect.bottom > 0) chromeBottom = Math.max(chromeBottom, rect.bottom)
      }
      if (chromeBottom > top) root.style.marginTop = Math.ceil(chromeBottom - top + 4) + 'px'
      top = Math.max(0, root.getBoundingClientRect().top)
      var viewport = window.visualViewport ? window.visualViewport.height : window.innerHeight
      var footer = document.querySelector('footer')
      var footerHeight = footer && !root.contains(footer) ? footer.getBoundingClientRect().height : 0
      var available, scale
      root.style.height = Math.max(160, viewport - top - footerHeight - 8) + 'px'
      available = document.getElementById('mazeSpace')
      scale = Math.max(1, Math.min(available.clientWidth / cols, available.clientHeight / rows))
      canvas.style.width = Math.floor(cols * scale) + 'px'
      canvas.style.height = Math.floor(rows * scale) + 'px'
   }

   function open(x, y) {
      return x >= 0 && y >= 0 && x < cols && y < rows && map[y][x] === 0
   }

   function actor(x, y, color) {
      return { x: x, y: y, fromX: x, fromY: y, toX: x, toY: y, progress: 0, moving: false, dir: 0, wanted: 0, color: color }
   }

   function resetActors() {
      playerColor = themeColor('warning', '#ffc107')
      wallColor = themeColor('primary', '#0d6efd')
      player = actor(playerStart.x, playerStart.y, playerColor)
      ghosts = [
         actor(ghostStarts[0].x, ghostStarts[0].y, themeColor('danger', '#dc3545')),
         actor(ghostStarts[1].x, ghostStarts[1].y, themeColor('info', '#0dcaf0')),
         actor(ghostStarts[2].x, ghostStarts[2].y, themeColor('success', '#198754')),
         actor(ghostStarts[3].x, ghostStarts[3].y, themeColor('primary', '#0d6efd'))
      ]
      if (remaining) remaining.textContent = ghosts.length
   }

   function setPhase(value) {
      phase = value
      root.setAttribute('data-state', value)
   }

   function loadRound() {
      var q = config.questions[round]
      var i
      goals = []
      for (i = 0; i < q.choices.length; i++) {
         if (solvedTerms.indexOf(q.choices[i]) < 0) goals.push({ x: goalPositions[i].x, y: goalPositions[i].y, term: q.choices[i] })
      }
      elapsed = 0
      collisionGrace = 0.9
      wrongCooldown = 0
      revealed = false
      hint.textContent = ''
      hint.hidden = true

      definition.textContent = q.definition
      if (roundLabel) roundLabel.textContent = (round + 1) + ' / 4'
      setPhase('ready')

      draw()
   }

   function initAudio() {
      var AudioClass = window.AudioContext || window.webkitAudioContext
      if (!AudioClass) return
      if (!audioContext) audioContext = new AudioClass()
      if (audioContext.state === 'suspended') audioContext.resume().catch(audioFailure)
   }

   function audioFailure() {
      // Gameplay remains available if browser audio is unavailable.
   }

   function tone(frequency, duration, delay, type) {
      var oscillator, gain, start
      if (muted || !audioContext || audioContext.state !== 'running') return
      start = audioContext.currentTime + (delay || 0)
      oscillator = audioContext.createOscillator()
      gain = audioContext.createGain()
      oscillator.type = type || 'square'
      oscillator.frequency.setValueAtTime(frequency, start)
      gain.gain.setValueAtTime(0, start)
      gain.gain.linearRampToValueAtTime(0.035, start + 0.008)
      gain.gain.exponentialRampToValueAtTime(0.0001, start + duration)
      oscillator.connect(gain)
      gain.connect(audioContext.destination)
      oscillator.start(start)
      oscillator.stop(start + duration + 0.02)
      oscillator.onended = releaseAudio
      function releaseAudio() {
         oscillator.disconnect()
         gain.disconnect()
      }
   }

   function direction(index) {
      var d = dirs[index]
      if (Date.now() < inputUnlockAt) return
      initAudio()
      if (phase !== 'ready' && phase !== 'running' && phase !== 'chase') return
      player.wanted = index
      if (phase === 'ready' && (player.moving || open(player.x + d.x, player.y + d.y))) {
         setPhase('running')

         tone(330, 0.09)
      }
      // Allow immediate reversal, including halfway through a corridor.
      if (player.moving && index === (player.dir + 2) % 4) {
         var oldX = player.fromX
         var oldY = player.fromY
         player.fromX = player.toX
         player.fromY = player.toY
         player.toX = oldX
         player.toY = oldY
         player.progress = 1 - player.progress
         player.dir = index
      }
   }

   function beginStep(entity, index) {
      var d = dirs[index]
      if (!open(entity.x + d.x, entity.y + d.y)) return false
      entity.dir = index
      entity.fromX = entity.x
      entity.fromY = entity.y
      entity.toX = entity.x + d.x
      entity.toY = entity.y + d.y
      entity.progress = 0
      entity.moving = true
      return true
   }

   function ghostDirection(ghost, number) {
      var options = []
      var best = -1
      var bestDistance = phase === 'chase' ? -Infinity : Infinity
      var i, d, distance
      var targetX = player.x
      var targetY = player.y
      // Different temperaments: pursue, anticipate, and occasionally wander.
      if (number === 1) {
         targetX += dirs[player.dir].x * 3
         targetY += dirs[player.dir].y * 3
      }
      for (i = 0; i < dirs.length; i++) {
         d = dirs[i]
         if (open(ghost.x + d.x, ghost.y + d.y)) options.push(i)
      }
      if (options.length > 1) options = options.filter(notReverse)
      function notReverse(value) { return value !== (ghost.dir + 2) % 4 }
      if (Math.random() < (number === 2 ? 0.65 : 0.2)) return options[Math.floor(Math.random() * options.length)]
      for (i = 0; i < options.length; i++) {
         d = dirs[options[i]]
         distance = Math.abs(ghost.x + d.x - targetX) + Math.abs(ghost.y + d.y - targetY)
         if ((phase === 'chase' && distance > bestDistance) || (phase !== 'chase' && distance < bestDistance)) {
            bestDistance = distance
            best = options[i]
         }
      }
      return best
   }

   function move(entity, speed, dt, ghostNumber) {
      var chosen
      if (!entity.moving) {
         if (ghostNumber >= 0) {
            chosen = ghostDirection(entity, ghostNumber)
            if (chosen < 0) return
            beginStep(entity, chosen)
         } else if (!beginStep(entity, entity.wanted)) beginStep(entity, entity.dir)
      }
      if (!entity.moving) return
      entity.progress = Math.min(1, entity.progress + speed * dt)
      entity.x = entity.fromX + (entity.toX - entity.fromX) * entity.progress
      entity.y = entity.fromY + (entity.toY - entity.fromY) * entity.progress
      if (entity.progress >= 1) {
         entity.x = entity.toX
         entity.y = entity.toY
         entity.moving = false
      }
   }

   function touchGoal() {
      var i, goal
      for (i = 0; i < goals.length; i++) {
         goal = goals[i]
         // The visible block and the collision area have the same bounds.
         if (player.x + 0.32 >= goal.x - 0.5 && player.x - 0.32 <= goal.x + 2.5 && Math.abs(player.y - goal.y) <= 0.75) {
            if (goal.term === config.questions[round].term) {
               solvedTerms.push(goal.term)
               setPhase('chase')
               tone(523, 0.15)
               tone(659, 0.15, 0.12)
               tone(784, 0.25, 0.24)
               hint.hidden = false
               hint.textContent = goal.term


               return
            }
            if (wrongCooldown <= 0) {
               tone(150, 0.18, 0, 'sawtooth')

               wrongCooldown = 1.5
            }
         }
      }
   }

   function submitAnswer() {
      var url = config.endpoint
      var form = {}
      form.body = new URLSearchParams()
      form.body.set('id', app.id)
      form.body.set('qid', config.questions[round].id)
      fetch(url, form).then(text_done)
         .then(done)
         .catch(caught(url))

      function done(response) {
         var pct = +response
         $('.progress-bar').css('width', pct + '%')
            .text(pct + '%')
            .attr('aria-valuenow', pct)
         if (pct >= 100) {
            $('.progress-bar').addClass('bg-success progress-bar-striped progress-bar-animated fw-bold')
         }
      }
   }

   function tick(dt) {
      var i, dx, dy
      if (phase !== 'running' && phase !== 'chase') return
      animationTime += dt
      collisionGrace = Math.max(0, collisionGrace - dt)
      wrongCooldown -= dt
      if (phase === 'running') {
         elapsed += dt
         if (!revealed) {
            if (elapsed >= config.revealAfter) {
               revealed = true
               hint.hidden = false
               hint.textContent = config.questions[round].term

               tone(880, 0.1, 0, 'sine')
            }
         }
      }
      move(player, 5.5 * speed, dt, -1)
      if (phase === 'running') touchGoal()
      for (i = 0; i < ghosts.length; i++) {
         move(ghosts[i], (phase === 'chase' ? 2.5 : 2.8) * speed, dt, i)
         dx = ghosts[i].x - player.x
         dy = ghosts[i].y - player.y
         if (dx * dx + dy * dy < 0.56) {
            if (phase === 'chase') {
               submitAnswer()
               ghosts.splice(i, 1)
               if (remaining) remaining.textContent = ghosts.length
               tone(880, 0.12)
               tone(1175, 0.2, 0.1)
               if (!ghosts.length) finishGame()
               else {
                  round++
                  inputUnlockAt = Date.now() + 1000
                  pointerStart = null
                  loadRound()

               }
               return
            }
            if (collisionGrace <= 0) {
               setPhase('caught')

               showGameModal('You were caught!', 'A ghost caught you. Reload the page to try again.')
               tone(150, 0.2, 0, 'sawtooth')
               return
            }
         }
      }
      soundClock += dt
      if (player.moving && soundClock > 0.19) {
         soundStep++
         tone(soundStep % 2 ? 190 : 240, 0.055, 0, 'triangle')
         soundClock = 0
      }
   }

   function finishGame() {
      setPhase('finished')

      tone(523, 0.15)
      tone(659, 0.15, 0.14)
      tone(784, 0.15, 0.28)
      tone(1047, 0.4, 0.42)
      showGameModal('All ghosts caught!', 'You matched all four definitions.')
   }

   function showGameModal(title, description) {
      document.getElementById('completeTitle').textContent = title
      document.getElementById('completeDescription').textContent = description
      modal.showModal()
      document.getElementById('reloadGame').focus()
   }

   function reloadGame() {
      window.location.reload()
   }

   function keepModalOpen(event) {
      event.preventDefault()
   }

   function roundedRect(x, y, w, h, radius) {
      ctx.beginPath()
      ctx.moveTo(x + radius, y)
      ctx.arcTo(x + w, y, x + w, y + h, radius)
      ctx.arcTo(x + w, y + h, x, y + h, radius)
      ctx.arcTo(x, y + h, x, y, radius)
      ctx.arcTo(x, y, x + w, y, radius)
      ctx.closePath()
   }

   function drawGhost(ghost) {
      var x = (ghost.x + 0.5) * cell
      var y = (ghost.y + 0.5) * cell
      var r = cell * 0.36
      var eye, d = dirs[ghost.dir]
      var beingChased = phase === 'chase' || (phase === 'paused' && resumePhase === 'chase')
      // Three color changes per second; freeze the flash while paused.
      ctx.fillStyle = beingChased && Math.floor(animationTime * 3) % 2 ? '#f8f9fa' : ghost.color
      ctx.beginPath()
      ctx.arc(x, y - 1, r, Math.PI, 0)
      ctx.lineTo(x + r, y + r)
      ctx.lineTo(x + r * 0.5, y + r * 0.6)
      ctx.lineTo(x, y + r)
      ctx.lineTo(x - r * 0.5, y + r * 0.6)
      ctx.lineTo(x - r, y + r)
      ctx.closePath()
      ctx.fill()
      for (eye = -1; eye <= 1; eye += 2) {
         ctx.fillStyle = '#fff'
         ctx.beginPath()
         ctx.ellipse(x + eye * 4.5, y - 2, 3.8, 4.8, 0, 0, Math.PI * 2)
         ctx.fill()
         ctx.fillStyle = '#202444'
         ctx.beginPath()
         ctx.arc(x + eye * 4.5 + d.x * 1.7, y - 2 + d.y * 2, 1.9, 0, Math.PI * 2)
         ctx.fill()
      }
   }

   function draw() {
      var x, y, i, goal, mouth, angle, labelSize
      ctx.clearRect(0, 0, canvas.width, canvas.height)
      ctx.fillStyle = '#0c1229'
      ctx.fillRect(0, 0, canvas.width, canvas.height)
      for (y = 0; y < rows; y++) {
         for (x = 0; x < cols; x++) {
            if (map[y][x]) {
               ctx.fillStyle = '#142143'
               ctx.fillRect(x * cell, y * cell, cell, cell)
               ctx.strokeStyle = wallColor
               ctx.lineWidth = 2
               ctx.beginPath()
               if (open(x - 1, y)) { ctx.moveTo(x * cell + 2, y * cell); ctx.lineTo(x * cell + 2, (y + 1) * cell) }
               if (open(x + 1, y)) { ctx.moveTo((x + 1) * cell - 2, y * cell); ctx.lineTo((x + 1) * cell - 2, (y + 1) * cell) }
               if (open(x, y - 1)) { ctx.moveTo(x * cell, y * cell + 2); ctx.lineTo((x + 1) * cell, y * cell + 2) }
               if (open(x, y + 1)) { ctx.moveTo(x * cell, (y + 1) * cell - 2); ctx.lineTo((x + 1) * cell, (y + 1) * cell - 2) }
               ctx.stroke()
            }
         }
      }
      for (i = 0; i < goals.length && phase !== 'chase' && phase !== 'finished' && !(phase === 'paused' && resumePhase === 'chase'); i++) {
         goal = goals[i]
         ctx.fillStyle = '#1d3147'
         ctx.strokeStyle = '#78b3ad'
         ctx.lineWidth = 1.5
         roundedRect(goal.x * cell, goal.y * cell + 2, cell * 3, cell - 4, 7)
         ctx.fill()
         ctx.stroke()
         labelSize = 15
         ctx.font = '600 ' + labelSize + 'px system-ui, sans-serif'
         while (ctx.measureText(goal.term).width > cell * 3 - 14 && labelSize > 8) {
            labelSize--
            ctx.font = '600 ' + labelSize + 'px system-ui, sans-serif'
         }
         ctx.textAlign = 'center'
         ctx.textBaseline = 'middle'
         ctx.fillStyle = '#e5fff6'
         ctx.fillText(goal.term, (goal.x + 1.5) * cell, (goal.y + 0.5) * cell, cell * 3 - 12)
      }
      for (i = 0; i < ghosts.length; i++) drawGhost(ghosts[i])
      mouth = (phase === 'running' || phase === 'chase') && player.moving ? 0.13 + Math.abs(Math.sin(animationTime * 14)) * 0.2 : 0.18
      angle = player.dir * Math.PI / 2
      ctx.fillStyle = playerColor
      ctx.beginPath()
      ctx.moveTo((player.x + 0.5) * cell, (player.y + 0.5) * cell)
      ctx.arc((player.x + 0.5) * cell, (player.y + 0.5) * cell, cell * 0.34, angle + mouth * Math.PI, angle + (2 - mouth) * Math.PI)
      ctx.closePath()
      ctx.fill()
   }

   function frame(time) {
      var delta = lastTime ? Math.min((time - lastTime) / 1000, 0.1) : 0
      lastTime = time
      accumulator += delta
      while (accumulator >= stepTime) {
         tick(stepTime)
         accumulator -= stepTime
      }
      draw()
      requestAnimationFrame(frame)
   }

   function keyDown(event) {
      var key = event.key.toLowerCase()
      var index = { arrowright: 0, d: 0, arrowdown: 1, s: 1, arrowleft: 2, a: 2, arrowup: 3, w: 3 }[key]
      var tag = event.target.tagName.toLowerCase()
      if (tag === 'input' || tag === 'textarea' || tag === 'select' || event.target.isContentEditable || event.ctrlKey || event.metaKey || event.altKey) return
      if (typeof index === 'number') {
         event.preventDefault()
         // Movement is continuous: repeated keydown events must never start a new round.
         if (event.repeat || Date.now() < inputUnlockAt) return
         direction(index)
      } else if (key === '-' || key === '_' || key === '+' || key === '=') {
         event.preventDefault()
         if (Date.now() < inputUnlockAt || phase === 'caught' || phase === 'finished') return
         changeSpeed(key === '-' || key === '_' ? -0.1 : 0.1)
      } else if (key === ' ' && tag !== 'button') {
         if (event.repeat || Date.now() < inputUnlockAt) {
            event.preventDefault()
            return
         }
         event.preventDefault()
         togglePause()
      }
   }

   function changeSpeed(amount) {
      speed = Math.max(0.3, Math.min(2, Math.round((speed + amount) * 10) / 10))
      var speedLabel = document.getElementById('gameSpeed')
      if (speedLabel) speedLabel.textContent = speed.toFixed(1) + '×'
   }

   function togglePause() {
      if (Date.now() < inputUnlockAt) return
      initAudio()
      if (phase === 'running' || phase === 'chase') {
         resumePhase = phase
         setPhase('paused')

      } else if (phase === 'paused') {
         setPhase(resumePhase)

      }
   }

   function visibilityChanged() {
      if (document.hidden && (phase === 'running' || phase === 'chase')) togglePause()
      lastTime = 0
      accumulator = 0
   }

   function windowBlurred() {
      if (phase === 'running' || phase === 'chase') togglePause()
   }

   function muteClicked() {
      if (Date.now() < inputUnlockAt) return
      muted = !muted
      muteButton.textContent = muted ? 'Sound off' : 'Sound on'
      muteButton.setAttribute('aria-pressed', String(!muted))
      if (!muted) {
         initAudio()
         tone(660, 0.08, 0, 'sine')
      }
   }

   function pointerDown(event) {
      if (Date.now() < inputUnlockAt) return
      pointerStart = { x: event.clientX, y: event.clientY }
      canvas.setPointerCapture(event.pointerId)
      canvas.focus({ preventScroll: true })
      initAudio()
   }

   function pointerUp(event) {
      var dx, dy
      if (!pointerStart) return
      dx = event.clientX - pointerStart.x
      dy = event.clientY - pointerStart.y
      pointerStart = null
      if (Math.max(Math.abs(dx), Math.abs(dy)) < 12) return
      direction(Math.abs(dx) > Math.abs(dy) ? (dx > 0 ? 0 : 2) : (dy > 0 ? 1 : 3))
   }

   function pointerCancelled() { pointerStart = null }

   function validate() {
      var i, j, q, seen
      var correctTerms = []
      if (config.questions.length < 4) throw new Error('Add at least four questions, one per ghost')
      for (i = 0; i < config.questions.length; i++) {
         q = config.questions[i]
         if (!q.definition || !q.term || !q.choices || q.choices.length !== 4 || q.choices.indexOf(q.term) < 0) throw new Error('Each question needs a definition, term, and four choices including the term')
         if (i < 4 && correctTerms.indexOf(q.term) >= 0) throw new Error('Use four different correct terms so solved terms can stay removed')
         correctTerms.push(q.term)
         seen = []
         for (j = 0; j < q.choices.length; j++) {
            if (!q.choices[j] || seen.indexOf(q.choices[j]) >= 0) throw new Error('Choices must be nonempty and unique')
            seen.push(q.choices[j])
         }
      }
   }

   var i
   validate()
   canvas.width = cols * cell
   canvas.height = rows * cell
   makeMap()
   document.addEventListener('keydown', keyDown)
   document.addEventListener('visibilitychange', visibilityChanged)
   window.addEventListener('blur', windowBlurred)
   muteButton.addEventListener('click', muteClicked)
   canvas.addEventListener('pointerdown', pointerDown)
   canvas.addEventListener('pointerup', pointerUp)
   canvas.addEventListener('pointercancel', pointerCancelled)
   resetActors()
   loadRound()
   fitGame()
   window.addEventListener('resize', fitGame)
   window.addEventListener('load', fitGame)
   if (window.visualViewport) window.visualViewport.addEventListener('resize', fitGame)
   if (window.ResizeObserver) {
      var sizeObserver = new window.ResizeObserver(fitGame)
      sizeObserver.observe(document.getElementById('manDefinition'))
      var chromeElements = document.querySelectorAll('.navbar, .progress, .progress-bar')
      for (i = 0; i < chromeElements.length; i++) sizeObserver.observe(chromeElements[i])
   }
   document.getElementById('reloadGame').addEventListener('click', reloadGame)
   modal.addEventListener('cancel', keepModalOpen)
   requestAnimationFrame(frame)
}

createTermChase(termChaseConfig)
