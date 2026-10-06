select speciesid,speciesname
from species
where speciesname like 'Anas%'
order by speciesname

select speciesid,speciesname
from species
where speciesname like 'Cairina%'
order by speciesname

declare @speciesid int=348977

insert into breed(breed_species,breedname)
select @speciesid,v.breedname
from (values
	 (N'Call Ducks')
	,(N'Cayuga Ducks')
	,(N'Crested Ducks')
	,(N'Khaki Campbell Ducks')
	,(N'Orpington Ducks')
	,(N'Pekin Ducks')
	,(N'Pomeranian Ducks')
	,(N'Rouen Ducks')
	,(N'Runner Ducks')
) v(breedname)
where not exists (
	select 1
	from breed
	where breed_species=@speciesid
	and breedname=v.breedname
)
go

declare @speciesid int=349020

insert into breed(breed_species,breedname)
select @speciesid,v.breedname
from (values
	 (N'Muscovy Ducks')
) v(breedname)
where not exists (
	select 1
	from breed
	where breed_species=@speciesid
	and breedname=v.breedname
)
go
