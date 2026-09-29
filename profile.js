$('#firstname').on('input', function () {
	$('.profile-firstname').text(this.value.trim() || 'there')
})
