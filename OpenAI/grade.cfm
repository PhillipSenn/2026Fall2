<cfscript>
setting showdebugoutput=false;
param form.text='You work in the educational software industry. Your boss asks you to give a brief lecture to other employees about the digital divide. Create a one-page document in which you define and give examples of the impact of the digital divide, and list ways your company can work to narrow the gap between students without reliable access to educational software, the Internet, and the hardware on which to run both. Discuss the ethical ramifications of not addressing the digital divide—what is your role as a company?';

if (!structKeyExists(form,'text') || !len(trim(form.text))) {
	writeOutput(serializeJSON({
		error = 'No text supplied'
	}))
	abort;
}
apiKey = "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"
requestBody = {
	model = 'gpt-5.4-mini',
	instructions = '
		You evaluate the reading difficulty of text for students in the
		United States.

		Estimate the minimum US school grade at which a typical student
		could comfortably understand the passage.

		Consider:
		- vocabulary
		- sentence structure
		- abstract concepts
		- assumed background knowledge

		Do not judge only by word length or sentence length.

		For audience, use one of:
		Elementary school
		Middle school
		High school
		College
		Graduate/Professional
	',
	input = form.text,
	text = {
		format = {
			type = 'json_schema',
			name = 'reading_level',
			strict = true,
			schema = {
				type = 'object',
				properties = {
					grade = {
						type = 'integer',
						minimum = 1,
						maximum = 20
					},
					age = {
						type = 'string'
					},
					audience = {
						type = 'string',
						enum = [
							'Elementary school',
							'Middle school',
							'High school',
							'College',
							'Graduate/Professional'
						]
					},
					reason = {
						type = 'string'
					},
					difficultWords = {
						type = 'array',
						items = {
							type = 'string'
						}
					}
				},
				required = [
					'grade',
					'age',
					'audience',
					'reason',
					'difficultWords'
				],
				additionalProperties = false
			}
		}
	}
}

cfhttp(
	url='https://api.openai.com/v1/responses',
	method='post',
	result='apiResult'
) {
	cfhttpparam(
		type='header',
		name='Authorization',
		value='Bearer ' & apiKey
	)

	cfhttpparam(
		type='header',
		name='Content-Type',
		value='application/json'
	)

	cfhttpparam(
		type='body',
		value=serializeJSON(requestBody)
	)
}

response = deserializeJSON(apiResult.fileContent)

if (!structKeyExists(response,'output')) {
writeOutput(apiResult.fileContent)
	writeOutput(serializeJSON({
		error = 'OpenAI did not return an output'
	}))
	abort;
}

result = ''

for (item in response.output) {
	if (
		structKeyExists(item,'type')
		&& item.type == 'message'
		&& structKeyExists(item,'content')
	) {
		for (content in item.content) {
			if (
				structKeyExists(content,'type')
				&& content.type == 'output_text'
			) {
				result = content.text
			}
		}
	}
}

if (!len(result)) {
	writeOutput(serializeJSON({
		error = 'OpenAI did not return a reading assessment'
	}))
	abort;
}

writeOutput(result)
</cfscript>