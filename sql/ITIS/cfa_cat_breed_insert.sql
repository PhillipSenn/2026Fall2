alter table breed
add breedCoat nvarchar(50)
	,breedCharacteristics nvarchar(500)
	,breedPersonality nvarchar(500)
go



declare @speciesid int

select @speciesid=speciesid
from species
where speciesname='Felis catus'

if @speciesid is null
	throw 50000,'Felis catus was not found in species',1

insert into breed(breed_species,breedname,breedCoat,breedCharacteristics,breedPersonality) values
	 (@speciesid,N'Abyssinian',N'Shorthair',N'Ticked coat; ruddy, cinnamon, blue and fawn colors',N'Busy, active, agenda-driven and affectionate')
	,(@speciesid,N'American Bobtail',N'Longhair and Shorthair',N'Medium to large, naturally occurring, bobtailed cat',N'Loving and intelligent')
	,(@speciesid,N'American Curl',N'Longhair and Shorthair',N'Ears curl back, away from the face; available in a variety of colors and patterns',N'Energetic and affectionate')
	,(@speciesid,N'American Shorthair',N'Shorthair',N'Stocky, working breed: available in a wide variety of colors and patterns',N'Even temperament')
	,(@speciesid,N'American Wirehair',N'Shorthair',N'Crimped, springy coat; available in a variety of colors and patterns',N'Even temperament')
	,(@speciesid,N'Balinese',N'Longhair',N'Longhaired variety of the Siamese and Colorpoint Shorthair',N'Vocal, affectionate, active')
	,(@speciesid,N'Bengal',N'Shorthair',N'Richly colored, highly contrasted coat of vivid spots or distinctive marbling',N'Curious and athletic')
	,(@speciesid,N'Birman',N'Longhair',N'Stocky body with white feet and point color pattern; easy to groom coat of intermediate length',N'Sweet and affectionate')
	,(@speciesid,N'Bombay',N'Shorthair',N'Glossy, black coat',N'Playful and affectionate; lap cats')
	,(@speciesid,N'British Shorthair',N'Shorthair',N'Stocky, sturdy, plush coat; blue is very popular but also comes in other colors',N'Calm and quiet; enjoy people')
	,(@speciesid,N'Burmese',N'Shorthair',N'Stocky and well muscled; sable, also champagne, blue and platinum',N'People oriented, affectionate')
	,(@speciesid,N'Burmilla',N'Longhair and Shorthair',N'Sparkling silver coat, and distinctive “make up” lining the nose, lips and eyes',N'Sociable, playful, and affectionate')
	,(@speciesid,N'Chartreux',N'Shorthair',N'Blue only, well muscled, medium woolly coat',N'Even-tempered and adaptable')
	,(@speciesid,N'Colorpoint Shorthair',N'Shorthair',N'Non-traditional point colors',N'Vocal, affectionate, active; can be insistent')
	,(@speciesid,N'Cornish Rex',N'Shorthair',N'Soft, wavy, curly coat; many colors and patterns',N'Active, racy, affectionate')
	,(@speciesid,N'Devon Rex',N'Shorthair',N'Naturally curly, wavy coat; many colors and patterns',N'Pixie like and personality')
	,(@speciesid,N'Egyptian Mau',N'Shorthair',N'Spotted pattern in silver, bronze and black smoke',N'Athletic and active')
	,(@speciesid,N'European Burmese',N'Shorthair',N'Moderate type with gently rounded contours',N'Highly intelligent, affectionate and extremely loyal')
	,(@speciesid,N'Exotic',N'Longhair and Shorthair',N'Body and head type like a Persian but with a short plush coat; available in same colors and patterns as the Persian',N'Sweet, affectionate, quiet')
	,(@speciesid,N'Havana Brown',N'Shorthair',N'Chocolate brown',N'Busy, affectionate')
	,(@speciesid,N'Japanese Bobtail',N'Longhair and Shorthair',N'Short pom-pom tail; many colors and patterns available',N'Active, intelligent, and affectionate')
	,(@speciesid,N'Khao Manee',N'Shorthair',N'Pure, glistening white cat with luminous, vibrant eye color',N'Curious and Intelligent')
	,(@speciesid,N'Korat',N'Shorthair',N'Thai “good luck” cat; silver blue coat and a heart shaped face; muscular',N'Energetic and affectionate')
	,(@speciesid,N'LaPerm',N'Longhair and Shorthair',N'Medium sized, curly coated; many colors and patterns',N'Affectionate, gentle and while very active, enjoy sitting in a comfortable lap')
	,(@speciesid,N'Lykoi',N'Shorthair',N'Partial hairlessness, and unique “roan” patterned coat',N'Fun loving and intelligent')
	,(@speciesid,N'Maine Coon Cat',N'Longhair',N'Large, rugged cat; many colors and patterns are available',N'Gentle, easy going yet active')
	,(@speciesid,N'Manx',N'Longhair and Shorthair',N'Tailless cat from the Isle of Man; thick, dense coat; heavy cat; many colors and patterns are available',N'Quiet and gentle')
	,(@speciesid,N'Norwegian Forest Cat',N'Longhair',N'Stocky and hardy with a heavy coat',N'Active and sweet')
	,(@speciesid,N'Ocicat',N'Shorthair',N'Spotted hybrid; athletic and muscular',N'Strong, active and social')
	,(@speciesid,N'Oriental',N'Longhair and Shorthair',N'Siamese style cat without the point markings; over 150 colors and patterns are possible',N'Vocal, affectionate, active; can be insistent')
	,(@speciesid,N'Persian',N'Longhair',N'Stocky body, long full coat, round head with a short nose; broad face; available in a variety of colors and patterns',N'Sweet, affectionate, quiet')
	,(@speciesid,N'RagaMuffin',N'Longhair',N'Large size, large expressive eyes, all colors except pointed',N'Docile, people loving and affectionate')
	,(@speciesid,N'Ragdoll',N'Longhair',N'Large cat with color at the points',N'Docile, placid and affectionate')
	,(@speciesid,N'Russian Blue',N'Shorthair',N'Short, dense silver tipped blue coat',N'Graceful, playful and quiet')
	,(@speciesid,N'Scottish Fold',N'Longhair and Shorthair',N'Ears fold forward and down; large round eyes; also available with straight ears; many colors and patterns are bred',N'Affectionate and laid back; sweet expressions')
	,(@speciesid,N'Selkirk Rex',N'Longhair and Shorthair',N'Naturally curly coat; rounded, stocky body',N'Quiet')
	,(@speciesid,N'Siamese',N'Shorthair',N'Long, slender body with color at the points – chocolate, seal, blue and lilac; long slender legs; long wedge shaped head',N'Vocal, affectionate, active; can be insistent')
	,(@speciesid,N'Siberian',N'Longhair',N'Russian native breed; rare outside of Europe',N'Dog-like, intelligent and devoted')
	,(@speciesid,N'Singapura',N'Shorthair',N'Warm beige, ticked coat; large expressive eyes; small cat',N'Sweet, demanding, affectionate and occasionally bossy')
	,(@speciesid,N'Somali',N'Longhair',N'Longhaired variety of the Abyssinian and available in the same colors',N'Busy, active, agenda-driven and affectionate')
	,(@speciesid,N'Sphynx',N'Shorthair',N'The “hairless” cat; rare',N'Active, affectionate')
	,(@speciesid,N'Tonkinese',N'Shorthair',N'Originally developed from Burmese and Siamese; strikes a balance between the two parent breeds',N'Can be vocal, people oriented')
	,(@speciesid,N'Toybob',N'Longhair and Shorthair',N'Naturally small, bobtailed cat originating in Russia',N'Affectionate, active, playful and agile')
	,(@speciesid,N'Turkish Angora',N'Longhair',N'Originated in Turkey; silky intermediate length coat; long body; several colors and patterns',N'Busy, curious')
	,(@speciesid,N'Turkish Van',N'Longhair',N'All white except for color on head and tail',N'Sweet and interested; enjoy water')
go
