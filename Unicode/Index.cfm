<cfscript>
include '/Inc/header6.cfm'
examples = [
	{code: 65, name: 'Latin capital letter A', use: 'ASCII used this same number for A.'},
	{code: 233, name: 'Latin small letter e with acute', use: 'A Western European letter. UTF-8 stores it in two bytes.'},
	{code: 8364, name: 'Euro sign', use: 'Windows ANSI stored this at decimal 128. Unicode gave it a new number.'},
	{code: 9731, name: 'Snowman', use: 'A symbol from the Miscellaneous Symbols block.'},
	{code: 12354, name: 'Hiragana letter A', use: 'One character from a Japanese writing system.'},
	{code: 128512, name: 'Grinning face', use: 'An emoji. Its number is above 65,535, so UTF-8 stores it in four bytes.'}
]
function codePoint(code) {
	var hex = uCase(formatBaseN(code, 16))
	return 'U+' & repeatString('0', max(4 - len(hex), 0)) & hex
}
function character(code) {
	return '&##' & code & ';'
}
function utf8Bytes(code) {
	if (code < 128) {
		return 1
	}
	if (code < 2048) {
		return 2
	}
	if (code < 65536) {
		return 3
	}
	return 4
}
</cfscript>

<cfoutput>
<div class="card">
	<div class="card-header">
		Unicode
	</div>
	<div class="card-body">
		<p>ASCII gave every character a number from 0 to 127. ANSI used the next 128 numbers for Western European letters. Unicode keeps one list for the characters of every writing system, plus symbols and emoji.</p>
		<p>Each character's number is called a code point. It is written with U+ and the number in hexadecimal. The letter A is U+0041, which is the same decimal 65 it had in ASCII. Code points run from U+0000 through U+10FFFF. The first 128 are the ASCII characters, with the same numbers.</p>
		<p>UTF-8 is a way to store a code point in bytes. ASCII characters stay one byte, so an old ASCII file is already valid UTF-8. Other characters take two, three, or four bytes.</p>
		<table class="table table-sm table-striped mb-3">
			<thead>
				<tr>
					<th class="text-end">Decimal</th>
					<th>Code point</th>
					<th class="text-center">Character</th>
					<th>Name</th>
					<th class="text-end">UTF-8 bytes</th>
					<th>Use</th>
				</tr>
			</thead>
			<tbody>
				<cfloop array="#examples#" index="example">
					<tr>
						<td class="text-end">#example.code#</td>
						<td class="font-monospace">#codePoint(example.code)#</td>
						<td class="text-center">#character(example.code)#</td>
						<td>#example.name#</td>
						<td class="text-end">#utf8Bytes(example.code)#</td>
						<td>#example.use#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
		<p><a href="viewer.cfm">Browse every block</a> or read the <a href="https://cdn.jsdelivr.net/gh/unicode-org/unicodetools@main/unicodetools/data/ucd/dev/UnicodeData.txt">Unicode character list</a>.</p>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
