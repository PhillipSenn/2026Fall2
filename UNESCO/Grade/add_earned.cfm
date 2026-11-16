<cfscript>
setting showdebugoutput=false;
grade = new dbo.proc().usr('grade.add_earned',[form.actid,form.points])
done = queryExecute('
	select count(*) as cnt
	from ug
	join (
		select poi_row
		from poi
		group by poi_row
	) poi on poi_row = ug_row
	where ug_usr = :usrid',
	{usrid: {value: request.usr.usrid, cfsqltype: 'cf_sql_integer'}},
	{datasource: 'UNESCO'}
)
total = queryExecute('
	select count(*) as cnt
	from row
	join (
		select poi_row
		from poi
		group by poi_row
	) poi on poi_row = rowid',
	{},
	{datasource: 'UNESCO'}
)
writeoutput(grade.earned & '|' & val(done.cnt) & ' / ' & val(total.cnt) & ' (' & grade.earned & '%)')
</cfscript>
