<cfscript>
request.title = 'Calendar'
request.pageModule = true
include '/Inc/header6.cfm'
</cfscript>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vanilla-calendar-pro@3.4.0/styles/core.css">

<div class="row g-4 my-4">
	<div class="col-6">
		<div class="card h-100">
			<div class="card-header">Vanilla Calendar Pro</div>
			<div class="card-body">
				<div id="calendar"></div>
				<p id="picked" class="mt-3 mb-0">Select a start date and an end date.</p>
			</div>
		</div>
	</div>
	<div class="col-6">
		<div class="card h-100">
			<div class="card-header">Input</div>
			<div class="card-body">
				<label for="calendar-input" class="form-label">Choose a date</label>
				<input type="text" class="form-control w-12" id="calendar-input">
			</div>
		</div>
	</div>
</div>

<cfinclude template="/Inc/footer6.cfm">
