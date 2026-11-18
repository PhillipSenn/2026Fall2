(() => {
	const carousel = document.getElementById('timelineCarousel')
	const counter = document.getElementById('timelineCounter')
	if (!carousel || !counter) {
		return
	}
	const total = carousel.querySelectorAll('.carousel-item').length
	const updateCounter = () => {
		const active = carousel.querySelector('.carousel-item.active')
		const index = active ? Number(active.dataset.slideIndex || 1) : 1
		counter.textContent = index + ' / ' + total
	}
	carousel.addEventListener('slid.bs.carousel', updateCounter)
	updateCounter()
})()
