<cfscript>
request.container = 'container-fluid';
request.progress.bar = false;
include '/Inc/header.cfm';
</cfscript>

<cfoutput query="act">
<div class="rel-window">
	<div id="rel-canvas"></div>
</div>
<div class="modal fade" id="phonetype-modal" tabindex="-1" aria-labelledby="phonetype-title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="phonetype-title">phonetype</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
		</div>
	</div>
</div>
<div class="modal fade" id="term-modal" tabindex="-1" aria-labelledby="term-title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="term-title">term</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
		</div>
	</div>
</div>
<div class="modal fade" id="course-modal" tabindex="-1" aria-labelledby="course-title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="course-title">course</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
		</div>
	</div>
</div>
<div class="modal fade" id="curriculum-modal" tabindex="-1" aria-labelledby="curriculum-title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="curriculum-title">Curriculum</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
		</div>
	</div>
</div>
<div class="modal fade" id="classlevel-modal" tabindex="-1" aria-labelledby="classlevel-title" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="classlevel-title">ClassLevel</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">
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
		</div>
	</div>
</div>
<button class="nav-link" name="actid" value="#actid#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>
