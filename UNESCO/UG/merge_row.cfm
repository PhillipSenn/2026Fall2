<cfscript>
setting showdebugoutput=false;
ug = new dbo.proc().usr('ug.merge_row',[form.rowid,form.lat,form.lng],'UNESCO')
writeoutput(serializeJSON(ug))
</cfscript>
