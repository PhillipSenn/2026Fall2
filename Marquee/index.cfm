<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, viewport-fit=cover" />

<title>Marquee</title>

<link rel="stylesheet" href="index.css">
</head>

<body>

<div class="controls">
    <input id="textInput" value="HELLO" />
    <button onclick="updateText()">SHOW</button>
</div>

<div class="marquee-container">
    <div class="marquee" id="marqueeText">HELLO</div>
</div>

<script src="index.js"></script>
</body>
</html>