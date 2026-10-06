;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select genus
		,species
		,row_number() over(
			order by genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and genus.genus_family is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
use itis
select 'insert into kingdom(kingdomname) values'
	+ string_agg(
		cast(
			char(13) + char(10)
			+ case when rn > 1 then ',' else ' ' end
			+ '(''' + replace(complete_name,'''','''''') + ''')'
			as varchar(max)
		)
		,''
	)
from (
	select complete_name
		,row_number() over(order by complete_name) rn
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')
) x
go

;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select distinct kingdom,phylum
	from tax
	where rank_id=220
	and phylum is not null
),
sql as (
	select 1 sort
		,'insert into phylum(phylum_kingdom,phylumname)' txt

	union all

	select 2
		,'select kingdomid,phylumname'

	union all

	select 3
		,'from kingdom'

	union all

	select 4
		,'join (values'

	union all

	select 1000 + row_number() over(order by kingdom,phylum)
		,case when row_number() over(order by kingdom,phylum) > 1 then ',' else '' end
		+ '('''
		+ replace(kingdom,'''','''''')
		+ ''','''
		+ replace(phylum,'''','''''')
		+ ''')'
	from x

	union all

	select 1000000
		,') x(kingdomname,phylumname)'

	union all

	select 1000001
		,'on kingdom.kingdomname=x.kingdomname'
)
select txt
from sql
order by sort
option (maxrecursion 100)
--
-- Class
--
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select distinct kingdom,phylum,class
	from tax
	where rank_id=220
	and class is not null
),
sql as (
	select 1 sort
		,'insert into class(class_phylum,classname)' txt

	union all

	select 2
		,'select phylumid,classname'

	union all

	select 3
		,'from phylum'

	union all

	select 4
		,'join kingdom on phylum_kingdom=kingdomid'

	union all

	select 5
		,'join (values'

	union all

	select 1000 + row_number() over(order by kingdom,phylum,class)
		,case when row_number() over(order by kingdom,phylum,class) > 1 then ',' else '' end
		+ '('''
		+ replace(kingdom,'''','''''')
		+ ''','''
		+ replace(phylum,'''','''''')
		+ ''','''
		+ replace(class,'''','''''')
		+ ''')'
	from x

	union all

	select 1000000
		,') x(kingdomname,phylumname,classname)'

	union all

	select 1000001
		,'on kingdom.kingdomname=x.kingdomname'

	union all

	select 1000002
		,'and phylum.phylumname=x.phylumname'
)
select txt
from sql
order by sort
option (maxrecursion 100)
--
-- Order
-- 
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select distinct kingdom,phylum,class,[order],family
	from tax
	where rank_id=220
	and family is not null
),
sql as (
	-- Family -> Order -> Class
	select 1 sort
		,'insert into family(family_ord,familyname)' txt

	union all

	select 2
		,'select ordid,familyname'

	union all

	select 3
		,'from ord'

	union all

	select 4
		,'join class on ord_class=classid'

	union all

	select 5
		,'join phylum on class_phylum=phylumid'

	union all

	select 6
		,'join kingdom on phylum_kingdom=kingdomid'

	union all

	select 7
		,'join (values'

	union all

	select 1000 + row_number() over(order by kingdom,phylum,class,[order],family)
		,case when row_number() over(order by kingdom,phylum,class,[order],family) > 1 then ',' else '' end
		+ '('''
		+ replace(kingdom,'''','''''')
		+ ''','''
		+ replace(phylum,'''','''''')
		+ ''','''
		+ replace(class,'''','''''')
		+ ''','''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''')'
	from x
	where [order] is not null
	and class is not null

	union all

	select 1000000
		,') x(kingdomname,phylumname,classname,ordname,familyname)'

	union all

	select 1000001
		,'on kingdom.kingdomname=x.kingdomname'

	union all

	select 1000002
		,'and phylum.phylumname=x.phylumname'

	union all

	select 1000003
		,'and class.classname=x.classname'

	union all

	select 1000004
		,'and ord.ordname=x.ordname'

	-- Family -> Order, but Order has no Class
	union all

	select 2000000
		,''

	union all

	select 2000001
		,'insert into family(family_ord,familyname)'

	union all

	select 2000002
		,'select ordid,familyname'

	union all

	select 2000003
		,'from ord'

	union all

	select 2000004
		,'join (values'

	union all

	select 2001000 + row_number() over(order by [order],family)
		,case when row_number() over(order by [order],family) > 1 then ',' else '' end
		+ '('''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''')'
	from x
	where [order] is not null
	and class is null

	union all

	select 3000000
		,') x(ordname,familyname)'

	union all

	select 3000001
		,'on ord.ordname=x.ordname'

	union all

	select 3000002
		,'and ord.ord_class is null'

	-- Family has no Order
	union all

	select 4000000
		,''

	union all

	select 4000001
		,'insert into family(familyname)'

	union all

	select 4000002
		,'values'

	union all

	select 4001000 + row_number() over(order by kingdom,phylum,class,family)
		,case when row_number() over(order by kingdom,phylum,class,family) > 1 then ',' else '' end
		+ '('''
		+ replace(family,'''','''''')
		+ ''')'
	from x
	where [order] is null
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
--
-- Genus 1,000 rows at time
--
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select distinct kingdom,phylum,class,[order],family,genus
	from tax
	where rank_id=220
	and genus is not null
),
y as (
	select *
		,case
			when family is null then 4
			when [order] is null then 3
			when class is null then 2
			else 1
		end typ
	from x
),
z as (
	select *
		,row_number() over(
			partition by typ
			order by kingdom,phylum,class,[order],family,genus
		) rn
	from y
),
sql as (
	-- Normal hierarchy
	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 10 sort
		,'insert into genus(genus_family,genusname)' txt
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 20
		,'select familyid,genusname'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 30
		,'from family'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 40
		,'join ord on family_ord=ordid'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 50
		,'join class on ord_class=classid'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 60
		,'join phylum on class_phylum=phylumid'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 70
		,'join kingdom on phylum_kingdom=kingdomid'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 80
		,'join (values'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(kingdom,'''','''''')
		+ ''','''
		+ replace(phylum,'''','''''')
		+ ''','''
		+ replace(class,'''','''''')
		+ ''','''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''')'
	from z
	where typ=1

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5000
		,') x(kingdomname,phylumname,classname,ordname,familyname,genusname)'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5010
		,'on kingdom.kingdomname=x.kingdomname'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5020
		,'and phylum.phylumname=x.phylumname'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5030
		,'and class.classname=x.classname'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5040
		,'and ord.ordname=x.ordname'
	from z
	where typ=1
	and (rn-1)%1000=0

	union all

	select typ * 100000000
		+ ((rn-1)/1000) * 100000
		+ 5050
		,'and family.familyname=x.familyname'
	from z
	where typ=1
	and (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
--
-- Species 1,000 rows at a time
--
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select kingdom
		,phylum
		,class
		,[order]
		,family
		,genus
		,species
		,row_number() over(
			order by kingdom,phylum,class,[order],family,genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is not null
	and [order] is not null
	and class is not null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join family on genus_family=familyid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join ord on family_ord=ordid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 60
		,'join class on ord_class=classid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 70
		,'join phylum on class_phylum=phylumid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 80
		,'join kingdom on phylum_kingdom=kingdomid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 90
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(kingdom,'''','''''')
		+ ''','''
		+ replace(phylum,'''','''''')
		+ ''','''
		+ replace(class,'''','''''')
		+ ''','''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(kingdomname,phylumname,classname,ordname,familyname,genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on kingdom.kingdomname=x.kingdomname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and phylum.phylumname=x.phylumname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and class.classname=x.classname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'and ord.ordname=x.ordname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5050
		,'and family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5060
		,'and genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
use ITIS
--
-- Species with class missing
--
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select [order]
		,family
		,genus
		,row_number() over(
			order by [order],family,genus
		) rn
	from (
		select distinct [order],family,genus
		from tax
		where rank_id=220
		and genus is not null
		and family is not null
		and [order] is not null
		and class is null
	) a
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into genus(genus_family,genusname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select familyid,genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from family'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join ord on family_ord=ordid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(ordname,familyname,genusname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on ord.ordname=x.ordname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and ord.ord_class is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
--
-- Species with Order missing
--
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select family
		,genus
		,row_number() over(order by family,genus) rn
	from (
		select distinct family,genus
		from tax
		where rank_id=220
		and genus is not null
		and family is not null
		and [order] is null
	) a
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into genus(genus_family,genusname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select familyid,genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from family'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(familyname,genusname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and family.family_ord is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
--
-- Species with family missing
--


;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select genus
		,row_number() over(order by genus) rn
	from (
		select distinct genus
		from tax
		where rank_id=220
		and genus is not null
		and family is null
	) a
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into genus(genusname) values' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(genus,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma axanthum')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma brassicae')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma cavigenitalium')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma equifetale')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma granularum')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma hippikon')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma laidlawii')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma modicum')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma morum')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma multilocale')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma oculi')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma palmae')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma parvum')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma pleciae')
,('Acholeplasmatales','Acholeplasmataceae','Acholeplasma','Acholeplasma vituli')
,('Acidobacteriales','Acidobacteriaceae','Acidobacterium','Acidobacterium capsulatum')
,('Acidobacteriales','Acidobacteriaceae','Bryocella','Bryocella elongata')
,('Acidobacteriales','Acidobacteriaceae','Edaphobacter','Edaphobacter aggregans')
,('Acidobacteriales','Acidobacteriaceae','Edaphobacter','Edaphobacter modestus')
,('Acidobacteriales','Acidobacteriaceae','Granulicella','Granulicella aggregans')
,('Acidobacteriales','Acidobacteriaceae','Granulicella','Granulicella paludicola')
,('Acidobacteriales','Acidobacteriaceae','Granulicella','Granulicella pectinivorans')
,('Acidobacteriales','Acidobacteriaceae','Granulicella','Granulicella rosea')
,('Acidobacteriales','Acidobacteriaceae','Telmatobacter','Telmatobacter bradus')
,('Acidobacteriales','Acidobacteriaceae','Terriglobus','Terriglobus roseus')
,('Acidobacteriales','Acidobacteriaceae','Terriglobus','Terriglobus saanensis')
,('Actinomycetales','Acidothermaceae','Acidothermus','Acidothermus cellulolyticus')
,('Actinomycetales','Actinomycetaceae','Actinobaculum','Actinobaculum massiliense')
,('Actinomycetales','Actinomycetaceae','Actinobaculum','Actinobaculum schaalii')
,('Actinomycetales','Actinomycetaceae','Actinobaculum','Actinobaculum suis')
,('Actinomycetales','Actinomycetaceae','Actinobaculum','Actinobaculum urinale')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces bovis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces bowdenii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces canis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces cardiffensis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces catuli')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces coleocanis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces dentalis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces denticolens')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces europaeus')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces funkei')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces georgiae')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces gerencseriae')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces graevenitzii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces hominis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces hongkongensis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces hordeovulneris')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces howellii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces hyovaginalis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces israelii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces johnsonii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces marimammalium')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces massiliensis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces meyeri')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces naeslundii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces nasicola')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces naturae')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces odontolyticus')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces oricola')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces oris')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces radicidentis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces radingae')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces ruminicola')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces slackii')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces suimastitidis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces timonensis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces turicensis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces urogenitalis')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces vaccimaxillae')
,('Actinomycetales','Actinomycetaceae','Actinomyces','Actinomyces viscosus')
,('Actinomycetales','Actinomycetaceae','Arcanobacterium','Arcanobacterium haemolyticum')
,('Actinomycetales','Actinomycetaceae','Arcanobacterium','Arcanobacterium hippocoleae')
,('Actinomycetales','Actinomycetaceae','Arcanobacterium','Arcanobacterium phocae')
,('Actinomycetales','Actinomycetaceae','Arcanobacterium','Arcanobacterium pluranimalium')
,('Actinomycetales','Actinomycetaceae','Mobiluncus','Mobiluncus curtisii')
,('Actinomycetales','Actinomycetaceae','Mobiluncus','Mobiluncus mulieris')
,('Actinomycetales','Actinomycetaceae','Trueperella','Trueperella abortisuis')
,('Actinomycetales','Actinomycetaceae','Trueperella','Trueperella bernardiae')
,('Actinomycetales','Actinomycetaceae','Trueperella','Trueperella bialowiezense')
,('Actinomycetales','Actinomycetaceae','Trueperella','Trueperella bonasi')
,('Actinomycetales','Actinomycetaceae','Trueperella','Trueperella pyogenes')
,('Actinomycetales','Actinomycetaceae','Varibaculum','Varibaculum cambriense')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora alba')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora erythraea')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora halophila')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora iraqiensis')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora mortivallis')
,('Actinomycetales','Actinopolysporaceae','Actinopolyspora','Actinopolyspora xinjiangensis')
,('Actinomycetales','Actinospicaceae','Actinospica','Actinospica acidiphila')
,('Actinomycetales','Actinospicaceae','Actinospica','Actinospica robiniae')
,('Actinomycetales','Beutenbergiaceae','Beutenbergia','Beutenbergia cavernae')
,('Actinomycetales','Beutenbergiaceae','Miniimonas','Miniimonas arenae')
,('Actinomycetales','Beutenbergiaceae','Salana','Salana multivorans')
,('Actinomycetales','Beutenbergiaceae','Serinibacter','Serinibacter salmoneus')
,('Actinomycetales','Bogoriellaceae','Bogoriella','Bogoriella caseilytica')
,('Actinomycetales','Bogoriellaceae','Georgenia','Georgenia halophila')
,('Actinomycetales','Bogoriellaceae','Georgenia','Georgenia muralis')
,('Actinomycetales','Bogoriellaceae','Georgenia','Georgenia ruanii')
,('Actinomycetales','Bogoriellaceae','Georgenia','Georgenia soli')
,('Actinomycetales','Bogoriellaceae','Georgenia','Georgenia thermotolerans')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium album')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium antiquum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium aurantiacum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium avium')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium casei')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium celere')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium epidermidis')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium frigoritolerans')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium halotolerans')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium iodinum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium linens')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium luteolum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium marinum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium massiliense')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium mcbrellneri')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium oceani')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium otitidis')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium paucivorans')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium permense')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium picturae')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium pityocampae')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium ravenspurgense')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium salitolerans')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium samyangense')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium sandarakinum')
,('Actinomycetales','Brevibacteriaceae','Brevibacterium','Brevibacterium sanguinis')
,('Actinomycetales','Catenulisporaceae','Catenulispora','Catenulispora acidiphila')
,('Actinomycetales','Catenulisporaceae','Catenulispora','Catenulispora rubra')
,('Actinomycetales','Catenulisporaceae','Catenulispora','Catenulispora subtropica')
,('Actinomycetales','Catenulisporaceae','Catenulispora','Catenulispora yoronensis')
,('Actinomycetales','Cellulomonadaceae','Actinotalea','Actinotalea fermentans')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas aerilata')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas biazotea')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas bogoriensis')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas cellasea')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas chitinilytica')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas composti')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas denverensis')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas fimi')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas flavigena')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas gelida')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas hominis')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas humilata')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas iranensis')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas persica')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas phragmiteti')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas terrae')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas uda')
,('Actinomycetales','Cellulomonadaceae','Cellulomonas','Cellulomonas xylanilytica')
,('Actinomycetales','Cellulomonadaceae','Oerskovia','Oerskovia enterophila')
,('Actinomycetales','Cellulomonadaceae','Oerskovia','Oerskovia jenensis')
,('Actinomycetales','Cellulomonadaceae','Oerskovia','Oerskovia paurometabola')
,('Actinomycetales','Cellulomonadaceae','Oerskovia','Oerskovia turbata')
,('Actinomycetales','Cellulomonadaceae','Paraoerskovia','Paraoerskovia marina')
,('Actinomycetales','Cellulomonadaceae','Tropheryma','Tropheryma whipplei')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium accolens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium afermentans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ammoniagenes')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium amycolatum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium appendicis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium aquilae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium argentoratense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium atypicum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium aurimucosum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium auris')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium auriscanis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium beticola')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium bovis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium callunae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium camporealensis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium canis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium capitovis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium casei')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium caspium')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ciconiae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium confusum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium coyleae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium cystitidis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium deserti')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium diphtheriae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium doosanense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium durum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium efficiens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium falsenii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium felinum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium flavescens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium freiburgense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium freneyi')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium glaucum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium glucuronolyticum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium glutamicum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium halotolerans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium hansenii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium humireducens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ilicis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium imitans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium jeikeium')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium kroppenstedtii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium kutscheri')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium lipophiloflavum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium lubricantis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium macginleyi')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium marinum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium maris')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium massiliense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium mastitidis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium matruchotii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium minutissimum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium mucifaciens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium mustelae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium mycetoides')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium nuruki')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium phocae')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium pilbarense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium pilosum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium propinquum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium pseudodiphtheriticum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium pseudotuberculosis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium pyruviciproducens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium renale')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium resistens')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium riegelii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium simulans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium singulare')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium sphenisci')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium spheniscorum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium sputi')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium stationis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium striatum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium suicordis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium sundsvallense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium terpenotabidum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium testudinoris')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium thomssenii')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium timonense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium tuberculostearicum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium tuscaniense')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ulcerans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ulceribovis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium urealyticum')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium ureicelerivorans')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium variabile')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium vitaeruminis')
,('Actinomycetales','Corynebacteriaceae','Corynebacterium','Corynebacterium xerosis')
,('Actinomycetales','Corynebacteriaceae','Turicella','Turicella otitidis')
,('Actinomycetales','Cryptosporangiaceae','Cryptosporangium','Cryptosporangium arvum')
,('Actinomycetales','Cryptosporangiaceae','Cryptosporangium','Cryptosporangium aurantiacum')
,('Actinomycetales','Cryptosporangiaceae','Cryptosporangium','Cryptosporangium japonicum')
,('Actinomycetales','Cryptosporangiaceae','Cryptosporangium','Cryptosporangium minutisporangium')
,('Actinomycetales','Cryptosporangiaceae','Fodinicola','Fodinicola feengrottensis')
,('Actinomycetales','Demequinaceae','Demequina','Demequina aestuarii')
,('Actinomycetales','Demequinaceae','Demequina','Demequina aurantiaca')
,('Actinomycetales','Demequinaceae','Demequina','Demequina globuliformis')
,('Actinomycetales','Demequinaceae','Demequina','Demequina lutea')
,('Actinomycetales','Demequinaceae','Demequina','Demequina oxidasica')
,('Actinomycetales','Demequinaceae','Demequina','Demequina salsinemoris')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium alimentarium')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium conglomeratum')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium faecium')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium fresconis')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium muris')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium nesterenkovii')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium paraconglomeratum')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium phenoliresistens')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium rhamnosum')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium sacelli')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium saurashtrense')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium squillarum')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium tyrofermentans')
,('Actinomycetales','Dermabacteraceae','Brachybacterium','Brachybacterium zhongshanense')
,('Actinomycetales','Dermabacteraceae','Dermabacter','Dermabacter hominis')
,('Actinomycetales','Dermabacteraceae','Devriesea','Devriesea agamarum')
,('Actinomycetales','Dermabacteraceae','Helcobacillus','Helcobacillus massiliensis')
,('Actinomycetales','Dermacoccaceae','Branchiibius','Branchiibius hedensis')
,('Actinomycetales','Dermacoccaceae','Calidifontibacter','Calidifontibacter indicus')
,('Actinomycetales','Dermacoccaceae','Demetria','Demetria terragena')
,('Actinomycetales','Dermacoccaceae','Dermacoccus','Dermacoccus abyssi')
,('Actinomycetales','Dermacoccaceae','Dermacoccus','Dermacoccus barathri')
,('Actinomycetales','Dermacoccaceae','Dermacoccus','Dermacoccus nishinomiyaensis')
,('Actinomycetales','Dermacoccaceae','Dermacoccus','Dermacoccus profundi')
,('Actinomycetales','Dermacoccaceae','Flexivirga','Flexivirga alba')
,('Actinomycetales','Dermacoccaceae','Kytococcus','Kytococcus aerolatus')
,('Actinomycetales','Dermacoccaceae','Kytococcus','Kytococcus schroeteri')
,('Actinomycetales','Dermacoccaceae','Kytococcus','Kytococcus sedentarius')
,('Actinomycetales','Dermacoccaceae','Luteipulveratus','Luteipulveratus mongoliensis')
,('Actinomycetales','Dermacoccaceae','Yimella','Yimella lutea')
,('Actinomycetales','Dermatophilaceae','Austwickia','Austwickia chelonae')
,('Actinomycetales','Dermatophilaceae','Dermatophilus','Dermatophilus congolensis')
,('Actinomycetales','Dermatophilaceae','Kineosphaera','Kineosphaera limosa')
,('Actinomycetales','Dermatophilaceae','Mobilicoccus','Mobilicoccus pelagius')
,('Actinomycetales','Dermatophilaceae','Piscicoccus','Piscicoccus intestinalis')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia aerolata')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia alimentaria')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia aurantiaca')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia cercidiphylli')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia cinnamea')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia kunjamensis')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia lutea')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia maris')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia natronolimnaea')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia papillomatosis')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia psychralcaliphila')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia schimae')
,('Actinomycetales','Dietziaceae','Dietzia','Dietzia timorensis')
,('Actinomycetales','Frankiaceae','Frankia','Frankia alni')
,('Actinomycetales','Geodermatophilaceae','Blastococcus','Blastococcus aggregatus')
,('Actinomycetales','Geodermatophilaceae','Blastococcus','Blastococcus jejuensis')
,('Actinomycetales','Geodermatophilaceae','Blastococcus','Blastococcus saxobsidens')
,('Actinomycetales','Geodermatophilaceae','Geodermatophilus','Geodermatophilus obscurus')
,('Actinomycetales','Geodermatophilaceae','Geodermatophilus','Geodermatophilus ruber')
,('Actinomycetales','Geodermatophilaceae','Modestobacter','Modestobacter marinus')
,('Actinomycetales','Geodermatophilaceae','Modestobacter','Modestobacter multiseptatus')
,('Actinomycetales','Geodermatophilaceae','Modestobacter','Modestobacter versicolor')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces algeriensis')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces arizonensis')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces endophyticus')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces harbinensis')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces lechevalierae')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces mayteni')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces rutgersensis')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces sambucus')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces scopariae')
,('Actinomycetales','Glycomycetaceae','Glycomyces','Glycomyces tenuis')
,('Actinomycetales','Glycomycetaceae','Haloglycomyces','Haloglycomyces albus')
,('Actinomycetales','Glycomycetaceae','Stackebrandtia','Stackebrandtia albiflava')
,('Actinomycetales','Glycomycetaceae','Stackebrandtia','Stackebrandtia nassauensis')
,('Actinomycetales','Intrasporangiaceae','Aquipuribacter','Aquipuribacter hungaricus')
,('Actinomycetales','Intrasporangiaceae','Arsenicicoccus','Arsenicicoccus bolidensis')
,('Actinomycetales','Intrasporangiaceae','Arsenicicoccus','Arsenicicoccus piscis')
,('Actinomycetales','Intrasporangiaceae','Fodinibacter','Fodinibacter luteus')
,('Actinomycetales','Intrasporangiaceae','Humibacillus','Humibacillus xanthopallidus')
,('Actinomycetales','Intrasporangiaceae','Intrasporangium','Intrasporangium calvum')
,('Actinomycetales','Intrasporangiaceae','Intrasporangium','Intrasporangium chromatireducens')
,('Actinomycetales','Intrasporangiaceae','Intrasporangium','Intrasporangium mesophilum')
,('Actinomycetales','Intrasporangiaceae','Intrasporangium','Intrasporangium oryzae')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter anophelis')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter corallicola')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter hoylei')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter limosus')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter melonis')
,('Actinomycetales','Intrasporangiaceae','Janibacter','Janibacter terrae')
,('Actinomycetales','Intrasporangiaceae','Knoellia','Knoellia aerolata')
,('Actinomycetales','Intrasporangiaceae','Knoellia','Knoellia flava')
,('Actinomycetales','Intrasporangiaceae','Knoellia','Knoellia locipacati')
,('Actinomycetales','Intrasporangiaceae','Knoellia','Knoellia sinensis')
,('Actinomycetales','Intrasporangiaceae','Knoellia','Knoellia subterranea')
,('Actinomycetales','Intrasporangiaceae','Kribbia','Kribbia dieselivorans')
,('Actinomycetales','Intrasporangiaceae','Lapillicoccus','Lapillicoccus jejuensis')
,('Actinomycetales','Intrasporangiaceae','Marihabitans','Marihabitans asiaticum')
,('Actinomycetales','Intrasporangiaceae','Ornithinibacter','Ornithinibacter aureus')
,('Actinomycetales','Intrasporangiaceae','Ornithinicoccus','Ornithinicoccus hortensis')
,('Actinomycetales','Intrasporangiaceae','Ornithinimicrobium','Ornithinimicrobium humiphilum')
,('Actinomycetales','Intrasporangiaceae','Ornithinimicrobium','Ornithinimicrobium kibberense')
,('Actinomycetales','Intrasporangiaceae','Ornithinimicrobium','Ornithinimicrobium pekingense')
,('Actinomycetales','Intrasporangiaceae','Oryzihumus','Oryzihumus leptocrescens')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus aerophilus')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus bigeumensis')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus cremeus')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus dokdonensis')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus ginsenosidimutans')
,('Actinomycetales','Intrasporangiaceae','Phycicoccus','Phycicoccus jejuensis')
,('Actinomycetales','Intrasporangiaceae','Serinicoccus','Serinicoccus chungangensis')
,('Actinomycetales','Intrasporangiaceae','Serinicoccus','Serinicoccus marinus')
,('Actinomycetales','Intrasporangiaceae','Serinicoccus','Serinicoccus profundi')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter aeriphilus')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter aerolatus')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter carboxydivorans')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter ginsenosidimutans')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter lapilli')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter terrae')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter terrigena')
,('Actinomycetales','Intrasporangiaceae','Terrabacter','Terrabacter tumescens')
,('Actinomycetales','Intrasporangiaceae','Terracoccus','Terracoccus luteus')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera australiensis')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera duodecadis')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera elongata')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera japonica')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera jenkinsii')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera remsis')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera vanveenii')
,('Actinomycetales','Intrasporangiaceae','Tetrasphaera','Tetrasphaera veronensis')
,('Actinomycetales','Jiangellaceae','Haloactinopolyspora','Haloactinopolyspora alba')
,('Actinomycetales','Jiangellaceae','Jiangella','Jiangella alba')
,('Actinomycetales','Jiangellaceae','Jiangella','Jiangella alkaliphila')
,('Actinomycetales','Jiangellaceae','Jiangella','Jiangella gansuensis')
,('Actinomycetales','Jiangellaceae','Jiangella','Jiangella muralis')
,('Actinomycetales','Jonesiaceae','Jonesia','Jonesia denitrificans')
,('Actinomycetales','Jonesiaceae','Jonesia','Jonesia quinghaiensis')
,('Actinomycetales','Kineosporiaceae','Angustibacter','Angustibacter luteus')
,('Actinomycetales','Kineosporiaceae','Kineococcus','Kineococcus aurantiacus')
,('Actinomycetales','Kineosporiaceae','Kineococcus','Kineococcus gynurae')
,('Actinomycetales','Kineosporiaceae','Kineococcus','Kineococcus radiotolerans')
,('Actinomycetales','Kineosporiaceae','Kineococcus','Kineococcus rhizosphaerae')
,('Actinomycetales','Kineosporiaceae','Kineococcus','Kineococcus xinjiangensis')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia aurantiaca')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia babensis')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia mesophila')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia mikuniensis')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia rhamnosa')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia rhizophila')
,('Actinomycetales','Kineosporiaceae','Kineosporia','Kineosporia succinea')
,('Actinomycetales','Kineosporiaceae','Pseudokineococcus','Pseudokineococcus lusitanus')
,('Actinomycetales','Kineosporiaceae','Pseudokineococcus','Pseudokineococcus marinus')
,('Actinomycetales','Kineosporiaceae','Quadrisphaera','Quadrisphaera granulorum')
,('Actinomycetales','Microbacteriaceae','Agreia','Agreia bicolorata')
,('Actinomycetales','Microbacteriaceae','Agreia','Agreia pratensis')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus baldri')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus carbonis')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus casei')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus citreus')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus jejuensis')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus jenensis')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus lahaulensis')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus terreus')
,('Actinomycetales','Microbacteriaceae','Agrococcus','Agrococcus versicolor')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces albus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces allii')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces atrinae')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces aurantiacus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces bauzanensis')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces bracchium')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces cerinus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces flavus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces fucosus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces hippuratus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces humatus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces italicus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces lapidis')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces luteolus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces mediolanus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces neolithicus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces ramosus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces rhizospherae')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces salentinus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces soli')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces subbeticus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces terreus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces tropicus')
,('Actinomycetales','Microbacteriaceae','Agromyces','Agromyces ulmi')
,('Actinomycetales','Microbacteriaceae','Amnibacterium','Amnibacterium kyonggiense')
,('Actinomycetales','Microbacteriaceae','Bactoderma','Bactoderma alba')
,('Actinomycetales','Microbacteriaceae','Bactoderma','Bactoderma rosea')
,('Actinomycetales','Microbacteriaceae','Chryseoglobus','Chryseoglobus frigidaquae')
,('Actinomycetales','Microbacteriaceae','Clavibacter','Clavibacter michiganensis')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium arcticum')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium flavum')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium luteum')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium mesophilum')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium psychrophilum')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium psychrotolerans')
,('Actinomycetales','Microbacteriaceae','Cryobacterium','Cryobacterium roopkundense')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium albidum')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium ammoniigenes')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium citreum')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium flaccumfaciens')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium ginsengisoli')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium herbarum')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium luteum')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium plantarum')
,('Actinomycetales','Microbacteriaceae','Curtobacterium','Curtobacterium pusillum')
,('Actinomycetales','Microbacteriaceae','Frigoribacterium','Frigoribacterium faeni')
,('Actinomycetales','Microbacteriaceae','Frigoribacterium','Frigoribacterium mesophilum')
,('Actinomycetales','Microbacteriaceae','Frondihabitans','Frondihabitans australicus')
,('Actinomycetales','Microbacteriaceae','Frondihabitans','Frondihabitans cladoniiphilus')
,('Actinomycetales','Microbacteriaceae','Frondihabitans','Frondihabitans peucedani')
,('Actinomycetales','Microbacteriaceae','Glaciibacter','Glaciibacter superstes')
,('Actinomycetales','Microbacteriaceae','Gulosibacter','Gulosibacter chungangensis')
,('Actinomycetales','Microbacteriaceae','Gulosibacter','Gulosibacter molinativorax')
,('Actinomycetales','Microbacteriaceae','Herbiconiux','Herbiconiux flava')
,('Actinomycetales','Microbacteriaceae','Herbiconiux','Herbiconiux ginsengi')
,('Actinomycetales','Microbacteriaceae','Herbiconiux','Herbiconiux moechotypicola')
,('Actinomycetales','Microbacteriaceae','Herbiconiux','Herbiconiux solani')
,('Actinomycetales','Microbacteriaceae','Humibacter','Humibacter albus')
,('Actinomycetales','Microbacteriaceae','Klugiella','Klugiella xanthotipulae')
,('Actinomycetales','Microbacteriaceae','Labedella','Labedella gwakjiensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia antarctica')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia aquatica')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia bigeumensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia kafniensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia kribbensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia lichenia')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia naganoensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia pindariensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia poae')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia psychrotolerans')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia rubra')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia shinshuensis')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia soli')
,('Actinomycetales','Microbacteriaceae','Leifsonia','Leifsonia xyli')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter aerolatus')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter albus')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter alluvii')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter aridicollis')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter celer')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter chironomi')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter chromiireducens')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter chromiiresistens')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter denitrificans')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter exalbidus')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter iarius')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter komagatae')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter luti')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter salsicius')
,('Actinomycetales','Microbacteriaceae','Leucobacter','Leucobacter tardus')
,('Actinomycetales','Microbacteriaceae','Marisediminicola','Marisediminicola antarctica')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium aerolatum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium agarici')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium aoyamense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium aquimaris')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium arabinogalactanolyticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium arborescens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium arthrosphaerae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium aurantiacum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium aurum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium awajiense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium azadirachtae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium barkeri')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium binotii')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium chocolatum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium deminutum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium dextranolyticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium esteraromaticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium flavescens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium flavum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium fluvii')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium foliorum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium ginsengisoli')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium ginsengiterrae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium gubbeenense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium halophilum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium halotolerans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium hatanonis')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium hominis')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium humi')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium hydrocarbonoxydans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium imperiale')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium indicum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium insulae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium invictum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium keratanolyticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium ketosireducens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium kitamiense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium koreense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium kribbense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium lacticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium lacus')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium laevaniformans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium lindanitolerans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium liquefaciens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium luteolum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium luticocti')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium marinilacus')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium maritypicum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium mitrae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium natoriense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium oleivorans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium oxydans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium paludicola')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium paraoxydans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium phyllosphaerae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium profundi')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium pseudoresistens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium pumilum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium pygmaeum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium radiodurans')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium resistens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium saperdae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium schleiferi')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium sediminicola')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium soli')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium suwonense')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium terrae')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium terregens')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium terricola')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium testaceum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium thalassium')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium trichothecenolyticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium ulmi')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium xylanilyticum')
,('Actinomycetales','Microbacteriaceae','Microbacterium','Microbacterium yannicii')
,('Actinomycetales','Microbacteriaceae','Microcella','Microcella alkaliphila')
,('Actinomycetales','Microbacteriaceae','Microcella','Microcella putealis')
,('Actinomycetales','Microbacteriaceae','Microterricola','Microterricola viridarii')
,('Actinomycetales','Microbacteriaceae','Mycetocola','Mycetocola lacteus')
,('Actinomycetales','Microbacteriaceae','Mycetocola','Mycetocola reblochoni')
,('Actinomycetales','Microbacteriaceae','Mycetocola','Mycetocola saprophilus')
,('Actinomycetales','Microbacteriaceae','Mycetocola','Mycetocola tolaasinivorans')
,('Actinomycetales','Microbacteriaceae','Okibacterium','Okibacterium fritillariae')
,('Actinomycetales','Microbacteriaceae','Phycicola','Phycicola gilvus')
,('Actinomycetales','Microbacteriaceae','Plantibacter','Plantibacter auratus')
,('Actinomycetales','Microbacteriaceae','Plantibacter','Plantibacter flavus')
,('Actinomycetales','Microbacteriaceae','Pseudoclavibacter','Pseudoclavibacter caeni')
,('Actinomycetales','Microbacteriaceae','Pseudoclavibacter','Pseudoclavibacter chungangensis')
,('Actinomycetales','Microbacteriaceae','Pseudoclavibacter','Pseudoclavibacter helvolus')
,('Actinomycetales','Microbacteriaceae','Pseudoclavibacter','Pseudoclavibacter soli')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter caricis')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter festucae')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter iranicus')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter rathayi')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter toxicus')
,('Actinomycetales','Microbacteriaceae','Rathayibacter','Rathayibacter tritici')
,('Actinomycetales','Microbacteriaceae','Rhodoglobus','Rhodoglobus aureus')
,('Actinomycetales','Microbacteriaceae','Rhodoglobus','Rhodoglobus vestalii')
,('Actinomycetales','Microbacteriaceae','Salinibacterium','Salinibacterium amurskyense')
,('Actinomycetales','Microbacteriaceae','Salinibacterium','Salinibacterium xinjiangense')
,('Actinomycetales','Microbacteriaceae','Schumannella','Schumannella luteola')
,('Actinomycetales','Microbacteriaceae','Stibiobacter','Stibiobacter senarmontii')
,('Actinomycetales','Microbacteriaceae','Subtercola','Subtercola boreus')
,('Actinomycetales','Microbacteriaceae','Subtercola','Subtercola frigoramans')
,('Actinomycetales','Microbacteriaceae','Yonghaparkia','Yonghaparkia alkaliphila')
,('Actinomycetales','Microbacteriaceae','Zimmermannella','Zimmermannella alba')
,('Actinomycetales','Microbacteriaceae','Zimmermannella','Zimmermannella bifida')
,('Actinomycetales','Microbacteriaceae','Zimmermannella','Zimmermannella faecalis')
,('Actinomycetales','Micrococcaceae','Acaricomes','Acaricomes phytoseiuli')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter agilis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter albidus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter albus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter alkaliphilus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter alpinus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter antarcticus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter ardleyensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter arilaitensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter aurescens')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter bergerei')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter castelli')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter chlorophenolicus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter citreus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter creatinolyticus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter cryoconiti')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter cryotolerans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter crystallopoietes')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter cumminsii')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter defluvii')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter echigonensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter equi')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter flavus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter gandavensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter gangotriensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter globiformis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter histidinolovorans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter humicola')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter ilicis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter kerguelensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter koreensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter livingstonensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter luteolus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter methylotrophus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter monumenti')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter mysorens')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter nasiphocae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter nicotianae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter nicotinovorans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter niigatensis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter nitroguajacolicus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter oryzae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter oxydans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter parietis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter pascens')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter phenanthrenivorans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter pigmenti')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter polychromogenes')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter protophormiae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter psychrochitiniphilus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter psychrolactophilus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter psychrophenolicus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter ramosus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter rhombi')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter roseus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter russicus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter sanguinis')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter scleromae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter soli')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter stackebrandtii')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter subterraneus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter sulfonivorans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter sulfureus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter tecti')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter tumbae')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter uratoxydans')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter ureafaciens')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter viscosus')
,('Actinomycetales','Micrococcaceae','Arthrobacter','Arthrobacter woluwensis')
,('Actinomycetales','Micrococcaceae','Auritidibacter','Auritidibacter ignavus')
,('Actinomycetales','Micrococcaceae','Citricoccus','Citricoccus alkalitolerans')
,('Actinomycetales','Micrococcaceae','Citricoccus','Citricoccus muralis')
,('Actinomycetales','Micrococcaceae','Citricoccus','Citricoccus nitrophenolicus')
,('Actinomycetales','Micrococcaceae','Citricoccus','Citricoccus parietis')
,('Actinomycetales','Micrococcaceae','Citricoccus','Citricoccus zhacaiensis')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria aegyptia')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria atrinae')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria carniphila')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria flava')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria gwangalliensis')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria halotolerans')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria himachalensis')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria koreensis')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria kristinae')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria marina')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria palustris')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria polaris')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria rhizophila')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria rosea')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria salsicia')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria turfanensis')
,('Actinomycetales','Micrococcaceae','Kocuria','Kocuria varians')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus antarcticus')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus endophyticus')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus flavus')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus lactis')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus luteus')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus lylae')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus terreus')
,('Actinomycetales','Micrococcaceae','Micrococcus','Micrococcus yunnanensis')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia aethiopica')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia alba')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia flava')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia halobia')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia halophila')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia halotolerans')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia jeotgali')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia lacusekhoensis')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia lutea')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia sandarakina')
,('Actinomycetales','Micrococcaceae','Nesterenkonia','Nesterenkonia xinjiangensis')
,('Actinomycetales','Micrococcaceae','Renibacterium','Renibacterium salmoninarum')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia aeria')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia amarae')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia dentocariosa')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia mucilaginosa')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia nasimurium')
,('Actinomycetales','Micrococcaceae','Rothia','Rothia terrae')
,('Actinomycetales','Micrococcaceae','Sinomonas','Sinomonas atrocyanea')
,('Actinomycetales','Micrococcaceae','Sinomonas','Sinomonas flava')
,('Actinomycetales','Micrococcaceae','Sinomonas','Sinomonas soli')
,('Actinomycetales','Micrococcaceae','Zhihengliuella','Zhihengliuella aestuarii')
,('Actinomycetales','Micrococcaceae','Zhihengliuella','Zhihengliuella alba')
,('Actinomycetales','Micrococcaceae','Zhihengliuella','Zhihengliuella halotolerans')
,('Actinomycetales','Micromonosporaceae','Actinaurispora','Actinaurispora siamensis')
,('Actinomycetales','Micromonosporaceae','Actinocatenispora','Actinocatenispora rupis')
,('Actinomycetales','Micromonosporaceae','Actinocatenispora','Actinocatenispora sera')
,('Actinomycetales','Micromonosporaceae','Actinocatenispora','Actinocatenispora thailandica')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes abujensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes auranticolor')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes brasiliensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes campanulatus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes capillaceus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes consettensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes couchii')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes cyaneus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes deccanensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes derwentensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes digitatis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes durhamensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes ferrugineus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes friuliensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes globisporus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes humidus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes ianthinogenes')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes italicus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes liguriensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes lobatus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes missouriensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes octamycinicus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes palleronii')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes philippinensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes rectilineatus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes regularis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes sichuanensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes teichomyceticus')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes tereljensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes toevensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes utahensis')
,('Actinomycetales','Micromonosporaceae','Actinoplanes','Actinoplanes xinjiangensis')
,('Actinomycetales','Micromonosporaceae','Allocatelliglobosispora','Allocatelliglobosispora scoriae')
,('Actinomycetales','Micromonosporaceae','Asanoa','Asanoa ferruginea')
,('Actinomycetales','Micromonosporaceae','Asanoa','Asanoa hainanensis')
,('Actinomycetales','Micromonosporaceae','Asanoa','Asanoa iriomotensis')
,('Actinomycetales','Micromonosporaceae','Asanoa','Asanoa ishikariensis')
,('Actinomycetales','Micromonosporaceae','Catellatospora','Catellatospora bangladeshensis')
,('Actinomycetales','Micromonosporaceae','Catellatospora','Catellatospora chokoriensis')
,('Actinomycetales','Micromonosporaceae','Catellatospora','Catellatospora citrea')
,('Actinomycetales','Micromonosporaceae','Catellatospora','Catellatospora coxensis')
,('Actinomycetales','Micromonosporaceae','Catellatospora','Catellatospora methionotrophica')
,('Actinomycetales','Micromonosporaceae','Catelliglobosispora','Catelliglobosispora koreensis')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes atrovinosus')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes castaneus')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes crispus')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes indicus')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes japonicus')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes nepalensis')
,('Actinomycetales','Micromonosporaceae','Catenuloplanes','Catenuloplanes niger')
,('Actinomycetales','Micromonosporaceae','Couchioplanes','Couchioplanes caeruleus')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium aurantiacum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium darangshiense')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium fulvum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium luridum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium luteum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium maewongense')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium matsuzakiense')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium roseum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium salmoneum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium thailandense')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium tropicum')
,('Actinomycetales','Micromonosporaceae','Dactylosporangium','Dactylosporangium vinaceum')
,('Actinomycetales','Micromonosporaceae','Hamadaea','Hamadaea tsunoensis')
,('Actinomycetales','Micromonosporaceae','Jishengella','Jishengella endophytica')
,('Actinomycetales','Micromonosporaceae','Krasilnikovia','Krasilnikovia cinnamomea')
,('Actinomycetales','Micromonosporaceae','Longispora','Longispora albida')
,('Actinomycetales','Micromonosporaceae','Longispora','Longispora fulva')
,('Actinomycetales','Micromonosporaceae','Luedemannella','Luedemannella flava')
,('Actinomycetales','Micromonosporaceae','Luedemannella','Luedemannella helvata')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora aurantiaca')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora auratinigra')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora carbonacea')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora chaiyaphumensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora chalcea')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora chersina')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora chokoriensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora citrea')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora coerulea')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora coriariae')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora coxensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora eburnea')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora echinaurantiaca')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora echinofusca')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora echinospora')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora endolithica')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora fulviviridis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora gallica')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora halophytica')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora humi')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora inositola')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora inyonensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora krabiensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora lupini')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora marina')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora matsumotoense')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora mirobrigensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora narathiwatensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora nigra')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora olivasterospora')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora pallida')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora pattaloongensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora peucetia')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora pisi')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora purpureochromogenes')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora rhizosphaerae')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora rifamycinica')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora rosaria')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora saelicesensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora sagamiensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora siamensis')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora tulbaghiae')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora viridifaciens')
,('Actinomycetales','Micromonosporaceae','Micromonospora','Micromonospora yangpuensis')
,('Actinomycetales','Micromonosporaceae','Phytohabitans','Phytohabitans suffuscus')
,('Actinomycetales','Micromonosporaceae','Phytomonospora','Phytomonospora endophytica')
,('Actinomycetales','Micromonosporaceae','Pilimelia','Pilimelia anulata')
,('Actinomycetales','Micromonosporaceae','Pilimelia','Pilimelia columellifera')
,('Actinomycetales','Micromonosporaceae','Pilimelia','Pilimelia terevasa')
,('Actinomycetales','Micromonosporaceae','Planosporangium','Planosporangium flavigriseum')
,('Actinomycetales','Micromonosporaceae','Planosporangium','Planosporangium mesophilum')
,('Actinomycetales','Micromonosporaceae','Plantactinospora','Plantactinospora mayteni')
,('Actinomycetales','Micromonosporaceae','Polymorphospora','Polymorphospora rubra')
,('Actinomycetales','Micromonosporaceae','Pseudosporangium','Pseudosporangium ferrugineum')
,('Actinomycetales','Micromonosporaceae','Rugosimonospora','Rugosimonospora acidiphila')
,('Actinomycetales','Micromonosporaceae','Rugosimonospora','Rugosimonospora africana')
,('Actinomycetales','Micromonosporaceae','Salinispora','Salinispora arenicola')
,('Actinomycetales','Micromonosporaceae','Salinispora','Salinispora tropica')
,('Actinomycetales','Micromonosporaceae','Spirilliplanes','Spirilliplanes yamanashiensis')
,('Actinomycetales','Micromonosporaceae','Verrucosispora','Verrucosispora gifhornensis')
,('Actinomycetales','Micromonosporaceae','Verrucosispora','Verrucosispora lutea')
,('Actinomycetales','Micromonosporaceae','Verrucosispora','Verrucosispora maris')
,('Actinomycetales','Micromonosporaceae','Verrucosispora','Verrucosispora sediminis')
,('Actinomycetales','Micromonosporaceae','Virgisporangium','Virgisporangium aliadipatigenens')
,('Actinomycetales','Micromonosporaceae','Virgisporangium','Virgisporangium aurantiacum')
,('Actinomycetales','Micromonosporaceae','Virgisporangium','Virgisporangium ochraceum')
,('Actinomycetales','Mycobacteriaceae','Amycolicicoccus','Amycolicicoccus subflavus')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium abscessus')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium africanum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium agri')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium aichiense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium algericum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium alvei')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium aromaticivorans')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium arosiense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium arupense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium asiaticum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium aubagnense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium aurum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium austroafricanum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium avium')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium boenickei')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium bohemicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium botniense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium bouchedurhonense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium bovis')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium branderi')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium brisbanense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium brumae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium canariasense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium caprae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium celatum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium chelonae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium chimaera')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium chitae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium chlorophenolicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium chubuense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium colombiense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium conceptionense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium confluentis')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium conspicuum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium cookii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium cosmeticum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium crocinum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium diernhoferi')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium doricum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium duvalii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium elephantis')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium europaeum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium fallax')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium farcinogenes')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium flavescens')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium florentinum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium fluoranthenivorans')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium fortuitum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium frederiksbergense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium gadium')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium gastri')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium genavense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium gilvum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium goodii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium gordonae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium haemophilum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium hassiacum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium heckeshornense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium heidelbergense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium hiberniae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium hodleri')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium holsaticum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium houstonense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium immunogenum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium insubricum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium interjectum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium intermedium')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium intracellulare')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium kansasii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium komossense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium koreense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium kubicae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium kumamotonense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium kyorinense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium lacus')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium lentiflavum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium leprae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium lepraemurium')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium litorale')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium llatzerense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium madagascariense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium mageritense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium malmoense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium mantenii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium marinum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium marseillense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium microti')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium monacense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium montefiorense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium moriokaense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium mucogenicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium murale')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium nebraskense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium neoaurum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium neworleansense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium nonchromogenicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium noviomagense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium novocastrense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium obuense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium pallens')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium palustre')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium paraffinicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium parafortuitum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium parascrofulaceum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium paraseoulense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium parmense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium peregrinum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium phlei')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium phocaicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium pinnipedii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium porcinum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium poriferae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium pseudoshottsii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium psychrotolerans')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium pulveris')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium pyrenivorans')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium rhodesiae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium riyadhense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium rufum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium rutilum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium salmoniphilum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium saskatchewanense')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium scrofulaceum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium senegalense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium senuense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium seoulense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium septicum')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium setense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium sherrisii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium shimoidei')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium shinjukuense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium shottsii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium simiae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium smegmatis')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium sphagni')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium stomatepiae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium szulgai')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium terrae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium thermoresistibile')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium timonense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium tokaiense')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium triplex')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium triviale')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium tuberculosis')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium tusciae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium ulcerans')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium vaccae')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium vanbaalenii')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium vulneris')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium wolinskyi')
,('Actinomycetales','Mycobacteriaceae','Mycobacterium','Mycobacterium xenopi')
,('Actinomycetales','Nakamurellaceae','Humicoccus','Humicoccus flavidus')
,('Actinomycetales','Nakamurellaceae','Nakamurella','Nakamurella multipartita')
,('Actinomycetales','Nakamurellaceae','Saxeibacter','Saxeibacter lacteus')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia aichiensis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia alkanivorans')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia amarae')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia amicalis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia araii')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia bronchialis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia cholesterolivorans')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia defluvii')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia desulfuricans')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia effusa')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia hankookensis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia hirsuta')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia humi')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia hydrophobica')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia kroppenstedtii')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia lacunae')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia malaquae')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia namibiensis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia neofelifaecis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia otitidis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia paraffinivorans')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia polyisoprenivorans')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia rhizosphera')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia rubripertincta')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia shandongensis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia sihwensis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia sinesedis')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia soli')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia sputi')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia terrae')
,('Actinomycetales','Nocardiaceae','Gordonia','Gordonia westfalica')
,('Actinomycetales','Nocardiaceae','Micropolyspora','Micropolyspora internatus')
,('Actinomycetales','Nocardiaceae','Millisia','Millisia brevis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia abscessus')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia acidivorans')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia africana')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia alba')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia altamirensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia amamiensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia anaemiae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia aobensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia araoensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia artemisiae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia arthritidis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia asiatica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia asteroides')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia beijingensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia blacklockiae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia brasiliensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia brevicatena')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia caishijiensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia callitridis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia carnea')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia cerradoensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia coeliaca')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia concava')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia coubleae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia crassostreae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia cummidelens')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia cyriacigeorgica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia elegans')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia endophytica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia exalbida')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia farcinica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia flavorosea')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia fluminea')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia gamkensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia globerula')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia goodfellowii')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia grenadensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia harenae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia higoensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia ignorata')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia inohanensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia iowensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia jejuensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia jiangxiensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia jinanensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia kruczakiae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia lijiangensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia mexicana')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia mikamii')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia miyunensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia neocaledoniensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia niigatensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia ninae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia niwae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia nova')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia otitidiscaviarum')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia paucivorans')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia pigrifrangens')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia pneumoniae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia polyresistens')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia pseudobrasiliensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia pseudovaccinii')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia puris')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia rhamnosiphila')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia salmonicida')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia seriolae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia shimofusensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia sienata')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia soli')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia speluncae')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia takedensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia tenerifensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia terpenica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia testacea')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia thailandica')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia thraciensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia transvalensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia uniformis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia vaccinii')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia vermiculata')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia veterana')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia vinacea')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia wallacei')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia xishanensis')
,('Actinomycetales','Nocardiaceae','Nocardia','Nocardia yamanashiensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus aetherivorans')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus artemisiae')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus baikonurensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus coprophilus')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus corynebacterioides')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus equi')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus erythropolis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus fascians')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus globerulus')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus gordoniae')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus imtechensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus jialingiae')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus jostii')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus koreensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus kroppenstedtii')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus kunmingensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus kyotonensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus maanshanensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus marinonascens')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus opacus')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus percolatus')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus phenolicus')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus pyridinivorans')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus qingshengii')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus rhodnii')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus rhodochrous')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus ruber')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus triatomae')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus tukisamuensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus wratislaviensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus yunnanensis')
,('Actinomycetales','Nocardiaceae','Rhodococcus','Rhodococcus zopfii')
,('Actinomycetales','Nocardiaceae','Skermania','Skermania piniformis')
,('Actinomycetales','Nocardiaceae','Smaragdicoccus','Smaragdicoccus niigatensis')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia deligens')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia faeni')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia limnetica')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia marianensis')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia maris')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia muralis')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia phyllosphaerae')
,('Actinomycetales','Nocardiaceae','Williamsia','Williamsia serinedens')
,('Actinomycetales','Nocardioidaceae','Actinopolymorpha','Actinopolymorpha alba')
,('Actinomycetales','Nocardioidaceae','Actinopolymorpha','Actinopolymorpha cephalotaxi')
,('Actinomycetales','Nocardioidaceae','Actinopolymorpha','Actinopolymorpha pittospori')
,('Actinomycetales','Nocardioidaceae','Actinopolymorpha','Actinopolymorpha rutila')
,('Actinomycetales','Nocardioidaceae','Actinopolymorpha','Actinopolymorpha singaporensis')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium alkaliterrae')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium erythreum')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium fastidiosum')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium flavum')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium ginsengisoli')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium halocynthiae')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium marinum')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium panaciterrae')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium ponti')
,('Actinomycetales','Nocardioidaceae','Aeromicrobium','Aeromicrobium tamlense')
,('Actinomycetales','Nocardioidaceae','Flindersiella','Flindersiella endophytica')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella alba')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella aluminosa')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella amoyensis')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella antibiotica')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella catacumbae')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella flavida')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella ginsengisoli')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella hippodromi')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella jejuensis')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella karoonensis')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella koreensis')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella lupini')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella sancticallisti')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella sandramycini')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella solani')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella swartbergensis')
,('Actinomycetales','Nocardioidaceae','Kribbella','Kribbella yunnanensis')
,('Actinomycetales','Nocardioidaceae','Marmoricola','Marmoricola aequoreus')
,('Actinomycetales','Nocardioidaceae','Marmoricola','Marmoricola aurantiacus')
,('Actinomycetales','Nocardioidaceae','Marmoricola','Marmoricola bigeumensis')
,('Actinomycetales','Nocardioidaceae','Marmoricola','Marmoricola korecus')
,('Actinomycetales','Nocardioidaceae','Marmoricola','Marmoricola scoriae')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides aestuarii')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides agariphilus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides albus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides alkalitolerans')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides alpinus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides aquaticus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides aquiterrae')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides aromaticivorans')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides basaltis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides bigeumensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides caeni')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides caricicola')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides daedukensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides daejeonensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides daphniae')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides dilutus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides dokdonensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides dubius')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides exalbidus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides fonticola')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides furvisabuli')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides ganghwensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides ginsengagri')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides ginsengisegetis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides ginsengisoli')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides halotolerans')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides hankookensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides humi')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides hungaricus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides hwasunensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides insulae')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides iriomotensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides islandensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides jensenii')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides kongjuensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides koreensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides kribbensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides lentus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides luteus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides maradonensis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides marinisabuli')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides marinus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides mesophilus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides nitrophenolicus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides oleivorans')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides panacihumi')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides panacisoli')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides plantarum')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides pyridinolyticus')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides salarius')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides sediminis')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides simplex')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides terrae')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides terrigena')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides tritolerans')
,('Actinomycetales','Nocardioidaceae','Nocardioides','Nocardioides ultimimeridianus')
,('Actinomycetales','Nocardioidaceae','Thermasporomyces','Thermasporomyces composti')
,('Actinomycetales','Nocardiopsaceae','Haloactinospora','Haloactinospora alba')
,('Actinomycetales','Nocardiopsaceae','Marinactinospora','Marinactinospora thermotolerans')
,('Actinomycetales','Nocardiopsaceae','Murinocardiopsis','Murinocardiopsis flavida')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis aegyptia')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis alba')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis alkaliphila')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis arabia')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis arvandica')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis baichengensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis chromatogenes')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis composta')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis dassonvillei')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis exhalans')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis flavescens')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis ganjiahuensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis gilva')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis halophila')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis halotolerans')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis kunsanensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis listeri')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis litoralis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis lucentensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis metallicus')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis nikkonensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis potens')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis prasina')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis quinghaiensis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis rhodophaea')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis rosea')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis salina')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis sinuspersici')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis synnemataformans')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis trehalosi')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis tropica')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis umidischolae')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis valliformis')
,('Actinomycetales','Nocardiopsaceae','Nocardiopsis','Nocardiopsis xinjiangensis')
,('Actinomycetales','Nocardiopsaceae','Salinactinospora','Salinactinospora qingdaonensis')
,('Actinomycetales','Nocardiopsaceae','Spinactinospora','Spinactinospora alkalitolerans')
,('Actinomycetales','Nocardiopsaceae','Streptomonospora','Streptomonospora alba')
,('Actinomycetales','Nocardiopsaceae','Streptomonospora','Streptomonospora amylolytica')
,('Actinomycetales','Nocardiopsaceae','Streptomonospora','Streptomonospora flavalba')
,('Actinomycetales','Nocardiopsaceae','Streptomonospora','Streptomonospora halophila')
,('Actinomycetales','Nocardiopsaceae','Streptomonospora','Streptomonospora salina')
,('Actinomycetales','Nocardiopsaceae','Thermobifida','Thermobifida alba')
,('Actinomycetales','Nocardiopsaceae','Thermobifida','Thermobifida cellulosilytica')
,('Actinomycetales','Nocardiopsaceae','Thermobifida','Thermobifida fusca')
,('Actinomycetales','Nocardiopsaceae','Thermobifida','Thermobifida halotolerans')
,('Actinomycetales','Promicromonosporaceae','Cellulosimicrobium','Cellulosimicrobium cellulans')
,('Actinomycetales','Promicromonosporaceae','Cellulosimicrobium','Cellulosimicrobium funkei')
,('Actinomycetales','Promicromonosporaceae','Cellulosimicrobium','Cellulosimicrobium terreum')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola chiayiensis')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola dokdonensis')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola halotolerans')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola hypogeus')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola jiangsuensis')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola nanjingensis')
,('Actinomycetales','Promicromonosporaceae','Isoptericola','Isoptericola variabilis')
,('Actinomycetales','Promicromonosporaceae','Myceligenerans','Myceligenerans crystallogenes')
,('Actinomycetales','Promicromonosporaceae','Myceligenerans','Myceligenerans halotolerans')
,('Actinomycetales','Promicromonosporaceae','Myceligenerans','Myceligenerans xiligouense')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora aerolata')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora citrea')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora flava')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora kroppenstedtii')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora sukumoe')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora umidemergens')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora vindobonensis')
,('Actinomycetales','Promicromonosporaceae','Promicromonospora','Promicromonospora xylanilytica')
,('Actinomycetales','Promicromonosporaceae','Xylanibacterium','Xylanibacterium ulmi')
,('Actinomycetales','Promicromonosporaceae','Xylanimicrobium','Xylanimicrobium pachnodae')
,('Actinomycetales','Promicromonosporaceae','Xylanimonas','Xylanimonas cellulosilytica')
,('Actinomycetales','Propionibacteriaceae','Aestuariimicrobium','Aestuariimicrobium kwangyangense')
,('Actinomycetales','Propionibacteriaceae','Auraticoccus','Auraticoccus monumenti')
,('Actinomycetales','Propionibacteriaceae','Brooklawnia','Brooklawnia cerclae')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella antarctica')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella capsulata')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella lacustris')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella lucida')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella luteola')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella okinawensis')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella sagamiharensis')
,('Actinomycetales','Propionibacteriaceae','Friedmanniella','Friedmanniella spumicola')
,('Actinomycetales','Propionibacteriaceae','Granulicoccus','Granulicoccus phenolivorans')
,('Actinomycetales','Propionibacteriaceae','Luteococcus','Luteococcus japonicus')
,('Actinomycetales','Propionibacteriaceae','Luteococcus','Luteococcus peritonei')
,('Actinomycetales','Propionibacteriaceae','Luteococcus','Luteococcus sanguinis')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus aurantiacus')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus ginsengisoli')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus panaciterrae')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus parietis')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus phosphovorus')
,('Actinomycetales','Propionibacteriaceae','Microlunatus','Microlunatus soli')
,('Actinomycetales','Propionibacteriaceae','Micropruina','Micropruina glycogenica')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium acidifaciens')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium acidipropionici')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium acnes')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium australiense')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium avidum')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium cyclohexanicum')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium freudenreichii')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium granulosum')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium jensenii')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium microaerophilum')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium propionicum')
,('Actinomycetales','Propionibacteriaceae','Propionibacterium','Propionibacterium thoenii')
,('Actinomycetales','Propionibacteriaceae','Propionicicella','Propionicicella superfundia')
,('Actinomycetales','Propionibacteriaceae','Propioniciclava','Propioniciclava tarda')
,('Actinomycetales','Propionibacteriaceae','Propionicimonas','Propionicimonas paludicola')
,('Actinomycetales','Propionibacteriaceae','Propioniferax','Propioniferax innocua')
,('Actinomycetales','Propionibacteriaceae','Propionimicrobium','Propionimicrobium lymphophilum')
,('Actinomycetales','Propionibacteriaceae','Tessaracoccus','Tessaracoccus bendigoensis')
,('Actinomycetales','Propionibacteriaceae','Tessaracoccus','Tessaracoccus flavescens')
,('Actinomycetales','Propionibacteriaceae','Tessaracoccus','Tessaracoccus lubricantis')
,('Actinomycetales','Propionibacteriaceae','Tessaracoccus','Tessaracoccus oleiagri')
,('Actinomycetales','Pseudonocardiaceae','Actinoalloteichus','Actinoalloteichus cyanogriseus')
,('Actinomycetales','Pseudonocardiaceae','Actinoalloteichus','Actinoalloteichus hymeniacidonis')
,('Actinomycetales','Pseudonocardiaceae','Actinoalloteichus','Actinoalloteichus nanshanensis')
,('Actinomycetales','Pseudonocardiaceae','Actinoalloteichus','Actinoalloteichus spitiensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora auranticolor')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora baliensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora cianjurensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora cibodasensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora diospyrosa')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora enzanensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora fastidiosa')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora globicatena')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora inagensis')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora riparia')
,('Actinomycetales','Pseudonocardiaceae','Actinokineospora','Actinokineospora terrae')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora chiangmaiensis')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora chibensis')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora chlora')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora cinnamomea')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora corticicola')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora iriomotensis')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora lutea')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora rishiriensis')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora straminea')
,('Actinomycetales','Pseudonocardiaceae','Actinomycetospora','Actinomycetospora succinea')
,('Actinomycetales','Pseudonocardiaceae','Actinophytocola','Actinophytocola burenkhanensis')
,('Actinomycetales','Pseudonocardiaceae','Actinophytocola','Actinophytocola corallina')
,('Actinomycetales','Pseudonocardiaceae','Actinophytocola','Actinophytocola oryzae')
,('Actinomycetales','Pseudonocardiaceae','Actinophytocola','Actinophytocola timorensis')
,('Actinomycetales','Pseudonocardiaceae','Actinophytocola','Actinophytocola xinjiangensis')
,('Actinomycetales','Pseudonocardiaceae','Actinosynnema','Actinosynnema mirum')
,('Actinomycetales','Pseudonocardiaceae','Actinosynnema','Actinosynnema pretiosum')
,('Actinomycetales','Pseudonocardiaceae','Alloactinosynnema','Alloactinosynnema album')
,('Actinomycetales','Pseudonocardiaceae','Allokutzneria','Allokutzneria albata')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis alba')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis albidoflavus')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis australiensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis azurea')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis balhimycina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis benzoatilytica')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis circi')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis coloradensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis decaplanina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis echigonensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis equina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis eurytherma')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis granulosa')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis halophila')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis halotolerans')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis helveola')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis hippodromi')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis japonica')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis jejuensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis kentuckyensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis keratiniphila')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis lexingtonensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis lurida')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis marina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis mediterranei')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis methanolica')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis minnesotensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis nigrescens')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis niigatensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis orientalis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis palatopharyngis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis pigmentata')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis plumensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis pretoriensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis regifaucium')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis rifamycinica')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis ruanii')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis rubida')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis saalfeldensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis sacchari')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis salitolerans')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis samaneae')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis sulphurea')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis taiwanensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis thailandensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis thermalba')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis thermoflava')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis thermophila')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis tolypomycina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis tucumanensis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis ultiminotia')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis vancoresmycina')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis viridis')
,('Actinomycetales','Pseudonocardiaceae','Amycolatopsis','Amycolatopsis xylanica')
,('Actinomycetales','Pseudonocardiaceae','Crossiella','Crossiella cryophila')
,('Actinomycetales','Pseudonocardiaceae','Crossiella','Crossiella equi')
,('Actinomycetales','Pseudonocardiaceae','Goodfellowiella','Goodfellowiella coeruleoviolacea')
,('Actinomycetales','Pseudonocardiaceae','Haloechinothrix','Haloechinothrix alba')
,('Actinomycetales','Pseudonocardiaceae','Kibdelosporangium','Kibdelosporangium aridum')
,('Actinomycetales','Pseudonocardiaceae','Kibdelosporangium','Kibdelosporangium philippinense')
,('Actinomycetales','Pseudonocardiaceae','Kutzneria','Kutzneria albida')
,('Actinomycetales','Pseudonocardiaceae','Kutzneria','Kutzneria kofuensis')
,('Actinomycetales','Pseudonocardiaceae','Kutzneria','Kutzneria viridogrisea')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria aerocolonigenes')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria atacamensis')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria deserti')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria flava')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria fradiae')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria roselyniae')
,('Actinomycetales','Pseudonocardiaceae','Lechevalieria','Lechevalieria xinjiangensis')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea albida')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea albidocapillata')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea californiensis')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea flaviverrucosa')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea kentuckyensis')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea violacea')
,('Actinomycetales','Pseudonocardiaceae','Lentzea','Lentzea waywayandensis')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella aidingensis')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella alba')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella flava')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella halophila')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella marina')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella muralis')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella rugosa')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella salsuginis')
,('Actinomycetales','Pseudonocardiaceae','Prauserella','Prauserella sediminis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia acaciae')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia adelaidensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia ailaonensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia alaniniphila')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia alni')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia ammonioxydans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia antarctica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia artemisiae')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia asaccharolytica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia aurantiaca')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia autotrophica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia babensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia benzenivorans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia carboxydivorans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia chloroethenivorans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia compacta')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia dioxanivorans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia endophytica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia eucalypti')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia halophobica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia hydrocarbonoxydans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia khuvsgulensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia kongjuensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia kunmingensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia mongoliensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia nitrificans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia oroxyli')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia parietis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia petroleophila')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia saturnea')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia spinosa')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia spinosispora')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia sulfidoxydans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia tetrahydrofuranoxydans')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia thermophila')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia tropica')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia xinjiangensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia yunnanensis')
,('Actinomycetales','Pseudonocardiaceae','Pseudonocardia','Pseudonocardia zijingensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora azurea')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora cyanea')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora glauca')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora halophila')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora marina')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora paurometabolica')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora saliphila')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora viridis')
,('Actinomycetales','Pseudonocardiaceae','Saccharomonospora','Saccharomonospora xinjiangensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora antimicrobica')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora cebuensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora erythraea')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora flava')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora gloriosae')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora gregorii')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora halophila')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora hirsuta')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora hordei')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora jiangxiensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora phatthalungensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora qijiaojingensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora rectivirgula')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora rosea')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora shandongensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora spinosa')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora spinosporotrichia')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora taberi')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora thermophila')
,('Actinomycetales','Pseudonocardiaceae','Saccharopolyspora','Saccharopolyspora tripterygii')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix algeriensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix australiensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix coeruleofusca')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix espanaensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix longispora')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix mutabilis')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix syringae')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix texasensis')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix variisporea')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix violaceirubra')
,('Actinomycetales','Pseudonocardiaceae','Saccharothrix','Saccharothrix xinjiangensis')
,('Actinomycetales','Pseudonocardiaceae','Sciscionella','Sciscionella marina')
,('Actinomycetales','Pseudonocardiaceae','Streptoalloteichus','Streptoalloteichus hindustanus')
,('Actinomycetales','Pseudonocardiaceae','Streptoalloteichus','Streptoalloteichus tenebrarius')
,('Actinomycetales','Pseudonocardiaceae','Thermobispora','Thermobispora bispora')
,('Actinomycetales','Pseudonocardiaceae','Thermocrispum','Thermocrispum agreste')
,('Actinomycetales','Pseudonocardiaceae','Thermocrispum','Thermocrispum municipale')
,('Actinomycetales','Pseudonocardiaceae','Umezawaea','Umezawaea tangerina')
,('Actinomycetales','Pseudonocardiaceae','Yuhushiella','Yuhushiella deserti')
,('Actinomycetales','Rarobacteraceae','Rarobacter','Rarobacter faecitabidus')
,('Actinomycetales','Rarobacteraceae','Rarobacter','Rarobacter incanus')
,('Actinomycetales','Ruaniaceae','Haloactinobacterium','Haloactinobacterium album')
,('Actinomycetales','Ruaniaceae','Ruania','Ruania albidiflava')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter antarcticus')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter inulinus')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter keddieii')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter marinus')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter soli')
,('Actinomycetales','Sanguibacteraceae','Sanguibacter','Sanguibacter suarezii')
,('Actinomycetales','Segniliparaceae','Segniliparus','Segniliparus rotundus')
,('Actinomycetales','Segniliparaceae','Segniliparus','Segniliparus rugosus')
,('Actinomycetales','Sporichthyaceae','Sporichthya','Sporichthya brevicatena')
,('Actinomycetales','Sporichthyaceae','Sporichthya','Sporichthya polymorpha')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora arboriphila')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora atroaurantiaca')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora azatica')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora cheerisanensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora cineracea')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora cochleata')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora cystarginea')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora gansuensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora griseola')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora kazusensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora kifunensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora mediocidica')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora niigatensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora nipponensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora paracochleata')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora paranensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora phosalacinea')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora putterlickiae')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora saccharophila')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora sampliensis')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora terrestris')
,('Actinomycetales','Streptomycetaceae','Kitasatospora','Kitasatospora viridis')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus albus')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus anmyonensis')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus carbonis')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus jiangxiensis')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus melanogenes')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus neutrinimicus')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus oryzae')
,('Actinomycetales','Streptomycetaceae','Streptacidiphilus','Streptacidiphilus rugosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces abikoensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aburaviensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces achromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces acidiscabies')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aculeolatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces afghaniensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces africanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces alanosinicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albaduncus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albiaxialis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albidochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albidoflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albiflaviniger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces alboflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albogriseolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albolongus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces alboniger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albospinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albosporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albovinaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albulus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces albus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aldersoniae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces almquistii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces alni')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces althioticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces amakusaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ambofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces anandii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces angustmyceticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces anthocyanicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces antibioticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces antimycoticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces anulatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aomiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ardus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces arenae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces armeniacus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces artemisiae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ascomycinicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces asiaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces asterosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces atratus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces atriruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces atroolivaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces atrovirens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aurantiacus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aurantiogriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces auratus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aureocirculatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aureofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aureorectus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aureoverticillatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces aureus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces avellaneus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces avermitilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces avicenniae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces avidinii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces axinellae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces azureus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bacillaris')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces badius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces baliensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bambergiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bangladeshensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces beijiangensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bellus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bikiniensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces blastmyceticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bluensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bobili')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bottropensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces brasiliensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces brevispora')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces bungoensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cacaoi')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces caelestis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces caeruleatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces calvus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces canarius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces candidus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cangkringensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces caniferus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces canus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces capillispiralis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces capoamus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces carpaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces carpinensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces castelarensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces catenulae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cavourensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cellostaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces celluloflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cellulolyticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cellulosae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chartreusis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chattanoogensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cheonanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chrestomyceticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chromofuscus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chryseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces chrysomallus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinereorectus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinereoruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinereospinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinereus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinerochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinnabarinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinnamonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cinnamoneus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cirratus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ciscaucasicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces clavifer')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces clavuligerus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coacervatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cocklensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coelescens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coelicoflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coeruleoflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coeruleofuscus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coeruleoprunus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coeruleorubidus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces coerulescens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces collinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces corchorusii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces costaricanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cremeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces crystallinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces curacoi')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cuspidosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cyaneofuscatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cyaneus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces cyanoalbus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces daghestanicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces deccanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces decoyicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces demainii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces diastaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces diastatochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces djakartensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces drozdowiczii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces durhamensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces durmitorensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces echinatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces echinoruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ederensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces emeiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces endus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces enissocaesilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces erythrogriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces eurocidicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces europaeiscabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces eurythermus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces exfoliatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fenghuangensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ferralitis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces filamentosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces filipinensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fimbriatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fimicarius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces finlayi')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flaveolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flaveus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavidovirens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavofungini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavotricini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavovariabilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavovirens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flavoviridis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces flocculus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fradiae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fragilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fulvissimus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fulvorobeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fumanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces fumigatiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces galbus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces galilaeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gancidicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gardneri')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gelaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces geldanamycininus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces geysiriensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ghanaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gibsonii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glaucescens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glauciniger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glaucosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glaucus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces globisporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces globosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glomeratus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces glomeroaurantiacus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gobitricini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces goshikiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gougerotii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces graminearus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gramineus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseiniger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoaurantiacus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseocarneus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseofuscus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoincarnatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoloalbus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoluteus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoplanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseorubens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseorubiginosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseosporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseostramineus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseoviridis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces griseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces guanduensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces gulbargensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hainanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces haliclonae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces halstedii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hawaiiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hebeiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces heliomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces helvaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces herbaricolor')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces himastatinicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hiroshimensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hirsutus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces humidus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces humiferus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hyderabadensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hydrogenans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hygroscopicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces hypolithicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces iakyrus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces indiaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces indicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces indigoferus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces indonesiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces intermedius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces inusitatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ipomoeae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces iranensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces janthinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces javensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces jietaisiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces kanamyceticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces kasugaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces katrae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces koyangensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces kunmingensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces kurssanovii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces labedae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lacticiproducens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces laculatispora')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lanatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lateritius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces laurentii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lavendofoliae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lavendulae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lavenduligriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lavendulocolor')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces levis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces libani')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lienomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lilacinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lincolnensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces litmocidini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lomondensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces longisporoflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces longispororuber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces longisporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces longwoodensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lucensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lunalinharesii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces luridus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lusitanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces luteireticuli')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces luteogriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces luteosporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces lydicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces macrosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces malachitofuscus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces malachitospinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces malaysiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces marinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces marokkonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mashuensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces massasporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces matensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mauvecolor')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mayteni')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces megasporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces melanogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces melanosporofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mexicanus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces michiganensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces microflavus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces milbemycinicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces minutiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mirabilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces misakiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces misionensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mobaraensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces monomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mordarskii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces morookaense')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces murinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mutabilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces mutomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces naganishii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nanhaiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nanshensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces narbonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nashvillensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces netropsis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces neyagawaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces niger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nigrescens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nitrosporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces niveiscabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces niveoruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces noboritoensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nodosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nogalater')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces nojiriensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces noursei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces novaecaesareae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ochraceiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivaceiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivaceoviridis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces olivoverticillatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces omiyaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces orinoci')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces osmaniensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pactum')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces panacagri')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces paradoxus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces parvulus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces parvus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces paucisporeus')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces peucetius')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeogriseichromatogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeoluteichromatogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeoluteigriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phaeopurpureus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pharetrae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pharmamarensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces phosalacineus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pilosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces platensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces plicatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces plumbiresistens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pluricolorescens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces polyantibioticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces polychromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces poonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces prasinopilosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces prasinosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces prasinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces prunicolor')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces psammoticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pseudoechinosporeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pseudogriseolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pseudovenezuelae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces pulveraceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces puniceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces puniciscabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces purpeofuscus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces purpurascens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces purpureus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces purpurogeneiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces qinglanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces racemochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces radiopugnans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rameus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ramulosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rangoonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rapamycinicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces recifensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rectiviolaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces regensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces resistomycificus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces reticuliscabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rhizosphaericus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rimosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rishiriensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rochei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseiscleroticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseofulvus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseolilacinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseoviolaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces roseoviridis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces ruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rubidus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rubiginosohelvolus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rubiginosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rubrogriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rubrus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces rutgersensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces samsunensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sanglieri')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sannanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sanyensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces scabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces scabrisporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sclerotialus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces scopiformis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces scopuliridis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sedi')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces seoulensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces setae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces showdoensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces silaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sindenensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sioyaensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sodiiphilus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces somaliensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sparsogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sparsus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces specialis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spectabilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces speibonae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces speleomycini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spinoverrucosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spiralis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spiroverticillatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spongiae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sporocinereus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sporoclivatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces spororaveus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sporoverrucosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces staurosporininus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces stelliscabiei')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces stramineus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces subrutilus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sulfonofaciens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sulphureus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces sundarbansensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces synnematoformans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tacrolimicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tanashiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tateyamensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tauricus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tendae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces termitum')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermoalcalitolerans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermoautotrophicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermocarboxydovorans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermocarboxydus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermocoprophilus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermodiastaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermogriseus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermolineatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermospinosisporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermoviolaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thermovulgaris')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thinghirensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces thioluteus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces torulosus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces toxytricini')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tricolor')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tritolerans')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tubercidicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces tuirus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces turgidiscabies')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces umbrinus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces variabilis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces variegatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces varsoviensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces vastus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces venezuelae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces vietnamensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces vinaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces vinaceusdrappus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceolatus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceorectus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceoruber')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceorubidus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violaceusniger')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violarus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violascens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces violens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces virens')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces virginiae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces viridiviolaceus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces viridobrunneus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces viridochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces viridodiastaticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces viridosporus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces vitaminophilus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces wedmorensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces wellingtoniae')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces werraensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xanthochromogenes')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xanthocidicus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xantholiticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xanthophaeus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xiamenensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces xinghaiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yanglinensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yanii')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yatensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yeochonensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yerevanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yogyakartensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yokosukanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces youssoufiensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces yunnanensis')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces zaomyceticus')
,('Actinomycetales','Streptomycetaceae','Streptomyces','Streptomyces zinciresistens')
,('Actinomycetales','Streptosporangiaceae','Acrocarpospora','Acrocarpospora corrugata')
,('Actinomycetales','Streptosporangiaceae','Acrocarpospora','Acrocarpospora macrocephala')
,('Actinomycetales','Streptosporangiaceae','Acrocarpospora','Acrocarpospora pleiomorpha')
,('Actinomycetales','Streptosporangiaceae','Herbidospora','Herbidospora cretacea')
,('Actinomycetales','Streptosporangiaceae','Herbidospora','Herbidospora daliensis')
,('Actinomycetales','Streptosporangiaceae','Herbidospora','Herbidospora osyris')
,('Actinomycetales','Streptosporangiaceae','Herbidospora','Herbidospora sakaeratensis')
,('Actinomycetales','Streptosporangiaceae','Herbidospora','Herbidospora yilanensis')
,('Actinomycetales','Streptosporangiaceae','Microbispora','Microbispora corallina')
,('Actinomycetales','Streptosporangiaceae','Microbispora','Microbispora mesophila')
,('Actinomycetales','Streptosporangiaceae','Microbispora','Microbispora rosea')
,('Actinomycetales','Streptosporangiaceae','Microbispora','Microbispora siamensis')
,('Actinomycetales','Streptosporangiaceae','Microtetraspora','Microtetraspora fusca')
,('Actinomycetales','Streptosporangiaceae','Microtetraspora','Microtetraspora glauca')
,('Actinomycetales','Streptosporangiaceae','Microtetraspora','Microtetraspora malaysiensis')
,('Actinomycetales','Streptosporangiaceae','Microtetraspora','Microtetraspora niveoalba')
,('Actinomycetales','Streptosporangiaceae','Microtetraspora','Microtetraspora tyrrhenii')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea africana')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea angiospora')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea antimicrobica')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea bangladeshensis')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea candida')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea coxensis')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea dietziae')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea endophytica')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea fastidiosa')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea ferruginea')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea helvata')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea jiangxiensis')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea kuesteri')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea longicatena')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea maheshkhaliensis')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea maritima')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea polychroma')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea pusilla')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea recticatena')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea rhizophila')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea rosea')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea roseola')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea roseoviolacea')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea rubra')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea salmonea')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea spiralis')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea turkmeniaca')
,('Actinomycetales','Streptosporangiaceae','Nonomuraea','Nonomuraea wenchangensis')
,('Actinomycetales','Streptosporangiaceae','Planobispora','Planobispora longispora')
,('Actinomycetales','Streptosporangiaceae','Planobispora','Planobispora rosea')
,('Actinomycetales','Streptosporangiaceae','Planomonospora','Planomonospora alba')
,('Actinomycetales','Streptosporangiaceae','Planomonospora','Planomonospora parontospora')
,('Actinomycetales','Streptosporangiaceae','Planomonospora','Planomonospora sphaerica')
,('Actinomycetales','Streptosporangiaceae','Planomonospora','Planomonospora venezuelensis')
,('Actinomycetales','Streptosporangiaceae','Planotetraspora','Planotetraspora kaengkrachanensis')
,('Actinomycetales','Streptosporangiaceae','Planotetraspora','Planotetraspora mira')
,('Actinomycetales','Streptosporangiaceae','Planotetraspora','Planotetraspora phitsanulokensis')
,('Actinomycetales','Streptosporangiaceae','Planotetraspora','Planotetraspora silvatica')
,('Actinomycetales','Streptosporangiaceae','Planotetraspora','Planotetraspora thailandica')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium album')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium cinnabarinum')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium flaviroseum')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium krabiense')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium melleum')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium rubeum')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium siamense')
,('Actinomycetales','Streptosporangiaceae','Sphaerisporangium','Sphaerisporangium viridialbum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium album')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium amethystogenes')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium canum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium carneum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium fragile')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium longisporum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium nondiastaticum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium oxazolinicum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium pseudovulgare')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium purpuratum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium roseum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium subroseum')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium violaceochromogenes')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium vulgare')
,('Actinomycetales','Streptosporangiaceae','Streptosporangium','Streptosporangium yunnanense')
,('Actinomycetales','Streptosporangiaceae','Thermopolyspora','Thermopolyspora flexuosa')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus acaciae')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus amamiensis')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus caesius')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus coprocola')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus fulvus')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus iriomotensis')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus luridus')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus oryzae')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus purpureus')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus radicium')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus spadix')
,('Actinomycetales','Thermomonosporaceae','Actinoallomurus','Actinoallomurus yoronensis')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia aurantiaca')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia aurea')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia cavernae')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia glomerata')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia herbida')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia libanotica')
,('Actinomycetales','Thermomonosporaceae','Actinocorallia','Actinocorallia longicatena')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura alba')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura apis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura atramentaria')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura bangladeshensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura catellatispora')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura chibensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura chokoriensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura citrea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura coerulea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura cremea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura echinospora')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura fibrosa')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura flavalba')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura formosensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura fulvescens')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura glauciflava')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura hallensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura hibisca')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura keratinilytica')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura kijaniata')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura latina')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura livida')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura luteofluorescens')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura macra')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura madurae')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura meridiana')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura mexicana')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura meyerae')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura miaoliensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura namibiensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura napierensis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura nitritigenes')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura oligospora')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura pelletieri')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura rifamycini')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura rubrobrunea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura rudentiformis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura rugatobispora')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura rupiterrae')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura scrupuli')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura sediminis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura sputi')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura umbrina')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura verrucosospora')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura vinacea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura viridilutea')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura viridis')
,('Actinomycetales','Thermomonosporaceae','Actinomadura','Actinomadura yumaensis')
,('Actinomycetales','Thermomonosporaceae','Spirillospora','Spirillospora albida')
,('Actinomycetales','Thermomonosporaceae','Spirillospora','Spirillospora rubra')
,('Actinomycetales','Thermomonosporaceae','Thermomonospora','Thermomonospora chromogena')
,('Actinomycetales','Thermomonosporaceae','Thermomonospora','Thermomonospora curvata')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella carboxydivorans')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella inchonensis')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella paurometabola')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella pseudospumae')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella pulmonis')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella soli')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella spongiae')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella spumae')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella strandjordii')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella sunchonensis')
,('Actinomycetales','Tsukamurellaceae','Tsukamurella','Tsukamurella tyrosinosolvens')
,('Actinomycetales','Yaniellaceae','Yaniella','Yaniella flava')
,('Actinomycetales','Yaniellaceae','Yaniella','Yaniella fodinae')
,('Actinomycetales','Yaniellaceae','Yaniella','Yaniella halotolerans')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma africae')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma arabiae')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma belcheri')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma bennetti')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma bermudae')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma californiense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma capense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma caribaeum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma elongatum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma floridae')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma gambiense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma indicum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma lanceolatum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma leonense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma longirostrum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma malayanum')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma nigeriense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma platae')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma senegalense')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma tattersalli')
,('Amphioxiformes','Branchiostomatidae','Branchiostoma','Branchiostoma virginiae')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys australis')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys bassanus')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys cingalensis')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys cultellus')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys hectori')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys lucayanus')
,('Amphioxiformes','Branchiostomatidae','Epigonichthys','Epigonichthys maldivensis')
,('Anaeroplasmatales','Anaeroplasmataceae','Anaeroplasma','Anaeroplasma abactoclasticum')
,('Anaeroplasmatales','Anaeroplasmataceae','Anaeroplasma','Anaeroplasma bactoclasticum')
,('Anaeroplasmatales','Anaeroplasmataceae','Anaeroplasma','Anaeroplasma intermedium')
,('Anaeroplasmatales','Anaeroplasmataceae','Anaeroplasma','Anaeroplasma varium')
,('Anaeroplasmatales','Anaeroplasmataceae','Asteroleplasma','Asteroleplasma anaerobium')
,('Basidiobolales','Basidiobolaceae','Basidiobolus','Basidiobolus microsporus')
,('Bifidobacteriales','Bifidobacteriaceae','Aeriscardovia','Aeriscardovia aeriphila')
,('Bifidobacteriales','Bifidobacteriaceae','Alloscardovia','Alloscardovia omnicolens')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium actinocoloniiforme')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium adolescentis')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium angulatum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium animalis')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium asteroides')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium biavatii')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium bifidum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium bohemicum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium bombi')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium boum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium breve')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium callitrichos')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium catenulatum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium choerinum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium coryneforme')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium cuniculi')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium dentium')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium gallicum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium gallinarum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium indicum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium kashiwanohense')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium longum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium magnum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium merycicum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium minimum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium mongoliense')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium pseudocatenulatum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium pseudolongum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium psychraerophilum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium pullorum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium reuteri')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium ruminantium')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium saeculare')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium saguini')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium scardovii')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium stellenboschense')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium stercoris')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium subtile')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium thermacidophilum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium thermophilum')
,('Bifidobacteriales','Bifidobacteriaceae','Bifidobacterium','Bifidobacterium tsurumiense')
,('Bifidobacteriales','Bifidobacteriaceae','Gardnerella','Gardnerella vaginalis')
,('Bifidobacteriales','Bifidobacteriaceae','Metascardovia','Metascardovia criceti')
,('Bifidobacteriales','Bifidobacteriaceae','Parascardovia','Parascardovia denticolens')
,('Bifidobacteriales','Bifidobacteriaceae','Scardovia','Scardovia inopinata')
,('Bifidobacteriales','Bifidobacteriaceae','Scardovia','Scardovia wiggsiae')
,('Bursovaginoidea','Agnathiellidae','Agnathiella','Agnathiella beckeri')
,('Bursovaginoidea','Agnathiellidae','Agnathiella','Agnathiella nominata')
,('Bursovaginoidea','Agnathiellidae','Paragnathiella','Paragnathiella trifoliceps')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia atraclava')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia boadeni')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia homunculus')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia kirsteueri')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia medusifera')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia mooreensis')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia pecten')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia sterreri')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia stirialis')
,('Bursovaginoidea','Austrognathiidae','Austrognatharia','Austrognatharia strunki')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia australiensis')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia christianae')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia clavigera')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia hymanae')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia macroconifera')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia microconulifera')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia nannulifera')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia novazelandiae')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia riedli')
,('Bursovaginoidea','Austrognathiidae','Austrognathia','Austrognathia singatokae')
,('Bursovaginoidea','Austrognathiidae','Triplignathia','Triplignathia adriatica')
,('Bursovaginoidea','Austrognathiidae','Triplignathia','Triplignathia bathycola')
,('Bursovaginoidea','Clausognathiidae','Clausognathia','Clausognathia suicauda')
,('Bursovaginoidea','Gnathostomariidae','Gnathostomaria','Gnathostomaria lutheri')
,('Bursovaginoidea','Gnathostomulidae','Corculognathia','Corculognathia apennata')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula algreti')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula arabica')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula armata')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula axi')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula brunidens')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula costata')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula jenneri')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula karlingi')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula maldivarum')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula maorica')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula mediocristata')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula mediterranea')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula microstyla')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula murmanica')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula nigrostoma')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula paradoxa')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula peregrina')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula raji')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula salotae')
,('Bursovaginoidea','Gnathostomulidae','Gnathostomula','Gnathostomula uncinata')
,('Bursovaginoidea','Gnathostomulidae','Ratugnathia','Ratugnathia makuluvae')
,('Bursovaginoidea','Gnathostomulidae','Semaeognathia','Semaeognathia sterreri')
,('Bursovaginoidea','Mesognathariidae','Labidognathia','Labidognathia longicollis')
,('Bursovaginoidea','Mesognathariidae','Mesognatharia','Mesognatharia bahamensis')
,('Bursovaginoidea','Mesognathariidae','Mesognatharia','Mesognatharia eastwardiae')
,('Bursovaginoidea','Mesognathariidae','Mesognatharia','Mesognatharia remanei')
,('Bursovaginoidea','Mesognathariidae','Tenuignathia','Tenuignathia rikerae')
,('Bursovaginoidea','Mesognathariidae','Tenuignathia','Tenuignathia vitiensis')
,('Bursovaginoidea','Onychognathiidae','Goannagnathia','Goannagnathia susannae')
,('Bursovaginoidea','Onychognathiidae','Nanognathia','Nanognathia exigua')
,('Bursovaginoidea','Onychognathiidae','Onychognathia','Onychognathia bractearotunda')
,('Bursovaginoidea','Onychognathiidae','Onychognathia','Onychognathia filifera')
,('Bursovaginoidea','Onychognathiidae','Onychognathia','Onychognathia rhombocephala')
,('Bursovaginoidea','Onychognathiidae','Valvognathia','Valvognathia pogonostoma')
,('Bursovaginoidea','Onychognathiidae','Vampyrognathia','Vampyrognathia horribilis')
,('Bursovaginoidea','Onychognathiidae','Vampyrognathia','Vampyrognathia minor')
,('Bursovaginoidea','Onychognathiidae','Vampyrognathia','Vampyrognathia varanus')
,('Bursovaginoidea','Paucidentulidae','Paucidentula','Paucidentula anonyma')
,('Bursovaginoidea','Problognathiidae','Problognathia','Problognathia minima')
,('Bursovaginoidea','Rastrognathiidae','Rastrognathia','Rastrognathia macrostoma')
,('Catenulida','Catenulidae','Africatenula','Africatenula riuruae')
,('Catenulida','Catenulidae','Catenula','Catenula alitha')
,('Catenulida','Catenulidae','Catenula','Catenula confusa')
,('Catenulida','Catenulidae','Catenula','Catenula evelinae')
,('Catenulida','Catenulidae','Catenula','Catenula gesserensis')
,('Catenulida','Catenulidae','Catenula','Catenula lemnae')
,('Catenulida','Catenulidae','Catenula','Catenula leptocephala')
,('Catenulida','Catenulidae','Catenula','Catenula leuca')
,('Catenulida','Catenulidae','Catenula','Catenula macrura')
,('Catenulida','Catenulidae','Catenula','Catenula quaterna')
,('Catenulida','Catenulidae','Catenula','Catenula sawayai')
,('Catenulida','Catenulidae','Catenula','Catenula sekerai')
,('Catenulida','Catenulidae','Catenula','Catenula turgida')
,('Catenulida','Catenulidae','Catenula','Catenula virginia')
,('Catenulida','Catenulidae','Dasyhormus','Dasyhormus illiesi')
,('Catenulida','Catenulidae','Dasyhormus','Dasyhormus lasius')
,('Catenulida','Catenulidae','Dasyhormus','Dasyhormus lithophorus')
,('Catenulida','Catenulidae','Dasyhormus','Dasyhormus pygmaeus')
,('Catenulida','Catenulidae','Dasyhormus','Dasyhormus stygios')
,('Catenulida','Chordariidae','Chordarium','Chordarium cryptum')
,('Catenulida','Chordariidae','Chordarium','Chordarium europaeum')
,('Catenulida','Chordariidae','Chordarium','Chordarium evelinae')
,('Catenulida','Chordariidae','Chordarium','Chordarium leucanthum')
,('Catenulida','Chordariidae','Chordarium','Chordarium philum')
,('Catenulida','Retronectidae','Myoretronectes','Myoretronectes paranaensis')
,('Catenulida','Retronectidae','Paracatenula','Paracatenula erato')
,('Catenulida','Retronectidae','Paracatenula','Paracatenula galateia')
,('Catenulida','Retronectidae','Paracatenula','Paracatenula kalliope')
,('Catenulida','Retronectidae','Paracatenula','Paracatenula polyhymnia')
,('Catenulida','Retronectidae','Paracatenula','Paracatenula urania')
,('Catenulida','Retronectidae','Retronectes','Retronectes atypica')
,('Catenulida','Retronectidae','Retronectes','Retronectes clio')
,('Catenulida','Retronectidae','Retronectes','Retronectes euterpe')
,('Catenulida','Retronectidae','Retronectes','Retronectes melpomene')
,('Catenulida','Retronectidae','Retronectes','Retronectes sterreri')
,('Catenulida','Retronectidae','Retronectes','Retronectes terpsichore')
,('Catenulida','Retronectidae','Retronectes','Retronectes thalia')
,('Catenulida','Stenostomidae','Myostenostomum','Myostenostomum bulbocaudatum')
,('Catenulida','Stenostomidae','Myostenostomum','Myostenostomum ilmenicum')
,('Catenulida','Stenostomidae','Myostenostomum','Myostenostomum lutheri')
,('Catenulida','Stenostomidae','Myostenostomum','Myostenostomum marcusi')
,('Catenulida','Stenostomidae','Myostenostomum','Myostenostomum vanderlandi')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex diplolithicus')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex evelinae')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex nanus')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex platypus')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex pusillus')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex remanei')
,('Catenulida','Stenostomidae','Rhynchoscolex','Rhynchoscolex simplex')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum amphotum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum anatirostrum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum anophthalmum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum anops')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum arevaloi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum ashanika')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum beauchampi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum beryli')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum bicaudatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum binum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum brevipharyngium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum bryophilum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum caudatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum ciliatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum constrictum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum corderoi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum cryptops')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum evelinae')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum fasciatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum gigerium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum gilvum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum glandulosum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum gotlandense')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum grabbskogense')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum grande')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum handoelense')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum heebuktense')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum hemisphericum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum hystrix')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum ignavum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum karlingi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum kepneri')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum langi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum leucops')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum macedonicus')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum mandibulatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum materazzoi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum membranosum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum middendorffii')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum occultum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum paraguayense')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum pegephilum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum perforatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum predatorium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum pseudoacetabulum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum romanae')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum rosulatum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum saliens')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum sieboldi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum simplex')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum sphagnetorum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum steveoi')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum sthenium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum temporaneum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum tuberculosum')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum uronephrium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum ventronephrium')
,('Catenulida','Stenostomidae','Stenostomum','Stenostomum virginianum')
,('Catenulida','Tyrrheniellidae','Tyrrheniella','Tyrrheniella sigillata')
,('Chaetonotida','Chaetonotidae','Arenotus','Arenotus strixinoi')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus bibulbosus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus bisquamosus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus brahmsi')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus heterodermus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus lamellophorus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus lilloensis')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus longichaetus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus marinus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus mediterraneus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus microsquamatus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus multitubulatus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus oculifer')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus ophiodermus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus ornatus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus paradoxus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus paramediterraneus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus pleustonicus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus polonicus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus polystictos')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus pori')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus schlitzensis')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus semirotundus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus slovinensis')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus squamulosus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus tatraensis')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus tentaculatus')
,('Chaetonotida','Chaetonotidae','Aspidiophorus','Aspidiophorus tetrachaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus acanthocephalus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus acanthodes')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus acanthophorus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus acareus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus aculeatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus aegilonensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus aemilianus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus aequispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus alatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus alni')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus angustus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus annectens')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus anomalus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus antipai')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus apechochaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus apolemmus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus aquaticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus arethusae')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus armatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus arquatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus atrox')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus australiensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus balsaminus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus balsamoae')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus balticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus beauchampi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus benacensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus bifidispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus bisacer')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus bogdanovii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus brachyurus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus brasiliensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus breviacanthus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus brevis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus brevisetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus brevispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus caricicola')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus caudalspinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus cestacanthus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus chicous')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus christianus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus chuni')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus condensus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus cordiformis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus crassus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus crinitus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dadayi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus daphnes')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus decemsetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dentatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus disiunctus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dispar')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dracunculus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dubius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus dybowskii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus elegans')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus elegantulus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus enormis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus erinaceus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus euhystrix')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus fencheli')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus ferrarius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus fluviatilis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus formosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus fujisanensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus furcatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus gastrocyaneus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus gracilis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus greuteri')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus heideri')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus hermaphroditus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus heterocanthus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus heterochaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus heterospinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus hilarus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus hirsutus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus hoanicus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus hystrix')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus ichthydioides')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus illiesi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus inaequidentatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus insigniformis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus intermedius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus italicus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus jakubskii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus jamaicensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus kisielewskii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus lacunosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus lancearis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus laroides')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus larus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus laterospinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus linguaeformis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus lobo')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus longisetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus longispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus lucksi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus lunatospinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus luporinii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus macrochaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus macrolepidotus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus magnificus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus majestuosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus mariae')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus marinus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus maximus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus mediterraneus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus microchaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus minimus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus mitraformis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus modestus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus monobarbatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus montevideensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus multisetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus multispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus murrayi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus mutinensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus naiadis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus napoleonicus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus neptuni')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus novenarius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus oceanides')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus octonarius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus oculatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus oculifer')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus odontopharynx')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus oligohalinus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus ophiogaster')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus oplites')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus paluster')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus palustris')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus parafurcatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus paraguayensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus parthenopeius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus paucisetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus paucisquamatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pawlowskii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pentacanthus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus persetosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pilaga')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus ploenensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus polychaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus polyspinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus poznaniensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pratensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pseudopolyspinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pungens')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus puniceus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pusillus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus pygmaeus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus quadratus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus quintospinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus rafalskii')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus rarispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus rectaculeatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus remanei')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus robustus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus rotundus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus sagittarius')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus sanctipauli')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus schlitzensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus schoepferi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus schromi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus schultzei')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus scoticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus scutatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus scutulatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus segnis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus serenus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus sextospinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus siciliensis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus silvaticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus similis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus simrothi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus slackiae')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus soberanus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus somniculosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus sphagnophilus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus spinifer')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus spinulosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus splendidus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus stagnalis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus striatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus succinctus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus sudeticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tabulatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tachyneusticus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tempestivus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tentaculatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tenuis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tenuisquamatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tesselatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus testiculophorus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus triacanthus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus trianguliformis')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus trichodrymodes')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus trichostichodes')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus tricuspidatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus trilineatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus triradiatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus trispinosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus uncinus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus vargai')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus variosquamatus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus vechovi')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus vellosus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus ventrochaetus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus venustus')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus voigti')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus vorax')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus vulgaris')
,('Chaetonotida','Chaetonotidae','Chaetonotus','Chaetonotus woodi')
,('Chaetonotida','Chaetonotidae','Diuronotus','Diuronotus aspetos')
,('Chaetonotida','Chaetonotidae','Diuronotus','Diuronotus rupperti')
,('Chaetonotida','Chaetonotidae','Fluxiderma','Fluxiderma concinnum')
,('Chaetonotida','Chaetonotidae','Fluxiderma','Fluxiderma montanum')
,('Chaetonotida','Chaetonotidae','Fluxiderma','Fluxiderma verrucosum')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus aculifer')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus arenarius')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus atlanticus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus australis')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus balticus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus bataceus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus batillifer')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus clavicornis')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus decipiens')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus etrolomus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus genatus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus italicus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus jucundus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus lamellatus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus littoralis')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus margaretae')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus marivagus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus paradoxus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus parvus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus pleuracanthus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus riedli')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus schromi')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus spinosus')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus swedmarki')
,('Chaetonotida','Chaetonotidae','Halichaetonotus','Halichaetonotus thalassopais')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma arenosum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma armatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma axi')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma brevitabulatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma clipeatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma contectum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma dimentmani')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma fallax')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma famaillensis')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma foliatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma gracile')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma grandiculum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma hermaphroditum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma illinoisensis')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma istrianum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma jureiense')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma kossinensis')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma lamellatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma longicaudata')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma loricatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma macrops')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma majus')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma marinum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma multiseriatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma obesum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma obliquum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma ocellatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma patella')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma pineisquamatum')
,('Chaetonotida','Chaetonotidae','Heterolepidoderma','Heterolepidoderma tenuisquamatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium auritum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium balatonicum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium bifasciale')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium bifurcatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium brachykolon')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium cephalobares')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium chaetiferum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium crassum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium cyclocephalum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium dubium')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium forcipatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium forficula')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium fossae')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium galeatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium hummoni')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium leptum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium macrocapitatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium macropharyngistum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium maximum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium minimum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium monolobum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium palustre')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium pellucidum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium plicatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium podura')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium rostrum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium rupperti')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium squamigerum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium sulcatum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium supralitoralis')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium tanytrichum')
,('Chaetonotida','Chaetonotidae','Ichthydium','Ichthydium tergestinum')
,('Chaetonotida','Chaetonotidae','Lepidochaetus','Lepidochaetus brasilense')
,('Chaetonotida','Chaetonotidae','Lepidochaetus','Lepidochaetus carpaticus')
,('Chaetonotida','Chaetonotidae','Lepidochaetus','Lepidochaetus ornatus')
,('Chaetonotida','Chaetonotidae','Lepidochaetus','Lepidochaetus zelinkai')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella amazonica')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella aspidioformis')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella broa')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella limogena')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella macrocephala')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella minor')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella serrata')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella spinifera')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella squamata')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella tabulata')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella triloba')
,('Chaetonotida','Chaetonotidae','Lepidodermella','Lepidodermella zelinkai')
,('Chaetonotida','Chaetonotidae','Musellifer','Musellifer delamarei')
,('Chaetonotida','Chaetonotidae','Musellifer','Musellifer profundus')
,('Chaetonotida','Chaetonotidae','Musellifer','Musellifer sublitoralis')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus andreae')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus biroi')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus callosus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus corumbensis')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus elongatus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus entzii')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus hystrix')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus macrurus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus magnus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus nodicaudus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus nodifurca')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus paraelongatum')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus rhomboides')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus serraticaudus')
,('Chaetonotida','Chaetonotidae','Polymerurus','Polymerurus squamofurcatus')
,('Chaetonotida','Chaetonotidae','Rhomballichthys','Rhomballichthys carinatus')
,('Chaetonotida','Chaetonotidae','Rhomballichthys','Rhomballichthys murrayi')
,('Chaetonotida','Chaetonotidae','Rhomballichthys','Rhomballichthys punctatus')
,('Chaetonotida','Chaetonotidae','Undula','Undula paraensis')
,('Chaetonotida','Dasydytidae','Anacanthoderma','Anacanthoderma paucisetosum')
,('Chaetonotida','Dasydytidae','Anacanthoderma','Anacanthoderma punctatum')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes asymmetricus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes carvalhoae')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes chatticus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes collini')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes elongatus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes goniathrix')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes lamellatus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes longisetosus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes longispinosus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes monile')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes nhumirimensis')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes ornatus')
,('Chaetonotida','Dasydytidae','Dasydytes','Dasydytes papaveroi')
,('Chaetonotida','Dasydytidae','Haltidytes','Haltidytes crassus')
,('Chaetonotida','Dasydytidae','Haltidytes','Haltidytes festinans')
,('Chaetonotida','Dasydytidae','Haltidytes','Haltidytes ooeides')
,('Chaetonotida','Dasydytidae','Haltidytes','Haltidytes saltitans')
,('Chaetonotida','Dasydytidae','Haltidytes','Haltidytes squamosus')
,('Chaetonotida','Dasydytidae','Metadasydytes','Metadasydytes quadrimaculatus')
,('Chaetonotida','Dasydytidae','Ornamentula','Ornamentula paraensis')
,('Chaetonotida','Dasydytidae','Setopus','Setopus abarbitus')
,('Chaetonotida','Dasydytidae','Setopus','Setopus aequatorialis')
,('Chaetonotida','Dasydytidae','Setopus','Setopus bisetosus')
,('Chaetonotida','Dasydytidae','Setopus','Setopus dubius')
,('Chaetonotida','Dasydytidae','Setopus','Setopus iunctus')
,('Chaetonotida','Dasydytidae','Setopus','Setopus primus')
,('Chaetonotida','Dasydytidae','Setopus','Setopus tongiorgii')
,('Chaetonotida','Dasydytidae','Stylochaeta','Stylochaeta curviseta')
,('Chaetonotida','Dasydytidae','Stylochaeta','Stylochaeta fusiformis')
,('Chaetonotida','Dasydytidae','Stylochaeta','Stylochaeta longispinosa')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Chaetonotida','Dasydytidae','Stylochaeta','Stylochaeta scirteticus')
,('Chaetonotida','Dasydytidae','Stylochaeta','Stylochaeta stylifera')
,('Chaetonotida','Dichaeturidae','Dichaetura','Dichaetura capricornia')
,('Chaetonotida','Dichaeturidae','Dichaetura','Dichaetura piscator')
,('Chaetonotida','Dichaeturidae','Marinellina','Marinellina flagellata')
,('Chaetonotida','Neodasyidae','Neodasys','Neodasys chaetonotoideus')
,('Chaetonotida','Neodasyidae','Neodasys','Neodasys ciritus')
,('Chaetonotida','Neodasyidae','Neodasys','Neodasys uchidai')
,('Chaetonotida','Neogosseidae','Kijanebalola','Kijanebalola canina')
,('Chaetonotida','Neogosseidae','Kijanebalola','Kijanebalola cubeutes')
,('Chaetonotida','Neogosseidae','Kijanebalola','Kijanebalola dubia')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea acanthocolla')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea antennigera')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea fasciculata')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea pauciseta')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea sexiseta')
,('Chaetonotida','Neogosseidae','Neogossea','Neogossea voigti')
,('Chaetonotida','Proichthydiidae','Proichthydioides','Proichthydioides remanei')
,('Chaetonotida','Proichthydiidae','Proichthydium','Proichthydium coronatum')
,('Chaetonotida','Xenotrichulidae','Draculiciteria','Draculiciteria tesselata')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula affinis')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula arcassonensis')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula flandrensis')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula pygmaea')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula squamosa')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula subterranea')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula transatlantica')
,('Chaetonotida','Xenotrichulidae','Heteroxenotrichula','Heteroxenotrichula wilkei')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula bispina')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula cornuta')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula floridana')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula guadelupense')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula intermedia')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula laccadivensis')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula lineata')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula micracantha')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula punctata')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula quadritubulata')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula simplex')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula sokai')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula tentaculata')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula variocirrata')
,('Chaetonotida','Xenotrichulidae','Xenotrichula','Xenotrichula velox')
,('Coloniales','Loxosomatidae','Loxocorone','Loxocorone allax')
,('Coloniales','Loxosomatidae','Loxocorone','Loxocorone brochobola')
,('Coloniales','Loxosomatidae','Loxocorone','Loxocorone dicotyledonis')
,('Coloniales','Loxosomatidae','Loxocorone','Loxocorone pseudocompressa')
,('Coloniales','Loxosomatidae','Loxomespilon','Loxomespilon perezi')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra annulata')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra kefersteinii')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra mepse')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra mizugamaensis')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra ryukyuensis')
,('Coloniales','Loxosomatidae','Loxomitra','Loxomitra tetraorganon')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma agile')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma annelidicola')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma axisadversum')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma cingulata')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma claparedei')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma cocciforme')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma cubitus')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma davenporti')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma fishelsoni')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma infundibuliformis')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma isolata')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma jaegersteni')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma lanchesteri')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma loricatum')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma loxalina')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma monensis')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma monilis')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma nielseni')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma nung')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma okudai')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma pectinaricola')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma poculi')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma rhodinicola')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma rotunda')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma saltans')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma sam')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma significans')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma singulare')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma sluiteri')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma song')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma spathula')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma tetracheir')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma troglodytes')
,('Coloniales','Loxosomatidae','Loxosoma','Loxosoma vatilli')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella akkeshiense')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella alatum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella aloxiata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella antarctica')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella antedonis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella antis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella aripes')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella atkinsae')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella bifida')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella bilocata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella bocki')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella breve')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella brucei')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella brumpti')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella circulare')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella cirriferum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella claviformis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella cochlear')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella compressa')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella constrictum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella crassicauda')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella cricketae')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella diopatricola')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella discopoda')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella ditadii')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella elegans')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella fagei')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella fauveli')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella follicola')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella gautieri')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella glandulifera')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella globosa')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella harmeri')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella hispida')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella illota')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella intragemmata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella kindal')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella lappa')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella lecythifera')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella leptoclini')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella lineata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella macginitieorum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella marisalbi')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella marsypos')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella minuta')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella monocera')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella mortenseni')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella murmanica')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella museriensis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella neapolitanum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella nitschei')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella nordgaardi')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella obesa')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella olei')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella ornata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella parvipes')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella pes')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella phascolosomata')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella polita')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella prenanti')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella pusillum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella raja')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella sawayai')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella scaura')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella schizugawaense')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella seiryoini')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella similis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella stomatophora')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella studiosorum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella subsessile')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella teissieri')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella tethyae')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella tonsoria')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella triangularis')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella varians')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella velatum')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella vivipara')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella worki')
,('Coloniales','Loxosomatidae','Loxosomella','Loxosomella zima')
,('Coriobacteriales','Coriobacteriaceae','Adlercreutzia','Adlercreutzia equolifaciens')
,('Coriobacteriales','Coriobacteriaceae','Asaccharobacter','Asaccharobacter celatus')
,('Coriobacteriales','Coriobacteriaceae','Atopobium','Atopobium fossor')
,('Coriobacteriales','Coriobacteriaceae','Atopobium','Atopobium minutum')
,('Coriobacteriales','Coriobacteriaceae','Atopobium','Atopobium parvulum')
,('Coriobacteriales','Coriobacteriaceae','Atopobium','Atopobium rimae')
,('Coriobacteriales','Coriobacteriaceae','Atopobium','Atopobium vaginae')
,('Coriobacteriales','Coriobacteriaceae','Collinsella','Collinsella aerofaciens')
,('Coriobacteriales','Coriobacteriaceae','Collinsella','Collinsella intestinalis')
,('Coriobacteriales','Coriobacteriaceae','Collinsella','Collinsella stercoris')
,('Coriobacteriales','Coriobacteriaceae','Collinsella','Collinsella tanakaei')
,('Coriobacteriales','Coriobacteriaceae','Coriobacterium','Coriobacterium glomerans')
,('Coriobacteriales','Coriobacteriaceae','Cryptobacterium','Cryptobacterium curtum')
,('Coriobacteriales','Coriobacteriaceae','Denitrobacterium','Denitrobacterium detoxificans')
,('Coriobacteriales','Coriobacteriaceae','Eggerthella','Eggerthella lenta')
,('Coriobacteriales','Coriobacteriaceae','Eggerthella','Eggerthella sinensis')
,('Coriobacteriales','Coriobacteriaceae','Enterorhabdus','Enterorhabdus caecimuris')
,('Coriobacteriales','Coriobacteriaceae','Enterorhabdus','Enterorhabdus mucosicola')
,('Coriobacteriales','Coriobacteriaceae','Gordonibacter','Gordonibacter pamelaeae')
,('Coriobacteriales','Coriobacteriaceae','Olsenella','Olsenella profusa')
,('Coriobacteriales','Coriobacteriaceae','Olsenella','Olsenella uli')
,('Coriobacteriales','Coriobacteriaceae','Olsenella','Olsenella umbonata')
,('Coriobacteriales','Coriobacteriaceae','Paraeggerthella','Paraeggerthella hongkongensis')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia equolifaciens')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia exigua')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia faecicanis')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia heliotrinireducens')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia isoflavoniconvertens')
,('Coriobacteriales','Coriobacteriaceae','Slackia','Slackia piriformis')
,('Cyclorhagida','Antygomonidae','Antygomonas','Antygomonas incomitata')
,('Cyclorhagida','Antygomonidae','Antygomonas','Antygomonas oreas')
,('Cyclorhagida','Cateriidae','Carteria','Carteria gerlachi')
,('Cyclorhagida','Cateriidae','Carteria','Carteria styx')
,('Cyclorhagida','Centroderidae','Campyloderes','Campyloderes adherens')
,('Cyclorhagida','Centroderidae','Campyloderes','Campyloderes macquariae')
,('Cyclorhagida','Centroderidae','Campyloderes','Campyloderes vanhoeffeni')
,('Cyclorhagida','Centroderidae','Centroderes','Centroderes eisigii')
,('Cyclorhagida','Centroderidae','Centroderes','Centroderes spinosus')
,('Cyclorhagida','Centroderidae','Condyloderes','Condyloderes multispinosus')
,('Cyclorhagida','Centroderidae','Condyloderes','Condyloderes paradoxus')
,('Cyclorhagida','Centroderidae','Condyloderes','Condyloderes setoensis')
,('Cyclorhagida','Centroderidae','Condyloderes','Condyloderes storchi')
,('Cyclorhagida','Cephalorhynchidae','Cephalorhyncha','Cephalorhyncha asiatica')
,('Cyclorhagida','Dracoderidae','Dracoderes','Dracoderes abei')
,('Cyclorhagida','Dracoderidae','Dracoderes','Dracoderes orientalis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes abbreviatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes agigens')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes andamanensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes angustus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes aquilonius')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes arlis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes aureus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes bengalensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes bermudensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes bispinosus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes bookhouti')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes brevicaudatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes cantabricus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes capitatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes caribiensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes cavernus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes citrinus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes coulli')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes druxi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes dujardinii')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes ehlersi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes elongatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes eximus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes ferrugineus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes filispinosus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes gerardi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes higginsi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes hispanicus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes horni')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes imperforatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes koreanus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes kozloffi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes krishnaswamyi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes kristenseni')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes lanceolatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes levanderi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes malakhovi')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes maxwelli')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes multisetosus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes newcaledoniensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes nybakkeni')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes pacificus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes pennaki')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes peterseni')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes pilosus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes remanei')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes riedli')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes sensibilis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes setiger')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes steineri')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes stockmani')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes sublicarum')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes svetlanae')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes tchefouensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes teretis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes truncatus')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes tubilak')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes ulsanensis')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes wallaceae')
,('Cyclorhagida','Echinoderidae','Echinoderes','Echinoderes worthingi')
,('Cyclorhagida','Semnoderidae','Semnoderes','Semnoderes armiger')
,('Cyclorhagida','Semnoderidae','Semnoderes','Semnoderes pacificus')
,('Cyclorhagida','Semnoderidae','Semnoderes','Semnoderes ponticus')
,('Cyclorhagida','Semnoderidae','Sphenoderes','Sphenoderes indicus')
,('Cyclorhagida','Zelinkaderidae','Zelinkaderes','Zelinkaderes floridensis')
,('Cyclorhagida','Zelinkaderidae','Zelinkaderes','Zelinkaderes klepali')
,('Cyclorhagida','Zelinkaderidae','Zelinkaderes','Zelinkaderes submersus')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema acciaccatum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema acheroni')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema acuticephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema aegira')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema apalachiensis')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema apollyoni')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema australis')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema balamuthi')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema banyulensis')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema benedeni')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema benthoctopi')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema bilobum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema briarei')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema caudatum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema clavatum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema colurum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema dolichocephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema erythrum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema ganapatii')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema hadrum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema hypercephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema japonicum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema knoxi')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema lycidoeceum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema macrocephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema madrasensis')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema maorum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema megalocephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema microcephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema misakiense')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema monodi')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema moschatum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema nouveli')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema octopusi')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema oligomerum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema orientale')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema paradoxum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema plathycephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema rhadinum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema robsonellae')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema rondeletiolae')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema schulzianum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema shorti')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema sphyrocephalum')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema sullivani')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema typoides')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema typus')
,('Dicyemida','Dicyemidae','Dicyema','Dicyema whitmani')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea abasi')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea abbreviata')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea abelis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea abreida')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea adminicula')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea adscita')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea antarcticensis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea bathybenthum')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea brevicephala')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea brevicephaloides')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea californica')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea canadensis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea coromandelensis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea curta')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea discocephala')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea dogieli')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea dorycephalum')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea eledones')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea eltanini')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea filiformis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea gracile')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea granularis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea gyrinodes')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea kaikouriensis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea lameerei')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea littlei')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea longinucleata')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea marplatensis')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea mastigoides')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea minabense')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea nouveli')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea ophioides')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea parva')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea rossiae')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea rostrata')
,('Dicyemida','Dicyemidae','Dicyemennea','Dicyemennea trochocephalum')
,('Dicyemida','Dicyemidae','Dicyemodeca','Dicyemodeca anthinocephalum')
,('Dicyemida','Dicyemidae','Dicyemodeca','Dicyemodeca dogieli')
,('Dicyemida','Dicyemidae','Dicyemodeca','Dicyemodeca sceptrum')
,('Dicyemida','Dicyemidae','Dodecadicyema','Dodecadicyema loligoi')
,('Dicyemida','Dicyemidae','Pleodicyema','Pleodicyema delamarie')
,('Dicyemida','Dicyemidae','Pseudicyema','Pseudicyema nakaoi')
,('Dicyemida','Dicyemidae','Pseudicyema','Pseudicyema truncatum')
,('Dicyemida','Katharellidae','Kantharella','Kantharella antarctica')
,('Dimargaritales','Dimargaritaceae','Dimargaris','Dimargaris arida')
,('Dimargaritales','Dimargaritaceae','Dimargaris','Dimargaris bacillispora')
,('Dimargaritales','Dimargaritaceae','Dimargaris','Dimargaris cristalligena')
,('Dimargaritales','Dimargaritaceae','Dimargaris','Dimargaris oblongispora')
,('Dimargaritales','Dimargaritaceae','Dimargaris','Dimargaris xerosporica')
,('Dimargaritales','Dimargaritaceae','Dispira','Dispira cornuta')
,('Dimargaritales','Dimargaritaceae','Dispira','Dispira simplex')
,('Dimargaritales','Dimargaritaceae','Spinalia','Spinalia radians')
,('Dimargaritales','Dimargaritaceae','Tieghemiomyces','Tieghemiomyces californicus')
,('Dimargaritales','Dimargaritaceae','Tieghemiomyces','Tieghemiomyces parasiticus')
,('Dolichomicrostomida','Dolichomacrostomidae','Acanthomacrostomum','Acanthomacrostomum gerlachi')
,('Dolichomicrostomida','Dolichomacrostomidae','Acanthomacrostomum','Acanthomacrostomum spiculiferum')
,('Dolichomicrostomida','Dolichomacrostomidae','Austromacrostomum','Austromacrostomum arumoidicornum')
,('Dolichomicrostomida','Dolichomacrostomidae','Austromacrostomum','Austromacrostomum mortenseni')
,('Dolichomicrostomida','Dolichomacrostomidae','Bathymacrostomum','Bathymacrostomum spirale')
,('Dolichomicrostomida','Dolichomacrostomidae','Cylindromacrostomum','Cylindromacrostomum formosae')
,('Dolichomicrostomida','Dolichomacrostomidae','Cylindromacrostomum','Cylindromacrostomum mediterraneum')
,('Dolichomicrostomida','Dolichomacrostomidae','Cylindromacrostomum','Cylindromacrostomum notandum')
,('Dolichomicrostomida','Dolichomacrostomidae','Cylindromacrostomum','Cylindromacrostomum riegeri')
,('Dolichomicrostomida','Dolichomacrostomidae','Dolichomacrostomum','Dolichomacrostomum uniporum')
,('Dolichomicrostomida','Dolichomacrostomidae','Karlingia','Karlingia lutheri')
,('Dolichomicrostomida','Dolichomacrostomidae','Megamorion','Megamorion brevicauda')
,('Dolichomicrostomida','Dolichomacrostomidae','Meiocheta','Meiocheta spiralis')
,('Dolichomicrostomida','Dolichomacrostomidae','Myomacrostomum','Myomacrostomum bichaeta')
,('Dolichomicrostomida','Dolichomacrostomidae','Myomacrostomum','Myomacrostomum rubrioculum')
,('Dolichomicrostomida','Dolichomacrostomidae','Myomacrostomum','Myomacrostomum unichaeta')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria arcassonensis')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria ascia')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria bistylifera')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria falcis')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria fissipara')
,('Dolichomicrostomida','Dolichomacrostomidae','Myozonaria','Myozonaria jenneri')
,('Dolichomicrostomida','Dolichomacrostomidae','Paramacrostomum','Paramacrostomum tricladoides')
,('Dolichomicrostomida','Dolichomacrostomidae','Paramyozonaria','Paramyozonaria bermudensis')
,('Dolichomicrostomida','Dolichomacrostomidae','Paramyozonaria','Paramyozonaria riegeri')
,('Dolichomicrostomida','Dolichomacrostomidae','Paramyozonaria','Paramyozonaria simplex')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum atratum')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum coronum')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum dubium')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum fusculum')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum massiliensis')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum minutum')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum parvum')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum proceracauda')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum scilliensis')
,('Dolichomicrostomida','Dolichomacrostomidae','Paromalostomum','Paromalostomum subflavum')
,('Dolichomicrostomida','Microstomidae','Alaurina','Alaurina alba')
,('Dolichomicrostomida','Microstomidae','Alaurina','Alaurina claparedii')
,('Dolichomicrostomida','Microstomidae','Alaurina','Alaurina composita')
,('Dolichomicrostomida','Microstomidae','Alaurina','Alaurina prolifera')
,('Dolichomicrostomida','Microstomidae','Alaurina','Alaurina viridirostrum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum achroophthalmum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum bioculatum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum bispiralis')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum breviceps')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum canum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum coerulescens')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum crildensis')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum davenporti')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum dermophthalmum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum gabriellae')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum groenlandicum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum hanatum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum jenseni')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum lineare')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum littorale')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum lucidum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum melanophthalmum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum mortenseni')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum mundum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum ornatum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum papillosum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum paradii')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum philadelphicum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum punctatum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum rhabdotum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum rubromaculatum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum septentrionale')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum spiculifer')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum spiriferum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum trichotum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum ulum')
,('Dolichomicrostomida','Microstomidae','Microstomum','Microstomum unicolor')
,('Dolichomicrostomida','Microstomidae','Myozonella','Myozonella microstomoidis')
,('Endogonales','Endogonaceae','Acaulospora','Acaulospora laevis')
,('Endogonales','Endogonaceae','Endogone','Endogone pisiformis')
,('Endogonales','Endogonaceae','Gigaspora','Gigaspora gigantea')
,('Endogonales','Endogonaceae','Glaziella','Glaziella vesiculosa')
,('Endogonales','Endogonaceae','Glomus','Glomus macrocarpus')
,('Endogonales','Endogonaceae','Modicella','Modicella malleola')
,('Endogonales','Endogonaceae','Sclerocystis','Sclerocystis coremioides')
,('Entomophthorales','Entomophthoraceae','Ancylistes','Ancylistes closterii')
,('Entomophthorales','Entomophthoraceae','Ballocephala','Ballocephala sphaerospora')
,('Entomophthorales','Entomophthoraceae','Conidiobolus','Conidiobolus utriculosus')
,('Entomophthorales','Entomophthoraceae','Gonimochaete','Gonimochaete horridula')
,('Entomophthorales','Entomophthoraceae','Massospora','Massospora cicadina')
,('Entomophthorales','Entomophthoraceae','Zygnemomyces','Zygnemomyces echinulatus')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma ellychniae')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma freundtii')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma lucivorax')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma luminosum')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma melaleucae')
,('Entomoplasmatales','Entomoplasmataceae','Entomoplasma','Entomoplasma somnilux')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma chauliocola')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma coleopterae')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma corruscae')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma entomophilum')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma florum')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma grammopterae')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma lactucae')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma photuris')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma seiffertii')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma syrphidae')
,('Entomoplasmatales','Entomoplasmataceae','Mesoplasma','Mesoplasma tabanidae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma alleghenense')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma apis')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma atrichopogonis')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma cantharicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma chinense')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma chrysopicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma citri')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma clarkii')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma corruscae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma culicicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma diabroticae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma diminutum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma eriocheiris')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma floricola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma gladiatoris')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma helicoides')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma insolitum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma ixodetis')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma kunkelii')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma lampyridicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma leptinotarsae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma leucomae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma lineolae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma litorale')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma melliferum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma mirum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma monobiae')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma montanense')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma penaei')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma phoeniceum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma platyhelix')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma poulsonii')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma sabaudiense')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma syrphidicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma tabanidicola')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma taiwanense')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma turonicum')
,('Entomoplasmatales','Spiroplasmataceae','Spiroplasma','Spiroplasma velocicrescens')
,('Euzebyales','Euzebyaceae','Euzebya','Euzebya tangerina')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia asymmetrica')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia belizensis')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia filum')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia gubbarnorum')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia lunulifera')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia rosea')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia ruberrima')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia rubromaculata')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia rufa')
,('Filospermoidea','Haplognathiidae','Haplognathia','Haplognathia simplex')
,('Filospermoidea','Pterognathiidae','Cosmognathia','Cosmognathia aquila')
,('Filospermoidea','Pterognathiidae','Cosmognathia','Cosmognathia arcus')
,('Filospermoidea','Pterognathiidae','Cosmognathia','Cosmognathia bastillae')
,('Filospermoidea','Pterognathiidae','Cosmognathia','Cosmognathia manubrium')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia alcicornis')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia atrox')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia crocodilus')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia ctenifera')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia hawaiiensis')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia meixneri')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia pygmaea')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia sica')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia sorex')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia swedmarki')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia ugera')
,('Filospermoidea','Pterognathiidae','Pterognathia','Pterognathia vilii')
,('Gaiellales','Gaiellaceae','Gaiella','Gaiella occulta')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima antarctica')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima borealis')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima brattstroemi')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima mediterranea')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima reisingeri')
,('Gnosonesimida','Gnosonesimidae','Gnosonesima','Gnosonesima tropicalis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius abaiconus')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius abbreviatus')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius alfredi')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius australiensis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius deshayesi')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius echinatus')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius funis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius inesae')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius irregularis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius latastei')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius lineatus')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius palustre')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius raphaelis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius sankurensis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius ugandensis')
,('Gordioidea','Chordodidae','Beatogordius','Beatogordius variabilis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes aethiopicus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes africanus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ambonensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes annandalei')
,('Gordioidea','Chordodidae','Chordodes','Chordodes annulatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes anthophorus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes aquaeductus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes balzani')
,('Gordioidea','Chordodidae','Chordodes','Chordodes baramensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes bouvieri')
,('Gordioidea','Chordodidae','Chordodes','Chordodes brasiliensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes brevipilus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes caledoniensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes cameranonis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes capensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes capillatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes carioca')
,('Gordioidea','Chordodidae','Chordodes','Chordodes carmelitanus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes compressus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes congolensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes corderoi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes cornuta')
,('Gordioidea','Chordodidae','Chordodes','Chordodes cubanensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes curvicillatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes delmae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes devius')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ferganensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ferox')
,('Gordioidea','Chordodidae','Chordodes','Chordodes festae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes fukuii')
,('Gordioidea','Chordodidae','Chordodes','Chordodes furnessi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes guineensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes hamatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes hawkeri')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ibembensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes insidiator')
,('Gordioidea','Chordodidae','Chordodes','Chordodes jandae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes japonensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes kivuensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes kolensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes koreensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes lenti')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ligasiensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes liguligerus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes maculatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes madagascariensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes matensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes mobensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes modiglianii')
,('Gordioidea','Chordodidae','Chordodes','Chordodes montgomeryi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes moraisi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes morgani')
,('Gordioidea','Chordodidae','Chordodes','Chordodes moutoni')
,('Gordioidea','Chordodidae','Chordodes','Chordodes nietoi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes ornatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes parasitus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes peraccae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes pilosus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes pollonerae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes polytuberculatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes queenslandi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes shipleyi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes siamensis')
,('Gordioidea','Chordodidae','Chordodes','Chordodes silvestri')
,('Gordioidea','Chordodidae','Chordodes','Chordodes skoritowi')
,('Gordioidea','Chordodidae','Chordodes','Chordodes staviarskii')
,('Gordioidea','Chordodidae','Chordodes','Chordodes tenodarae')
,('Gordioidea','Chordodidae','Chordodes','Chordodes tuberculatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes undulatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes variopapillatus')
,('Gordioidea','Chordodidae','Chordodes','Chordodes wangi')
,('Gordioidea','Chordodidae','Dacochordodes','Dacochordodes bacescui')
,('Gordioidea','Chordodidae','Digordius','Digordius excavatus')
,('Gordioidea','Chordodidae','Digordius','Digordius trinacris')
,('Gordioidea','Chordodidae','Euchordodes','Euchordodes libellulovivens')
,('Gordioidea','Chordodidae','Euchordodes','Euchordodes malaysiensis')
,('Gordioidea','Chordodidae','Euchordodes','Euchordodes nigromaculatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus alpestris')
,('Gordioidea','Chordodidae','Gordionus','Gordionus bilinareolatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus densareolatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus diligens')
,('Gordioidea','Chordodidae','Gordionus','Gordionus dubiosus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus harpali')
,('Gordioidea','Chordodidae','Gordionus','Gordionus kaschgaricus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus lenae')
,('Gordioidea','Chordodidae','Gordionus','Gordionus lineatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus linourgos')
,('Gordioidea','Chordodidae','Gordionus','Gordionus longareolatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus longistriatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus lunatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus molopsis')
,('Gordioidea','Chordodidae','Gordionus','Gordionus ondulatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus platycephalus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus porosus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus punctulatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus scaber')
,('Gordioidea','Chordodidae','Gordionus','Gordionus semistriatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus silphae')
,('Gordioidea','Chordodidae','Gordionus','Gordionus sinepilosus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus strigatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus sulcatus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus thienemanni')
,('Gordioidea','Chordodidae','Gordionus','Gordionus thuringensis')
,('Gordioidea','Chordodidae','Gordionus','Gordionus violaceus')
,('Gordioidea','Chordodidae','Gordionus','Gordionus wolterstorffii')
,('Gordioidea','Chordodidae','Lanochordodes','Lanochordodes zeravshanicus')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes californensis')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes chordodides')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes columbianus')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes molukkanus')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes occidentalis')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes punctatus')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes semiluna')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes talensis')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes uniareolatus')
,('Gordioidea','Chordodidae','Neochordodes','Neochordodes weberi')
,('Gordioidea','Chordodidae','Noteochordodes','Noteochordodes desantisi')
,('Gordioidea','Chordodidae','Noteochordodes','Noteochordodes saltae')
,('Gordioidea','Chordodidae','Pantachordodes','Pantachordodes europaeus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes arndti')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes capitosulcatus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes ciferrii')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes gemmatus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes lestica')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes magnus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes megareolatus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes modestus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes okadai')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes orientalis')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes propareolatus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes pustulosus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes speciosus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes tegonotus')
,('Gordioidea','Chordodidae','Parachordodes','Parachordodes tolosanus')
,('Gordioidea','Chordodidae','Paragordionus','Paragordionus dispar')
,('Gordioidea','Chordodidae','Paragordionus','Paragordionus kawamurai')
,('Gordioidea','Chordodidae','Paragordionus','Paragordionus rautheri')
,('Gordioidea','Chordodidae','Paragordionus','Paragordionus vejdovskyi')
,('Gordioidea','Chordodidae','Paragordius','Paragordius diversolobatus')
,('Gordioidea','Chordodidae','Paragordius','Paragordius esavianus')
,('Gordioidea','Chordodidae','Paragordius','Paragordius flavescens')
,('Gordioidea','Chordodidae','Paragordius','Paragordius minusculus')
,('Gordioidea','Chordodidae','Paragordius','Paragordius stylosus')
,('Gordioidea','Chordodidae','Paragordius','Paragordius tricuspidatus')
,('Gordioidea','Chordodidae','Paragordius','Paragordius varius')
,('Gordioidea','Chordodidae','Progordius','Progordius maculosus')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes bedriagae')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes bulbareolatus')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes dugesi')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes gestri')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes gordioides')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes manteri')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes meridionalis')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes pardalis')
,('Gordioidea','Chordodidae','Pseudochordodes','Pseudochordodes texanus')
,('Gordioidea','Chordodidae','Pseudogordius','Pseudogordius tanganyikae')
,('Gordioidea','Chordodidae','Semigordionus','Semigordionus circumannulatus')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes actiniphorus')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes baeri')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes cameranoi')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes piliferus')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes tellinii')
,('Gordioidea','Chordodidae','Spinochordodes','Spinochordodes vitiferus')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius acuminatus')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius americanus')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius australiensis')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius doriae')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius feae')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius incertus')
,('Gordioidea','Gordiidae','Acutogordius','Acutogordius obesus')
,('Gordioidea','Gordiidae','Gordius','Gordius aeneus')
,('Gordioidea','Gordiidae','Gordius','Gordius alascensis')
,('Gordioidea','Gordiidae','Gordius','Gordius albopunctatus')
,('Gordioidea','Gordiidae','Gordius','Gordius alpinus')
,('Gordioidea','Gordiidae','Gordius','Gordius angulatus')
,('Gordioidea','Gordiidae','Gordius','Gordius aquaticus')
,('Gordioidea','Gordiidae','Gordius','Gordius attoni')
,('Gordioidea','Gordiidae','Gordius','Gordius bivittatus')
,('Gordioidea','Gordiidae','Gordius','Gordius borisphaenicus')
,('Gordioidea','Gordiidae','Gordius','Gordius cavernarum')
,('Gordioidea','Gordiidae','Gordius','Gordius chilensis')
,('Gordioidea','Gordiidae','Gordius','Gordius dectici')
,('Gordioidea','Gordiidae','Gordius','Gordius difficilis')
,('Gordioidea','Gordiidae','Gordius','Gordius fulgur')
,('Gordioidea','Gordiidae','Gordius','Gordius germanicus')
,('Gordioidea','Gordiidae','Gordius','Gordius gesneri')
,('Gordioidea','Gordiidae','Gordius','Gordius guatemalensis')
,('Gordioidea','Gordiidae','Gordius','Gordius interjectus')
,('Gordioidea','Gordiidae','Gordius','Gordius japonicus')
,('Gordioidea','Gordiidae','Gordius','Gordius kimmeriensis')
,('Gordioidea','Gordiidae','Gordius','Gordius longissimus')
,('Gordioidea','Gordiidae','Gordius','Gordius lumpei')
,('Gordioidea','Gordiidae','Gordius','Gordius luteopunctatus')
,('Gordioidea','Gordiidae','Gordius','Gordius mongolicus')
,('Gordioidea','Gordiidae','Gordius','Gordius mulleri')
,('Gordioidea','Gordiidae','Gordius','Gordius nonmaculatus')
,('Gordioidea','Gordiidae','Gordius','Gordius ogatai')
,('Gordioidea','Gordiidae','Gordius','Gordius omensis')
,('Gordioidea','Gordiidae','Gordius','Gordius paranensis')
,('Gordioidea','Gordiidae','Gordius','Gordius perronciti')
,('Gordioidea','Gordiidae','Gordius','Gordius pioltii')
,('Gordioidea','Gordiidae','Gordius','Gordius platyurus')
,('Gordioidea','Gordiidae','Gordius','Gordius plicatulus')
,('Gordioidea','Gordiidae','Gordius','Gordius preslii')
,('Gordioidea','Gordiidae','Gordius','Gordius robustus')
,('Gordioidea','Gordiidae','Gordius','Gordius setiger')
,('Gordioidea','Gordiidae','Gordius','Gordius sinareolatus')
,('Gordioidea','Gordiidae','Gordius','Gordius solaris')
,('Gordioidea','Gordiidae','Gordius','Gordius sphaerura')
,('Gordioidea','Gordiidae','Gordius','Gordius stellatus')
,('Gordioidea','Gordiidae','Gordius','Gordius tatrensis')
,('Gordioidea','Gordiidae','Gordius','Gordius tenuis')
,('Gordioidea','Gordiidae','Gordius','Gordius testaceus')
,('Gordioidea','Gordiidae','Gordius','Gordius tirolensis')
,('Gordioidea','Gordiidae','Gordius','Gordius turcomanicus')
,('Gordioidea','Gordiidae','Gordius','Gordius undulatus')
,('Gordioidea','Gordiidae','Gordius','Gordius verrucosus')
,('Haloplasmatales','Haloplasmataceae','Haloplasma','Haloplasma contractile')
,('Haplopharyngida','Haplopharyngidae','Haplopharynx','Haplopharynx papii')
,('Haplopharyngida','Haplopharyngidae','Haplopharynx','Haplopharynx quadristimulus')
,('Haplopharyngida','Haplopharyngidae','Haplopharynx','Haplopharynx rostratus')
,('Heterocyemida','Conocyemidae','Conocyema','Conocyema deca')
,('Heterocyemida','Conocyemidae','Conocyema','Conocyema polymorpha')
,('Heterocyemida','Conocyemidae','Microcyema','Microcyema vespa')
,('Homalorhagida','Neocentrophyidae','Neocentrophyes','Neocentrophyes intermedius')
,('Homalorhagida','Neocentrophyidae','Neocentrophyes','Neocentrophyes satyai')
,('Homalorhagida','Neocentrophyidae','Paracentrophyes','Paracentrophyes praedictus')
,('Homalorhagida','Neocentrophyidae','Paracentrophyes','Paracentrophyes quadridentatus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus anomalus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus apotomus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus belizensis')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus cataphractus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus deirophorus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus distentus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus erismatus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus fimbriatus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus giganteus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus ilyocryptus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus langi')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus mainensis')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus paraneapolitanus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus phyllotropis')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus rabaulensis')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus spinosus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus stenopygus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus trisetosus')
,('Homalorhagida','Pycnophyidae','Kinorhynchus','Kinorhynchus yushini')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes arctous')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes argentinensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes australensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes barentsi')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes beaufortensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes borealis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes calmani')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes canadensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes carinatus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes chiliensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes chukchiensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes communis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes corrugatus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes cryopygus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes dentatus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes ecphantor')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes egyptensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes emarginatus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes faveolus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes flaveolatus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes frequens')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes furugelmi')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes galtsovae')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes greenlandicus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes iniorhaptus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes kielensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes longicornis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes maximus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes mokievskii')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes neuhausi')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes newguiniensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes newzealandiensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes odhneri')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes parasanjuanensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes ponticus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes robustus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes rugosus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes sanjuanensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes schornikovi')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes sculptus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes spitsbergensis')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes tubuliferus')
,('Homalorhagida','Pycnophyidae','Pycnophyes','Pycnophyes zelinkaei')
,('Kickxellales','Kickxellaceae','Coemansia','Coemansia corticii')
,('Kickxellales','Kickxellaceae','Coemansia','Coemansia reversa')
,('Kickxellales','Kickxellaceae','Dipsacomyces','Dipsacomyces acuminosporus')
,('Kickxellales','Kickxellaceae','Kickxella','Kickxella alabastrina')
,('Kickxellales','Kickxellaceae','Linderina','Linderina pennisoria')
,('Kickxellales','Kickxellaceae','Martensella','Martensella pectinata')
,('Kickxellales','Kickxellaceae','Martensiomyces','Martensiomyces pterosporus')
,('Kickxellales','Kickxellaceae','Spirodactylon','Spirodactylon aureum')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola baltica')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola cornuta')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola indica')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola mesotyphle')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola roscovita')
,('Macrodasyida','Dactylopodolidae','Dactylopodola','Dactylopodola typhle')
,('Macrodasyida','Dactylopodolidae','Dendrodasys','Dendrodasys affinis')
,('Macrodasyida','Dactylopodolidae','Dendrodasys','Dendrodasys gracilis')
,('Macrodasyida','Dactylopodolidae','Dendrodasys','Dendrodasys pacificus')
,('Macrodasyida','Dactylopodolidae','Dendrodasys','Dendrodasys ponticus')
,('Macrodasyida','Dactylopodolidae','Dendropodola','Dendropodola transitionalis')
,('Macrodasyida','Dactylopodolidae','Redudasys','Redudasys fornerise')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys badrosomus')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys cambriensis')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys caudatus')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys littoralis')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys maximus')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys miniceraus')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys pacificus')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys palavensis')
,('Macrodasyida','Lepidodasyidae','Cephalodasys','Cephalodasys turbanelloides')
,('Macrodasyida','Lepidodasyidae','Dolichodasys','Dolichodasys carolinensis')
,('Macrodasyida','Lepidodasyidae','Dolichodasys','Dolichodasys delicatus')
,('Macrodasyida','Lepidodasyidae','Dolichodasys','Dolichodasys elongatus')
,('Macrodasyida','Lepidodasyidae','Lepidodasys','Lepidodasys arcolepis')
,('Macrodasyida','Lepidodasyidae','Lepidodasys','Lepidodasys castoroides')
,('Macrodasyida','Lepidodasyidae','Lepidodasys','Lepidodasys martini')
,('Macrodasyida','Lepidodasyidae','Lepidodasys','Lepidodasys platyurus')
,('Macrodasyida','Lepidodasyidae','Lepidodasys','Lepidodasys unicarenatus')
,('Macrodasyida','Lepidodasyidae','Megadasys','Megadasys minor')
,('Macrodasyida','Lepidodasyidae','Megadasys','Megadasys pacificus')
,('Macrodasyida','Lepidodasyidae','Megadasys','Megadasys sterreri')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys adenotubulatus')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys hexapodus')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys ischiensis')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys laticaudatus')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys littoralis')
,('Macrodasyida','Lepidodasyidae','Mesodasys','Mesodasys lobocercus')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys hexadactylus')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys lineatus')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys littoralis')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys nipponensis')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys pacificus')
,('Macrodasyida','Lepidodasyidae','Paradasys','Paradasys subterraneus')
,('Macrodasyida','Lepidodasyidae','Pleurodasys','Pleurodasys helgolandicus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys affinis')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys africanus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys andamanensis')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys balticus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys buddenbrocki')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys caudatus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys cephalatus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys cunctatus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys fornerise')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys gerlachi')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys hexadactylus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys indicus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys neapolitanus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys pacificus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys remanei')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys thuscus')
,('Macrodasyida','Macrodasyidae','Macrodasys','Macrodasys waltairensis')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys acanthostylis')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys anorektoxys')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys calicostylus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys cornustylus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys elongatus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys mirabilis')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys nodostylus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys remostylus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys spirostylus')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys uncinostylis')
,('Macrodasyida','Macrodasyidae','Urodasys','Urodasys viviparus')
,('Macrodasyida','Planodasyidae','Crasiella','Crasiella diplura')
,('Macrodasyida','Planodasyidae','Crasiella','Crasiella indica')
,('Macrodasyida','Planodasyidae','Crasiella','Crasiella oceanica')
,('Macrodasyida','Planodasyidae','Crasiella','Crasiella pacifica')
,('Macrodasyida','Planodasyidae','Planodasys','Planodasys littoralis')
,('Macrodasyida','Planodasyidae','Planodasys','Planodasys marginalis')
,('Macrodasyida','Thaumastodermatidae','Acanthodasys','Acanthodasys aculeatus')
,('Macrodasyida','Thaumastodermatidae','Acanthodasys','Acanthodasys arcassonensis')
,('Macrodasyida','Thaumastodermatidae','Acanthodasys','Acanthodasys fibrosus')
,('Macrodasyida','Thaumastodermatidae','Acanthodasys','Acanthodasys lineatus')
,('Macrodasyida','Thaumastodermatidae','Acanthodasys','Acanthodasys silvulus')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys ankeli')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys caudatus')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys meloriae')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys minor')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys platydasyoides')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys remanei')
,('Macrodasyida','Thaumastodermatidae','Diplodasys','Diplodasys swedmarki')
,('Macrodasyida','Thaumastodermatidae','Hemidasys','Hemidasys agaso')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys mastigurus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys maximus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys ocellatus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys pacificus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys phacellatus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys rarus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys ruber')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys styliferus')
,('Macrodasyida','Thaumastodermatidae','Platydasys','Platydasys tentaculatus')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella andamanica')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella cataphracta')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella etrusca')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella faroensis')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella indica')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella klauserae')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella malayica')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella megapalpator')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella plumosa')
,('Macrodasyida','Thaumastodermatidae','Pseudostomella','Pseudostomella roscovita')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella brachycephala')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella helana')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella higginsi')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella lepidota')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella mediterranea')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella ommatophora')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella pectinata')
,('Macrodasyida','Thaumastodermatidae','Ptychostomella','Ptychostomella tyrrhenica')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma anomalopsum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma antennatum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma aphenothigmum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma apus')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma arcticum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma boadeni')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma boreale')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma bulbosum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma bunti')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma cirrophora')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma coeliopodium')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma dendricum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma dragescoi')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma enallosa')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma esarabdophorum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma faroense')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma gracilium')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma heterotubulatum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma hirtum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma hoonsooi')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma hypopsilancrum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma hystrix')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma indica')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma inequitubulatum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma insulare')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma kontosomum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma littoralis')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma massiliense')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma megastomum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma norvegicum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma pachysomum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma pacificum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma papii')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma paradoxa')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma paralittoralis')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma polyacanthum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma polypodium')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma polyprobolostomum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma psilotopum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma pugetensis')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma quadritentaculatum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma renaudae')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma sanctaecaterinae')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma sardum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma schizocirratum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma suecica')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma swedmarki')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma tanymesatherum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma tentaculata')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma thysanogaster')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma thysanophorum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma tribolosum')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma vera')
,('Macrodasyida','Thaumastodermatidae','Tetranchyroderma','Tetranchyroderma weissi')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma arcassonense')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma bifurcatum')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma cantacuzeni')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma heideri')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma mediterraneum')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma moebjergi')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma ramuliferum')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma renaudae')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma swedmarki')
,('Macrodasyida','Thaumastodermatidae','Thaumastoderma','Thaumastoderma symphorochetum')
,('Macrodasyida','Turbanellidae','Desmodasys','Desmodasys borealis')
,('Macrodasyida','Turbanellidae','Desmodasys','Desmodasys phocoides')
,('Macrodasyida','Turbanellidae','Dinodasys','Dinodasys mirabilis')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella aggregotubulata')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella armoricana')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella boadeni')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella brevicaudatus')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella cuanensis')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella dohrni')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella eireanna')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella intermedia')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella mesoptera')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella pallida')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella palpibara')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella scanica')
,('Macrodasyida','Turbanellidae','Paraturbanella','Paraturbanella teissieri')
,('Macrodasyida','Turbanellidae','Prostobuccantia','Prostobuccantia brocha')
,('Macrodasyida','Turbanellidae','Pseudoturbanella','Pseudoturbanella stylifera')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella ambronensis')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella aminensis')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella bengalensis')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella bocqueti')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella corderoi')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella cornuta')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella digitifera')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella hyalina')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella indica')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella italica')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella lutheri')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella multidigitata')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella mustela')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella ocellata')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella otti')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella pacifica')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella palaciosi')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella petiti')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella plana')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella pontica')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella reducta')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella remanei')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella subterranea')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella thiophila')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella varians')
,('Macrodasyida','Turbanellidae','Turbanella','Turbanella veneziana')
,('Macrodasyida','Turbanellidae','Xenodasys','Xenodasys antennatus')
,('Macrodasyida','Turbanellidae','Xenodasys','Xenodasys riedli')
,('Macrodasyida','Turbanellidae','Xenodasys','Xenodasys sanctigoulveni')
,('Macrostomida','Macrostomidae','Antromacrostomum','Antromacrostomum armatum')
,('Macrostomida','Macrostomidae','Archimacrostomum','Archimacrostomum beaufortense')
,('Macrostomida','Macrostomidae','Archimacrostomum','Archimacrostomum brasiliensis')
,('Macrostomida','Macrostomidae','Archimacrostomum','Archimacrostomum hustedi')
,('Macrostomida','Macrostomidae','Archimacrostomum','Archimacrostomum sublitorale')
,('Macrostomida','Macrostomidae','Axia','Axia gieysztori')
,('Macrostomida','Macrostomidae','Bradburia','Bradburia australiensis')
,('Macrostomida','Macrostomidae','Bradburia','Bradburia miraculicis')
,('Macrostomida','Macrostomidae','Dunwichia','Dunwichia arenosa')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum acus')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum acutum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum aegyptium')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum amaniense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum amurense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum appendiculatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum astericis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum auriculatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum australiense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum axi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum balticum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum baringoense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum bellebaruchae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum bicaudatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum bicurvistyla')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum boreale')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum brevituba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum burti')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum cairoense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum calcaris')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum caprariae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum carolinense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum catarractae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ceylanicum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum christinae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum clavistylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum clavituba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum collistylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum contortum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum coomerensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum coxi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum curvata')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum curvistylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum curvituba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum delphax')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum deltanensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum distinguendum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum dongyuanensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum dorsiforum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum elgonense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ensiferum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ermini')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum evelinae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum extraculum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum fergussoni')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum finnlandense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum flexum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum frigorophilum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum gallicum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum galloprovinciale')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum georgeense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum gilberti')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum glochistylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum goharii')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum gracile')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum graffi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum granulophorum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum greenwoodi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum guttulatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum hamatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum heyuanensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum hofsteni')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum hystricinum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum hystrix')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ideficis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum incurvatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum inductum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum inflatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum infundibuliferum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum intermedium')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ismailiensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum japonicum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum johni')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum karlingi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum kepneri')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum korsakovi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum leptos')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum lewisi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum lignano')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum lineare')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum longistyliferum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum longituba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum lutheri')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum magnacurvituba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum majesticis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum mediterraneum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum megalogastricum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum minutum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum mosquense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum mystrophorum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum nairobiense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum nassonovi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum niloticum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum norfolkensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum obelicis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum obtusa')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum obtusum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ontarioense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum orthostylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum parmum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum peteraxi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum phillipsi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum phocurum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum pithecusae')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum platensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum poznaniense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum prognosticis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum pseudoobscurum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum puntapiedrensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum purpureum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum pusillum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum quiritium')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum rectum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum recurvostylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum retortum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum reynoldsi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum reynoldsoni')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum rhabdophorum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum riedeli')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum romanicum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum rostratum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum rubrocinctum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum ruebushi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum saifunicum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum salemensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum schmitti')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum semicirculatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum sensitivum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum shenandoahense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum silesiacum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum sinensis')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum sinyaense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum stepposus')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum stylopensillum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum subterraneum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum tennesseense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum tenuicauda')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum thermale')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum thingithuense')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum timavi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum troubadicus')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum truncatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum tuba')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum uncinatum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum vejdovskyi')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum velastylum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum virginianum')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum viride')
,('Macrostomida','Macrostomidae','Macrostomum','Macrostomum xiamensis')
,('Macrostomida','Macrostomidae','Omalostomum','Omalostomum claparedii')
,('Macrostomida','Macrostomidae','Omalostomum','Omalostomum schultzei')
,('Macrostomida','Macrostomidae','Promacrostomum','Promacrostomum palum')
,('Macrostomida','Macrostomidae','Promacrostomum','Promacrostomum paradoxum')
,('Macrostomida','Macrostomidae','Protomacrostomum','Protomacrostomum groenlandicum')
,('Macrostomida','Macrostomidae','Psammomacrostomum','Psammomacrostomum equicaudum')
,('Macrostomida','Macrostomidae','Psammomacrostomum','Psammomacrostomum turbanelloides')
,('Macrostomida','Macrostomidae','Siccomacrostomum','Siccomacrostomum triviale')
,('Mortierellales','Mortierellaceae','Aquamortierella','Aquamortierella elegans')
,('Mortierellales','Mortierellaceae','Azygozygum','Azygozygum chlamydosporum')
,('Mortierellales','Mortierellaceae','Dissophora','Dissophora decumbens')
,('Mortierellales','Mortierellaceae','Echinosprangium','Echinosprangium aceris')
,('Mortierellales','Mortierellaceae','Haplosporangium','Haplosporangium bisporale')
,('Mortierellales','Mortierellaceae','Mortierella','Mortierella polycephala')
,('Mucorales','Choanephoraceae','Blakeslea','Blakeslea trispora')
,('Mucorales','Choanephoraceae','Choanephora','Choanephora conjuncta')
,('Mucorales','Choanephoraceae','Choanephora','Choanephora cucurbitarum')
,('Mucorales','Choanephoraceae','Choanephora','Choanephora infundibulifera')
,('Mucorales','Cunninghamellaceae','Cunninghamella','Cunninghamella africana')
,('Mucorales','Cunninghamellaceae','Sigmoideomyces','Sigmoideomyces dispiroides')
,('Mucorales','Cunninghamellaceae','Thamnocephalis','Thamnocephalis quadrupedata')
,('Mucorales','Mucoraceae','Mucor','Mucor caninus')
,('Mycoplasmatales','Mycoplasmataceae','Eperythrozoon','Eperythrozoon coccoides')
,('Mycoplasmatales','Mycoplasmataceae','Eperythrozoon','Eperythrozoon parvum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma adleri')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma agalactiae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma agassizii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma alkalescens')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma alligatoris')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma alvi')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma amphoriforme')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma anatis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma anseris')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma arginini')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma arthritidis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma auris')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma bovigenitalium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma bovirhinis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma bovis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma bovoculi')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma buccale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma buteonis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma californicum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma canadense')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma canis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma capricolum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma caviae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma cavipharyngis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma citelli')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma cloacale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma collis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma columbinasale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma columbinum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma columborale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma conjunctivae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma corogypsi')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma cottewii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma cricetuli')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma crocodyli')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma cynos')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma dispar')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma edwardii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma elephantis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma equigenitalium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma equirhinis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma falconis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma fastidiosum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma faucium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma felifaucium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma feliminutum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma felis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma fermentans')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma flocculare')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gallinaceum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gallinarum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gallisepticum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gallopavonis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gateae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma genitalium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma glycophilum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma gypis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma haemocanis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma haemofelis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma haemomuris')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma hominis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma hyopharyngis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma hyopneumoniae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma hyorhinis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma hyosynoviae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma iguanae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma imitans')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma indiense')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma iners')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma iowae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma lagogenitalium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma leachii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma leonicaptivi')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma leopharyngis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma lipofaciens')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma lipophilum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma maculosum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma meleagridis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma microti')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma moatsii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma mobile')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma molare')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma mucosicanis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma muris')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma mustelae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma mycoides')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma neophronis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma neurolyticum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma opalescens')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma orale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma ovipneumoniae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma ovis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma oxoniensis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma penetrans')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma phocae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma phocicerebrale')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma phocirhinis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma pirum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma pneumoniae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma primatum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma pullorum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma pulmonis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma putrefaciens')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma salivarium')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma simbae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma spermatophilum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma spumans')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma sturni')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma sualvi')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma subdolum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma suis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma synoviae')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma testudineum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma testudinis')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma verecundum')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma wenyonii')
,('Mycoplasmatales','Mycoplasmataceae','Mycoplasma','Mycoplasma yeatsii')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma canigenitalium')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma cati')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma diversum')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma felinum')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma gallorale')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma parvum')
,('Mycoplasmatales','Mycoplasmataceae','Ureaplasma','Ureaplasma urealyticum')
,('Nanaloricida','Nanaloricidae','Armorloricus','Armorloricus davidi')
,('Nanaloricida','Nanaloricidae','Armorloricus','Armorloricus elegans')
,('Nanaloricida','Nanaloricidae','Armorloricus','Armorloricus kristenseni')
,('Nanaloricida','Nanaloricidae','Nanaloricus','Nanaloricus khaitatus')
,('Nanaloricida','Nanaloricidae','Nanaloricus','Nanaloricus mysticus')
,('Nanaloricida','Nanaloricidae','Phoeniciloricus','Phoeniciloricus simplidigitatus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus corvus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus dubius')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus enigmaticus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus gracilis')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus hadalis')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus leocaudatus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus orphanus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus pedicularis')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus profundus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus senicirrus')
,('Nanaloricida','Pliciloricidae','Pliciloricus','Pliciloricus shukeri')
,('Nanaloricida','Pliciloricidae','Rugiloricus','Rugiloricus carolinensis')
,('Nanaloricida','Pliciloricidae','Rugiloricus','Rugiloricus cauliculus')
,('Nanaloricida','Pliciloricidae','Rugiloricus','Rugiloricus ornatus')
,('Nanaloricida','Pliciloricidae','Rugiloricus','Rugiloricus polaris')
,('Nanaloricida','Pliciloricidae','Titaniloricus','Titaniloricus inexpectatovus')
,('Nectonematoidea','Nectonemidae','Nectonema','Nectonema agile')
,('Nectonematoidea','Nectonemidae','Nectonema','Nectonema melanocephalum')
,('Nectonematoidea','Nectonemidae','Nectonema','Nectonema munidae')
,('Nectonematoidea','Nectonemidae','Nectonema','Nectonema svensksundi')
,('Nectonematoidea','Nectonemidae','Nectonema','Nectonema zealandica')
,('Nitriliruptorales','Nitriliruptoraceae','Nitriliruptor','Nitriliruptor alkaliphilus')
,('Plasmodigenea','Pelmatosphaeridae','Pelmatosphaera','Pelmatosphaera polycirri')
,('Plasmodigenea','Rhopaluridae','Ciliocincta','Ciliocincta akkeshiensis')
,('Plasmodigenea','Rhopaluridae','Ciliocincta','Ciliocincta julini')
,('Plasmodigenea','Rhopaluridae','Ciliocincta','Ciliocincta sabellariae')
,('Plasmodigenea','Rhopaluridae','Intoshia','Intoshia leptoplanae')
,('Plasmodigenea','Rhopaluridae','Intoshia','Intoshia linei')
,('Plasmodigenea','Rhopaluridae','Intoshia','Intoshia metchnikovi')
,('Plasmodigenea','Rhopaluridae','Intoshia','Intoshia paraphanostomae')
,('Plasmodigenea','Rhopaluridae','Intoshia','Intoshia variabili')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura elongata')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura granosa')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura litoralis')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura major')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura murmanica')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura ophiocomae')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura philinae')
,('Plasmodigenea','Rhopaluridae','Rhopalura','Rhopalura sanguinea')
,('Plasmodigenea','Rhopaluridae','Stoecharthrum','Stoecharthrum burresoni')
,('Plasmodigenea','Rhopaluridae','Stoecharthrum','Stoecharthrum fosterae')
,('Plasmodigenea','Rhopaluridae','Stoecharthrum','Stoecharthrum giardi')
,('Plasmodigenea','Rhopaluridae','Stoecharthrum','Stoecharthrum monnati')
,('Polycladida','Amyellidae','Amyella','Amyella lineata')
,('Polycladida','Amyellidae','Chromyella','Chromyella saga')
,('Polycladida','Anocellidae','Anocellidus','Anocellidus profundus')
,('Polycladida','Anonymidae','Anonymus','Anonymus kaikourensis')
,('Polycladida','Anonymidae','Anonymus','Anonymus multivirilis')
,('Polycladida','Anonymidae','Anonymus','Anonymus virilis')
,('Polycladida','Anonymidae','Marcusia','Marcusia ernesti')
,('Polycladida','Anonymidae','Simpliciplana','Simpliciplana marginata')
,('Polycladida','Apidioplanidae','Apidioplana','Apidioplana apluda')
,('Polycladida','Apidioplanidae','Apidioplana','Apidioplana mira')
,('Polycladida','Apidioplanidae','Apidioplana','Apidioplana okadai')
,('Polycladida','Apidioplanidae','Apidioplana','Apidioplana similis')
,('Polycladida','Boniniidae','Boninia','Boninia antillarum')
,('Polycladida','Boniniidae','Boninia','Boninia divae')
,('Polycladida','Boniniidae','Boninia','Boninia mirabilis')
,('Polycladida','Boniniidae','Boninia','Boninia neotethydis')
,('Polycladida','Boniniidae','Paraboninia','Paraboninia caymanensis')
,('Polycladida','Boniniidae','Traunfelsia','Traunfelsia elongata')
,('Polycladida','Callioplanidae','Ancoratheca','Ancoratheca australiensis')
,('Polycladida','Callioplanidae','Aotearoa','Aotearoa ballantinensis')
,('Polycladida','Callioplanidae','Asolenia','Asolenia deilogyna')
,('Polycladida','Callioplanidae','Callioplana','Callioplana evelinae')
,('Polycladida','Callioplanidae','Callioplana','Callioplana marginata')
,('Polycladida','Callioplanidae','Crassiplana','Crassiplana albatrossi')
,('Polycladida','Callioplanidae','Discostylochus','Discostylochus parcus')
,('Polycladida','Callioplanidae','Discostylochus','Discostylochus yatsui')
,('Polycladida','Callioplanidae','Kaburakia','Kaburakia excelsa')
,('Polycladida','Callioplanidae','Kaburakia','Kaburakia oceanica')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus burchami')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus elongatus')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus fulvus')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus longipenis')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus meridialis')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus notoensis')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus ostreophagus')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus siamensis')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus stimpsoni')
,('Polycladida','Callioplanidae','Koinostylochus','Koinostylochus takeshitai')
,('Polycladida','Callioplanidae','Meixneria','Meixneria furva')
,('Polycladida','Callioplanidae','Munseoma','Munseoma maculata')
,('Polycladida','Callioplanidae','Neostylochus','Neostylochus caraibica')
,('Polycladida','Callioplanidae','Neostylochus','Neostylochus fulvopunctatus')
,('Polycladida','Callioplanidae','Neostylochus','Neostylochus pacificus')
,('Polycladida','Callioplanidae','Neostylochus','Neostylochus viridis')
,('Polycladida','Callioplanidae','Parastylochus','Parastylochus astis')
,('Polycladida','Callioplanidae','Tokiphallus','Tokiphallus bartschi')
,('Polycladida','Candimboididae','Candimboides','Candimboides cuneiformis')
,('Polycladida','Cestoplanidae','Acestoplana','Acestoplana raffaelei')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana ceylanica')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana faraglionensis')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana marina')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana nexa')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana rubrocincta')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana salar')
,('Polycladida','Cestoplanidae','Cestoplana','Cestoplana techa')
,('Polycladida','Cestoplanidae','Cestoplanella','Cestoplanella microps')
,('Polycladida','Cestoplanidae','Cestoplanides','Cestoplanides lactea')
,('Polycladida','Cestoplanidae','Cestoplanoida','Cestoplanoida polypora')
,('Polycladida','Cestoplanidae','Eucestoplana','Eucestoplana cuneata')
,('Polycladida','Cestoplanidae','Eucestoplana','Eucestoplana meridionalis')
,('Polycladida','Chromoplanidae','Chromoplana','Chromoplana bella')
,('Polycladida','Chromoplanidae','Chromoplana','Chromoplana kaikouris')
,('Polycladida','Chromoplanidae','Chromoplana','Chromoplana sirena')
,('Polycladida','Cryptocelidae','Adenodactyloplana','Adenodactyloplana uruguayensis')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis alba')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis amakusaensis')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis compacta')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis equiteni')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis glandulata')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis ijimae')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis insularis')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis lilianae')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis littoralis')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis occidentalis')
,('Polycladida','Cryptocelidae','Cryptocelis','Cryptocelis orientalis')
,('Polycladida','Cryptocelidae','Hylocelis','Hylocelis californica')
,('Polycladida','Cryptocelidae','Hylocelis','Hylocelis diabloensis')
,('Polycladida','Cryptocelidae','Hylocelis','Hylocelis huina')
,('Polycladida','Cryptocelidae','Macginitiella','Macginitiella delmaris')
,('Polycladida','Cryptocelidae','Notoplanella','Notoplanella estelae')
,('Polycladida','Cryptocelidae','Notoplanella','Notoplanella inarmata')
,('Polycladida','Cryptocelidae','Phaenocelis','Phaenocelis medvedica')
,('Polycladida','Cryptocelidae','Phaenocelis','Phaenocelis purpurea')
,('Polycladida','Dicteroidae','Dicteros','Dicteros pacificus')
,('Polycladida','Didangiidae','Didangia','Didangia carneyi')
,('Polycladida','Didangiidae','Didangia','Didangia mactanensis')
,('Polycladida','Diplopharyngeatidae','Diplopharyngeata','Diplopharyngeata filiformis')
,('Polycladida','Diposthidae','Asthenoceros','Asthenoceros woodworthi')
,('Polycladida','Diposthidae','Diposthus','Diposthus corallicola')
,('Polycladida','Diposthidae','Diposthus','Diposthus popeae')
,('Polycladida','Discocelidae','Adenoplana','Adenoplana evelinae')
,('Polycladida','Discocelidae','Adenoplana','Adenoplana obovata')
,('Polycladida','Discocelidae','Adenoplana','Adenoplana platae')
,('Polycladida','Discocelidae','Coronadena','Coronadena mutabilis')
,('Polycladida','Discocelidae','Discocelis','Discocelis fulva')
,('Polycladida','Discocelidae','Discocelis','Discocelis hollemani')
,('Polycladida','Discocelidae','Discocelis','Discocelis japonica')
,('Polycladida','Discocelidae','Discocelis','Discocelis lactea')
,('Polycladida','Discocelidae','Discocelis','Discocelis lichenoides')
,('Polycladida','Discocelidae','Discocelis','Discocelis parvimaculata')
,('Polycladida','Discocelidae','Discocelis','Discocelis persica')
,('Polycladida','Discocelidae','Discocelis','Discocelis pusilla')
,('Polycladida','Discocelidae','Discocelis','Discocelis tigrina')
,('Polycladida','Discocelidae','Thalamoplana','Thalamoplana australis')
,('Polycladida','Discocelidae','Thalamoplana','Thalamoplana herdmani')
,('Polycladida','Discocelidae','Thalamoplana','Thalamoplana insularis')
,('Polycladida','Discocelididae','Pseudodiscocelis','Pseudodiscocelis aegeanensis')
,('Polycladida','Discoprosthididae','Discoprosthides','Discoprosthides patagoniensis')
,('Polycladida','Ditremageniidae','Ditremagenia','Ditremagenia macropharynx')
,('Polycladida','Enantiidae','Enantia','Enantia spinifera')
,('Polycladida','Enantiidae','Spinantia','Spinantia pellucida')
,('Polycladida','Euplanidae','Euplana','Euplana carolinensis')
,('Polycladida','Euplanidae','Euplana','Euplana gracilis')
,('Polycladida','Euplanidae','Euplana','Euplana hymanae')
,('Polycladida','Euplanidae','Euplanina','Euplanina horrida')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida concolor')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida elioti')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida malayana')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida pacificola')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida penangensis')
,('Polycladida','Euplanidae','Euplanoida','Euplanoida tropicalis')
,('Polycladida','Euplanidae','Namyhplana','Namyhplana henriettae')
,('Polycladida','Euplanidae','Paraprostatum','Paraprostatum echinolittorinae')
,('Polycladida','Euplanidae','Semonia','Semonia maculata')
,('Polycladida','Euplanidae','Taenioplana','Taenioplana teredini')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa alba')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa arctica')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa baiae')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa bituna')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa californica')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa inconspicua')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa langi')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa leuca')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa nationalis')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa notulata')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa ochotensis')
,('Polycladida','Euryleptidae','Acerotisa','Acerotisa typhla')
,('Polycladida','Euryleptidae','Anciliplana','Anciliplana graffi')
,('Polycladida','Euryleptidae','Ascidiophilla','Ascidiophilla alba')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus albofasciatus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus atratus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus australis')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus gabriellae')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus guttatus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus harlequin')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus japonicus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus maculatus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus papillosus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus reticulatus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus spiritus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus variegatus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus venetus')
,('Polycladida','Euryleptidae','Cycloporus','Cycloporus xanthopunctatus')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta aurantiaca')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta baeckstroemi')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta californica')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta cornuta')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta fulvolimbata')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta herberti')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta leoparda')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta meridiana')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta multicelis')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta neptis')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta pantherina')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta piscatoria')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta rugosa')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta turma')
,('Polycladida','Euryleptidae','Eurylepta','Eurylepta violacea')
,('Polycladida','Euryleptidae','Euryleptodes','Euryleptodes cavicola')
,('Polycladida','Euryleptidae','Euryleptodes','Euryleptodes galikias')
,('Polycladida','Euryleptidae','Euryleptodes','Euryleptodes insularis')
,('Polycladida','Euryleptidae','Euryleptodes','Euryleptodes pannulus')
,('Polycladida','Euryleptidae','Euryleptodes','Euryleptodes phyllulus')
,('Polycladida','Euryleptidae','Graffizoon','Graffizoon lobatum')
,('Polycladida','Euryleptidae','Katheurylepta','Katheurylepta susakiensis')
,('Polycladida','Euryleptidae','Leptoteredra','Leptoteredra maculata')
,('Polycladida','Euryleptidae','Leptoteredra','Leptoteredra tentaculata')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella aureolineatus')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella crozieri')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella eschara')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella fuscopunctata')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella makranica')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella marygarsonae')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella newmanae')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella ocellata')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella stellata')
,('Polycladida','Euryleptidae','Maritigrella','Maritigrella virgulata')
,('Polycladida','Euryleptidae','Oligoclado','Oligoclado floridanus')
,('Polycladida','Euryleptidae','Oligocladus','Oligocladus auritus')
,('Polycladida','Euryleptidae','Oligocladus','Oligocladus bathymodiensis')
,('Polycladida','Euryleptidae','Oligocladus','Oligocladus sanguinolentus')
,('Polycladida','Euryleptidae','Oligocladus','Oligocladus voightae')
,('Polycladida','Euryleptidae','Parastylostomum','Parastylostomum hozawai')
,('Polycladida','Euryleptidae','Parastylostomum','Parastylostomum maculatum')
,('Polycladida','Euryleptidae','Pareurylepta','Pareurylepta punctata')
,('Polycladida','Euryleptidae','Pareurylepta','Pareurylepta wandeli')
,('Polycladida','Euryleptidae','Praestheceraeus','Praestheceraeus bellostriatus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus albocinctus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus anomalus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus argus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus flavomarginatus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus floridanus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus giesbrechtii')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus maculosus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus meleagrinus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus moseleyi')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus nigricornus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus panamensis')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus pseudolimax')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus roseus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus rubropunctatus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus terricola')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus violaceus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus vittatus')
,('Polycladida','Euryleptidae','Prostheceraeus','Prostheceraeus zebra')
,('Polycladida','Euryleptidae','Stygolepta','Stygolepta hjalmari')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum ellipse')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum felinum')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum frigidum')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum fulvum')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum lentum')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum rusticum')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum sanjuania')
,('Polycladida','Euryleptidae','Stylostomum','Stylostomum spanis')
,('Polycladida','Euryleptididae','Euryleptides','Euryleptides brasiliensis')
,('Polycladida','Faubelidae','Amyris','Amyris favis')
,('Polycladida','Faubelidae','Amyris','Amyris hummelincki')
,('Polycladida','Faubelidae','Amyris','Amyris ujara')
,('Polycladida','Faubelidae','Chiliplana','Chiliplana taltalensis')
,('Polycladida','Faubelidae','Copidoplana','Copidoplana paradoxa')
,('Polycladida','Faubelidae','Diplandros','Diplandros singularis')
,('Polycladida','Faubelidae','Faubelus','Faubelus neupommerensis')
,('Polycladida','Faubelidae','Notoplehnia','Notoplehnia nationalis')
,('Polycladida','Faubelidae','Triadomma','Triadomma curvum')
,('Polycladida','Faubelidae','Triadomma','Triadomma evelinae')
,('Polycladida','Faubelidae','Tripyloplana','Tripyloplana tripyla')
,('Polycladida','Faubelidae','Tripyloplana','Tripyloplana virgae')
,('Polycladida','Gnesiocerotidae','Echinoplana','Echinoplana celerrima')
,('Polycladida','Gnesiocerotidae','Gnesioceros','Gnesioceros floridana')
,('Polycladida','Gnesiocerotidae','Gnesioceros','Gnesioceros sargassicola')
,('Polycladida','Gnesiocerotidae','Planctoplanella','Planctoplanella atlantica')
,('Polycladida','Gnesiocerotidae','Styloplanocera','Styloplanocera fasciata')
,('Polycladida','Ilyplanidae','Anandroplana','Anandroplana muscularis')
,('Polycladida','Ilyplanidae','Anandroplana','Anandroplana portoricensis')
,('Polycladida','Ilyplanidae','Crassandros','Crassandros dominicanus')
,('Polycladida','Ilyplanidae','Euilyoida','Euilyoida malagasensis')
,('Polycladida','Ilyplanidae','Euilyoida','Euilyoida takewakii')
,('Polycladida','Ilyplanidae','Ilyella','Ilyella gigas')
,('Polycladida','Ilyplanidae','Ilyella','Ilyella purpurea')
,('Polycladida','Ilyplanidae','Ilyella','Ilyella yrsa')
,('Polycladida','Ilyplanidae','Ilyplana','Ilyplana aberrans')
,('Polycladida','Ilyplanidae','Ilyplana','Ilyplana mitsui')
,('Polycladida','Ilyplanidae','Postenterogonia','Postenterogonia orbicularis')
,('Polycladida','Ilyplanidae','Pulchriplana','Pulchriplana insignis')
,('Polycladida','Ilyplanidae','Tripylocelis','Tripylocelis typica')
,('Polycladida','Ilyplanidae','Zygantroides','Zygantroides henriettae')
,('Polycladida','Ilyplanidae','Zygantroides','Zygantroides plesia')
,('Polycladida','Ilyplanidae','Zygantroplana','Zygantroplana ups')
,('Polycladida','Ilyplanidae','Zygantroplana','Zygantroplana verrilli')
,('Polycladida','Ilyplanidae','Zygantrum','Zygantrum clepeastum')
,('Polycladida','Laidlawiidae','Laidlawia','Laidlawia polygenia')
,('Polycladida','Laidlawiidae','Laidlawia','Laidlawia trigonoporus')
,('Polycladida','Latocestidae','Aprostatum','Aprostatum clippertoni')
,('Polycladida','Latocestidae','Aprostatum','Aprostatum longipenis')
,('Polycladida','Latocestidae','Aprostatum','Aprostatum stiliferum')
,('Polycladida','Latocestidae','Eulatocestus','Eulatocestus caribbeanus')
,('Polycladida','Latocestidae','Eulatocestus','Eulatocestus galapagensis')
,('Polycladida','Latocestidae','Eulatocestus','Eulatocestus pacificus')
,('Polycladida','Latocestidae','Latocestus','Latocestus argus')
,('Polycladida','Latocestidae','Latocestus','Latocestus brasiliensis')
,('Polycladida','Latocestidae','Latocestus','Latocestus callizona')
,('Polycladida','Latocestidae','Latocestus','Latocestus maldivensis')
,('Polycladida','Latocestidae','Latocestus','Latocestus marginatus')
,('Polycladida','Latocestidae','Latocestus','Latocestus mexicana')
,('Polycladida','Latocestidae','Latocestus','Latocestus plehni')
,('Polycladida','Latocestidae','Latocestus','Latocestus viridis')
,('Polycladida','Latocestidae','Latocestus','Latocestus whartoni')
,('Polycladida','Latocestidae','Latoplana','Latoplana levis')
,('Polycladida','Latocestidae','Mesocela','Mesocela caledonica')
,('Polycladida','Latocestidae','Nonatona','Nonatona euscopa')
,('Polycladida','Latocestidae','Pentaplana','Pentaplana divae')
,('Polycladida','Latocestidae','Prolatocestus','Prolatocestus ocellatus')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus aegypticus')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus cephalophthalmus')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus dendriticus')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus eximius')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus folium')
,('Polycladida','Latocestidae','Trigonoporus','Trigonoporus mirabilis')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana californica')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana cupida')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana deanna')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana divae')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana elisabelloi')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana inquilina')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana insignis')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana luracola')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana ornata')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana papillosa')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana rosea')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana rubra')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana schizoporellae')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana usaguia')
,('Polycladida','Leptoplanidae','Hoploplana','Hoploplana villosa')
,('Polycladida','Leptoplanidae','Indiplana','Indiplana oosora')
,('Polycladida','Leptoplanidae','Itannia','Itannia ornata')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana acuta')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana brunnea')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana capensis')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana delicatula')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana diaphana')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana discus')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana formosa')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana fulva')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana fusca')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana hyalina')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana inconspicua')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana irrorata')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana littoralis')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana macrosora')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana maculosa')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana mertensii')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana moseleyi')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana nigripunctata')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana notabilis')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana oblonga')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana obtusum')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana ophryoglena')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana polycyclia')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana punctata')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana schizoporellae')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana schoenbornii')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana striata')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana taenia')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana tenebrosa')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana tenella')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana trapezoglena')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana tremellaris')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana trullaeformis')
,('Polycladida','Leptoplanidae','Leptoplana','Leptoplana vesiculata')
,('Polycladida','Leptoplanidae','Leptoplanella','Leptoplanella californica')
,('Polycladida','Leptoplanidae','Longiprostatum','Longiprostatum rickettsi')
,('Polycladida','Leptoplanidae','Parviplana','Parviplana hymani')
,('Polycladida','Leptoplanidae','Parviplana','Parviplana lynca')
,('Polycladida','Limnostylochidae','Limnoplana','Limnoplana amara')
,('Polycladida','Limnostylochidae','Limnoplana','Limnoplana annardalei')
,('Polycladida','Limnostylochidae','Limnostylochus','Limnostylochus borneensis')
,('Polycladida','Mucroplanidae','Mucroplana','Mucroplana caelata')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana acticola')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana celeris')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana chierchiae')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana erythrotaenia')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana evelinae')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana gardineri')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana humilis')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana koreana')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana lapunda')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana libera')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana litoricola')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana longiducta')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana longisaccata')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana martae')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana mexicana')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana microsora')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana natans')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana otophora')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana palaoensis')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana palta')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana rupicola')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana sanguinea')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana sanjuania')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana saxicola')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana sciophila')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana septentrionalis')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana sophia')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana syntoma')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana tavoyensis')
,('Polycladida','Notoplanidae','Notocomplana','Notocomplana timida')
,('Polycladida','Notoplanidae','Notoplana','Notoplana alcinoi')
,('Polycladida','Notoplanidae','Notoplana','Notoplana annula')
,('Polycladida','Notoplanidae','Notoplana','Notoplana atlantica')
,('Polycladida','Notoplanidae','Notoplana','Notoplana australis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana comes')
,('Polycladida','Notoplanidae','Notoplana','Notoplana cotylifera')
,('Polycladida','Notoplanidae','Notoplana','Notoplana delicata')
,('Polycladida','Notoplanidae','Notoplana','Notoplana distincta')
,('Polycladida','Notoplanidae','Notoplana','Notoplana divae')
,('Polycladida','Notoplanidae','Notoplana','Notoplana dubia')
,('Polycladida','Notoplanidae','Notoplana','Notoplana haloglena')
,('Polycladida','Notoplanidae','Notoplana','Notoplana igiliensis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana inquilina')
,('Polycladida','Notoplanidae','Notoplana','Notoplana insularis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana kuekenthali')
,('Polycladida','Notoplanidae','Notoplana','Notoplana longastyletta')
,('Polycladida','Notoplanidae','Notoplana','Notoplana longicrumena')
,('Polycladida','Notoplanidae','Notoplana','Notoplana micheli')
,('Polycladida','Notoplanidae','Notoplana','Notoplana micronesiana')
,('Polycladida','Notoplanidae','Notoplana','Notoplana parvula')
,('Polycladida','Notoplanidae','Notoplana','Notoplana pegnis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana plecta')
,('Polycladida','Notoplanidae','Notoplana','Notoplana puma')
,('Polycladida','Notoplanidae','Notoplana','Notoplana queruca')
,('Polycladida','Notoplanidae','Notoplana','Notoplana rugulosa')
,('Polycladida','Notoplanidae','Notoplana','Notoplana sanpedrensis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana sawayai')
,('Polycladida','Notoplanidae','Notoplana','Notoplana serica')
,('Polycladida','Notoplanidae','Notoplana','Notoplana similis')
,('Polycladida','Notoplanidae','Notoplana','Notoplana stilifera')
,('Polycladida','Notoplanidae','Notoplana','Notoplana suteri')
,('Polycladida','Notoplanidae','Notoplana','Notoplana tipuca')
,('Polycladida','Notoplanidae','Notoplana','Notoplana vitrea')
,('Polycladida','Notoplanidae','Notoplana','Notoplana willeyi')
,('Polycladida','Notoplanidae','Plagiotata','Plagiotata promiscua')
,('Polycladida','Opisthogeniidae','Opisthogenia','Opisthogenia tentaculata')
,('Polycladida','Palauidae','Palaua','Palaua tropica')
,('Polycladida','Pericelidae','Pericelis','Pericelis byerleyana')
,('Polycladida','Pericelidae','Pericelis','Pericelis cata')
,('Polycladida','Pericelidae','Pericelis','Pericelis hymanae')
,('Polycladida','Pericelidae','Pericelis','Pericelis orbicularia')
,('Polycladida','Planoceridae','Aquaplana','Aquaplana pacifica')
,('Polycladida','Planoceridae','Disparoplana','Disparoplana dubia')
,('Polycladida','Planoceridae','Neoplanocera','Neoplanocera elongata')
,('Polycladida','Planoceridae','Neoplanocera','Neoplanocera steueri')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera aurora')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera discus')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera fritillata')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera langii')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera marginata')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera misakiensis')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera oceanica')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera oligoglena')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera rotumanensis')
,('Polycladida','Planoceridae','Paraplanocera','Paraplanocera rubrifasciata')
,('Polycladida','Planoceridae','Planocera','Planocera armata')
,('Polycladida','Planoceridae','Planocera','Planocera aurea')
,('Polycladida','Planoceridae','Planocera','Planocera ceratommata')
,('Polycladida','Planoceridae','Planocera','Planocera crosslandi')
,('Polycladida','Planoceridae','Planocera','Planocera dictyota')
,('Polycladida','Planoceridae','Planocera','Planocera discoides')
,('Polycladida','Planoceridae','Planocera','Planocera edmondsi')
,('Polycladida','Planoceridae','Planocera','Planocera folia')
,('Polycladida','Planoceridae','Planocera','Planocera gilchristi')
,('Polycladida','Planoceridae','Planocera','Planocera graffi')
,('Polycladida','Planoceridae','Planocera','Planocera hawaiensis')
,('Polycladida','Planoceridae','Planocera','Planocera heda')
,('Polycladida','Planoceridae','Planocera','Planocera multitentaculata')
,('Polycladida','Planoceridae','Planocera','Planocera pacifica')
,('Polycladida','Planoceridae','Planocera','Planocera pellucida')
,('Polycladida','Planoceridae','Planocera','Planocera profunda')
,('Polycladida','Planoceridae','Planocera','Planocera purpurea')
,('Polycladida','Planoceridae','Planocera','Planocera rainieri')
,('Polycladida','Planoceridae','Planocera','Planocera reticulata')
,('Polycladida','Planoceridae','Planocera','Planocera thesea')
,('Polycladida','Planoceridae','Planocera','Planocera tridentata')
,('Polycladida','Planoceridae','Planocera','Planocera uncinata')
,('Polycladida','Planoceridae','Pseudoplanocera','Pseudoplanocera izmirensis')
,('Polycladida','Planoceridae','Spinicirrus','Spinicirrus inequalis')
,('Polycladida','Plehniidae','Diplehnia','Diplehnia caeca')
,('Polycladida','Plehniidae','Diplehnia','Diplehnia pacifica')
,('Polycladida','Plehniidae','Discocelides','Discocelides langi')
,('Polycladida','Plehniidae','Myoramyxa','Myoramyxa pardalota')
,('Polycladida','Plehniidae','Plehnia','Plehnia arctica')
,('Polycladida','Plehniidae','Plehnia','Plehnia ellipsoides')
,('Polycladida','Plehniidae','Plehnia','Plehnia japonica')
,('Polycladida','Plehniidae','Plehnia','Plehnia ovatus')
,('Polycladida','Pleioplanidae','Izmira','Izmira cinari')
,('Polycladida','Pleioplanidae','Izmira','Izmira turkeyi')
,('Polycladida','Pleioplanidae','Laqueusplana','Laqueusplana bocki')
,('Polycladida','Pleioplanidae','Laqueusplana','Laqueusplana megala')
,('Polycladida','Pleioplanidae','Melloplana','Melloplana ferruginea')
,('Polycladida','Pleioplanidae','Melloplana','Melloplana japonica')
,('Polycladida','Pleioplanidae','Persica','Persica qeshmensis')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana atomata')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana bosphorensis')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana californica')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana delicata')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana mortenseni')
,('Polycladida','Pleioplanidae','Pleioplana','Pleioplana okusi')
,('Polycladida','Polyposthiidae','Bergendalia','Bergendalia anomala')
,('Polycladida','Polyposthiidae','Bergendalia','Bergendalia diversa')
,('Polycladida','Polyposthiidae','Cryptocelides','Cryptocelides loveni')
,('Polycladida','Polyposthiidae','Cryptocelides','Cryptocelides samoensis')
,('Polycladida','Polyposthiidae','Metaposthia','Metaposthia norfolkensis')
,('Polycladida','Polyposthiidae','Polyphalloplana','Polyphalloplana bocki')
,('Polycladida','Polyposthiidae','Polyposthia','Polyposthia similis')
,('Polycladida','Polyposthiidae','Polyposthides','Polyposthides affinis')
,('Polycladida','Polyposthiidae','Polyposthides','Polyposthides caraibica')
,('Polycladida','Polyposthiidae','Polyposthides','Polyposthides karimatensis')
,('Polycladida','Prosthiostomidae','Amakusaplana','Amakusaplana acroporae')
,('Polycladida','Prosthiostomidae','Amakusaplana','Amakusaplana ohshimae')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium delicatum')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium evelinae')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium gabriellae')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium japonicum')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium periommatum')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium punctatum')
,('Polycladida','Prosthiostomidae','Enchiridium','Enchiridium russoi')
,('Polycladida','Prosthiostomidae','Enterogonimus','Enterogonimus aureus')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum adhaerens')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum angustum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum auratum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum bellum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum exiguum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum laetum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum matarazzoi')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum molle')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum mortenseni')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum pakium')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum pulchrum')
,('Polycladida','Prosthiostomidae','Euprosthiostomum','Euprosthiostomum viscosum')
,('Polycladida','Prosthiostomidae','Lurymare','Lurymare clavocapitata')
,('Polycladida','Prosthiostomidae','Lurymare','Lurymare drygalskii')
,('Polycladida','Prosthiostomidae','Lurymare','Lurymare katoi')
,('Polycladida','Prosthiostomidae','Lurymare','Lurymare monosorum')
,('Polycladida','Prosthiostomidae','Lurymare','Lurymare singulare')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum asiaticum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum aurantiacum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum awaensa')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum capense')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum collare')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum constipatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum cooperi')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum crassiusculum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum cribrarium')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum cyclops')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum cynarium')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum dohrnii')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum elegans')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum formosum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum gilvum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum grande')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum griseum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum komaii')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum latocelis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum lineatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum lobatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum macrorhynchum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum maculatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum marmoratum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum milcum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum montiporae')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum multicelis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum nationale')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum notoensis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum nozakensis')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
insert into species(species_genus,speciesname)
select genusid,speciesname
from genus
join family on genus_family=familyid
join ord on family_ord=ordid
join (values
('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum obscurum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum ostreae')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum pallidum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum parvicelis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum pellucidum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum purum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum rubropunctatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum sadoensis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum sancum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum siphunculus')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum sonorum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum sparsum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum suzakiensis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum trilineatum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum utarum')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum vulgare')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum wagurensis')
,('Polycladida','Prosthiostomidae','Prosthiostomum','Prosthiostomum yeri')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon albopapillosus')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon albopunctatum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon alderi')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon allmani')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon armatum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon auropunctatum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon boehmigi')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon hispidum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon indicum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon lepidum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon maculosum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon marginatum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon obscurum')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon ovale')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon papilionis')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon plehni')
,('Polycladida','Pseudocerotidae','Acanthozoon','Acanthozoon semperi')
,('Polycladida','Pseudocerotidae','Bulaceros','Bulaceros porcellanus')
,('Polycladida','Pseudocerotidae','Cryptobiceros','Cryptobiceros bajae')
,('Polycladida','Pseudocerotidae','Cryptoceros','Cryptoceros marmoratus')
,('Polycladida','Pseudocerotidae','Cryptoceros','Cryptoceros sasakii')
,('Polycladida','Pseudocerotidae','Monobiceros','Monobiceros langi')
,('Polycladida','Pseudocerotidae','Nymphozoon','Nymphozoon bayeri')
,('Polycladida','Pseudocerotidae','Nymphozoon','Nymphozoon orsaki')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros baibaiye')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros diadaleos')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros fritillus')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros galacticus')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros katoi')
,('Polycladida','Pseudocerotidae','Phrikoceros','Phrikoceros mopsus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros apricus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros bedfordi')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros brogani')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros caribbensis')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros cinereus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros damawan')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros dendriticus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros evelinae')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros ferrugineus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros flavocanthus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros flavolineatus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros flavomarginatus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros flowersi')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros fulgor')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros fulvogriseus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros gardineri')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros gloriosus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros gratus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros hancockanus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros hymanae')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros izuensis')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros kryptos')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros micronesianus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros mikros')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros miniatus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros murinus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros nigromarginatus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros pardalis')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros periculosus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros philippinensis')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros rubrocinctus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros schmardae')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros sharroni')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros splendidus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros stellae')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros undulatus')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros viridis')
,('Polycladida','Pseudocerotidae','Pseudobiceros','Pseudobiceros wirtzi')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros affinis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros albicornis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros albomarginatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros asamusiensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros astrorum')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros ater')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros atraviridis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros atropurpureus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros bicolor')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros bifasciatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros bimarginatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros bolool')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros buskii')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros caeruleocinctus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros caeruleopunctatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros canadensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros cardinalis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros cardiosorus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros cerebralis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros chloreus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros clavicornis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros coccineus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros colemani')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros collingwoodii')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros concinnus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros confusus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros contrarius')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros cruentus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros depiliktabub')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros devisii')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros dimidiatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros dulcis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros exoptatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros felis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros flavomaculatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros fulminatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros fuscogriseus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros fuscopunctatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros fuscus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros galatheensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros gamblei')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros glaucus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros goslineri')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros gravieri')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros griseus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros guttatomarginatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros habroptilus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros haddoni')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros harrisi')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros heronensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros imitatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros imperatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros indicus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros intermittus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros interruptus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros irretitus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros japonicus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros jebborum')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros josei')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros juani')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros kelaarti')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros kentii')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros kylie')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros lacteus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros lactolimbus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros laingensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros langamaakensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros laticlavus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros latissimus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros leptostictus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros limbatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros lindae')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros liparus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros litoralis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros lividus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros luteus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros maculatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros maximus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros memoralis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros mexicanus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros microceraeus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros micropapillosus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros monostichos')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros montereyensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros mossambicus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros muelleri')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros niger')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros nigrocinctus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros nigropunctatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros nipponicus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros ouini')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros paradoxus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros paralaticlavus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros periaurantius')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros periphaeus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros peripurpureus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros perviolaceus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros pius')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros pleurostictus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros prudhoei')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros punctatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros purpureus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros rawlinsonae')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros regalis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros reticulatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros rubellus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros rubronanus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros rubrotentaculatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros sagamianus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros scintillatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros scriptus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros stimpsoni')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros striatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros susanae')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros texanus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros tigrinus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros tomiokaensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros tristriatus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros velutinus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros verecundus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros vinosus')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros yessoensis')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros zebra')
,('Polycladida','Pseudocerotidae','Pseudoceros','Pseudoceros zeylanicus')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon alagoensis')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon aucklandicum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon australe')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon brocchii')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon californicum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon cruciatum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon discoideum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon distinctum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon flavotuberculatum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon griseum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon hawaiiensis')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon huttoni')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon japonicum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon langi')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon minutum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon mirtae')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon nigropapillosum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon nigrum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon papillosum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon raphaeli')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon sandiegiense')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon skottsburgi')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon tentaculatum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon verrucosum')
,('Polycladida','Pseudocerotidae','Thysanozoon','Thysanozoon vulgare')
,('Polycladida','Pseudocerotidae','Tytthosoceros','Tytthosoceros inca')
,('Polycladida','Pseudocerotidae','Tytthosoceros','Tytthosoceros lizardensis')
,('Polycladida','Pseudocerotidae','Tytthosoceros','Tytthosoceros nocturnus')
,('Polycladida','Pseudocerotidae','Yungia','Yungia aurantiaca')
,('Polycladida','Pseudocerotidae','Yungia','Yungia dicquemari')
,('Polycladida','Pseudocerotidae','Yungia','Yungia teffi')
,('Polycladida','Pseudostylochidae','Cryptophallus','Cryptophallus sondaicus')
,('Polycladida','Pseudostylochidae','Cryptophallus','Cryptophallus wahlbergi')
,('Polycladida','Pseudostylochidae','Idioplana','Idioplana atlantica')
,('Polycladida','Pseudostylochidae','Idioplana','Idioplana australiensis')
,('Polycladida','Pseudostylochidae','Idioplana','Idioplana insignis')
,('Polycladida','Pseudostylochidae','Monosolenia','Monosolenia asymmetrica')
,('Polycladida','Pseudostylochidae','Ommatoplana','Ommatoplana mexicana')
,('Polycladida','Pseudostylochidae','Ommatoplana','Ommatoplana tuberculata')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus aino')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus edurus')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus fuscoviridus')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus intermedius')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus mactanensis')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus maculatus')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus nationalis')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus obscurus')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus okudai')
,('Polycladida','Pseudostylochidae','Pseudostylochus','Pseudostylochus sadoensis')
,('Polycladida','Pseudostylochidae','Stylochoposthia','Stylochoposthia bella')
,('Polycladida','Stylochidae','Cryptostylochus','Cryptostylochus coseirensis')
,('Polycladida','Stylochidae','Cryptostylochus','Cryptostylochus hullensis')
,('Polycladida','Stylochidae','Cryptostylochus','Cryptostylochus koreensis')
,('Polycladida','Stylochidae','Distylochus','Distylochus isifer')
,('Polycladida','Stylochidae','Distylochus','Distylochus martae')
,('Polycladida','Stylochidae','Distylochus','Distylochus pusillus')
,('Polycladida','Stylochidae','Imogine','Imogine aomori')
,('Polycladida','Stylochidae','Imogine','Imogine arenosus')
,('Polycladida','Stylochidae','Imogine','Imogine catus')
,('Polycladida','Stylochidae','Imogine','Imogine ceylanicus')
,('Polycladida','Stylochidae','Imogine','Imogine exiguus')
,('Polycladida','Stylochidae','Imogine','Imogine fafai')
,('Polycladida','Stylochidae','Imogine','Imogine hamanensis')
,('Polycladida','Stylochidae','Imogine','Imogine hyalinus')
,('Polycladida','Stylochidae','Imogine','Imogine ijimai')
,('Polycladida','Stylochidae','Imogine','Imogine izuensis')
,('Polycladida','Stylochidae','Imogine','Imogine kimae')
,('Polycladida','Stylochidae','Imogine','Imogine lateotentare')
,('Polycladida','Stylochidae','Imogine','Imogine lesteri')
,('Polycladida','Stylochidae','Imogine','Imogine marmoreus')
,('Polycladida','Stylochidae','Imogine','Imogine mcgrathi')
,('Polycladida','Stylochidae','Imogine','Imogine mediterranea')
,('Polycladida','Stylochidae','Imogine','Imogine megalops')
,('Polycladida','Stylochidae','Imogine','Imogine meganae')
,('Polycladida','Stylochidae','Imogine','Imogine melihertani')
,('Polycladida','Stylochidae','Imogine','Imogine minimus')
,('Polycladida','Stylochidae','Imogine','Imogine miyadii')
,('Polycladida','Stylochidae','Imogine','Imogine nebulosus')
,('Polycladida','Stylochidae','Imogine','Imogine necopinata')
,('Polycladida','Stylochidae','Imogine','Imogine oculifera')
,('Polycladida','Stylochidae','Imogine','Imogine orientalis')
,('Polycladida','Stylochidae','Imogine','Imogine pardalotus')
,('Polycladida','Stylochidae','Imogine','Imogine pulcher')
,('Polycladida','Stylochidae','Imogine','Imogine qeshmensis')
,('Polycladida','Stylochidae','Imogine','Imogine refertus')
,('Polycladida','Stylochidae','Imogine','Imogine rutilis')
,('Polycladida','Stylochidae','Imogine','Imogine sixteni')
,('Polycladida','Stylochidae','Imogine','Imogine speciosus')
,('Polycladida','Stylochidae','Imogine','Imogine stellae')
,('Polycladida','Stylochidae','Imogine','Imogine ticus')
,('Polycladida','Stylochidae','Imogine','Imogine tripartitus')
,('Polycladida','Stylochidae','Imogine','Imogine uniporus')
,('Polycladida','Stylochidae','Imogine','Imogine zebra')
,('Polycladida','Stylochidae','Kataria','Kataria gloriosa')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus capensis')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus elongatus')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus gracilis')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus novacambrensis')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus pacificus')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus palombii')
,('Polycladida','Stylochidae','Leptostylochus','Leptostylochus polysorus')
,('Polycladida','Stylochidae','Mirostylochus','Mirostylochus akkashiensis')
,('Polycladida','Stylochidae','Mirostylochus','Mirostylochus sachalinensis')
,('Polycladida','Stylochidae','Mirostylochus','Mirostylochus striatus')
,('Polycladida','Stylochidae','Stylochus','Stylochopsis ponticus')
,('Polycladida','Stylochidae','Stylochus','Stylochus alexandrinus')
,('Polycladida','Stylochidae','Stylochus','Stylochus argus')
,('Polycladida','Stylochidae','Stylochus','Stylochus atentaculatus')
,('Polycladida','Stylochidae','Stylochus','Stylochus bermudensis')
,('Polycladida','Stylochidae','Stylochus','Stylochus californicus')
,('Polycladida','Stylochidae','Stylochus','Stylochus castaneus')
,('Polycladida','Stylochidae','Stylochus','Stylochus cinereus')
,('Polycladida','Stylochidae','Stylochus','Stylochus conglomeratus')
,('Polycladida','Stylochidae','Stylochus','Stylochus crassus')
,('Polycladida','Stylochidae','Stylochus','Stylochus djiboutiensis')
,('Polycladida','Stylochidae','Stylochus','Stylochus ellipticus')
,('Polycladida','Stylochidae','Stylochus','Stylochus ferox')
,('Polycladida','Stylochidae','Stylochus','Stylochus flevensis')
,('Polycladida','Stylochidae','Stylochus','Stylochus franciscanus')
,('Polycladida','Stylochidae','Stylochus','Stylochus frontalis')
,('Polycladida','Stylochidae','Stylochus','Stylochus insolitus')
,('Polycladida','Stylochidae','Stylochus','Stylochus limosus')
,('Polycladida','Stylochidae','Stylochus','Stylochus luteus')
,('Polycladida','Stylochidae','Stylochus','Stylochus matatasi')
,('Polycladida','Stylochidae','Stylochus','Stylochus meixneri')
,('Polycladida','Stylochidae','Stylochus','Stylochus meridianus')
,('Polycladida','Stylochidae','Stylochus','Stylochus neapolitanus')
,('Polycladida','Stylochidae','Stylochus','Stylochus pilidium')
,('Polycladida','Stylochidae','Stylochus','Stylochus plessissii')
,('Polycladida','Stylochidae','Stylochus','Stylochus pygmaeus')
,('Polycladida','Stylochidae','Stylochus','Stylochus salmoneus')
,('Polycladida','Stylochidae','Stylochus','Stylochus stellatus')
,('Polycladida','Stylochidae','Stylochus','Stylochus suesensis')
,('Polycladida','Stylochidae','Stylochus','Stylochus tauricus')
,('Polycladida','Stylochidae','Stylochus','Stylochus vesiculatus')
,('Polycladida','Stylochidae','Stylochus','Stylochus vigilax')
,('Polycladida','Stylochidae','Stylochus','Stylochus zanzibaricus')
,('Polycladida','Stylochocestidae','Barcoplana','Barcoplana rochensis')
,('Polycladida','Stylochocestidae','Chatziplana','Chatziplana grubei')
,('Polycladida','Stylochocestidae','Mabelaplana','Mabelaplana santateresae')
,('Polycladida','Stylochocestidae','Stylochocestus','Stylochocestus gracilis')
,('Polycladida','Stylochocestidae','Stylochocestus','Stylochocestus hewatti')
,('Polycladida','Stylochoididae','Stylochoides','Stylochoides albus')
,('Polycladida','Stylochoplanidae','Alloioplana','Alloioplana aulica')
,('Polycladida','Stylochoplanidae','Alloioplana','Alloioplana delicata')
,('Polycladida','Stylochoplanidae','Alloioplana','Alloioplana stylifera')
,('Polycladida','Stylochoplanidae','Alloioplana','Alloioplana wyona')
,('Polycladida','Stylochoplanidae','Amemiyaia','Amemiyaia pacifica')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana affinis')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana celta')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana colombiana')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana divae')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana lactea')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana lactoalba')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana leptalea')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana panamensis')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana rabita')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana reishi')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana robusta')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana snadda')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana taurica')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana tenuis')
,('Polycladida','Stylochoplanidae','Armatoplana','Armatoplana vesiculata')
,('Polycladida','Stylochoplanidae','Ceratoplana','Ceratoplana colobocentroti')
,('Polycladida','Stylochoplanidae','Comoplana','Comoplana agilis')
,('Polycladida','Stylochoplanidae','Comoplana','Comoplana angusta')
,('Polycladida','Stylochoplanidae','Comoplana','Comoplana palmula')
,('Polycladida','Stylochoplanidae','Comoplana','Comoplana pusilla')
,('Polycladida','Stylochoplanidae','Digynopora','Digynopora americana')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx gracilis')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx hancocki')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx opisthoporus')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx pallida')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx rasae')
,('Polycladida','Stylochoplanidae','Emprosthopharynx','Emprosthopharynx vanhoffeni')
,('Polycladida','Stylochoplanidae','Heroplana','Heroplana bayeri')
,('Polycladida','Stylochoplanidae','Interplana','Interplana evelinae')
,('Polycladida','Stylochoplanidae','Interplana','Interplana sandiegensis')
,('Polycladida','Stylochoplanidae','Phaenoplana','Phaenoplana challengeri')
,('Polycladida','Stylochoplanidae','Phaenoplana','Phaenoplana conoceraea')
,('Polycladida','Stylochoplanidae','Phaenoplana','Phaenoplana longipenis')
,('Polycladida','Stylochoplanidae','Phaenoplana','Phaenoplana peleca')
,('Polycladida','Stylochoplanidae','Phaenoplana','Phaenoplana taiwanica')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana aberrans')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana alcha')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana amica')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana chilensis')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana chloranota')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana clara')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana divae')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana elegans')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana genicotyla')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana graffi')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana inquilina')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana limnoriae')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana maculata')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana minuta')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana nadiae')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana opisthopharynx')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana parasitica')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana parva')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana schauinslandi')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana selenopsis')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana suesensis')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana suoensis')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana tarda')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana utinomii')
,('Polycladida','Stylochoplanidae','Stylochoplana','Stylochoplana walsergia')
,('Polycladida','Stylochoplanidae','Triplana','Triplana viridis')
,('Polycladida','Theamatidae','Theama','Theama evelinae')
,('Polycladida','Theamatidae','Theama','Theama forrestensis')
,('Polycladida','Theamatidae','Theama','Theama mediterranea')
,('Polycladida','Theamatidae','Theama','Theama occidua')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora applanata')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora baltica')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora boui')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora cavernicola')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora gigas')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora incognita')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora intersticialis')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora levanidorum')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora marcusi')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora metameroides')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora olgae')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora porfirievae')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora sphyrocephala')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora tropica')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora wagini')
,('Prorhynchida','Prorhynchidae','Geocentrophora','Geocentrophora wasiliewi')
,('Prorhynchida','Prorhynchidae','Hofstenioplesia','Hofstenioplesia haswelli')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus alpinus')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus baikalensis')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus brincki')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus fontinalis')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus hastatus')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus ponticus')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus putealis')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus stagnalis')
,('Prorhynchida','Prorhynchidae','Prorhynchus','Prorhynchus tasmaniensis')
,('Prorhynchida','Prorhynchidae','Xenoprorhynchus','Xenoprorhynchus brasiliensis')
,('Prorhynchida','Prorhynchidae','Xenoprorhynchus','Xenoprorhynchus steinboecki')
,('Rubrobacterales','Rubrobacteraceae','Rubrobacter','Rubrobacter radiotolerans')
,('Rubrobacterales','Rubrobacteraceae','Rubrobacter','Rubrobacter taiwanensis')
,('Rubrobacterales','Rubrobacteraceae','Rubrobacter','Rubrobacter xylanophilus')
,('Solirubrobacterales','Conexibacteraceae','Conexibacter','Conexibacter woesei')
,('Solirubrobacterales','Patulibacteraceae','Patulibacter','Patulibacter americanus')
,('Solirubrobacterales','Patulibacteraceae','Patulibacter','Patulibacter ginsengiterrae')
,('Solirubrobacterales','Patulibacteraceae','Patulibacter','Patulibacter minatonensis')
,('Solirubrobacterales','Solirubrobacteraceae','Solirubrobacter','Solirubrobacter ginsenosidimutans')
,('Solirubrobacterales','Solirubrobacteraceae','Solirubrobacter','Solirubrobacter pauli')
,('Solirubrobacterales','Solirubrobacteraceae','Solirubrobacter','Solirubrobacter soli')
,('Solitaria','Barentsiidae','Barentsia','Barentsia aggregata')
,('Solitaria','Barentsiidae','Barentsia','Barentsia benedeni')
,('Solitaria','Barentsiidae','Barentsia','Barentsia berenice')
,('Solitaria','Barentsiidae','Barentsia','Barentsia bulbosa')
,('Solitaria','Barentsiidae','Barentsia','Barentsia bullata')
,('Solitaria','Barentsiidae','Barentsia','Barentsia capitata')
,('Solitaria','Barentsiidae','Barentsia','Barentsia conferta')
,('Solitaria','Barentsiidae','Barentsia','Barentsia discreta')
,('Solitaria','Barentsiidae','Barentsia','Barentsia elongata')
,('Solitaria','Barentsiidae','Barentsia','Barentsia geniculata')
,('Solitaria','Barentsiidae','Barentsia','Barentsia gracilis')
,('Solitaria','Barentsiidae','Barentsia','Barentsia hildegardae')
,('Solitaria','Barentsiidae','Barentsia','Barentsia hozawai')
,('Solitaria','Barentsiidae','Barentsia','Barentsia laxa')
,('Solitaria','Barentsiidae','Barentsia','Barentsia major')
,('Solitaria','Barentsiidae','Barentsia','Barentsia matsushimana')
,('Solitaria','Barentsiidae','Barentsia','Barentsia minuta')
,('Solitaria','Barentsiidae','Barentsia','Barentsia parva')
,('Solitaria','Barentsiidae','Barentsia','Barentsia ramosa')
,('Solitaria','Barentsiidae','Barentsia','Barentsia variabilis')
,('Solitaria','Barentsiidae','Barentsia','Barentsia variarticulata')
,('Solitaria','Barentsiidae','Coriella','Coriella stolonata')
,('Solitaria','Barentsiidae','Pedicellinopsis','Pedicellinopsis fruticosa')
,('Solitaria','Barentsiidae','Pseudopedicellina','Pseudopedicellina mutabilis')
,('Solitaria','Barentsiidae','Urnatella','Urnatella gracilis')
,('Solitaria','Loxokalypodidae','Loxokalypus','Loxokalypus pedicellinoides')
,('Solitaria','Loxokalypodidae','Loxokalypus','Loxokalypus socialis')
,('Solitaria','Pedicellinidae','Loxosomatoides','Loxosomatoides athleticus')
,('Solitaria','Pedicellinidae','Loxosomatoides','Loxosomatoides colonialis')
,('Solitaria','Pedicellinidae','Loxosomatoides','Loxosomatoides evelinae')
,('Solitaria','Pedicellinidae','Loxosomatoides','Loxosomatoides laevis')
,('Solitaria','Pedicellinidae','Loxosomatoides','Loxosomatoides sirindhornae')
,('Solitaria','Pedicellinidae','Myosoma','Myosoma hancocki')
,('Solitaria','Pedicellinidae','Myosoma','Myosoma spinosa')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina australis')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina cernua')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina choanata')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina compacta')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina grandis')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina hispida')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina nannoda')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina newberryi')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina nutans')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina pernae')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina pyriformis')
,('Solitaria','Pedicellinidae','Pedicellina','Pedicellina whiteleggii')
,('Solitaria','Pedicellinidae','Sangavella','Sangavella vineta')
,('Thermoleophilales','Thermoleophilaceae','Thermoleophilum','Thermoleophilum album')
,('Thermoleophilales','Thermoleophilaceae','Thermoleophilum','Thermoleophilum minutum')
) x(ordname,familyname,genusname,speciesname)
on ord.ordname=x.ordname
and ord.ord_class is null
and family.familyname=x.familyname
and genus.genusname=x.genusname
go
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select class
		,[order]
		,family
		,genus
		,species
		,row_number() over(
			order by class,[order],family,genus,species
		) rn
	from tax
	where rank_id=220
	and class is not null
	and [order] is not null
	and family is not null
	and genus is not null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join family on genus_family=familyid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join ord on family_ord=ordid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 60
		,'join class on ord_class=classid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 70
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(class,'''','''''')
		+ ''','''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(classname,ordname,familyname,genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on class.classname=x.classname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and ord.ordname=x.ordname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'and genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5050
		,'where not exists ('
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5060
		,'select * from species'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5070
		,'where species_genus=genusid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5080
		,'and species.speciesname=x.speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5090
		,')'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5100
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go

;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select class
		,[order]
		,family
		,genus
		,species
		,row_number() over(
			order by class,[order],family,genus,species
		) rn
	from tax
	where rank_id=220
	and class is not null
	and [order] is not null
	and family is not null
	and genus is not null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join family on genus_family=familyid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join ord on family_ord=ordid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 60
		,'join class on ord_class=classid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 70
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(class,'''','''''')
		+ ''','''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(classname,ordname,familyname,genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on class.classname=x.classname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and ord.ordname=x.ordname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'and genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5050
		,'where not exists ('
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5060
		,'select * from species'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5070
		,'where species_genus=genusid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5080
		,'and species.speciesname=x.speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5090
		,')'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5100
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
)
select count(*) total
	,sum(case when class is not null and [order] is not null and family is not null and genus is not null then 1 else 0 end) normal
	,sum(case when class is null and [order] is not null and family is not null and genus is not null then 1 else 0 end) noClass
	,sum(case when [order] is null and family is not null and genus is not null then 1 else 0 end) noOrder
	,sum(case when family is null and genus is not null then 1 else 0 end) noFamily
	,sum(case when genus is null then 1 else 0 end) noGenus
from tax
where rank_id=220
option (maxrecursion 100)

;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select genus
		,species
		,row_number() over(
			order by genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and genus.genus_family is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select genus
		,species
		,row_number() over(
			order by genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and genus.genus_family is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select [order]
		,family
		,genus
		,species
		,row_number() over(
			order by [order],family,genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is not null
	and [order] is not null
	and class is null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join family on genus_family=familyid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join ord on family_ord=ordid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 60
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace([order],'''','''''')
		+ ''','''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(ordname,familyname,genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on ord.ordname=x.ordname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and ord.ord_class is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'and genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5050
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)










;with tax as (
	select tsn
		,parent_tsn
		,rank_id
		,complete_name
		,complete_name kingdom
		,cast(null as varchar(300)) phylum
		,cast(null as varchar(300)) class
		,cast(null as varchar(300)) [order]
		,cast(null as varchar(300)) family
		,cast(null as varchar(300)) genus
		,cast(null as varchar(300)) species
	from taxonomic_units
	where rank_id=10
	and name_usage in ('valid','accepted')

	union all

	select t.tsn
		,t.parent_tsn
		,t.rank_id
		,t.complete_name
		,tax.kingdom
		,case when t.rank_id=30 then t.complete_name else tax.phylum end
		,case when t.rank_id=60 then t.complete_name else tax.class end
		,case when t.rank_id=100 then t.complete_name else tax.[order] end
		,case when t.rank_id=140 then t.complete_name else tax.family end
		,case when t.rank_id=180 then t.complete_name else tax.genus end
		,case when t.rank_id=220 then t.complete_name else tax.species end
	from taxonomic_units t
	join tax on t.parent_tsn=tax.tsn
	where t.name_usage in ('valid','accepted')
),
x as (
	select family
		,genus
		,species
		,row_number() over(
			order by family,genus,species
		) rn
	from tax
	where rank_id=220
	and genus is not null
	and family is not null
	and [order] is null
),
sql as (
	select ((rn-1)/1000) * 100000 + 10 sort
		,'insert into species(species_genus,speciesname)' txt
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 20
		,'select genusid,speciesname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 30
		,'from genus'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 40
		,'join family on genus_family=familyid'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 50
		,'join (values'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000
		+ 1000 + ((rn-1)%1000)
		,case when (rn-1)%1000 > 0 then ',' else '' end
		+ '('''
		+ replace(family,'''','''''')
		+ ''','''
		+ replace(genus,'''','''''')
		+ ''','''
		+ replace(species,'''','''''')
		+ ''')'
	from x

	union all

	select ((rn-1)/1000) * 100000 + 5000
		,') x(familyname,genusname,speciesname)'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5010
		,'on family.familyname=x.familyname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5020
		,'and family.family_ord is null'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5030
		,'and genus.genusname=x.genusname'
	from x
	where (rn-1)%1000=0

	union all

	select ((rn-1)/1000) * 100000 + 5040
		,'go'
	from x
	where (rn-1)%1000=0
)
select txt
from sql
order by sort
option (maxrecursion 100)
go
