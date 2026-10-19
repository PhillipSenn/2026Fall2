<cfscript>
include '/Inc/header6.cfm'
controls = [
	'NUL Null',
	'SOH Start of heading',
	'STX Start of text',
	'ETX End of text',
	'EOT End of transmission',
	'ENQ Enquiry',
	'ACK Acknowledge',
	'BEL Bell',
	'BS Backspace',
	'HT Horizontal tab',
	'LF Line feed',
	'VT Vertical tab',
	'FF Form feed',
	'CR Carriage return',
	'SO Shift out',
	'SI Shift in',
	'DLE Data link escape',
	'DC1 Device control 1',
	'DC2 Device control 2',
	'DC3 Device control 3',
	'DC4 Device control 4',
	'NAK Negative acknowledge',
	'SYN Synchronous idle',
	'ETB End of transmission block',
	'CAN Cancel',
	'EM End of medium',
	'SUB Substitute',
	'ESC Escape',
	'FS File separator',
	'GS Group separator',
	'RS Record separator',
	'US Unit separator'
]
uses = [
	'Extra nulls were sent as idle time so a teletype could finish returning the carriage before the next character arrived. The IBM PC drew a blank for this code.',
	'Marked the start of a message heading, such as who the message was for, before the text itself.',
	'Marked where the actual text of a message began.',
	'Marked where the text of a message ended.',
	'Told the other station that the sender was done transmitting.',
	'Asked the other station to answer, often to identify itself.',
	'The receiver sent this to say the message arrived intact.',
	'Rang the bell on a teletype. Newsrooms sent several bells ahead of an urgent story so editors would notice it.',
	'Moved the print head back one space. It was also used to overstrike, such as backing up and printing an underscore to underline a letter.',
	'Jumped the print head to the next tab stop so columns lined up.',
	'Advanced the paper one line. It did not return the print head to the left margin.',
	'Advanced the paper to the next vertical tab stop, used to skip down a printed form.',
	'Advanced the paper to the top of the next page.',
	'Returned the print head to the left margin. A new line was usually this followed by a line feed.',
	'Switched the machine to an alternate character set.',
	'Switched the machine back to the normal character set.',
	'Said the next character was data, not a command, so a control code could be included in the message.',
	'Often meant XON: the receiver was ready and the sender could resume. It also started a paper-tape reader.',
	'Turned on an auxiliary device, such as a paper-tape punch.',
	'Often meant XOFF: the receiver was busy and the sender should pause. It also stopped a paper-tape reader.',
	'Turned off an auxiliary device, such as a paper-tape punch.',
	'The receiver sent this to say the message was damaged and should be sent again.',
	'Kept a synchronous line in step when there was no data to send.',
	'Marked the end of one block when a long message was sent in pieces.',
	'Told the receiver to discard the data received so far in the current block.',
	'Marked the end of the physical medium, such as the end of a paper tape.',
	'Stood in for a character that arrived garbled. In DOS, this code also marked the end of a text file.',
	'Introduced a command instead of a character to print. ANSI cursor and color codes begin with escape.',
	'Separated one file from the next in a stream of data.',
	'Separated groups of records.',
	'Separated one record from the next.',
	'Separated fields inside a record.'
]
pictures = [
	0, 9786, 9787, 9829, 9830, 9827, 9824, 8226, 9688, 9675, 9689, 9794, 9792, 9834, 9835, 9788,
	9658, 9668, 8597, 8252, 182, 167, 9644, 8616, 8593, 8595, 8594, 8592, 8735, 8596, 9650, 9660
]
pictureNames = [
	'',
	'White smiling face',
	'Black smiling face',
	'Black heart',
	'Black diamond',
	'Black club',
	'Black spade',
	'Bullet',
	'Inverse bullet',
	'White circle',
	'Inverse white circle',
	'Male sign',
	'Female sign',
	'Eighth note',
	'Beamed eighth notes',
	'White sun',
	'Black right-pointing pointer',
	'Black left-pointing pointer',
	'Up down arrow',
	'Double exclamation mark',
	'Pilcrow',
	'Section sign',
	'Black rectangle',
	'Up down arrow with base',
	'Upwards arrow',
	'Downwards arrow',
	'Rightwards arrow',
	'Leftwards arrow',
	'Right angle',
	'Left right arrow',
	'Black up-pointing triangle',
	'Black down-pointing triangle'
]
points = [
	199, 252, 233, 226, 228, 224, 229, 231, 234, 235, 232, 239, 238, 236, 196, 197,
	201, 230, 198, 244, 246, 242, 251, 249, 255, 214, 220, 162, 163, 165, 8359, 402,
	225, 237, 243, 250, 241, 209, 170, 186, 191, 8976, 172, 189, 188, 161, 171, 187,
	9617, 9618, 9619, 9474, 9508, 9569, 9570, 9558, 9557, 9571, 9553, 9559, 9565, 9564, 9563, 9488,
	9492, 9524, 9516, 9500, 9472, 9532, 9566, 9567, 9562, 9556, 9577, 9574, 9568, 9552, 9580, 9575,
	9576, 9572, 9573, 9561, 9560, 9554, 9555, 9579, 9578, 9496, 9484, 9608, 9604, 9612, 9616, 9600,
	945, 223, 915, 960, 931, 963, 181, 964, 934, 920, 937, 948, 8734, 966, 949, 8745,
	8801, 177, 8805, 8804, 8992, 8993, 247, 8776, 176, 8729, 183, 8730, 8319, 178, 9632, 160
]
names = [
	'Latin capital C with cedilla',
	'Latin small u with diaeresis',
	'Latin small e with acute',
	'Latin small a with circumflex',
	'Latin small a with diaeresis',
	'Latin small a with grave',
	'Latin small a with ring',
	'Latin small c with cedilla',
	'Latin small e with circumflex',
	'Latin small e with diaeresis',
	'Latin small e with grave',
	'Latin small i with diaeresis',
	'Latin small i with circumflex',
	'Latin small i with grave',
	'Latin capital A with diaeresis',
	'Latin capital A with ring',
	'Latin capital E with acute',
	'Latin small ae',
	'Latin capital AE',
	'Latin small o with circumflex',
	'Latin small o with diaeresis',
	'Latin small o with grave',
	'Latin small u with circumflex',
	'Latin small u with grave',
	'Latin small y with diaeresis',
	'Latin capital O with diaeresis',
	'Latin capital U with diaeresis',
	'Cent sign',
	'Pound sign',
	'Yen sign',
	'Peseta sign',
	'Florin sign',
	'Latin small a with acute',
	'Latin small i with acute',
	'Latin small o with acute',
	'Latin small u with acute',
	'Latin small n with tilde',
	'Latin capital N with tilde',
	'Feminine ordinal indicator',
	'Masculine ordinal indicator',
	'Inverted question mark',
	'Reversed not sign',
	'Not sign',
	'One half',
	'One quarter',
	'Inverted exclamation mark',
	'Left angle quotation mark',
	'Right angle quotation mark',
	'Light shade',
	'Medium shade',
	'Dark shade',
	'Light vertical line',
	'Light vertical and left',
	'Vertical single and left double',
	'Vertical double and left single',
	'Down double and left single',
	'Down single and left double',
	'Double vertical and left',
	'Double vertical line',
	'Double down and left',
	'Double up and left',
	'Up double and left single',
	'Up single and left double',
	'Light down and left',
	'Light up and right',
	'Light up and horizontal',
	'Light down and horizontal',
	'Light vertical and right',
	'Light horizontal line',
	'Light vertical and horizontal',
	'Vertical single and right double',
	'Vertical double and right single',
	'Double up and right',
	'Double down and right',
	'Double up and horizontal',
	'Double down and horizontal',
	'Double vertical and right',
	'Double horizontal line',
	'Double vertical and horizontal',
	'Up single and horizontal double',
	'Up double and horizontal single',
	'Down single and horizontal double',
	'Down double and horizontal single',
	'Up double and right single',
	'Up single and right double',
	'Down single and right double',
	'Down double and right single',
	'Vertical double and horizontal single',
	'Vertical single and horizontal double',
	'Light up and left',
	'Light down and right',
	'Full block',
	'Lower half block',
	'Left half block',
	'Right half block',
	'Upper half block',
	'Greek small alpha',
	'Latin small sharp s',
	'Greek capital gamma',
	'Greek small pi',
	'Greek capital sigma',
	'Greek small sigma',
	'Micro sign',
	'Greek small tau',
	'Greek capital phi',
	'Greek capital theta',
	'Greek capital omega',
	'Greek small delta',
	'Infinity',
	'Greek small phi',
	'Greek small epsilon',
	'Intersection',
	'Identical to',
	'Plus-minus sign',
	'Greater than or equal to',
	'Less than or equal to',
	'Top half of an integral',
	'Bottom half of an integral',
	'Division sign',
	'Almost equal to',
	'Degree sign',
	'Bullet operator',
	'Middle dot',
	'Square root',
	'Superscript n',
	'Superscript two',
	'Black square',
	'No-break space'
]
extended = queryNew('code,glyph,description,usage,wiki', 'integer,varchar,varchar,varchar,varchar')
for (code = 0; code <= 255; code++) {
	glyph = ''
	description = ''
	usage = ''
	wiki = ''
	if (code <= 31) {
		point = pictures[code + 1]
		description = controls[code + 1]
		if (len(pictureNames[code + 1])) {
			description &= '. ' & pictureNames[code + 1]
			glyph = chr(point)
			wiki = 'https://en.wikipedia.org/wiki/' & encodeForURL(glyph)
		} else {
			wiki = 'https://en.wikipedia.org/wiki/Null_character'
		}
		usage = uses[code + 1]
		if (code) {
			usage &= ' The IBM PC displayed this picture for the same code.'
		}
	} else if (code <= 126) {
		glyph = code == 32 ? 'space' : chr(code)
		wiki = code == 32 ? 'https://en.wikipedia.org/wiki/Space_(punctuation)' : 'https://en.wikipedia.org/wiki/' & encodeForURL(chr(code))
	} else if (code == 127) {
		glyph = chr(8962)
		description = 'DEL Delete. House.'
		usage = 'On paper tape, every hole was punched in that spot so the earlier character was rubbed out. A hole could not be unpunched. The IBM PC drew a house for this code.'
		wiki = 'https://en.wikipedia.org/wiki/' & encodeForURL(glyph)
	} else {
		point = points[code - 127]
		glyph = code == 255 ? ' ' : chr(point)
		description = names[code - 127]
		wiki = 'https://en.wikipedia.org/wiki/' & encodeForURL(chr(point))
		if (code >= 176 && code <= 178) {
			usage = 'A shade of gray, used to fill an area on the text screen.'
		} else if (code >= 179 && code <= 218) {
			usage = 'Joined with the other line characters to draw boxes and menus on the text screen.'
		} else if (code >= 219 && code <= 223) {
			usage = 'Filled part or all of a character cell, used for bars and solid boxes.'
		} else if (code == 255) {
			usage = 'Blank. Word processors treated it as a space that does not break a line.'
		}
	}
	queryAddRow(extended, {
		code: code,
		glyph: glyph,
		description: description,
		usage: usage,
		wiki: wiki
	})
}
function binary(code) {
	var bits = formatBaseN(code, 2)
	return right('00000000' & bits, 8)
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header bg-subtle-primary">
		Extended ASCII
	</div>
	<div class="card-body">
		<p>This is the whole IBM PC code page 437, starting at 0. Codes 0 through 31 are the ASCII control signals, and the PC also stored a picture for each one. Codes 176 through 223 are the box-drawing characters. Programs joined those lines, corners, and shades to draw boxes and menus on the text screen.</p>
		<table class="table table-sm table-striped mb-0">
			<thead>
				<tr>
					<th>Binary</th>
					<th class="text-end">Decimal</th>
					<th class="text-center">Character</th>
					<th>Description</th>
					<th>Use</th>
				</tr>
			</thead>
			<tbody>
				<cfloop query="extended">
					<tr>
						<td class="font-monospace">#binary(extended.code)#</td>
						<td class="text-end"><a href="#wiki#">#extended.code#</a></td>
						<td class="text-center">#encodeForHTML(extended.glyph)#</td>
						<td>#extended.description#</td>
						<td>#extended.usage#</td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
	<div class="card-footer">
		<img class="img-fluid" src="https://upload.wikimedia.org/wikipedia/commons/6/69/IBM_PC_5150.jpg">
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
