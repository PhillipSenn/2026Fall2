<cfscript>
request.container = 'container-fluid'
request.progress.bar = false
builtins = deserializeJSON(fileRead(expandPath('../Fonts/builtin.json')));
fonts = deserializeJSON(fileRead(expandPath('../Fonts/families.json')));
include '/Inc/header6.cfm';

function cssGeneric(category) {
	if (category == 'Serif') return 'serif';
	if (category == 'Monospace') return 'monospace';
	if (category == 'Handwriting') return 'cursive';
	return 'sans-serif';
}
current = '';
if (!isNull(request.usr.fontFamily) && len(request.usr.fontFamily)) {
	current = request.usr.fontFamily;
}
</cfscript>

<cfoutput query="act">
<div class="editor">
	<div id="letter-frame">
		<div id="letter" contenteditable="plaintext-only" role="textbox" aria-label="Letter" spellcheck="false">A</div>
	</div>
	<aside id="font-list" aria-label="Fonts">
		<cfloop array="#builtins#" index="font">
			<button type="button" class="btn-font<cfif font.family == current> active</cfif>" title="#encodeForHTMLAttribute(font.family)#" data-bs-placement="left" data-source="builtin" data-family="#encodeForHTMLAttribute(font.family)#" data-generic="#encodeForHTMLAttribute(font.generic)#" data-stack="#encodeForHTMLAttribute(font.stack)#" style="font-family:#encodeForHTMLAttribute(font.stack)#">#encodeForHTML(font.family)#</button>
		</cfloop>
		<cfloop array="#fonts#" index="font">
			<cfset generic = cssGeneric(font.category)>
			<button type="button" class="btn-font<cfif font.family == current> active</cfif>" title="#encodeForHTMLAttribute(font.family)#" data-bs-placement="left" data-source="google" data-family="#encodeForHTMLAttribute(font.family)#" data-generic="#encodeForHTMLAttribute(generic)#">#encodeForHTML(font.family)#</button>
		</cfloop>
	</aside>
</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
