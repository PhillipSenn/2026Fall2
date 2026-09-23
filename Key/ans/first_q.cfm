<cfscript>
ans = new dbo.proc().exec('ans.first_q',url.qid)
WriteOutput(SerializeJSON(ans))
</cfscript>
