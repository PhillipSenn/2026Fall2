-- https://breeds.okstate.edu/other-breeds-of-livestock/donkeys

declare @speciesid int

select @speciesid=speciesid
from species
where speciesname='Equus asinus'

insert into breed(breed_species,breedname) values
	 (@speciesid,N'Abyssinian Donkeys')
	,(@speciesid,N'Anatolia Donkeys')
	,(@speciesid,N'Large Standard Donkeys')
	,(@speciesid,N'Mammoth Jack Stock Donkeys')
	,(@speciesid,N'Mary Donkeys')
	,(@speciesid,N'Miniature Donkeys')
	,(@speciesid,N'Poitou Donkeys')
	,(@speciesid,N'Standard Donkeys')
go
