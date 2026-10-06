<cfscript>
ans = exec('ans.first_q',url.qid)
WriteOutput(SerializeJSON(ans))
</cfscript>
