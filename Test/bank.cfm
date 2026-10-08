<cfscript>
param form.redo=0;
if (structKeyExists(form,'ansid')) {
	usr('guess.merge_ans',[form.ansid,form.redo]) // And grades where correct=1
} else if (StructKeyExists(form,'ansids')) {
	for (ansid in ListToArray(form.ansids)) {
		usr('guess.merge_ans', [ansid,form.redo])
	}
}
request.progress.anim = true
//request.progress.bar = false
include '/Inc/header.cfm'
if (StructKeyExists(form,'pollid')) {
	usr('poll.update_poll',form.pollid)
}
if (StructKeyExists(form,'Speech')) {
	request.usr = usr('usr.update_SpeechSynthesisUtterance',
		[form.Speech
		,form.SpeechRate
		,form.SpeechPitch
		,form.SpeechVolume
		,form.voiceName]
	)
}

q = usr('q.test_bank',form.actid)
unanswered = usr('q.unanswered',form.actid)
remaining = unanswered.recordcount
answered = q.recordcount - unanswered.recordcount
if (structKeyExists(form,'qid')) {
	unanswered = exec('q.where_q',form.qid)
}
qname = unanswered.qname
qdesc = unanswered.qdesc
if (unanswered.recordcount) {
	poll = usr('poll.start_q',unanswered.qid)
	form.pollid = poll.pollid
	ans = exec('ans.where_q',unanswered.qid)
	length = 0

	cfloop(query="ans") {
		if (correct) {
			length = Len(ansname)
		}
	}
	qname = Replace(qname,'_','|')
	qname = Replace(qname,'_','','all')
	qname = Replace(qname,'|','<span class="underscores">#repeatString('_', length)#</span>')
	if (Find('_',qdesc)) {
		qdesc = ListFirst(qdesc,'_') & '_' & ListLast(qdesc,'_')
	}
} else {
	form.pollid=0 // remaining=0
	totalSeconds = 0
	maxEnd = ""
	cfloop(query="q") {
		if (isDate(pollStart) and isDate(pollEnd)) {
			totalSeconds += DateDiff('s',pollStart,pollEnd)
			if (!isDate(maxEnd) or maxEnd < pollEnd) {
				maxEnd = pollEnd
			}
		}
	}
	rightWrong = usr('act.rightWrong',form.actid)
	total=rightWrong.count_right + rightWrong.count_wrong
}
qry = usr('guess.wrong_act',form.actid)
wrong = 0
cfloop(query="qry") {
	if (qry.qid == unanswered.qid) break;
	wrong = qry.wrong
}
</cfscript>


<cfoutput query="act">
<form>
	<cfif StructKeyExists(form,'qid') OR remaining>
		<div class="row">
			<div class="col">
				<div class="card">
					<div class="card-header">
						Textbook
					</div>
					<div class="card-body">
						#qname#
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card">
					<cfif len(q.qdesc)>
					<fieldset class="card-header">
						<legend>AI</legend>
						<div class="row">
							<div class="col-2 border">
								<label for="SpeechPitch" class="d-block">Pitch</label>
								<input style="width:60px" type="number" id="SpeechPitch" name="SpeechPitch" min=0 max=2 step=0.1 value=#request.usr.SpeechPitch#>
							</div>
						
							<div class="col-7 border">
								<label for="voiceName" class="d-block">Voice</label>
								<select class="form-control" id="voiceName" name="voiceName">
									<option value="#request.usr.voiceName#">#request.usr.voiceName#</option>
								</select>
							</div>
						
							<div class="col-2 border">
								<label for="SpeechRate" class="d-block">Rate</label>
								<input style="width:60px" type="number" id="SpeechRate" name="SpeechRate" min=.1 max=10 step=.1 value=#request.usr.SpeechRate#>
							</div>
							<div class="col-1 border ps-1">
								<label for="SpeechSynthesisUtterance" class="d-block">&nbsp;</label>
								<cfif request.usr.SpeechSynthesisUtterance>
									<button type="button" name="SpeechSynthesisUtterance" class="btn-outline-primary bi-volume-up" value="1"></button>
								<cfelse>
									<button type="button" name="SpeechSynthesisUtterance" class="btn-outline-primary bi-volume-mute" value="0"></button>
								</cfif>
							</div>
						</div>
						<input hidden name="SpeechVolume" value="1">
						<input hidden name="Speech" value="#request.usr.SpeechSynthesisUtterance#">
					</fieldset>
					</cfif>
					<div class="card-body">
						<div id="qdesc">#qdesc#</div>
						<ul class="list-unstyled" id="answers">
							<cfloop query="ans">
								<li>
									<cfif FindNoCase('Select all ',qname)>
										<div class="form-check">
											<cfif correct>
												<input class="form-check-input" type="checkbox" name="ansids" id="ans#ansid#" value="#ansid#">
												<label class="form-check-label" for="ans#ansid#">
													#ansname#
												</label>
											<cfelse>
												<!---  class="ansid" for fetch statement --->
												<input class="ansid form-check-input" type="checkbox" tabindex="-1" value="#ansid#">
												<label class="form-check-label">
													#ansname#
												</label>
											</cfif>
										</div>
									<cfelseif Val(correct)>
										<button name="ansid" class="btn-link text-start" value="#ansid#">#ansname#</button>
									<cfelse>
										<button type="button" class="ansid btn-link text-start" value="#ansid#">#ansname#</button>
									</cfif>
								</li>
							</cfloop>
						</ul>
					</div>
					<div class="card-footer text-end">
						<a target="_blank" href="https://ebooks.cengage.com/reader/37144ab6-3307-483b-b060-42403fe46440/content-bd_part_02_opener?sidepanel=contents">#unanswered.qhref#</a>
					</div>
				</div>
			</div>
		</div>
		<div hidden>
			<div id="answered">#answered#</div>
			<div id="questions">#q.recordcount#</div>
		</div>
	<cfelse>
		<div class="progress">
			<div class="progress-bar bg-success" style="width:#100 * rightWrong.count_right / total#%">
				#rightWrong.count_right#
			</div>
			<div class="progress-bar bg-danger" style="width:#100 * rightWrong.count_wrong / total#%">
				#rightWrong.count_wrong#
			</div>
		</div>
		<div class="card">
			<div class="card-body">
				<table>
					<thead>
						<tr>
							<th class="text-end">Row</th>
							<th>Question</th>
							<th class="bg-success-subtle">Correct</th>
							<th class="bg-danger-subtle">Incorrect</th>
							<th class="text-end">Start</th>
							<th class="text-end">End</th>
							<th class="text-end">Time</th>
						</tr>
					</thead>
					<tbody>
						<cfloop query="q">
							<tr>
								<td class="text-end">
									<button class="btn-link" name="qid" value="#qid#">#currentRow#</button>
								</td>
								<td>#qdesc#</td>
								<td>
									<cfif ListLen(correct_ansnames,'|') gt 1>
										<cfloop list="#correct_ansnames#" item="ansname" delimiters="|">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" checked>
												<label class="form-check-label">
													#ansname#
												</label>
											</div>
										</cfloop>
									<cfelseif ListLen(incorrect_ansnames,'|') gt 1>
										#correct_ansnames#!
									<cfelse>
										#correct_ansnames#
									</cfif>
								</td>

								<td>
									<cfif ListLen(correct_ansnames,'|') gt 1>
										<cfloop list="#incorrect_ansnames#" item="ansname" delimiters="|">
											<div class="form-check">
												<input class="form-check-input" type="checkbox" checked>
												<label class="form-check-label">
													#ansname#
												</label>
											</div>
										</cfloop>
									<cfelseif ListLen(incorrect_ansnames,'|') gt 1>
										<ol class="mb-0">
											<cfloop list="#incorrect_ansnames#" item="ansname" delimiters="|" index="i">
												<cfif i gt 1>
													<li class="text-danger">#ansname#</li>
												<cfelse>
													<li>#ansname#</li>
												</cfif>
											</cfloop>
										</ol>
									<cfelse>
										#incorrect_ansnames#
									</cfif>
								</td>

								<td class="text-end font-monospace">
									<cfif isDate(pollStart)>#TimeFormat(pollStart,'h:mm:ss')#</cfif>
								</td>
								<td class="text-end font-monospace">
									<cfif isDate(pollEnd)>#TimeFormat(pollEnd,'h:mm:ss')#</cfif>
								</td>
								<td class="text-end">
									<cfif isDate(pollStart) and isDate(pollEnd)>#TimeFormat(pollEnd-pollStart,'m:ss')#</cfif>
								</td>
							</tr>
						</cfloop>
						<tr>
							<th></th>
							<th colspan="3">Total</th>
							<td class="text-end font-monospace"<cfif isDate(q.pollStart)> title="#DateFormat(q.pollStart,'mm/dd/yyyy')#"</cfif>><cfif isDate(q.pollStart)>#TimeFormat(q.pollStart,'h:mm')#&nbsp;#TimeFormat(q.pollStart,'tt')#</cfif></td>
							<td class="text-end font-monospace"<cfif isDate(maxEnd)> title="#DateFormat(maxEnd,'mm/dd/yyyy')#"</cfif>><cfif isDate(maxEnd)>#TimeFormat(maxEnd,'h:mm')#&nbsp;#TimeFormat(maxEnd,'tt')#</cfif></td>
							<th class="text-end">#Int(totalSeconds / 60)#m&nbsp;#NumberFormat(totalSeconds mod 60,'00')#s</th>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
	</cfif>
	<cfif structKeyExists(form,'qid')>
		<input hidden name="redo" value="1">
	</cfif>
	<input hidden name="pollid" value="#form.pollid#">
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<div hidden id="wrong">#wrong#</div>
<button class="nav-link" name="actid" value="#form.actid#" formaction="#request.dir#">#actname#</button>
<cfinclude template="/Inc/footer.cfm">
</cfoutput>