<cfscript>
new dbo.proc().exec('q.update_desc',[form.qid,form.qdesc])
</cfscript>