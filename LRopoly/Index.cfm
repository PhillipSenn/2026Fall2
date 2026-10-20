<cfscript>
setting showdebugoutput=false;
include '/Inc/header6.cfm'
q = exec('q.where_act',form.actid)
spaces = [
	{id: 20, c: 1, r: 1, side: 'corner', bar: '', name: 'Free Parking', price: '', kind: 'parking', icon: 'bi-p-square-fill'}
	,{id: 21, c: 2, r: 1, side: 'top', bar: 'red', name: 'Kentucky Avenue', price: '$220', kind: 'property', icon: ''}
	,{id: 22, c: 3, r: 1, side: 'top', bar: '', name: 'Chance', price: '', kind: 'chance', icon: 'bi-question-lg'}
	,{id: 23, c: 4, r: 1, side: 'top', bar: 'red', name: 'Indiana Avenue', price: '$220', kind: 'property', icon: ''}
	,{id: 24, c: 5, r: 1, side: 'top', bar: 'red', name: 'Illinois Avenue', price: '$240', kind: 'property', icon: ''}
	,{id: 25, c: 6, r: 1, side: 'top', bar: '', name: 'B. & O. Railroad', price: '$200', kind: 'railroad', icon: 'bi-train-front-fill'}
	,{id: 26, c: 7, r: 1, side: 'top', bar: 'yellow', name: 'Atlantic Avenue', price: '$260', kind: 'property', icon: ''}
	,{id: 27, c: 8, r: 1, side: 'top', bar: 'yellow', name: 'Ventnor Avenue', price: '$260', kind: 'property', icon: ''}
	,{id: 28, c: 9, r: 1, side: 'top', bar: '', name: 'Water Works', price: '$150', kind: 'utility', icon: 'bi-droplet-fill'}
	,{id: 29, c: 10, r: 1, side: 'top', bar: 'yellow', name: 'Marvin Gardens', price: '$280', kind: 'property', icon: ''}
	,{id: 30, c: 11, r: 1, side: 'corner', bar: '', name: 'Go To Jail', price: '', kind: 'gotojail', icon: 'bi-person-walking'}
	,{id: 31, c: 11, r: 2, side: 'right', bar: 'green', name: 'Pacific Avenue', price: '$300', kind: 'property', icon: ''}
	,{id: 32, c: 11, r: 3, side: 'right', bar: 'green', name: 'North Carolina Avenue', price: '$300', kind: 'property', icon: ''}
	,{id: 33, c: 11, r: 4, side: 'right', bar: '', name: 'Community Chest', price: '', kind: 'chest', icon: 'bi-archive-fill'}
	,{id: 34, c: 11, r: 5, side: 'right', bar: 'green', name: 'Pennsylvania Avenue', price: '$320', kind: 'property', icon: ''}
	,{id: 35, c: 11, r: 6, side: 'right', bar: '', name: 'Short Line', price: '$200', kind: 'railroad', icon: 'bi-train-front-fill'}
	,{id: 36, c: 11, r: 7, side: 'right', bar: '', name: 'Chance', price: '', kind: 'chance', icon: 'bi-question-lg'}
	,{id: 37, c: 11, r: 8, side: 'right', bar: 'darkblue', name: 'Park Place', price: '$350', kind: 'property', icon: ''}
	,{id: 38, c: 11, r: 9, side: 'right', bar: '', name: 'Luxury Tax', price: '$100', kind: 'tax', icon: 'bi-cash-stack'}
	,{id: 39, c: 11, r: 10, side: 'right', bar: 'darkblue', name: 'Boardwalk', price: '$400', kind: 'property', icon: ''}
	,{id: 10, c: 1, r: 11, side: 'corner', bar: '', name: 'Jail', price: 'Just Visiting', kind: 'jail', icon: 'bi-lock-fill'}
	,{id: 9, c: 2, r: 11, side: 'bottom', bar: 'lightblue', name: 'Connecticut Avenue', price: '$120', kind: 'property', icon: ''}
	,{id: 8, c: 3, r: 11, side: 'bottom', bar: 'lightblue', name: 'Vermont Avenue', price: '$100', kind: 'property', icon: ''}
	,{id: 7, c: 4, r: 11, side: 'bottom', bar: '', name: 'Chance', price: '', kind: 'chance', icon: 'bi-question-lg'}
	,{id: 6, c: 5, r: 11, side: 'bottom', bar: 'lightblue', name: 'Oriental Avenue', price: '$100', kind: 'property', icon: ''}
	,{id: 5, c: 6, r: 11, side: 'bottom', bar: '', name: 'Reading Railroad', price: '$200', kind: 'railroad', icon: 'bi-train-front-fill'}
	,{id: 4, c: 7, r: 11, side: 'bottom', bar: '', name: 'Income Tax', price: 'Pay $200', kind: 'tax', icon: 'bi-cash-stack'}
	,{id: 3, c: 8, r: 11, side: 'bottom', bar: 'brown', name: 'Baltic Avenue', price: '$60', kind: 'property', icon: ''}
	,{id: 2, c: 9, r: 11, side: 'bottom', bar: '', name: 'Community Chest', price: '', kind: 'chest', icon: 'bi-archive-fill'}
	,{id: 1, c: 10, r: 11, side: 'bottom', bar: 'brown', name: 'Mediterranean Avenue', price: '$60', kind: 'property', icon: ''}
	,{id: 0, c: 11, r: 11, side: 'corner', bar: '', name: 'GO', price: 'Collect $200', kind: 'go', icon: 'bi-arrow-left'}
	,{id: 19, c: 1, r: 2, side: 'left', bar: 'orange', name: 'New York Avenue', price: '$200', kind: 'property', icon: ''}
	,{id: 18, c: 1, r: 3, side: 'left', bar: 'orange', name: 'Tennessee Avenue', price: '$180', kind: 'property', icon: ''}
	,{id: 17, c: 1, r: 4, side: 'left', bar: '', name: 'Community Chest', price: '', kind: 'chest', icon: 'bi-archive-fill'}
	,{id: 16, c: 1, r: 5, side: 'left', bar: 'orange', name: 'St. James Place', price: '$180', kind: 'property', icon: ''}
	,{id: 15, c: 1, r: 6, side: 'left', bar: '', name: 'Pennsylvania Railroad', price: '$200', kind: 'railroad', icon: 'bi-train-front-fill'}
	,{id: 14, c: 1, r: 7, side: 'left', bar: 'pink', name: 'Virginia Avenue', price: '$160', kind: 'property', icon: ''}
	,{id: 13, c: 1, r: 8, side: 'left', bar: 'pink', name: 'States Avenue', price: '$140', kind: 'property', icon: ''}
	,{id: 12, c: 1, r: 9, side: 'left', bar: '', name: 'Electric Company', price: '$150', kind: 'utility', icon: 'bi-lightbulb-fill'}
	,{id: 11, c: 1, r: 10, side: 'left', bar: 'pink', name: 'St. Charles Place', price: '$140', kind: 'property', icon: ''}
]
</cfscript>

<div class="card">
	<div class="card-header theme-primary theme-subtle d-flex justify-content-between align-items-center gap-2">
		<span>Click any name to change it. Edits are saved in this browser.</span>
		<button type="button" id="reset" class="btn btn-sm btn-outline theme-secondary">Reset names</button>
	</div>
	<div class="card-body">
		<div class="board" id="board" lang="en" aria-label="LRopoly board">
			<cfoutput>
			<cfloop array="#spaces#" index="space">
				<cfset classes = 'space side-' & space.side & ' kind-' & space.kind>
				<cfif len(space.bar)>
					<cfset classes &= ' bar-' & space.bar>
				</cfif>
				<div class="#classes#" style="grid-column: #space.c#; grid-row: #space.r#;" data-id="#space.id#" data-default-name="#encodeForHTMLAttribute(space.name)#" data-default-price="#encodeForHTMLAttribute(space.price)#">
					<cfif space.side eq 'bottom' or space.side eq 'right'>
						<cfif len(space.bar)><div class="color-bar"></div></cfif>
					</cfif>
					<div class="space-body">
						<cfif len(space.icon)>
							<i class="bi #space.icon# space-icon" aria-hidden="true"></i>
						</cfif>
						<div class="space-name" contenteditable="true" spellcheck="false">#encodeForHTML(space.name)#</div>
						<cfif len(space.price)>
							<div class="space-price" contenteditable="true" spellcheck="false">#encodeForHTML(space.price)#</div>
						</cfif>
					</div>
					<cfif space.side eq 'top' or space.side eq 'left'>
						<cfif len(space.bar)><div class="color-bar"></div></cfif>
					</cfif>
				</div>
			</cfloop>
			</cfoutput>
			<div class="center">
				<div class="deck chest-deck">Community Chest</div>
				<div class="logo-wrap">
					<div id="logo" contenteditable="true" spellcheck="false" data-default-name="LRopoly">LRopoly</div>
					<div class="tracks" aria-hidden="true"></div>
					<p class="tagline">A property trading game</p>
				</div>
				<div class="deck chance-deck">Chance</div>
			</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/footer6.cfm">
