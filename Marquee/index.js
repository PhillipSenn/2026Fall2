function updateText() {
	const input = document.getElementById("textInput").value;
	const marquee = document.getElementById("marqueeText");
	
	marquee.textContent = input.toUpperCase();
	
	// restart animation
	marquee.style.animation = "none";
	marquee.offsetHeight;
	marquee.style.animation = null;
}
