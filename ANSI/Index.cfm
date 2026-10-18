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
	'Extra nulls were sent as idle time so a teletype could finish returning the carriage before the next character arrived.',
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
points = [
	8364, 0, 8218, 402, 8222, 8230, 8224, 8225, 710, 8240,
	352, 8249, 338, 0, 381, 0, 0, 8216, 8217, 8220,
	8221, 8226, 8211, 8212, 732, 8482, 353, 8250, 339, 0,
	382, 376
]
names = [
	'Euro sign',
	'Not assigned',
	'Single low-9 quotation mark',
	'Latin small letter f with hook',
	'Double low-9 quotation mark',
	'Horizontal ellipsis',
	'Dagger',
	'Double dagger',
	'Modifier letter circumflex accent',
	'Per mille sign',
	'Latin capital letter S with caron',
	'Single left-pointing angle quotation mark',
	'Latin capital ligature OE',
	'Not assigned',
	'Latin capital letter Z with caron',
	'Not assigned',
	'Not assigned',
	'Left single quotation mark',
	'Right single quotation mark',
	'Left double quotation mark',
	'Right double quotation mark',
	'Bullet',
	'En dash',
	'Em dash',
	'Small tilde',
	'Trade mark sign',
	'Latin small letter s with caron',
	'Single right-pointing angle quotation mark',
	'Latin small ligature oe',
	'Not assigned',
	'Latin small letter z with caron',
	'Latin capital letter Y with diaeresis',
	'No-break space',
	'Inverted exclamation mark',
	'Cent sign',
	'Pound sign',
	'Currency sign',
	'Yen sign',
	'Broken bar',
	'Section sign',
	'Diaeresis',
	'Copyright sign',
	'Feminine ordinal indicator',
	'Left-pointing double angle quotation mark',
	'Not sign',
	'Soft hyphen',
	'Registered sign',
	'Macron',
	'Degree sign',
	'Plus-minus sign',
	'Superscript two',
	'Superscript three',
	'Acute accent',
	'Micro sign',
	'Pilcrow sign',
	'Middle dot',
	'Cedilla',
	'Superscript one',
	'Masculine ordinal indicator',
	'Right-pointing double angle quotation mark',
	'Vulgar fraction one quarter',
	'Vulgar fraction one half',
	'Vulgar fraction three quarters',
	'Inverted question mark',
	'Latin capital letter A with grave',
	'Latin capital letter A with acute',
	'Latin capital letter A with circumflex',
	'Latin capital letter A with tilde',
	'Latin capital letter A with diaeresis',
	'Latin capital letter A with ring above',
	'Latin capital letter AE',
	'Latin capital letter C with cedilla',
	'Latin capital letter E with grave',
	'Latin capital letter E with acute',
	'Latin capital letter E with circumflex',
	'Latin capital letter E with diaeresis',
	'Latin capital letter I with grave',
	'Latin capital letter I with acute',
	'Latin capital letter I with circumflex',
	'Latin capital letter I with diaeresis',
	'Latin capital letter Eth',
	'Latin capital letter N with tilde',
	'Latin capital letter O with grave',
	'Latin capital letter O with acute',
	'Latin capital letter O with circumflex',
	'Latin capital letter O with tilde',
	'Latin capital letter O with diaeresis',
	'Multiplication sign',
	'Latin capital letter O with stroke',
	'Latin capital letter U with grave',
	'Latin capital letter U with acute',
	'Latin capital letter U with circumflex',
	'Latin capital letter U with diaeresis',
	'Latin capital letter Y with acute',
	'Latin capital letter Thorn',
	'Latin small letter sharp S',
	'Latin small letter a with grave',
	'Latin small letter a with acute',
	'Latin small letter a with circumflex',
	'Latin small letter a with tilde',
	'Latin small letter a with diaeresis',
	'Latin small letter a with ring above',
	'Latin small letter ae',
	'Latin small letter c with cedilla',
	'Latin small letter e with grave',
	'Latin small letter e with acute',
	'Latin small letter e with circumflex',
	'Latin small letter e with diaeresis',
	'Latin small letter i with grave',
	'Latin small letter i with acute',
	'Latin small letter i with circumflex',
	'Latin small letter i with diaeresis',
	'Latin small letter eth',
	'Latin small letter n with tilde',
	'Latin small letter o with grave',
	'Latin small letter o with acute',
	'Latin small letter o with circumflex',
	'Latin small letter o with tilde',
	'Latin small letter o with diaeresis',
	'Division sign',
	'Latin small letter o with stroke',
	'Latin small letter u with grave',
	'Latin small letter u with acute',
	'Latin small letter u with circumflex',
	'Latin small letter u with diaeresis',
	'Latin small letter y with acute',
	'Latin small letter thorn',
	'Latin small letter y with diaeresis'
]
extraUse = {}
extraUse[128] = 'Windows added this later so prices could include the euro sign.'
extraUse[160] = 'A space that keeps the words on either side on the same line.'
extraUse[173] = 'Marks a place where a word may be split at the end of a line.'
for (emptyCode in [129, 141, 143, 144, 157]) {
	extraUse[emptyCode] = 'This number was left empty in the Windows ANSI set.'
}
function binary(code) {
	var bits = formatBaseN(code, 2)
	return repeatString('0', 8 - len(bits)) & bits
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header">
		American National Standards Institute
	</div>
	<div class="card-body">
		<p><a href="https://en.wikipedia.org/wiki/ANSI_escape_code">ANSI</a> was designed to control a text terminal. A program sent short sequences that moved the cursor, cleared the screen, and set the color and style of the characters that followed.</p>
		<img class="img-thumbnail" src="https://thumb.wikimedia.org/wikipedia/commons/thumb/9/99/DEC_VT100_terminal.jpg/500px-DEC_VT100_terminal.jpg">
		<p>The character set Windows called ANSI is code page 1252. Codes 0 through 127 are the same ASCII characters. Codes 128 through 255 add punctuation and letters used in Western European languages.</p>
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
				<cfloop from="0" to="31" index="code">
					<cfset control = controls[code + 1]>
					<tr>
						<td class="font-monospace">#binary(code)#</td>
						<td class="text-end">#code#</td>
						<td class="text-center">#listFirst(control, " ")#</td>
						<td>#listRest(control, " ")#</td>
						<td>#uses[code + 1]#</td>
					</tr>
				</cfloop>
				<cfloop from="32" to="126" index="code">
					<tr>
						<td class="font-monospace">#binary(code)#</td>
						<td class="text-end">#code#</td>
						<td class="text-center"><cfif code eq 32>space<cfelse>#encodeForHTML(chr(code))#</cfif></td>
						<td></td>
						<td></td>
					</tr>
				</cfloop>
				<tr>
					<td class="font-monospace">#binary(127)#</td>
					<td class="text-end">127</td>
					<td class="text-center">DEL</td>
					<td>Delete</td>
					<td>On paper tape, every hole was punched in that spot so the earlier character was rubbed out. A hole could not be unpunched.</td>
				</tr>
				<cfloop from="128" to="255" index="code">
					<cfset point = code gte 160 ? code : points[code - 127]>
					<cfset wiki = point ? "https://en.wikipedia.org/wiki/" & encodeForURL(chr(point)) : "">
					<tr>
						<td class="font-monospace">#binary(code)#</td>
						<td class="text-end"><cfif point><a href="#wiki#">#code#</a><cfelse>#code#</cfif></td>
						<td class="text-center">
							<cfif code eq 160>
								&amp;nbsp;
							<cfelseif code eq 173>
								-
							<cfelseif point>
								#encodeForHTML(chr(point))#
							</cfif>
						</td>
						<td>#names[code - 127]#</td>
						<td><cfif structKeyExists(extraUse, code)>#extraUse[code]#</cfif></td>
					</tr>
				</cfloop>
			</tbody>
		</table>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
