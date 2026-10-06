use itis
/*
select * from INFORMATION_SCHEMA.tables
order by table_name
*/
select * from hierarchy
where childrencount = 1
order by childrencount

select * from kingdoms
select * from comments
select * from experts
select * from geographic_div
select * from hierarchy -- 681,562
select DISTINCT jurisdiction_value,origin from jurisdiction -- 38 rows
select * from kingdoms  -- 7
select distinct completename from longnames --- 1,000,636 rows to 990,108
select * from nodc_ids -- 209,565 rows (nodc_id,tsn)
select * from other_sources -- 1,072 rows
select * from publications -- 30,000
select * from reference_links  -- 1,987,668 rows
select * from reviews
select * from strippedauthor -- 215,193 rows
select * from synonym_links -- 319,345 rows
select * from synonym_names
select * from taxon_authors_lkp
select * from taxon_unit_types order by rank_id -- 182 rows!
select distinct rank_name from taxon_unit_types  -- 41 rows!
select rank_id,rank_name
from taxon_unit_types
order by rank_id
select * from taxon_unit_types where rank_id <> 220


select * from taxonomic_units -- 1,000,636 rows

sp_help taxonomic_units
select count(*)
from taxonomic_units
where rank_id=220
and usage='valid'


select * from tu_comments_links -- 193,088 rows
select * from vern_ref_links -- 93,398 tsn, doc_id_prefix,documentation_id,vern_id
select DISTINCT vernacular_name 
from vernaculars 
where language = 'English'
and approved_ind <> 'N' -- 990 rows


;with tax as (
	select tsn species_tsn
		,parent_tsn
		,tsn
		,rank_id
		,complete_name
	from taxonomic_units
	where rank_id=220
	and name_usage in ('valid','accepted')

	union all

	select tax.species_tsn
		,t.parent_tsn
		,t.tsn
		,t.rank_id
		,t.complete_name
	from tax
	join taxonomic_units t on t.tsn=tax.parent_tsn
)
select species_tsn
	,max(case when rank_id=10 then complete_name end) kingdom
	,max(case when rank_id=30 then complete_name end) phylum
	,max(case when rank_id=60 then complete_name end) class
	,max(case when rank_id=100 then complete_name end) [order]
	,max(case when rank_id=140 then complete_name end) family
	,max(case when rank_id=180 then complete_name end) genus
	,max(case when rank_id=220 then complete_name end) species
from tax
group by species_tsn
order by species_tsn
option (maxrecursion 100)


;with tax as (
	select tsn species_tsn
		,parent_tsn
		,tsn
		,rank_id
		,complete_name
	from taxonomic_units
	where rank_id=220
	and name_usage in ('valid','accepted')

	union all

	select tax.species_tsn
		,t.parent_tsn
		,t.tsn
		,t.rank_id
		,t.complete_name
	from tax
	join taxonomic_units t on t.tsn=tax.parent_tsn
),
species as (
	select species_tsn
		,max(case when rank_id=10 then complete_name end) kingdom
		,max(case when rank_id=30 then complete_name end) phylum
		,max(case when rank_id=60 then complete_name end) class
		,max(case when rank_id=100 then complete_name end) [order]
		,max(case when rank_id=140 then complete_name end) family
		,max(case when rank_id=180 then complete_name end) genus
		,max(case when rank_id=220 then complete_name end) species
	from tax
	group by species_tsn
)
select count(*) total
	,count(kingdom) kingdom
	,count(phylum) phylum
	,count(class) class
	,count([order]) [order]
	,count(family) family
	,count(genus) genus
	,count(species) species
from species
option (maxrecursion 100)

select count(*)
from taxonomic_units

select rank_id,count(*) qty
from taxonomic_units
where name_usage in ('valid','accepted')
group by rank_id
order by rank_id



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
)
select kingdom
	,phylum
	,class
	,[order]
	,family
	,genus
	,species
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
species as (
	select *
	from tax
	where rank_id=220
)
select count(*) total
	,count(kingdom) kingdom
	,count(phylum) phylum
	,count(class) class
	,count([order]) [order]
	,count(family) family
	,count(genus) genus
	,count(species) species
from species
option (maxrecursion 100)

select 'insert into kingdom(kingdomname) values('''
	+ replace(complete_name,'''','''''')
	+ ''')'
from taxonomic_units
where rank_id=10
and name_usage in ('valid','accepted')
order by complete_name
