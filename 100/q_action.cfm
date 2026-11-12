<cfscript>
hasFile = structKeyExists(form,'clientFile') && len(trim(form.clientFile));
hasUrl = structKeyExists(form,'pollname') && len(trim(form.pollname));
back = 'q.cfm?actid=' & form.actid & '&qid=' & form.qid;

if (!hasFile && !hasUrl) {
	location(back & '&msg=' & urlEncodedFormat('Upload a file or paste an image URL.'), false);
}

uploadDir = expandPath('./uploads/');
if (!directoryExists(uploadDir)) {
	directoryCreate(uploadDir);
}
</cfscript>

<cfif hasFile>
	<cffile
		action="upload"
		filefield="clientFile"
		destination="#uploadDir#"
		nameconflict="makeunique"
		accept="image/png,image/jpeg,image/webp"
		strict="true"
		result="uploaded">

	<cfscript>
	filePath = uploaded.serverDirectory & '/' & uploaded.serverFile;

	// Maximum file size: 5 MB
	if (uploaded.fileSize > 5 * 1024 * 1024) {
		fileDelete(filePath);
		location(back & '&msg=' & urlEncodedFormat('Image exceeds the 5 MB limit.'), false);
	}

	// Validate the uploaded image content.
	if (!isImageFile(filePath)) {
		fileDelete(filePath);
		location(back & '&msg=' & urlEncodedFormat('The uploaded file is not a valid image.'), false);
	}

	form.pollname = uploaded.serverFile;
	</cfscript>
<cfelseif left(form.pollname, 4) != 'http'>
	<cfscript>
	location(back & '&msg=' & urlEncodedFormat('Image URL must start with http.'), false);
	</cfscript>
</cfif>

<cfscript>
new dbo.proc().usr('poll.merge_q',[form.qid,form.pollname]);
new dbo.proc().usr('grade.merge_act',[form.actid,100]);
location('things.cfm?actid=' & form.actid,false);
</cfscript>
