<cfscript>
param form.redo=0;
if (structKeyExists(form,'ansid')) {
	new dbo.proc().usr('guess.merge_ans',[form.ansid,form.redo]) // And grades where correct=1
} else if (StructKeyExists(form,'ansids')) {
	for (ansid in ListToArray(form.ansids)) {
		new dbo.proc().usr('guess.merge_ans', [ansid,form.redo])
	}
}
request.progress.anim = true
//request.progress.bar = false
include '/Inc/header6.cfm'
if (StructKeyExists(form,'pollid')) {
	new dbo.proc().usr('poll.update_poll',form.pollid)
}
if (StructKeyExists(form,'Speech')) {
	request.usr = new dbo.proc().usr('usr.update_SpeechSynthesisUtterance',
		[form.Speech
		,form.SpeechRate
		,form.SpeechPitch
		,form.SpeechVolume
		,form.voiceName]
	)
}

q = new dbo.proc().usr('q.test_bank',form.actid)
unanswered = new dbo.proc().usr('q.unanswered',form.actid)
remaining = unanswered.recordcount
answered = q.recordcount - unanswered.recordcount
if (structKeyExists(form,'qid')) {
	unanswered = new dbo.proc().exec('q.where_q',form.qid)
}
qname = unanswered.qname
qdesc = unanswered.qdesc
if (unanswered.recordcount) {
	poll = new dbo.proc().usr('poll.start_q',unanswered.qid)
	form.pollid = poll.pollid
	ans = new dbo.proc().exec('ans.where_q',unanswered.qid)
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
	rightWrong = new dbo.proc().usr('act.rightWrong',form.actid)
}
qry = new dbo.proc().usr('guess.wrong_act',form.actid)
wrong = 0
cfloop(query="qry") {
	if (qry.qid == unanswered.qid) break;
	wrong = qry.wrong
}
</cfscript>


<cfoutput query="act">
<form>
	<cfif StructKeyExists(form,'qid') OR remaining>
		<cfif len(q.qdesc)>
			<row>
				<div class="col">
					<article>
						<header>
							Textbook
						</header>
						<section>
							#qname#
						</section>
					</article>
				</div>
				<div class="col">
					<article>
						<header><fieldset>
							<legend>AI</legend>
							<row>
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
										<button type="button" name="SpeechSynthesisUtterance" class="btn-outline theme-primary bi-volume-up" value="1"></button>
									<cfelse>
										<button type="button" name="SpeechSynthesisUtterance" class="btn-outline theme-primary bi-volume-mute" value="0"></button>
									</cfif>
								</div>
							</row>
							<input hidden name="SpeechVolume" value="1">
							<input hidden name="Speech" value="#request.usr.SpeechSynthesisUtterance#">
						</fieldset></header>
						<section>
							<div id="qdesc">#qdesc#</div>
							<ul class="list-unstyled" id="answers">
								<cfloop query="ans">
									<li>
										<cfif FindNoCase('Select all ',qname)>
											<div class="form-field">
												<cfif correct>
													<input class="check" type="checkbox" name="ansids" id="ans#ansid#" value="#ansid#">
													<label for="ans#ansid#">
														#ansname#
													</label>
												<cfelse>
													<!---  class="ansid" for fetch statement --->
													<input class="ansid check" type="checkbox" tabindex="-1" value="#ansid#">
													<label>
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
						</section>
						<footer class="text-end">
							<a target="_blank" href="https://ebooks.cengage.com/reader/37144ab6-3307-483b-b060-42403fe46440/content-bd_part_02_opener?sidepanel=contents">#unanswered.qhref#</a>
						</footer>
					</article>
				</div>
			</row>
		<cfelse>
			<row>
				<div class="col-6 mx-auto">
					<article>
						<header>
							#qname#
						</header>
						<section>
							<ul class="list-unstyled" id="answers">
								<cfloop query="ans">
									<li>
										<cfif FindNoCase('Select all ',qname)>
											<div class="form-field">
												<cfif correct>
													<input class="check" type="checkbox" name="ansids" id="ans#ansid#" value="#ansid#">
													<label for="ans#ansid#">
														#ansname#
													</label>
												<cfelse>
													<!---  class="ansid" for fetch statement --->
													<input class="ansid check" type="checkbox" tabindex="-1" value="#ansid#">
													<label>
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
						</section>
						<footer class="text-end">
							<a target="_blank" href="https://ebooks.cengage.com/reader/37144ab6-3307-483b-b060-42403fe46440/content-bd_part_02_opener?sidepanel=contents">#unanswered.qhref#</a>
						</footer>
					</article>
				</div>
			</row>
		</cfif>
		<div hidden>
			<div id="answered">#answered#</div>
			<div id="questions">#q.recordcount#</div>
		</div>
	<cfelse>
		<article>
			<header class="theme-primary theme-subtle">
				<button formaction="../reset.cfm" class="btn-outline theme-danger float-end btn-sm">Reset</button>
			</header>
			<section>
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
								<td>#qname#</td>
								<td>
									<cfif ListLen(correct_ansnames,'|') gt 1>
										<cfloop list="#correct_ansnames#" item="ansname" delimiters="|">
											<div class="form-field">
												<input class="check" type="checkbox" checked>
												<label>
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
											<div class="form-field">
												<input class="check" type="checkbox" checked>
												<label>
													#ansname#
												</label>
											</div>
										</cfloop>
									<cfelseif ListLen(incorrect_ansnames,'|') gt 1>
										<ol class="mb-0">
											<cfloop list="#incorrect_ansnames#" item="ansname" delimiters="|" index="i">
												<cfif i gt 1>
													<li class="fg-danger">#ansname#</li>
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
			</section>
		</article>
		<div hidden id="count_right">#rightWrong.count_right#</div>
		<div hidden id="count_wrong">#rightWrong.count_wrong#</div>
	</cfif>
	<cfif structKeyExists(form,'qid')>
		<input hidden name="redo" value="1">
	</cfif>
	<input hidden name="pollid" value="#form.pollid#">
	<input hidden name="actid" value="#form.actid#">
	<input hidden name="id" value="#request.usr.id#">
</form>
<div hidden id="wrong">#wrong#</div>
<cfinclude template="/Inc/footer6.cfm">
</cfoutput>