use BoxOfficeMojo
go
create table creditType
(creditTypeid int identity primary key
,creditTypename nvarchar(255)
)
go
insert into credittype(credittypename) values('Actor')
go
create table [character]
(characterid int identity primary key 
,charactername nvarchar(max)
)
go
create table movie
(movieid varchar(10) primary key -- tt22084616
,moviename nvarchar(max)
,gross int
,[year] int
)
go
create table person
(personid varchar(10) primary key -- nm4043618
,personname nvarchar(max)
)
go
create table credit
(creditid int identity primary key
,credit_movie varchar(10)
,credit_person varchar(10)
,credit_type int
,credit_character int
)
go

insert into movie(movieid,moviename,gross,year) values
 ('tt22084616',N'Spider-Man: Brand New Day',959006311,2026)
,('tt2488496',N'Star Wars: Episode VII - The Force Awakens',936662225,2015)
,('tt4154796',N'Avengers: Endgame',898471864,2019)
,('tt10872600',N'Spider-Man: No Way Home',814866759,2021)
,('tt0499549',N'Avatar',785221649,2009)
,('tt1745960',N'Top Gun: Maverick',721996984,2022)
,('tt1825683',N'Black Panther',700426566,2018)
,('tt1630029',N'Avatar: The Way of Water',688459501,2022)
,('tt4154756',N'Avengers: Infinity War',678815482,2018)
,('tt0120338',N'Titanic',674354882,1997)
,('tt0369610',N'Jurassic World',653406625,2015)
,('tt22022452',N'Inside Out 2',652980194,2024)
,('tt6263850',N'Deadpool & Wolverine',636745858,2024)
,('tt1517268',N'Barbie',636238421,2023)
,('tt33764258',N'The Odyssey',625595435,2026)
,('tt0848228',N'The Avengers',623357910,2012)
,('tt2527336',N'Star Wars: Episode VIII - The Last Jedi',620181382,2017)
,('tt3606756',N'Incredibles 2',608581744,2018)
,('tt6718170',N'The Super Mario Bros. Movie',574934330,2023)
,('tt6105098',N'The Lion King',543638043,2019)
,('tt0468569',N'The Dark Knight',534987076,2008)
,('tt3748528',N'Rogue One: A Star Wars Story',533539991,2016)
,('tt2527338',N'Star Wars: Episode IX - The Rise of Skywalker',515202542,2019)
,('tt2771200',N'Beauty and the Beast',504481165,2017)
,('tt0120915',N'Star Wars: Episode I - The Phantom Menace',487576624,1999)
,('tt2277860',N'Finding Dory',486295561,2016)
,('tt29355505',N'Toy Story 5',480294461,2026)
,('tt4520988',N'Frozen II',477373578,2019)
,('tt1262426',N'Wicked',474983975,2024)
,('tt0076759',N'Star Wars: Episode IV - A New Hope',460998507,1977)
,('tt13622970',N'Moana 2',460405297,2024)
,('tt2395427',N'Avengers: Age of Ultron',459005868,2015)
,('tt9114286',N'Black Panther: Wakanda Forever',453829060,2022)
,('tt1345836',N'The Dark Knight Rises',448149584,2012)
,('tt0298148',N'Shrek 2',444978202,2004)
,('tt0083866',N'E.T. the Extra-Terrestrial',439454989,1982)
,('tt1979376',N'Toy Story 4',434038008,2019)
,('tt28650488',N'The Super Mario Galaxy Movie',429814610,2026)
,('tt26443597',N'Zootopia 2',428130160,2025)
,('tt4154664',N'Captain Marvel',426829839,2019)
,('tt1951264',N'The Hunger Games: Catching Fire',425316659,2013)
,('tt0110357',N'The Lion King',424979720,1994)
,('tt3566834',N'A Minecraft Movie',424087780,2025)
,('tt11655566',N'Lilo & Stitch',423778855,2025)
,('tt0383574',N'Pirates of the Caribbean: Dead Man''s Chest',423315812,2006)
,('tt4881806',N'Jurassic World: Fallen Kingdom',417719760,2018)
,('tt0435761',N'Toy Story 3',415004880,2010)
,('tt0121766',N'Star Wars: Episode III - Revenge of the Sith',414378291,2005)
,('tt0451279',N'Wonder Woman',412845172,2017)
,('tt9419884',N'Doctor Strange in the Multiverse of Madness',411331607,2022)
,('tt1300854',N'Iron Man 3',409013994,2013)
,('tt0145487',N'Spider-Man',408524875,2002)
,('tt3498820',N'Captain America: Civil War',408084349,2016)
,('tt1392170',N'The Hunger Games',408010692,2012)
,('tt0107290',N'Jurassic Park',407185075,1993)
,('tt2283362',N'Jumanji: Welcome to the Jungle',404540171,2017)
,('tt1757678',N'Avatar: Fire and Ash',404340010,2025)
,('tt1055369',N'Transformers: Revenge of the Fallen',402111870,2009)
,('tt2294629',N'Frozen',400738009,2013)
,('tt6320628',N'Spider-Man: Far from Home',391283774,2019)
,('tt3896198',N'Guardians of the Galaxy: Vol. 2',389813101,2017)
,('tt0167260',N'The Lord of the Rings: The Return of the King',386975644,2003)
,('tt1201607',N'Harry Potter and the Deathly Hallows: Part 2',381884297,2011)
,('tt9362722',N'Spider-Man: Across the Spider-Verse',381593754,2023)
,('tt0266543',N'Finding Nemo',380843261,2003)
,('tt8041270',N'Jurassic World: Dominion',376851080,2022)
,('tt0316654',N'Spider-Man 2',375087840,2004)
,('tt11378946',N'Michael',372303388,2026)
,('tt0335345',N'The Passion of the Christ',371864658,2004)
,('tt5113044',N'Minions: The Rise of Gru',370549695,2022)
,('tt1877830',N'The Batman',369801546,2022)
,('tt2709768',N'The Secret Life of Pets',368623860,2016)
,('tt1690953',N'Despicable Me 2',368065385,2013)
,('tt3040964',N'The Jungle Book',364001123,2016)
,('tt1431045',N'Deadpool',363070709,2016)
,('tt7510222',N'Despicable Me 4',361004205,2024)
,('tt6791350',N'Guardians of the Galaxy Vol. 3',358995815,2023)
,('tt2096673',N'Inside Out',356461711,2015)
,('tt6139732',N'Aladdin',355559216,2019)
,('tt5950044',N'Superman',354223803,2025)
,('tt2820852',N'Furious 7',353007020,2015)
,('tt1399103',N'Transformers: Dark of the Moon',352390543,2011)
,('tt2179136',N'American Sniper',350159020,2014)
,('tt0167261',N'The Lord of the Rings: The Two Towers',350104956,2002)
,('tt12042730',N'Project Hail Mary',344050007,2026)
,('tt10648342',N'Thor: Love and Thunder',343256830,2022)
,('tt19847976',N'Wicked: For Good',342915090,2025)
,('tt2948356',N'Zootopia',341268248,2016)
,('tt31036941',N'Jurassic World: Rebirth',339640400,2025)
,('tt0413300',N'Spider-Man 3',338032318,2007)
,('tt1951265',N'The Hunger Games: Mockingjay - Part 1',337135885,2014)
,('tt2293640',N'Minions',336045770,2015)
,('tt7286456',N'Joker',335477657,2019)
,('tt1477834',N'Aquaman',335104314,2018)
,('tt2250912',N'Spider-Man: Homecoming',334952829,2017)
,('tt1014759',N'Alice in Wonderland',334191110,2010)
,('tt2015381',N'Guardians of the Galaxy',333718600,2014)
,('tt0109830',N'Forrest Gump',330455270,1994)
,('tt2975590',N'Batman v Superman: Dawn of Justice',330360194,2016)
,('tt15398776',N'Oppenheimer',330078895,2023)
,('tt1396484',N'It',328874981,2017)
,('tt0120737',N'The Lord of the Rings: The Fellowship of the Ring',325873309,2001)
,('tt1386697',N'Suicide Squad',325100054,2016)
,('tt5463162',N'Deadpool 2',324591735,2018)
,('tt0413267',N'Shrek the Third',322719944,2007)
,('tt7975244',N'Jumanji: The Next Level',320314960,2019)
,('tt0241527',N'Harry Potter and the Philosopher''s Stone',319765078,2001)
,('tt0418279',N'Transformers',319246193,2007)
,('tt0371746',N'Iron Man',319034126,2008)
,('tt0367882',N'Indiana Jones and the Kingdom of the Crystal Skull',317101119,2008)
,('tt0086190',N'Star Wars: Episode VI - Return of the Jedi',316566101,1983)
,('tt3501632',N'Thor: Ragnarok',315058289,2017)
,('tt1228705',N'Iron Man 2',312433331,2010)
,('tt0121765',N'Star Wars: Episode II - Attack of the Clones',310676740,2002)
,('tt0449088',N'Pirates of the Caribbean: At World''s End',309420425,2007)
,('tt0116629',N'Independence Day',306169268,1996)
,('tt0325980',N'Pirates of the Caribbean: The Curse of the Black Pearl',305413918,2003)
,('tt1074638',N'Skyfall',304360277,2012)
,('tt0903624',N'The Hobbit: An Unexpected Journey',303030651,2012)
,('tt0417741',N'Harry Potter and the Half-Blood Prince',302334374,2009)
,('tt1325004',N'The Twilight Saga: Eclipse',300840764,2010)
,('tt1259571',N'The Twilight Saga: New Moon',298410482,2009)
,('tt5971474',N'The Little Mermaid',298172056,2023)
,('tt0926084',N'Harry Potter and the Deathly Hallows: Part 1',296374621,2010)
,('tt2049403',N'Beetlejuice Beetlejuice',294100435,2024)
,('tt0167404',N'The Sixth Sense',293506292,1999)
,('tt1673434',N'The Twilight Saga: Breaking Dawn - Part 2',293144686,2012)
,('tt1049413',N'Up',293004164,2009)
,('tt0080684',N'Star Wars: Episode V - The Empire Strikes Back',292753960,1980)
,('tt1375666',N'Inception',292587330,2010)
,('tt0373889',N'Harry Potter and the Order of the Phoenix',292382727,2007)
,('tt0363771',N'The Chronicles of Narnia: The Lion, the Witch and the Wardrobe',291710957,2005)
,('tt0330373',N'Harry Potter and the Goblet of Fire',291239805,2005)
,('tt0770828',N'Man of Steel',291045518,2013)
,('tt0198781',N'Monsters, Inc.',290642256,2001)
,('tt0099785',N'Home Alone',285761243,1990)
,('tt15239678',N'Dune: Part Two',282144358,2024)
,('tt1951266',N'The Hunger Games: Mockingjay - Part 2',282012349,2015)
,('tt1324999',N'The Twilight Saga: Breaking Dawn - Part 1',281797623,2011)
,('tt0234215',N'The Matrix Reloaded',281576461,2003)
,('tt0073195',N'Jaws',280083300,1975)
,('tt31193180',N'Sinners',279989632,2025)
,('tt0290002',N'Meet the Fockers',279261160,2004)
,('tt1119646',N'The Hangover',277339746,2009)
,('tt10676052',N'The Fantastic Four: First Steps',274286610,2025)
,('tt1454468',N'Gravity',274092705,2013)
,('tt2709692',N'The Grinch',272214456,2018)
,('tt3470600',N'Sing',270578425,2016)
,('tt0126029',N'Shrek',270491111,2001)
,('tt1453405',N'Monsters University',268492764,2013)
,('tt12584954',N'Twisters',267762265,2024)
,('tt0170016',N'How the Grinch Stole Christmas',264715545,2000)
,('tt3469046',N'Despicable Me 3',264624300,2017)
,('tt37287335',N'Obsession',263451715,2026)
,('tt0295297',N'Harry Potter and the Chamber of Secrets',263094348,2002)
,('tt26743210',N'How to Train Your Dragon',262958100,2025)
,('tt0948470',N'The Amazing Spider-Man',262782352,2012)
,('tt0317705',N'The Incredibles',261441092,2004)
,('tt1843866',N'Captain America: The Winter Soldier',259766572,2014)
,('tt1170358',N'The Hobbit: The Desolation of Smaug',258387334,2013)
,('tt1490017',N'The Lego Movie',257966122,2014)
,('tt0796366',N'Star Trek',257730019,2009)
,('tt0480249',N'I Am Legend',256393010,2007)
,('tt0878804',N'The Blind Side',255982860,2009)
,('tt0317219',N'Cars',255159210,2006)
,('tt2310332',N'The Hobbit: The Battle of the Five Armies',255138261,2014)
,('tt13186482',N'Mufasa: The Lion King',254567693,2024)
,('tt1411697',N'The Hangover Part II',254464305,2011)
,('tt1323594',N'Despicable Me',251639815,2010)
,('tt0096895',N'Batman',251409241,1989)
,('tt0477347',N'Night at the Museum',250863268,2006)
,('tt0119654',N'Men in Black',250690539,1997)
,('tt0304141',N'Harry Potter and the Prisoner of Azkaban',250657586,2016)
,('tt3521164',N'Moana',248757044,2016)
,('tt0082971',N'Raiders of the Lost Ark',248159971,1981)
,('tt0120363',N'Toy Story 2',245852179,1999)
,('tt2109248',N'Transformers: Age of Extinction',245439076,2014)
,('tt0087332',N'Ghostbusters',243640120,1984)
,('tt0315327',N'Bruce Almighty',242829261,2003)
,('tt0117998',N'Twister',241830615,1996)
,('tt0259446',N'My Big Fat Greek Wedding',241438208,2002)
,('tt1587310',N'Maleficent',241410378,2014)
,('tt1298650',N'Pirates of the Caribbean: On Stranger Tides',241071802,2011)
,('tt0892791',N'Shrek Forever After',238736787,2010)
,('tt1905041',N'Fast & Furious 6',238679850,2013)
,('tt1217209',N'Brave',237283207,2012)
,('tt18259086',N'Sonic the Hedgehog 3',236115100,2024)
,('tt1623205',N'Oz the Great and Powerful',234911825,2013)
,('tt0086960',N'Beverly Hills Cop',234760478,1984)
,('tt0376994',N'X-Men: The Last Stand',234362462,2006)
,('tt0407304',N'War of the Worlds',234280354,2005)
,('tt3183660',N'Fantastic Beasts and Where to Find Them',234037575,2016)
,('tt1877832',N'X-Men: Days of Future Past',233921534,2014)
,('tt0162222',N'Cast Away',233632142,2000)
,('tt0070047',N'The Exorcist',233005644,1973)
,('tt1211837',N'Doctor Strange',232641920,2016)
,('tt0114709',N'Toy Story',229947062,1995)
,('tt0119567',N'The Lost World: Jurassic Park',229086679,1997)
,('tt0974015',N'Justice League',229024295,2017)
,('tt1408101',N'Star Trek Into Darkness',228778661,2013)

insert into movie(movieid,moviename,gross,year) values
('tt3659388',N'The Martian',228433663,2015),
('tt0286106',N'Signs',227966634,2002),
('tt0448157',N'Hancock',227946274,2008),
('tt0440963',N'The Bourne Ultimatum',227471070,2007),
('tt3315342',N'Logan',226277068,2017),
('tt0266915',N'Rush Hour 2',226164286,2001),
('tt4630562',N'The Fate of the Furious',226008385,2017),
('tt9376612',N'Shang-Chi and the Legend of the Ten Rings',224543292,2021),
('tt0910970',N'WALL·E',223808164,2008),
('tt2245084',N'Big Hero 6',222527828,2014),
('tt0088763',N'Back to the Future',221348307,1985),
('tt33612209',N'The Devil Wears Prada 2',220556651,2026),
('tt4912910',N'Mission: Impossible - Fallout',220159104,2018),
('tt0465234',N'National Treasure: Book of Secrets',219964115,2007),
('tt1231580',N'Alvin and the Chipmunks: The Squeakquel',219614612,2009),
('tt0107614',N'Mrs. Doubtfire',219195243,1993),
('tt0101414',N'Beauty and the Beast',218967620,1991),
('tt1637725',N'Ted',218815487,2012),
('tt6166392',N'Wonka',218402312,2023),
('tt0360717',N'King Kong',218080025,2005),
('tt0099653',N'Ghost',217631306,1990),
('tt0892769',N'How to Train Your Dragon',217581231,2010),
('tt0382625',N'The Da Vinci Code',217536138,2006),
('tt0103639',N'Aladdin',217350219,1992),
('tt0952640',N'Alvin and the Chipmunks',217326974,2007),
('tt0120815',N'Saving Private Ryan',217049603,1998),
('tt1727824',N'Bohemian Rhapsody',216668042,2018),
('tt5095030',N'Ant-Man and the Wasp',216648740,2018),
('tt1277953',N'Madagascar 3: Europe''s Most Wanted',216391482,2012),
('tt0441773',N'Kung Fu Panda',215727546,2008),
('tt0120755',N'Mission: Impossible II',215409889,2000),
('tt1517451',N'A Star Is Born',215333122,2018),
('tt0290334',N'X2: X-Men United',214949694,2003),
('tt10954600',N'Ant-Man and the Wasp: Quantumania',214504909,2023),
('tt1482459',N'The Lorax',214151550,2012),
('tt3778644',N'Solo: A Star Wars Story',213767512,2018),
('tt7097896',N'Venom: Let There Be Carnage',213550366,2021),
('tt1270797',N'Venom',213515506,2018),
('tt0295178',N'Austin Powers in Goldmember',213307889,2002),
('tt7349950',N'It: Chapter Two',211622525,2019),
('tt0416449',N'300',210629101,2007),
('tt2380307',N'Coco',210460015,2017),
('tt1596343',N'Fast Five',209837675,2011),
('tt1229238',N'Mission: Impossible - Ghost Protocol',209397903,2011),
('tt0396269',N'Wedding Crashers',209273411,2005),
('tt0988045',N'Sherlock Holmes',209028679,2009),
('tt2103281',N'Dawn of the Planet of the Apes',208545589,2014),
('tt0103064',N'Terminator 2: Judgment Day',206973454,1991),
('tt0372784',N'Batman Begins',206863479,2005),
('tt0367594',N'Charlie and the Chocolate Factory',206459076,2005),
('tt0382932',N'Ratatouille',206445654,2007),
('tt1981115',N'Thor: The Dark World',206362140,2013),
('tt1502397',N'Bad Boys for Life',206305244,2020),
('tt0145660',N'Austin Powers: The Spy Who Shagged Me',206040086,1999),
('tt1872181',N'The Amazing Spider-Man 2',203605622,2014),
('tt0816692',N'Interstellar',203227580,2014),
('tt0816711',N'World War Z',202807711,2013),
('tt0209163',N'The Mummy Returns',202804895,2001),
('tt0120591',N'Armageddon',201578182,1998),
('tt1661199',N'Cinderella',201151353,2015),
('tt5848272',N'Ralph Breaks the Internet',201091711,2018),
('tt0031381',N'Gone with the Wind',200882193,1939),
('tt0398286',N'Tangled',200821936,2010),
('tt0831387',N'Godzilla',200676069,2014),
('tt14513804',N'Captain America: Brave New World',200500001,2025),
('tt0348150',N'Superman Returns',200081192,2006),
('tt2379713',N'Spectre',200074609,2015),
('tt0213149',N'Pearl Harbor',198542554,2001),
('tt0892782',N'Monsters vs. Aliens',198351526,2009),
('tt0366548',N'Happy Feet',198000317,2006),
('tt26657236',N'Backrooms',197523513,2026),
('tt9603208',N'Mission: Impossible - The Final Reckoning',197413515,2025),
('tt0097576',N'Indiana Jones and the Last Crusade',197171806,1989),
('tt1080016',N'Ice Age: Dawn of the Dinosaurs',196573705,2009),
('tt14539740',N'Godzilla X Kong: The New Empire',196350016,2024),
('tt1099212',N'Twilight',195553813,2008),
('tt0438097',N'Ice Age 2: The Meltdown',195330621,2006),
('tt2381249',N'Mission: Impossible - Rogue Nation',195042377,2015),
('tt0351283',N'Madagascar',194820396,2005),
('tt0120912',N'Men in Black II',193735288,2002),
('tt21692408',N'Kung Fu Panda 4',193590620,2024),
('tt4919268',N'Bad Boys: Ride or Die',193573217,2024),
('tt2294449',N'22 Jump Street',191719337,2014),
('tt1216475',N'Cars 2',191452396,2011),
('tt1291150',N'Teenage Mutant Ninja Turtles',191204754,2014),
('tt0338348',N'The Polar Express',191019448,2005),
('tt12412888',N'Sonic the Hedgehog 2',190872904,2022),
('tt20969586',N'Thunderbolts*',190274328,2025),
('tt4633694',N'Spider-Man: Into the Spider-Verse',190241310,2018),
('tt0077631',N'Grease',190071103,1978),
('tt5013056',N'Dunkirk',189740665,2017),
('tt16311594',N'F1: The Movie',189642436,2025),
('tt1772341',N'Wreck-It Ralph',189422889,2012),
('tt6644200',N'A Quiet Place',188024361,2018),
('tt0172495',N'Gladiator',187705427,2000),
('tt0481499',N'The Croods',187168425,2013),
('tt10366206',N'John Wick: Chapter 4',187131806,2023),
('tt1515091',N'Sherlock Holmes: A Game of Shadows',186848418,2011),
('tt0319262',N'The Day After Tomorrow',186740799,2004),
('tt0356910',N'Mr. & Mrs. Smith',186336279,2005),
('tt3915174',N'Puss in Boots: The Last Wish',186090535,2022),
('tt0029583',N'Snow White and the Seven Dwarfs',184925486,1937),
('tt2848292',N'Pitch Perfect 2',184296230,2015),
('tt1663202',N'The Revenant',184247394,2015),
('tt0099348',N'Dances with Wolves',184208848,1990),
('tt7599146',N'Sound of Freedom',184178046,2023),
('tt0112462',N'Batman Forever',184069126,1995),
('tt0106977',N'The Fugitive',183875760,1993),
('tt3480822',N'Black Widow',183651655,2021),
('tt0240772',N'Ocean''s Eleven',183615133,2001),
('tt0092099',N'Top Gun',183522341,1986),
('tt32890033',N'Minions & Monsters',183171260,2026),
('tt0462538',N'The Simpsons Movie',183135014,2007),
('tt0207201',N'What Women Want',182811707,2000),
('tt0177971',N'The Perfect Storm',182618434,2000),
('tt0443272',N'Lincoln',182207973,2012),
('tt0119528',N'Liar Liar',181410615,1997),
('tt0163025',N'Jurassic Park III',181171875,2001),
('tt0800369',N'Thor',181030624,2011),
('tt0117060',N'Mission: Impossible',180981856,1996),
('tt28814949',N'Taylor Swift: The Eras Tour',180756269,2023),
('tt0478970',N'Ant-Man',180202163,2015),
('tt0133152',N'Planet of the Apes',180011740,2001),
('tt0479952',N'Madagascar: Escape 2 Africa',180010950,2008),
('tt0458525',N'X-Men Origins: Wolverine',179883157,2009),
('tt0087469',N'Indiana Jones and the Temple of Doom',179870271,1984),
('tt0319343',N'Elf',179757261,2003),
('tt0386588',N'Hitch',179495555,2005),
('tt1409024',N'Men in Black 3',179020854,2012),
('tt0100405',N'Pretty Woman',178406268,1990),
('tt22898462',N'The Conjuring: Last Rites',177756445,2025),
('tt30825738',N'Star Wars: The Mandalorian and Grogu',177730060,2026),
('tt0133093',N'The Matrix',177559005,1999),
('tt2224026',N'Home',177397510,2015),
('tt1078912',N'Night at the Museum: Battle of the Smithsonian',177243721,2009),
('tt0084805',N'Tootsie',177200000,1982),
('tt1646971',N'How to Train Your Dragon 2',177002924,2014),
('tt1318514',N'Rise of the Planet of the Apes',176760185,2011),
('tt0458339',N'Captain America: The First Avenger',176654505,2011),
('tt1155076',N'The Karate Kid',176591618,2010),
('tt0129387',N'There''s Something About Mary',176484651,1998),
('tt0268380',N'Ice Age',176387405,2002),
('tt0372183',N'The Bourne Supremacy',176241941,2004),
('tt5052448',N'Get Out',176040665,2017),
('tt4116284',N'The Lego Batman Movie',175936671,2017),
('tt6857112',N'Us',175084580,2019),
('tt3874544',N'The Boss Baby',175003033,2017),
('tt3104988',N'Crazy Rich Asians',174837452,2018),
('tt0090555',N'Crocodile Dundee',174803506,1986),
('tt0112384',N'Apollo 13',174692658,1995),
('tt1462764',N'Indiana Jones and the Dial of Destiny',174480468,2023),
('tt1485796',N'The Greatest Showman',174340174,2017),
('tt6806448',N'Fast & Furious Presents: Hobbs & Shaw',173956935,2019),
('tt0104431',N'Home Alone 2: Lost in New York',173585516,1992),
('tt0368891',N'National Treasure',173008894,2004),
('tt5433138',N'F9: The Fast Saga',173005945,2021),
('tt0118571',N'Air Force One',172956409,1997),
('tt0095953',N'Rain Man',172825435,1988),
('tt9603212',N'Mission: Impossible - Dead Reckoning Part One',172640980,2023),
('tt1790809',N'Pirates of the Caribbean: Dead Men Tell No Tales',172558876,2017),
('tt9218128',N'Gladiator II',172438016,2024),
('tt1104001',N'Tron: Legacy',172062763,2010),
('tt5028340',N'Mary Poppins Returns',171958438,2018),
('tt1403865',N'True Grit',171243005,2010),
('tt11389872',N'Kingdom of the Planet of the Apes',171130165,2024),
('tt0120855',N'Tarzan',171091819,1999),
('tt6146586',N'John Wick: Chapter 3 - Parabellum',171015687,2019),
('tt0268978',N'A Beautiful Mind',170742341,2001),
('tt0299658',N'Chicago',170687518,2002),
('tt1454029',N'The Help',169708112,2011),
('tt2510894',N'Hotel Transylvania 2',169700110,2015),
('tt4846340',N'Hidden Figures',169607287,2016),
('tt1478338',N'Bridesmaids',169525235,2011),
('tt0830515',N'Quantum of Solace',168368427,2008),
('tt0486946',N'Wild Hogs',168273550,2007),
('tt6443346',N'Black Adam',168152111,2022),
('tt3731562',N'Kong: Skull Island',168052812,2017),
('tt0094137',N'Three Men and a Baby',167780960,1987),
('tt2267998',N'Gone Girl',167767189,2014),
('tt5220122',N'Hotel Transylvania 3: Summer Vacation',167510016,2018),
('tt0381061',N'Casino Royale',167445960,2006),
('tt10545296',N'The Hunger Games: The Ballad of Songbirds & Snakes',166350594,2023),
('tt0212338',N'Meet the Parents',166244045,2000),
('tt2322441',N'Fifty Shades of Grey',166167230,2015),
('tt1190080',N'2012',166112167,2009),
('tt26443616',N'Hoppers',166010783,2026),
('tt0102798',N'Robin Hood: Prince of Thieves',165493908,1991),
('tt8946378',N'Knives Out',165363234,2019),
('tt1302011',N'Kung Fu Panda 2',165249063,2011),
('tt0212985',N'Hannibal',165092268,2001),
('tt9032400',N'Eternals',164870234,2021),
('tt0264464',N'Catch Me If You Can',164615351,2002),
('tt1041829',N'The Proposal',163958031,2009),
('tt0454921',N'The Pursuit of Happyness',163566459,2006),
('tt0142342',N'Big Daddy',163479795,1999),
('tt0800320',N'Clash of the Titans',163214888,2010),
('tt2279373',N'The SpongeBob Movie: Sponge Out of Water',162994032,2015),
('tt0103776',N'Batman Returns',162924631,1992),
('tt1853728',N'Django Unchained',162805434,2012),
('tt0120623',N'A Bug''s Life',162798565,1998);
go
insert into movie(movieid,moviename,gross,year) values
('tt6467266',N'Sing 2',162790990,2021),
('tt4196776',N'Jason Bourne',162434410,2016),
('tt1375670',N'Grown Ups',162001186,2010),
('tt0120484',N'The Waterboy',161491646,1998),
('tt1667889',N'Ice Age: Continental Drift',161321843,2012),
('tt1398426',N'Straight Outta Compton',161197785,2015),
('tt0246460',N'Die Another Day',160942139,2002),
('tt2382320',N'No Time to Die',160891007,2021),
('tt0059742',N'The Sound of Music',160888776,1965),
('tt0307453',N'Shark Tale',160861908,2004),
('tt2386490',N'How to Train Your Dragon: The Hidden World',160799505,2019),
('tt8332922',N'A Quiet Place Part II',160072261,2021),
('tt35538033',N'Resident Evil',159694135,2026),
('tt2404463',N'The Heat',159582188,2013),
('tt4123430',N'Fantastic Beasts: The Crimes of Grindelwald',159555901,2018),
('tt1502407',N'Halloween',159342015,2018),
('tt8579674',N'1917',159227644,2019),
('tt5113040',N'The Secret Life of Pets 2',158980250,2019),
('tt2660888',N'Star Trek Beyond',158848340,2016),
('tt0106918',N'The Firm',158348367,1993),
('tt0398165',N'The Longest Yard',158119460,2005),
('tt5090568',N'Transformers: Rise of the Beasts',157341749,2023),
('tt0120903',N'X-Men',157299718,2000),
('tt0120616',N'The Mummy',157095368,1999),
('tt0175142',N'Scary Movie',157019771,2000),
('tt0093010',N'Fatal Attraction',156645693,1987),
('tt0096438',N'Who Framed Roger Rabbit',156452370,1988),
('tt11145118',N'Creed III',156248615,2023),
('tt0070735',N'The Sting',156000000,1973),
('tt0161081',N'What Lies Beneath',155464351,2000),
('tt3385516',N'X-Men: Apocalypse',155442489,2016),
('tt1735898',N'Snow White and the Huntsman',155332381,2012),
('tt2126355',N'San Andreas',155190832,2015),
('tt1013752',N'Fast & Furious',155064265,2009),
('tt0327084',N'Over the Hedge',155019340,2006),
('tt0120667',N'Fantastic Four',154696080,2005),
('tt0451079',N'Horton Hears a Who!',154529439,2008),
('tt15789038',N'Elemental',154426697,2023),
('tt1392190',N'Mad Max: Fury Road',154280290,2015),
('tt0116695',N'Jerry Maguire',154069639,1996),
('tt1679335',N'Trolls',153856089,2016),
('tt0092644',N'Beverly Hills Cop II',153665036,1987),
('tt0087363',N'Gremlins',153642180,1984),
('tt0267913',N'Scooby-Doo',153322074,2002),
('tt3606752',N'Cars 3',152901115,2017),
('tt1000774',N'Sex and the City',152647258,2008),
('tt0163187',N'Runaway Bride',152257509,1999),
('tt26581740',N'Weapons',151572492,2025),
('tt3783958',N'La La Land',151101803,2016),
('tt3704428',N'Elvis',151040048,2022),
('tt1840309',N'Divergent',150947895,2014),
('tt0089880',N'Rambo: First Blood Part II',150415432,1985),
('tt1723121',N'We''re the Millers',150394119,2013),
('tt0181852',N'Terminator 3: Rise of the Machines',150371112,2003),
('tt1528854',N'Daddy''s Home',150357137,2015),
('tt1046173',N'G.I. Joe: The Rise of Cobra',150201498,2009),
('tt2004420',N'Neighbors',150157400,2014),
('tt1800241',N'American Hustle',150117807,2013),
('tt0448694',N'Puss in Boots',149260504,2011),
('tt1707386',N'Les Misérables',149260140,2012),
('tt3794354',N'Sonic the Hedgehog',148974665,2020),
('tt0232500',N'The Fast and the Furious',148961825,2001),
('tt0478311',N'Knocked Up',148768917,2007),
('tt1464335',N'Uncharted',148648820,2022),
('tt10655524',N'It Ends with Us',148518266,2024),
('tt0119822',N'As Good as It Gets',148478011,1997),
('tt0970866',N'Little Fockers',148438600,2010),
('tt0837562',N'Hotel Transylvania',148426305,2012),
('tt1001526',N'Megamind',148415853,2010),
('tt0415306',N'Talladega Nights: The Ballad of Ricky Bobby',148342004,2006),
('tt1205489',N'Gran Torino',148095302,2008),
('tt0097733',N'Lethal Weapon 2',147253986,1989),
('tt3450958',N'War for the Planet of the Apes',146880162,2017),
('tt1270798',N'X-Men: First Class',146408305,2011),
('tt1114740',N'Paul Blart: Mall Cop',146336178,2009),
('tt0111503',N'True Lies',146282411,1994),
('tt5433140',N'Fast X',146126015,2023),
('tt0275847',N'Lilo & Stitch',145794338,2002),
('tt0111070',N'The Santa Clause',145539357,1994),
('tt4779682',N'The Meg',145522784,2018),
('tt0252866',N'American Pie 2',145103595,2001),
('tt0936501',N'Taken',145000989,2009),
('tt0055254',N'One Hundred and One Dalmatians',144880014,1961),
('tt1343092',N'The Great Gatsby',144857996,2013),
('tt0343818',N'I, Robot',144801023,2004),
('tt0104714',N'Lethal Weapon 3',144731527,1992),
('tt0795421',N'Mamma Mia!',144330569,2008),
('tt5884052',N'Pokémon: Detective Pikachu',144174568,2019),
('tt0118998',N'Doctor Dolittle',144156605,1998),
('tt29623480',N'The Wild Robot',143901945,2024),
('tt1436562',N'Rio',143619809,2011),
('tt2267968',N'Kung Fu Panda 3',143528619,2016),
('tt0467406',N'Juno',143495265,2007),
('tt0822832',N'Marley & Me',143153751,2008),
('tt7131622',N'Once Upon a Time in... Hollywood',142804994,2019),
('tt0472181',N'The Smurfs',142614158,2011),
('tt0295701',N'xXx',142109382,2002),
('tt0061852',N'The Jungle Book',141843612,1967),
('tt0499448',N'The Chronicles of Narnia: Prince Caspian',141621490,2008),
('tt0077975',N'National Lampoon''s Animal House',141600000,1978),
('tt0114148',N'Pocahontas',141579773,1995),
('tt0104257',N'A Few Good Men',141340178,1992),
('tt1010048',N'Slumdog Millionaire',141319928,2008),
('tt0120812',N'Rush Hour',141186864,1998),
('tt0185937',N'The Blair Witch Project',140539099,1999),
('tt0448115',N'Shazam!',140480049,2019),
('tt0120647',N'Deep Impact',140464664,1998),
('tt5164214',N'Ocean''s Eight',140295726,2018),
('tt0293564',N'Rush Hour 3',140125968,2007),
('tt0097778',N'Look Who''s Talking',140088813,1989),
('tt0164912',N'Stuart Little',140035367,1999),
('tt1397280',N'Taken 2',139854287,2012),
('tt16366836',N'Venom: The Last Dance',139755882,2024),
('tt0105417',N'Sister Act',139605150,1992),
('tt0242653',N'The Matrix Revolutions',139313948,2003),
('tt0304669',N'The Santa Clause 2',139236327,2002),
('tt13433802',N'A Quiet Place: Day One',139051884,2024),
('tt1504320',N'The King''s Speech',138797449,2010),
('tt0349205',N'Cheaper by the Dozen',138614544,2003),
('tt0172156',N'Bad Boys II',138608444,2003),
('tt0091763',N'Platoon',138530565,1986),
('tt1232829',N'21 Jump Street',138447667,2012),
('tt0119217',N'Good Will Hunting',138433435,1997),
('tt4972582',N'Split',138291365,2017),
('tt9619824',N'Final Destination: Bloodlines',138254739,2025),
('tt1067106',N'A Christmas Carol',137855863,2009),
('tt0130623',N'Dinosaur',137748063,2000),
('tt1677720',N'Ready Player One',137715350,2018),
('tt1457767',N'The Conjuring',137446368,2013),
('tt0389860',N'Click',137355633,2006),
('tt4589218',N'Five Nights at Freddy''s',137275620,2023),
('tt32820897',N'Demon Slayer: Kimetsu No Yaiba Infinity Castle',136950340,2025),
('tt0120689',N'The Green Mile',136801374,1999),
('tt0117438',N'Ransom',136492681,1996),
('tt0068646',N'The Godfather',136381073,1972),
('tt0120685',N'Godzilla',136314294,1998),
('tt0115433',N'101 Dalmatians',136189294,1996),
('tt1024648',N'Argo',136025503,2012),
('tt0305224',N'Anger Management',135645823,2003),
('tt0371606',N'Chicken Little',135386665,2005),
('tt0100758',N'Teenage Mutant Ninja Turtles',135384756,1990),
('tt0075860',N'Close Encounters of the Third Kind',135189114,1977),
('tt0129290',N'Patch Adams',135026902,1998),
('tt1408253',N'Ride Along',134938200,2014),
('tt0800080',N'The Incredible Hulk',134806913,2008),
('tt0337978',N'Live Free or Die Hard',134529403,2007),
('tt0493464',N'Wanted',134508551,2008),
('tt2024432',N'Identity Thief',134506920,2013),
('tt0078346',N'Superman',134478449,1978),
('tt0117500',N'The Rock',134069511,1996),
('tt0317919',N'Mission: Impossible III',134029801,2006),
('tt2191701',N'Grown Ups 2',133668525,2013),
('tt0332452',N'Troy',133378256,2004),
('tt0808151',N'Angels & Demons',133375846,2009),
('tt1615918',N'Alvin and the Chipmunks: Chipwrecked',133110742,2011),
('tt0305669',N'Bringing Down the House',132716677,2003),
('tt1430132',N'The Wolverine',132556852,2013),
('tt2543472',N'Wonder',132422809,2017),
('tt0407887',N'The Departed',132399394,2006),
('tt0286716',N'Hulk',132177234,2003),
('tt1045658',N'Silver Linings Playbook',132092958,2012),
('tt0181689',N'Minority Report',132072926,2002),
('tt0486576',N'Fantastic Four: Rise of the Silver Surfer',131921738,2007),
('tt0938283',N'The Last Airbender',131772187,2010),
('tt2357291',N'Rio 2',131538435,2014),
('tt0146316',N'Lara Croft: Tomb Raider',131168070,2001),
('tt0102926',N'The Silence of the Lambs',131138318,1991),
('tt0097523',N'Honey, I Shrunk the Kids',130724172,1989),
('tt0109813',N'The Flintstones',130531208,1994),
('tt0122151',N'Lethal Weapon 4',130444603,1998),
('tt0425061',N'Get Smart',130319208,2008),
('tt2908446',N'The Divergent Series: Insurgent',130179072,2015),
('tt2452042',N'The Peanuts Movie',130178411,2015),
('tt3371366',N'Transformers: The Last Knight',130168683,2017),
('tt0765429',N'American Gangster',130164645,2007),
('tt0169547',N'American Beauty',130096601,1999),
('tt0084434',N'An Officer and a Gentleman',129795554,1982),
('tt4513678',N'Ghostbusters: Afterlife',129471867,2021),
('tt0298130',N'The Ring',129128133,2002),
('tt0117218',N'The Nutty Professor',128853029,1996),
('tt0190332',N'Crouching Tiger, Hidden Dragon',128530421,2000),
('tt0443453',N'Borat',128505958,2006),
('tt1289401',N'Ghostbusters',128350574,2016),
('tt2802144',N'Kingsman: The Secret Service',128261724,2015),
('tt0358082',N'Robots',128200012,2005),
('tt0094898',N'Coming to America',128152301,1988),
('tt1130884',N'Shutter Island',128012934,2010),
('tt2180411',N'Into the Woods',128002372,2014),
('tt0089927',N'Rocky IV',127873716,1985),
('tt0461770',N'Enchanted',127807262,2007),
('tt30274401',N'Five Nights at Freddy''s 2',127730290,2025),
('tt6495056',N'Migration',127630880,2023),
('tt0421715',N'The Curious Case of Benjamin Button',127509326,2008),
('tt1489889',N'Central Intelligence',127440871,2016),
('tt1229340',N'Anchorman 2: The Legend Continues',127352707,2013),
('tt0256415',N'Sweet Home Alabama',127223418,2002),
('tt4701182',N'Bumblebee',127195589,2018),
('tt0109686',N'Dumb and Dumber',127190327,1994),
('tt0322259',N'2 Fast 2 Furious',127154901,2003),
('tt0119738',N'My Best Friend''s Wedding',127120029,1997);
go
insert into movie(movieid,moviename,gross,year) values
('tt1650062',N'Super 8',127004179,2011),
('tt0143145',N'The World Is Not Enough',126943684,1999),
('tt0108160',N'Sleepless in Seattle',126808165,1993),
('tt0076729',N'Smokey and the Bandit',126737428,1977),
('tt2872732',N'Lucy',126663600,2014),
('tt0918940',N'The Legend of Tarzan',126643061,2016),
('tt0389790',N'Bee Movie',126631277,2007),
('tt1446714',N'Prometheus',126477084,2012),
('tt27543632',N'The Housemaid',126432462,2025),
('tt1599348',N'Safe House',126373434,2012),
('tt0280590',N'Mr. Deeds',126293452,2002),
('tt27419466',N'Moana',126229663,2026),
('tt0120382',N'The Truman Show',125618201,1998),
('tt0195685',N'Erin Brockovich',125595205,2000),
('tt0349903',N'Ocean''s Twelve',125544280,2004),
('tt0438488',N'Terminator Salvation',125322469,2009),
('tt0160127',N'Charlie''s Angels',125305545,2000),
('tt0120347',N'Tomorrow Never Dies',125304276,1997),
('tt1091191',N'Lone Survivor',125095601,2013),
('tt3263904',N'Sully',125070033,2016),
('tt0084602',N'Rocky III',125049125,1982),
('tt1606389',N'The Vow',125014030,2012),
('tt0454876',N'Life of Pi',124987023,2012),
('tt2582846',N'The Fault in Our Stars',124872350,2014),
('tt0844471',N'Cloudy with a Chance of Meatballs',124870275,2009),
('tt0458352',N'The Devil Wears Prada',124740460,2006),
('tt0337741',N'Something''s Gotta Give',124728738,2003),
('tt9663764',N'Aquaman and the Lost Kingdom',124481226,2023),
('tt0115685',N'The Birdcage',124399687,1996),
('tt0181865',N'Traffic',124115725,2000),
('tt0101587',N'City Slickers',124033791,1991),
('tt0093105',N'Good Morning, Vietnam',123922370,1987),
('tt1192628',N'Rango',123477607,2011),
('tt0144528',N'Nutty Professor II: The Klumps',123309890,2000),
('tt10954984',N'Nope',123277080,2022),
('tt1979388',N'The Good Dinosaur',123087120,2015),
('tt1583421',N'G.I. Joe: Retaliation',122523060,2013),
('tt0109444',N'Clear and Present Danger',122187717,1994),
('tt0103855',N'The Bodyguard',122046449,1992),
('tt0099810',N'The Hunt for Red October',122012643,1990),
('tt27047903',N'Scream 7',121935967,2026),
('tt0105793',N'Wayne''s World',121697323,1992),
('tt0258463',N'The Bourne Identity',121661683,2002),
('tt6264654',N'Free Guy',121626598,2021),
('tt0829482',N'Superbad',121463226,2007),
('tt0111257',N'Speed',121248145,1994),
('tt0343660',N'50 First Dates',120908074,2004),
('tt6911608',N'Mamma Mia! Here We Go Again',120634935,2018),
('tt0120762',N'Mulan',120620254,1998),
('tt0361748',N'Inglourious Basterds',120540719,2009),
('tt0329575',N'Seabiscuit',120277854,2003),
('tt0338526',N'Van Helsing',120177084,2004),
('tt0369436',N'Four Christmases',120146040,2008),
('tt0762107',N'I Now Pronounce You Chuck & Larry',120059556,2007),
('tt0110475',N'The Mask',119938730,1994),
('tt1985966',N'Cloudy with a Chance of Meatballs 2',119793567,2013),
('tt0102057',N'Hook',119654823,1991),
('tt0071230',N'Blazing Saddles',119616663,1974),
('tt0358273',N'Walk the Line',119519402,2005),
('tt0436339',N'G-Force',119436770,2009),
('tt0100802',N'Total Recall',119412921,1990),
('tt0096874',N'Back to the Future Part II',119361197,1989),
('tt0082846',N'On Golden Pond',119285432,1981),
('tt1386588',N'The Other Guys',119219978,2010),
('tt0361596',N'Fahrenheit 9/11',119194771,2004),
('tt0427327',N'Hairspray',118946291,2007),
('tt0164184',N'The Sum of All Fears',118907036,2002),
('tt0452594',N'The Break-Up',118703275,2006),
('tt8589698',N'Teenage Mutant Ninja Turtles: Mutant Mayhem',118700272,2023),
('tt0339291',N'A Series of Unfortunate Events',118634549,2004),
('tt0445934',N'Blades of Glory',118594548,2007),
('tt0944835',N'Salt',118311368,2010),
('tt10298810',N'Lightyear',118307188,2022),
('tt0103772',N'Basic Instinct',117727224,1992),
('tt1670345',N'Now You See Me',117723989,2013),
('tt1950186',N'Ford v Ferrari',117624357,2019),
('tt0208003',N'Big Momma''s House',117559438,2000),
('tt0099423',N'Die Hard 2',117540947,1990),
('tt1499658',N'Horrible Bosses',117538559,2011),
('tt5814060',N'The Nun',117481222,2018),
('tt0075148',N'Rocky',117235147,1976),
('tt1116184',N'Jackass 3D',117229692,2010),
('tt0496806',N'Ocean''s Thirteen',117154724,2007),
('tt0870154',N'Jungle Cruise',116987516,2021),
('tt0257076',N'S.W.A.T.',116934650,2003),
('tt0993846',N'The Wolf of Wall Street',116900694,2013),
('tt0327597',N'Coraline',116896576,2009),
('tt0298203',N'8 Mile',116750901,2002),
('tt0150377',N'Double Jeopardy',116741558,1999),
('tt15047880',N'Disclosure Day',116636645,2026),
('tt1327773',N'The Butler',116632095,2013),
('tt1133985',N'Green Lantern',116601172,2011),
('tt0125439',N'Notting Hill',116089678,1999),
('tt0072308',N'The Towering Inferno',116000000,1974),
('tt0128853',N'You''ve Got Mail',115821495,1998),
('tt0259324',N'Ghost Rider',115802596,2007),
('tt0210945',N'Remember the Titans',115719751,2000),
('tt6343314',N'Creed II',115715889,2018),
('tt0073629',N'The Rocky Horror Picture Show',115670886,1975),
('tt1136608',N'District 9',115646235,2009),
('tt1809398',N'Unbroken',115637895,2014),
('tt5117670',N'Peter Rabbit',115253424,2018),
('tt0094737',N'Big',115227281,1988),
('tt3564472',N'Girls Trip',115171585,2017),
('tt0091326',N'The Karate Kid Part II',115103979,1986),
('tt0069704',N'American Graffiti',115000000,1973),
('tt3861390',N'Dumbo',114766307,2019),
('tt4465564',N'Fifty Shades Darker',114581250,2017),
('tt0364725',N'Dodgeball: A True Underdog Story',114326736,2004),
('tt0368447',N'The Village',114197520,2004),
('tt0397892',N'Bolt',114053579,2008),
('tt4777008',N'Maleficent: Mistress of Evil',113929605,2019),
('tt0120891',N'Wild Wild West',113804681,1999),
('tt1915581',N'Magic Mike',113781613,2012),
('tt2692250',N'Night at the Museum: Secret of the Tomb',113746621,2014),
('tt0101272',N'The Addams Family',113502426,1991),
('tt21235248',N'Ghostbusters: Frozen Empire',113376590,2024),
('tt0187393',N'The Patriot',113330342,2000),
('tt4651520',N'Bad Moms',113257297,2016),
('tt1194173',N'The Bourne Legacy',113203870,2012),
('tt0395699',N'The Pacifier',113086868,2005),
('tt0240462',N'Dr. Dolittle 2',112952899,2001),
('tt1230414',N'It''s Complicated',112735375,2009),
('tt0227538',N'Spy Kids',112719001,2001),
('tt0097428',N'Ghostbusters II',112494738,1989),
('tt0119094',N'Face/Off',112276146,1997),
('tt1951261',N'The Hangover Part III',112200072,2013),
('tt0096320',N'Twins',111938388,1988),
('tt0338459',N'Spy Kids 3: Game Over',111761982,2003),
('tt0059113',N'Doctor Zhivago',111721910,1965),
('tt0120660',N'Enemy of the State',111549836,1998),
('tt0097757',N'The Little Mermaid',111543479,1989),
('tt0864835',N'Mr. Peabody & Sherman',111506430,2014),
('tt11152168',N'IF',111375918,2024),
('tt0084522',N'Porky''s',111289673,1982),
('tt0325710',N'The Last Samurai',111127263,2003),
('tt6823368',N'Glass',111048468,2019),
('tt3079380',N'Spy',110825712,2015),
('tt0817230',N'Valentine''s Day',110528528,2010),
('tt0942385',N'Tropic Thunder',110515313,2008),
('tt3741700',N'Godzilla: King of the Monsters',110500138,2019),
('tt0391198',N'The Grudge',110359362,2004),
('tt0369441',N'Fun with Dick and Jane',110332737,2005),
('tt0322330',N'Freaky Friday',110230332,2003),
('tt3152624',N'Trainwreck',110225700,2015),
('tt0960731',N'Bedtime Stories',110101975,2008),
('tt0306047',N'Scary Movie 3',110003217,2003),
('tt3076658',N'Creed',109778883,2015),
('tt0092007',N'Star Trek IV: The Voyage Home',109713132,1986),
('tt0405422',N'The 40-Year-Old Virgin',109484237,2005),
('tt0092493',N'Crocodile Dundee II',109306210,1988),
('tt1078940',N'Couples Retreat',109204945,2009),
('tt0073486',N'One Flew Over the Cuckoo''s Nest',108981275,1975),
('tt1160419',N'Dune',108897830,2021),
('tt0117913',N'A Time to Kill',108766007,1996),
('tt0265086',N'Black Hawk Down',108638745,2001),
('tt0086425',N'Terms of Endearment',108423489,1983),
('tt17663992',N'Scream VI',108391107,2023),
('tt0112281',N'Ace Ventura: When Nature Calls',108385533,1995),
('tt32093575',N'Scary Movie',108277762,2026),
('tt1987680',N'The Upside',108252517,2019),
('tt0247638',N'The Princess Diaries',108248956,2001),
('tt0081573',N'Superman II',108185706,1981),
('tt0439572',N'The Flash',108133313,2023),
('tt3281548',N'Little Women',108101214,2019),
('tt1411704',N'Hop',108085305,2011),
('tt0110912',N'Pulp Fiction',107928762,1994),
('tt1179904',N'Paranormal Activity',107918810,2009),
('tt3890160',N'Baby Driver',107825862,2017),
('tt0947798',N'Black Swan',107770258,2010),
('tt0104694',N'A League of Their Own',107533928,1992),
('tt0848537',N'Epic',107518682,2013),
('tt0409459',N'Watchmen',107509799,2009),
('tt1985949',N'The Angry Birds Movie',107509366,2016),
('tt0118688',N'Batman & Robin',107353792,1997),
('tt1535109',N'Captain Phillips',107100855,2013),
('tt0120630',N'Chicken Run',107071709,2000),
('tt0122933',N'Analyze This',106885658,1999),
('tt0212346',N'Miss Congeniality',106807667,2000),
('tt0107211',N'Indecent Proposal',106614059,1993),
('tt0097239',N'Driving Miss Daisy',106593296,1989),
('tt1253863',N'300: Rise of an Empire',106580051,2014),
('tt0066011',N'Love Story',106550690,1970),
('tt0113189',N'GoldenEye',106429941,1995),
('tt0079417',N'Kramer vs. Kramer',106260000,1979),
('tt0317740',N'The Italian Job',106128601,2003),
('tt3513498',N'The Lego Movie 2: The Second Part',105956290,2019),
('tt15474916',N'Smile',105935048,2022),
('tt0251127',N'How to Lose a Guy in 10 Days',105813373,2003),
('tt0116313',N'The First Wives Club',105489203,1996),
('tt13320622',N'The Lost City',105344029,2022),
('tt18412256',N'Alien: Romulus',105313091,2024),
('tt0955308',N'Robin Hood',105269730,2010),
('tt0110148',N'Interview with the Vampire: The Vampire Chronicles',105264608,1994),
('tt0119190',N'George of the Jungle',105263257,1997),
('tt5503686',N'Hustlers',104963598,2019),
('tt0061722',N'The Graduate',104945305,1967),
('tt4765284',N'Pitch Perfect 3',104897530,2017),
('tt0117333',N'Phenomenon',104636382,1996),
('tt0328828',N'American Wedding',104565114,2003);
go
insert into movie(movieid,moviename,gross,year) values
('tt0257044',N'Road to Perdition',104454762,2002),
('tt0780521',N'The Princess and the Frog',104400899,2009),
('tt0980970',N'The Chronicles of Narnia: The Voyage of the Dawn Treader',104386950,2010),
('tt0317303',N'Daddy Day Care',104297061,2003),
('tt5657846',N'Daddy''s Home 2',104029443,2017),
('tt1778304',N'Paranormal Activity 3',104028807,2011),
('tt1397514',N'Journey 2: The Mysterious Island',103887748,2012),
('tt7959026',N'The Mule',103804407,2018),
('tt0099422',N'Dick Tracy',103738726,1990),
('tt0080319',N'9 to 5',103559773,1980),
('tt1446192',N'Rise of the Guardians',103412758,2012),
('tt12593682',N'Bullet Train',103368602,2022),
('tt0443489',N'Dreamgirls',103365956,2006),
('tt27613895',N'GOAT',103316898,2026),
('tt14362112',N'Trolls Band Together',103270155,2023),
('tt1628841',N'Independence Day: Resurgence',103144286,2016),
('tt1320253',N'The Expendables',103068524,2010),
('tt0117571',N'Scream',103046663,1996),
('tt1564367',N'Just Go with It',103028109,2011),
('tt3402236',N'Murder on the Orient Express',102826543,2017),
('tt0144214',N'The General''s Daughter',102705852,1999),
('tt0112642',N'Casper',102677077,1995),
('tt0338751',N'The Aviator',102610330,2004),
('tt0163651',N'American Pie',102561004,1999),
('tt0287978',N'Daredevil',102543518,2003),
('tt3065204',N'The Conjuring 2',102516140,2016),
('tt1568346',N'The Girl with the Dragon Tattoo',102515793,2011),
('tt0859163',N'The Mummy: Tomb of the Dragon Emperor',102491776,2008),
('tt1790864',N'The Maze Runner',102427862,2014),
('tt0107206',N'In the Line of Fire',102314823,1993),
('tt0064115',N'Butch Cassidy and the Sundance Kid',102308889,1969),
('tt0058331',N'Mary Poppins',102272727,1964),
('tt0034492',N'Bambi',102247150,1942),
('tt5140878',N'Annabelle: Creation',102092201,2017),
('tt3766354',N'The Equalizer 2',102084362,2018),
('tt3063516',N'Jackass Presents: Bad Grandpa',102003019,2013),
('tt0114369',N'Seven',101871174,1995),
('tt1663662',N'Pacific Rim',101802906,2013),
('tt0373051',N'Journey to the Center of the Earth',101704370,2008),
('tt0187078',N'Gone in 60 Seconds',101648571,2000),
('tt0110478',N'Maverick',101631272,1994),
('tt0102945',N'Sleeping with the Enemy',101599005,1991),
('tt0455944',N'The Equalizer',101530738,2014),
('tt1245492',N'This Is the End',101470202,2013),
('tt1059786',N'Eagle Eye',101440743,2008),
('tt0120794',N'The Prince of Egypt',101413188,1998),
('tt0120082',N'Scream 2',101363301,1997),
('tt0081562',N'Stir Crazy',101300000,1980),
('tt0116213',N'Eraser',101295562,1996),
('tt1959490',N'Noah',101200044,2014),
('tt0105695',N'Unforgiven',101167799,1992),
('tt0312528',N'The Cat in the Hat',101149285,2003),
('tt0118880',N'Con Air',101117573,1997),
('tt0162661',N'Sleepy Hollow',101071502,1999),
('tt2231461',N'Rampage',101028233,2018),
('tt0369339',N'Collateral',101005703,2004),
('tt0118884',N'Contact',100920329,1997),
('tt5034838',N'Godzilla vs. Kong',100916094,2021),
('tt0305357',N'Charlie''s Angels: Full Throttle',100830111,2003),
('tt0107798',N'The Pelican Brief',100768056,1993),
('tt1620981',N'The Addams Family',100723831,2019),
('tt0259711',N'Vanilla Sky',100618344,2001),
('tt2543164',N'Arrival',100546139,2016),
('tt1231583',N'Due Date',100539043,2010),
('tt0113497',N'Jumanji',100499940,1995),
('tt0134067',N'The Rugrats Movie',100494675,1998),
('tt0405159',N'Million Dollar Baby',100492203,2004),
('tt0065377',N'Airport',100489151,1970),
('tt1620680',N'A Wrinkle in Time',100478608,2018),
('tt0838283',N'Step Brothers',100468793,2008),
('tt0413099',N'Evan Almighty',100462298,2007),
('tt4477536',N'Fifty Shades Freed',100407760,2018),
('tt0138097',N'Shakespeare in Love',100317794,1998),
('tt1284575',N'Bad Teacher',100292856,2011),
('tt1302067',N'Yogi Bear',100246011,2010),
('tt0409847',N'Cowboys & Aliens',100240551,2011),
('tt4649466',N'Kingsman: The Golden Circle',100234838,2017),
('tt1631867',N'Edge of Tomorrow',100206256,2014),
('tt0116583',N'The Hunchback of Notre Dame',100138851,1996),
('tt0098067',N'Parenthood',100047830,1989),
('tt0960144',N'You Don''t Mess with the Zohan',100018837,2008),
('tt1355644',N'Passengers',100014699,2016),
('tt0112864',N'Die Hard with a Vengeance',100012499,1995),
('tt0377981',N'Gnomeo & Juliet',99967670,2011),
('tt4575576',N'Christopher Robin',99215042,2018),
('tt0119282',N'Hercules',99112101,1997),
('tt2302755',N'Olympus Has Fallen',98925640,2013),
('tt0990407',N'The Green Hornet',98780042,2011),
('tt1279935',N'Date Night',98711404,2010),
('tt0088939',N'The Color Purple',98467863,1985),
('tt10954718',N'Dog Man',97970355,2025),
('tt0396555',N'Meet the Robinsons',97822171,2007),
('tt1068680',N'Yes Man',97690976,2008),
('tt1700841',N'Sausage Party',97685686,2016),
('tt8115900',N'The Bad Guys',97459240,2022),
('tt0141369',N'Inspector Gadget',97403112,1999),
('tt1152836',N'Public Enemies',97104620,2009),
('tt0107688',N'The Nightmare Before Christmas',97026701,1993),
('tt14948432',N'Red One',97000759,2024),
('tt8521778',N'Bob Marley: One Love',96981216,2024),
('tt1285016',N'The Social Network',96962694,2010),
('tt0108052',N'Schindler''s List',96898818,1993),
('tt6398184',N'Downton Abbey',96853865,2019),
('tt0250494',N'Legally Blonde',96673082,2001),
('tt0230600',N'The Others',96578502,2001),
('tt0258000',N'Panic Room',96397334,2002),
('tt2066051',N'Rocketman',96368160,2019),
('tt2953050',N'Encanto',96093622,2021),
('tt0078788',N'Apocalypse Now',96074376,1979),
('tt32916440',N'Marty Supreme',96034978,2025),
('tt0097165',N'Dead Poets Society',95860116,1989),
('tt4123432',N'Fantastic Beasts: The Secrets of Dumbledore',95850844,2022),
('tt1790885',N'Zero Dark Thirty',95720716,2012),
('tt0477051',N'Norbit',95673607,2007),
('tt0159365',N'Cold Mountain',95636509,2003),
('tt5040012',N'Nosferatu',95608235,2024),
('tt0082031',N'Arthur',95461682,1981),
('tt1261945',N'Sex and the City 2',95347692,2010),
('tt0117038',N'Michael',95318203,1996),
('tt0368933',N'The Princess Diaries 2: Royal Engagement',95170481,2004),
('tt8760708',N'M3GAN',95159005,2023),
('tt0453562',N'42',95059709,2013),
('tt0217869',N'Unbreakable',95011339,2000),
('tt1037705',N'The Book of Eli',94835059,2010),
('tt0443649',N'10,000 BC',94784201,2008),
('tt1014775',N'Beverly Hills Chihuahua',94514402,2008),
('tt0076666',N'Saturday Night Fever',94213184,1977),
('tt31956415',N'Freakier Friday',94186236,2025),
('tt1135503',N'Julie & Julia',94125426,2009),
('tt0120746',N'The Mask of Zorro',94095523,1998),
('tt0252076',N'Maid in Manhattan',94011225,2002),
('tt1001508',N'He''s Just Not That Into You',93953653,2009),
('tt0311113',N'Master and Commander: The Far Side of the World',93927920,2003),
('tt1907668',N'Flight',93772375,2012),
('tt8912936',N'DC League of Super-Pets',93657117,2022),
('tt0964517',N'The Fighter',93617009,2010),
('tt0265029',N'America''s Sweethearts',93607673,2001),
('tt0048280',N'Lady and the Tramp',93602326,1955),
('tt2906216',N'Dungeons & Dragons: Honor Among Thieves',93549650,2023),
('tt0825232',N'The Bucket List',93466502,2007),
('tt1964418',N'Tomorrowland',93436322,2015),
('tt2404435',N'The Magnificent Seven',93432655,2016),
('tt0239395',N'Cats & Dogs',93385515,2001),
('tt0290296',N'Space Station 3D',93383953,2002),
('tt0313737',N'Two Weeks Notice',93354851,2002),
('tt0289765',N'Red Dragon',93149898,2002),
('tt0042332',N'Cinderella',93141149,1950),
('tt0098635',N'When Harry Met Sally...',93117425,1989),
('tt1535108',N'Elysium',93050117,2013),
('tt0119137',N'Flubber',92977226,1997),
('tt0085549',N'Flashdance',92921203,1983),
('tt1684562',N'The Fall Guy',92900355,2024),
('tt17024450',N'The Equalizer 3',92373751,2023),
('tt0840361',N'The Town',92186262,2010),
('tt2024469',N'Non-Stop',92168600,2014),
('tt0109446',N'The Client',92115211,1994),
('tt1856101',N'Blade Runner 2049',92071675,2017),
('tt4425200',N'John Wick: Chapter 2',92029184,2017),
('tt0117731',N'Star Trek: First Contact',92027888,1996),
('tt10665338',N'Halloween Kills',92002155,2021),
('tt5779228',N'The Garfield Movie',91956547,2024),
('tt1621045',N'Think Like a Man',91547205,2012),
('tt0099938',N'Kindergarten Cop',91457688,1990),
('tt1929263',N'Heaven Is for Real',91443253,2014),
('tt0171363',N'The Haunting',91411151,1999),
('tt0112740',N'Crimson Tide',91387195,1995),
('tt0090685',N'Back to School',91258000,1986),
('tt2869728',N'Ride Along 2',91221830,2016),
('tt0120686',N'Stepmom',91137662,1998),
('tt2084970',N'The Imitation Game',91125683,2014),
('tt31227572',N'Predator: Badlands',91083631,2025),
('tt0087538',N'The Karate Kid',91077276,1984),
('tt0206275',N'Save the Last Dance',91057006,2001),
('tt0277296',N'The Scorpion King',91047077,2002),
('tt0473075',N'Prince of Persia: The Sands of Time',90759676,2010),
('tt0120587',N'Antz',90757863,1998),
('tt0362120',N'Scary Movie 4',90710620,2006),
('tt0492956',N'The Game Plan',90648202,2007),
('tt0117705',N'Space Jam',90594962,1996),
('tt0183505',N'Me, Myself & Irene',90570999,2000),
('tt0962726',N'High School Musical 3: Senior Year',90559416,2008),
('tt1142800',N'Madea Goes to Jail',90508336,2009),
('tt0186566',N'Space Cowboys',90464773,2000),
('tt2561572',N'Get Hard',90411453,2015),
('tt0086465',N'Trading Places',90404800,1983),
('tt1245526',N'RED',90380162,2010),
('tt1691917',N'Planes',90288712,2013),
('tt9411972',N'Where the Crawdads Sing',90230760,2022),
('tt0333780',N'Legally Blonde 2: Red, White & Blonde',90186328,2003),
('tt0327056',N'Mystic River',90135191,2003),
('tt7144666',N'The Black Phone',90123230,2022),
('tt1340138',N'Terminator Genisys',89760956,2015),
('tt0408790',N'Flightplan',89707299,2005),
('tt0120917',N'The Emperor''s New Groove',89636687,2000),
('tt0101862',N'Father of the Bride',89325780,1991),
('tt1210819',N'The Lone Ranger',89302115,2013),
('tt2446042',N'Taken 3',89256424,2015),
('tt4160708',N'Don''t Breathe',89217875,2016),
('tt0134084',N'Scream 3',89143175,2000),
('tt1483013',N'Oblivion',89107235,2013);
go
select * from movie
order by gross desc
select * from creditType
order by creditTypeid
select * from [character]
order by characterid
select * from person
order by personid
select credit_movie,credit_person,credit_type
	,ISNULL(CONVERT(varchar, credit_character), '') AS credit_character
from credit
order by creditid
select moviename,personname,credittypename,charactername
from credit
join person on credit_person=personid
join creditType on credit_type=creditTypeid
join movie on credit_movie=movieid
left join [character] on credit_character=characterid
order by creditid


select credit_movie,credit_person,credit_type
	,credit_character
from credit
where credit_character is not null
order by creditid



use lr2026fall2
select * from act
where actlink like 'dbs%'
order by actid

insert into act(actname,actlink) values('Movie Database Relationships','dbs/movies.cfm') -- 357

select * from ans
join q on ans_q=qid
where q_act=336
declare @actid int=357
declare @qid int
insert into q(q_act,qname) values(@actid,'movie')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'movieid')
insert into ans(ans_q,ansname) values(@qid,'moviename')
insert into ans(ans_q,ansname) values(@qid,'gross')
insert into ans(ans_q,ansname) values(@qid,'year')
insert into q(q_act,qname) values(@actid,'person')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'personid')
insert into ans(ans_q,ansname) values(@qid,'personname')
insert into q(q_act,qname) values(@actid,'creditType')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'creditTypeid')
insert into ans(ans_q,ansname) values(@qid,'creditTypename')
insert into q(q_act,qname) values(@actid,'character')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'characterid')
insert into ans(ans_q,ansname) values(@qid,'charactername')
insert into q(q_act,qname) values(@actid,'credit')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'creditid')
insert into ans(ans_q,ansname) values(@qid,'credit_movie')
insert into ans(ans_q,ansname) values(@qid,'credit_person')
insert into ans(ans_q,ansname) values(@qid,'credit_type')
insert into ans(ans_q,ansname) values(@qid,'credit_character')
