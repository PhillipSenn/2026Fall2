<cfscript>
queryExecute('update act set actsort=' & form.actsort & ' where actid=' & form.actid)
</cfscript>