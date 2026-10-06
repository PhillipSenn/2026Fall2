use lr_itis
select * from INFORMATION_SCHEMA.tables

create table domain (
 domainid int identity primary key clustered
,domainname varchar(20) not null
)
go

insert into domain(domainname) values('Bacteria')
insert into domain(domainname) values('Archaea')
insert into domain(domainname) values('Eukarya')
go
create table kingdom (
	kingdomid int identity primary key clustered
	,kingdom_domain int references domain(domainid)
	,kingdomname varchar(100) not null
)
go

create table phylum (
	phylumid int identity primary key clustered
	,phylum_kingdom int not null references kingdom(kingdomid)
	,phylumname varchar(100) not null
)
go

create table class (
	classid int identity primary key clustered
	,class_phylum int not null references phylum(phylumid)
	,classname varchar(100) not null
)
go

create table ord (
	ordid int identity primary key clustered
	,ord_class int references class(classid)
	,ordname varchar(100) not null
)
go

create table family (
	familyid int identity primary key clustered
	,family_ord int references ord(ordid)
	,familyname varchar(100) not null
)
go

create table genus (
	genusid int identity primary key clustered
	,genus_family int references family(familyid)
	,genusname varchar(100) not null
)
go

create table species (
	speciesid int identity primary key clustered
	,species_genus int references genus(genusid)
	,speciesname varchar(300) not null
)
go



create index ix_kingdom_name
on kingdom(kingdomname)

create index ix_phylum_name
on phylum(phylumname,phylum_kingdom)

create index ix_class_name
on class(classname,class_phylum)

create index ix_ord_name
on ord(ordname,ord_class)

create index ix_family_name
on family(familyname,family_ord)
--
-- Breed
--
drop table breed
create table breed (
	breedid int identity primary key clustered
	,breed_species int not null references species(speciesid)
	,breedname nvarchar(100) not null
	,breedFCI nvarchar(100)
	,breedAKC nvarchar(50)
)
go
go