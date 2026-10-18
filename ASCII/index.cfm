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
function binary(code) {
	var bits = formatBaseN(code, 2)
	return repeatString('0', 7 - len(bits)) & bits
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header">
		American Standard Code for Information Interchange
	</div>
	<div class="card-body">
		<p>ASCII was designed so different machines could exchange text using the same character codes. Each letter, digit, punctuation mark, and control signal, such as carriage return and line feed, was assigned a number from 0 to 127.</p>
		<p>The codes below 32 were control signals, not characters you can see. A teletype used them to run the machine: bell rang the bell, backspace moved the print head back, horizontal tab jumped to the next stop, line feed advanced the paper, and carriage return returned the print head to the left margin. The rest marked the start and end of a message or separated records.</p>
		<table class="table table-sm table-striped mb-0">
			<thead>
				<tr>
					<th>Binary</th>
					<th class="text-end">Decimal</th>
					<th>Character</th>
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
						<td>#listFirst(control, " ")#</td>
						<td>#listRest(control, " ")#</td>
						<td>#uses[code + 1]#</td>
					</tr>
				</cfloop>
				<cfloop from="32" to="126" index="code">
					<tr>
						<td class="font-monospace">#binary(code)#</td>
						<td class="text-end">#code#</td>
						<td><cfif code eq 32>space<cfelse>#encodeForHTML(chr(code))#</cfif></td>
						<td></td>
						<td></td>
					</tr>
				</cfloop>
				<tr>
					<td class="font-monospace">#binary(127)#</td>
					<td class="text-end">127</td>
					<td>DEL</td>
					<td>Delete</td>
					<td>On paper tape, every hole was punched in that spot so the earlier character was rubbed out. A hole could not be unpunched.</td>
				</tr>
			</tbody>
		</table>
		<img class="img-fluid" src="https://ichef.bbci.co.uk/news/1024/cpsprodpb/13E3C/production/_106186418_gettyimages-471395639.jpg.webp">
		<p></p>
		<img class="img-fluid" src="https://www.wacdllc.com/wp-content/uploads/2017/06/A_typewriter_10995863465.jpg">

<p><iframe width="560" height="315" src="https://www.youtube.com/embed/S81GyMKH7zw?si=RW8IaaUNE-5DXSA_&amp;start=360" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
	</div>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
