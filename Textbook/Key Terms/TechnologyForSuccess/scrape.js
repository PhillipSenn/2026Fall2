str = 'insert into q(q_act,qname,qdesc) values'
sep = ''

$('.keytermentry').each(logQuestion)
$('ul').remove()
$('body').append('<pre>' + str + '</pre>')

function logQuestion(i) {
	var li = $(this)

	var qname = li.find('.keyterm').text().trim()

	var qdesc = li.find('.keytermdef')
		.clone()
		.children('.keytermdef-title, .keytermdef-footer')
		.remove()
		.end()
		.text()
		.trim()

	str += sep + "(@actid,N'" + qname + "',N'" + qdesc + "')\r\n"
	sep = ','
}
