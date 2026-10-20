<cfscript>
fonts = deserializeJSON(fileRead(expandPath('families.json')))
builtins = deserializeJSON(fileRead(expandPath('builtin.json')))
ordered = []
for (font in fonts) {
	if (font.family == 'Noto Sans' || font.family == 'Noto Serif') {
		arrayAppend(ordered, font)
	}
}
for (font in fonts) {
	if (left(font.family, 5) == 'Noto ' && font.family != 'Noto Sans' && font.family != 'Noto Serif') {
		arrayAppend(ordered, font)
	}
}
for (font in fonts) {
	if (left(font.family, 5) != 'Noto ') {
		arrayAppend(ordered, font)
	}
}
fonts = ordered
saved = false
current = ''
previewStack = ''
sizes = [12,14,16,18,20,24,28,32,36,48,64,72]
fontSize = 16
if (!isNull(request.usr.fontFamily) && len(request.usr.fontFamily)) {
	current = request.usr.fontFamily
}
if (!isNull(request.usr.fontSize) && arrayFind(sizes, val(request.usr.fontSize))) {
	fontSize = val(request.usr.fontSize)
}
if (cgi.request_method == 'POST' && structKeyExists(form, 'fontFamily')) {
	allowed = false
	for (font in builtins) {
		if (font.family == form.fontFamily) {
			allowed = true
			break
		}
	}
	if (!allowed) {
		for (font in fonts) {
			if (font.family == form.fontFamily) {
				allowed = true
				break
			}
		}
	}
	if (allowed && structKeyExists(form, 'fontSize') && arrayFind(sizes, val(form.fontSize))) {
		fontSize = val(form.fontSize)
		usr('usr.update_font',[form.fontFamily,fontSize])
		current = form.fontFamily
		querySetCell(request.usr, 'fontFamily', current)
		querySetCell(request.usr, 'fontSize', fontSize)
		saved = true
	}
}
for (font in builtins) {
	if (font.family == current) {
		previewStack = font.stack
		break
	}
}
request.fontFamily = current
request.fontSize = fontSize
include '/Inc/header6.cfm'

function cssGeneric(category) {
	if (category == 'Serif') return 'serif'
	if (category == 'Monospace') return 'monospace'
	if (category == 'Handwriting') return 'cursive'
	return 'sans-serif'
}
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-header theme-primary theme-subtle">
		Which font do you want as your default?
	</div>
	<div class="card-body">
		<cfif saved>
			<p>Your default font is #current#.</p>
		<cfelseif len(current)>
			<p>Your default font is #current#. Pick another one below to change it.</p>
		</cfif>
		<div class="font-try">
			<div class="row">
				<div class="col">
					<label for="fontSize">Size</label>
					<select name="fontSize" id="fontSize" class="form-control">
						<cfloop array="#sizes#" index="size">
							<option value="#size#"<cfif size == fontSize> selected</cfif>>#size#</option>
						</cfloop>
					</select>
					<div id="font-preview" contenteditable="plaintext-only" role="textbox" aria-multiline="true" spellcheck="true" style="font-size:#fontSize#px<cfif len(previewStack)>;font-family:#previewStack#<cfelseif len(current)>;font-family:'#current#', sans-serif</cfif>">#request.usr.firstname#</div>
				</div>
				<div class="col">
					<label for="font-search">Search</label>
					<input id="font-search" class="form-control" type="search" autocomplete="off" placeholder="Search #numberFormat(arrayLen(fonts))# Google Fonts">
					<label for="font-category">Category</label>
					<select id="font-category" class="form-control">
						<option value="">All</option>
						<option>Sans Serif</option>
						<option>Serif</option>
						<option>Display</option>
						<option>Handwriting</option>
						<option>Monospace</option>
					</select>
					<div>
						<button>Save</button>
					</div>
				</div>
			</div>
		</div>
		<h2 class="h5 font-section">Built-in fonts</h2>
		<p class="form-text">These fonts are already on the computer.</p>
		<div id="builtin-list" class="font-list mb-4">
			<cfloop array="#builtins#" index="font">
				<label class="font-choice" data-source="builtin" data-family="#font.family#" data-category="#font.category#" data-generic="#font.generic#" data-stack='#font.stack#'>
					<input type="radio" name="fontFamily" value="#font.family#" required<cfif font.family == current> checked</cfif>>
					<span class="font-sample" style='font-family:#font.stack#'>#font.family#</span>
					<span class="font-meta">#font.category#</span>
				</label>
			</cfloop>
		</div>
		<h2 class="h5 font-section">Google Fonts</h2>
		<p class="form-text">Noto is listed first. These fonts are loaded from Google.</p>
		<div id="font-list" class="font-list">
			<cfloop array="#fonts#" index="font">
				<cfset generic = cssGeneric(font.category)>
				<label class="font-choice" data-family="#font.family#" data-category="#font.category#" data-generic="#generic#">
					<input type="radio" name="fontFamily" value="#font.family#" required<cfif font.family == current> checked</cfif>>
					<span class="font-sample" style="font-family:'#font.family#', #generic#">#font.family#</span>
					<span class="font-meta">#font.category#</span>
				</label>
			</cfloop>
		</div>
	</div>
	<div class="card-footer text-end">
		<button>Save</button>
	</div>
	<input hidden name="id" value="#request.usr.id#">
	<input hidden name="actid" value="#form.actid#">
</form>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
