const canvas = document.querySelector("#boink");
const ctx = canvas.getContext("2d");
const toggleButton = document.querySelector("#toggle");
const soundButton = document.querySelector("#sound");
const speedInput = document.querySelector("#speed");
const status = document.querySelector("#status");

const W = canvas.width;
const H = canvas.height;
const horizon = 218;
const ball = { x: W * 0.3, y: 110, vx: 250, vy: 20, radius: 73, spin: 0 };
let previousTime = performance.now();
let running = true;
let soundOn = true;
let speed = 1;
let audioContext;

function drawBackground(time) {
  const sky = ctx.createLinearGradient(0, 0, 0, horizon);
  sky.addColorStop(0, "#070414");
  sky.addColorStop(0.62, "#281442");
  sky.addColorStop(1, "#a842a7");
  ctx.fillStyle = sky;
  ctx.fillRect(0, 0, W, horizon);

  ctx.fillStyle = "#ffd870";
  ctx.beginPath();
  ctx.arc(W / 2, horizon - 8, 98, Math.PI, 0);
  ctx.fill();
  ctx.fillStyle = "#c54090";
  for (let i = 0; i < 7; i += 1) {
    ctx.fillRect(W / 2 - 98, horizon - 8 - i * 13, 196, 5);
  }

  for (let i = 0; i < 44; i += 1) {
    const x = (i * 149 + 27) % W;
    const y = 11 + ((i * 71) % (horizon - 28));
    const twinkle = 0.35 + 0.65 * Math.sin(time / 400 + i);
    ctx.fillStyle = `rgba(255, 248, 214, ${twinkle})`;
    ctx.fillRect(x, y, i % 6 === 0 ? 3 : 1, i % 6 === 0 ? 3 : 1);
  }

  const floor = ctx.createLinearGradient(0, horizon, 0, H);
  floor.addColorStop(0, "#28114b");
  floor.addColorStop(1, "#08040f");
  ctx.fillStyle = floor;
  ctx.fillRect(0, horizon, W, H - horizon);

  const vanishingX = W / 2;
  const rows = 12;
  for (let row = 0; row < rows; row += 1) {
    const t1 = row / rows;
    const t2 = (row + 1) / rows;
    const y1 = horizon + (H - horizon) * t1 * t1;
    const y2 = horizon + (H - horizon) * t2 * t2;
    const columns = 18;
    for (let col = 0; col < columns; col += 1) {
      const left1 = vanishingX + (col / columns - .5) * W * (0.10 + t1 * 2.1);
      const right1 = vanishingX + ((col + 1) / columns - .5) * W * (0.10 + t1 * 2.1);
      const left2 = vanishingX + (col / columns - .5) * W * (0.10 + t2 * 2.1);
      const right2 = vanishingX + ((col + 1) / columns - .5) * W * (0.10 + t2 * 2.1);
      ctx.fillStyle = (row + col) % 2 ? "#4f2279" : "#b64de0";
      ctx.beginPath();
      ctx.moveTo(left1, y1);
      ctx.lineTo(right1, y1);
      ctx.lineTo(right2, y2);
      ctx.lineTo(left2, y2);
      ctx.fill();
    }
  }
  ctx.fillStyle = "rgba(255, 123, 239, .3)";
  ctx.fillRect(0, horizon, W, 2);
}

function drawBall() {
  const floorY = H - 48;
  const contactY = ball.y + ball.radius;
  const height = Math.max(0, floorY - contactY);
  const shadowScale = Math.max(.22, 1 - height / 360);

  ctx.save();
  ctx.translate(ball.x, floorY + 8);
  ctx.scale(1.55 * shadowScale, .26 * shadowScale);
  const shadow = ctx.createRadialGradient(0, 0, 3, 0, 0, ball.radius);
  shadow.addColorStop(0, "rgba(5, 0, 12, .73)");
  shadow.addColorStop(1, "rgba(5, 0, 12, 0)");
  ctx.fillStyle = shadow;
  ctx.beginPath();
  ctx.arc(0, 0, ball.radius, 0, Math.PI * 2);
  ctx.fill();
  ctx.restore();

  ctx.save();
  ctx.beginPath();
  ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
  ctx.clip();
  const cell = 20;
  const offsetX = ball.spin * 2.8;
  const offsetY = ball.spin * 1.15;
  for (let y = ball.y - ball.radius - cell; y < ball.y + ball.radius + cell; y += cell) {
    for (let x = ball.x - ball.radius - cell; x < ball.x + ball.radius + cell; x += cell) {
      const ix = Math.floor((x + offsetX) / cell);
      const iy = Math.floor((y + offsetY) / cell);
      ctx.fillStyle = (ix + iy) % 2 ? "#f8ebd1" : "#36145e";
      ctx.fillRect(x, y, cell + 1, cell + 1);
    }
  }

  const shading = ctx.createRadialGradient(
    ball.x - ball.radius * .37, ball.y - ball.radius * .43, ball.radius * .04,
    ball.x + ball.radius * .23, ball.y + ball.radius * .27, ball.radius * 1.22
  );
  shading.addColorStop(0, "rgba(255,255,255,.82)");
  shading.addColorStop(.2, "rgba(255,255,255,.03)");
  shading.addColorStop(.66, "rgba(23,3,49,.03)");
  shading.addColorStop(1, "rgba(6,0,16,.75)");
  ctx.fillStyle = shading;
  ctx.fillRect(ball.x - ball.radius, ball.y - ball.radius, ball.radius * 2, ball.radius * 2);
  ctx.restore();

  ctx.lineWidth = 5;
  ctx.strokeStyle = "#e3c8ff";
  ctx.shadowBlur = 12;
  ctx.shadowColor = "#da5dff";
  ctx.beginPath();
  ctx.arc(ball.x, ball.y, ball.radius, 0, Math.PI * 2);
  ctx.stroke();
  ctx.shadowBlur = 0;
}

function boinkSound() {
  if (!soundOn || !audioContext) return;
  const oscillator = audioContext.createOscillator();
  const gain = audioContext.createGain();
  oscillator.type = "square";
  oscillator.frequency.setValueAtTime(110, audioContext.currentTime);
  oscillator.frequency.exponentialRampToValueAtTime(53, audioContext.currentTime + .14);
  gain.gain.setValueAtTime(.06, audioContext.currentTime);
  gain.gain.exponentialRampToValueAtTime(.001, audioContext.currentTime + .15);
  oscillator.connect(gain).connect(audioContext.destination);
  oscillator.start();
  oscillator.stop(audioContext.currentTime + .16);
}

function update(dt) {
  const floorY = H - 48;
  ball.vy += 650 * dt;
  ball.x += ball.vx * dt;
  ball.y += ball.vy * dt;
  ball.spin += ball.vx * dt / 90;
  if (ball.x - ball.radius < 0 || ball.x + ball.radius > W) {
    ball.vx *= -1;
    ball.x = Math.max(ball.radius, Math.min(W - ball.radius, ball.x));
    boinkSound();
  }
  if (ball.y + ball.radius > floorY) {
    ball.y = floorY - ball.radius;
    ball.vy = -Math.max(360, Math.abs(ball.vy) * .91);
    boinkSound();
  }
}

function frame(now) {
  const dt = Math.min(.04, (now - previousTime) / 1000) * speed;
  previousTime = now;
  if (running) update(dt);
  drawBackground(now);
  drawBall();
  requestAnimationFrame(frame);
}

function setRunning(next) {
  running = next;
  toggleButton.textContent = running ? "Pause" : "Play";
  status.textContent = running ? "RUNNING • 60 FPS" : "PAUSED";
}

function unlockAudio() {
  if (!audioContext) audioContext = new AudioContext();
  if (audioContext.state === "suspended") audioContext.resume();
}

toggleButton.addEventListener("click", () => {
  unlockAudio();
  setRunning(!running);
});
soundButton.addEventListener("click", () => {
  unlockAudio();
  soundOn = !soundOn;
  soundButton.textContent = `Sound: ${soundOn ? "On" : "Off"}`;
  soundButton.setAttribute("aria-pressed", String(soundOn));
  if (soundOn) boinkSound();
});
speedInput.addEventListener("input", () => { speed = Number(speedInput.value); });
canvas.addEventListener("click", () => {
  unlockAudio();
  if (document.fullscreenElement) document.exitFullscreen();
  else canvas.closest(".screen-frame").requestFullscreen();
});
document.addEventListener("keydown", (event) => {
  if (event.code === "Space" && event.target.tagName !== "INPUT") {
    event.preventDefault();
    unlockAudio();
    setRunning(!running);
  }
});

requestAnimationFrame(frame);
