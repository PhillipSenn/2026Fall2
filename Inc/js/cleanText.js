function cleanText(response) {
    if (response === null) return 'null'
    if (response === undefined) return 'undefined'
	var result = response
		.replaceAll('\t',' ')
		.replaceAll('\r',' ')
		.replaceAll('\n',' ')
		.trim()
	while (result.includes('  ')) {
		result = result.replaceAll('  ',' ')
	}
	return result
}