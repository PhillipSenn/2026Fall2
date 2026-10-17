<cfscript>
include '/Inc/header6.cfm'
if (structKeyExists(form,'codePoint')) {
    usr('usr.codePoint', form.codePoint)
	writeoutput('<button class="home nav-link" formaction="' & request.home & '">Home</button>')
}
</cfscript>

<cfoutput query="act">
<div class="card">
	<div class="card-header">
		Select Your Character
	</div>
	<div class="card-body">
		<div class="btn-group flex-wrap mb-3" id="emojiCategories">

			<button class="btn-outline theme-primary active"
				data-start="1F466"
				data-end="1F487">People</button>

			<button class="btn-outline theme-primary"
				data-start="1F600"
				data-end="1F64F">Faces</button>

			<button class="btn-outline theme-primary"
				data-start="1F9D9"
				data-end="1F9DD">Fantasy</button>

			<button class="btn-outline theme-primary"
				data-start="1F400"
				data-end="1F43F">Animals</button>

			<button class="btn-outline theme-primary"
				data-start="1F950"
				data-end="1F96F">Food</button>

			<button class="btn-outline theme-primary"
				data-start="1F330"
				data-end="1F33F">Plants</button>

			<button class="btn-outline theme-primary"
				data-start="1F4A0"
				data-end="1F4FF">Objects</button>

			<button class="btn-outline theme-primary"
				data-start="1F6E0"
				data-end="1F6FF">Tools</button>

			<button class="btn-outline theme-primary"
				data-start="1F3C0"
				data-end="1F3CF">Sports</button>

			<button class="btn-outline theme-primary"
				data-start="1F680"
				data-end="1F6C5">Transport</button>

			<button class="btn-outline theme-primary"
				data-start="2600"
				data-end="26FF">Symbols</button>

		</div>

		<div id="emojiContainer" class="d-flex flex-wrap gap-2 mb-4"></div>

		<div id="skinToneSection" hidden>

			<h5>Choose Skin Tone</h5>

			<div class="btn-group" id="skinToneContainer"></div>

		</div>

		<div class="mt-4">

			<h5>Selected Character</h5>

			<div id="selectedCharacter" class="display-4"></div>
			<div>CodePoint: <span id="textCodePoint"></span></div>
		</div>
	</div>
	<form class="card-footer">
		<button name="codePoint" class="btn-solid theme-primary">
		Save
		</button>
		<input hidden name="actid" value="#actid#">
		<input hidden name="id" value="#request.usr.id#">
	</form>
</div>
<button class="nav-link">#actname#</button>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>