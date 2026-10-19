<cfscript>
param form.actid=322;
request.container = 'container-fluid';
include '/Inc/header6.cfm';
</cfscript>

<cfoutput query="act">
<div class="rel-window">
	<div id="rel-canvas"></div>
</div>
<dialog class="dialog" id="phonetype-modal" aria-labelledby="phonetype-title">
	<div class="dialog-header">
		<h5 class="dialog-title" id="phonetype-title">phonetype</h5>
		<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
	</div>
	<div class="dialog-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">phonetypeid</th>
							<th>phonetypename</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-end">1</td>
							<td>Home</td>
						</tr>
						<tr>
							<td class="text-end">2</td>
							<td>Cell</td>
						</tr>
						<tr>
							<td class="text-end">3</td>
							<td>Work</td>
						</tr>
						<tr>
							<td class="text-end">4</td>
							<td>Emergency</td>
						</tr>
					</tbody>
				</table>
	</div>
</dialog>
<dialog class="dialog" id="term-modal" aria-labelledby="term-title">
	<div class="dialog-header">
		<h5 class="dialog-title" id="term-title">term</h5>
		<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
	</div>
	<div class="dialog-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">termid</th>
							<th>termname</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-end">1</td>
							<td>Spring</td>
						</tr>
						<tr>
							<td class="text-end">2</td>
							<td>Summer</td>
						</tr>
						<tr>
							<td class="text-end">3</td>
							<td>Fall</td>
						</tr>
					</tbody>
				</table>
	</div>
</dialog>
<dialog class="dialog" id="course-modal" aria-labelledby="course-title">
	<div class="dialog-header">
		<h5 class="dialog-title" id="course-title">course</h5>
		<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
	</div>
	<div class="dialog-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">courseid</th>
							<th>coursename</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-end">175</td>
							<td>Information Technology</td>
						</tr>
					</tbody>
				</table>
	</div>
</dialog>
<dialog class="dialog" id="curriculum-modal" aria-labelledby="curriculum-title">
	<div class="dialog-header">
		<h5 class="dialog-title" id="curriculum-title">Curriculum</h5>
		<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
	</div>
	<div class="dialog-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">Curriculumid</th>
							<th>curriculumname</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-end">1000</td>
							<td>Accounting</td>
						</tr>
						<tr>
							<td class="text-end">2000</td>
							<td>Biology</td>
						</tr>
						<tr>
							<td class="text-end">3000</td>
							<td>Criminal Justice</td>
						</tr>
						<tr>
							<td class="text-end">4000</td>
							<td>Exercise Science</td>
						</tr>
						<tr>
							<td class="text-end">5000</td>
							<td>Finance</td>
						</tr>
						<tr>
							<td class="text-end">6000</td>
							<td>History</td>
						</tr>
					</tbody>
				</table>
	</div>
</dialog>
<dialog class="dialog" id="classlevel-modal" aria-labelledby="classlevel-title">
	<div class="dialog-header">
		<h5 class="dialog-title" id="classlevel-title">ClassLevel</h5>
		<button type="button" class="btn-close" data-bs-dismiss="dialog" aria-label="Close"></button>
	</div>
	<div class="dialog-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">ClassLevelid</th>
							<th>ClassLevelName</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="text-end">100</td>
							<td>Freshman</td>
						</tr>
						<tr>
							<td class="text-end">200</td>
							<td>Sophomore</td>
						</tr>
						<tr>
							<td class="text-end">300</td>
							<td>Junior</td>
						</tr>
						<tr>
							<td class="text-end">400</td>
							<td>Senior</td>
						</tr>
						<tr>
							<td class="text-end">500</td>
							<td>Graduate</td>
						</tr>
					</tbody>
				</table>
	</div>
</dialog>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>
