<cfscript>
request.title = 'Calendar'
request.pageModule = true
include '/Inc/header6.cfm'
</cfscript>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/vanilla-calendar-pro@3.4.0/styles/core.css">

<row class="g-4 my-4">
	<div class="col-6">
		<article class="h-100">
			<header>Vanilla Calendar Pro</header>
			<section>
				<div id="calendar"></div>
				<p id="picked" class="mt-3 mb-0">Select a start date and an end date.</p>
			</section>
		</article>
	</div>
	<div class="col-6">
		<article class="h-100">
			<header>Input</header>
			<section>
				<label for="calendar-input" class="form-label">Choose a date</label>
				<input type="text" class="form-control w-12" id="calendar-input">
			</section>
		</article>
	</div>
</row>

<cfinclude template="/Inc/footer6.cfm">
