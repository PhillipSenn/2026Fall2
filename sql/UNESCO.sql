USE UNESCO
create table iso2
(iso2id char(2)
,iso2name nvarchar(max)
)
go

insert into iso2(iso2id,iso2name) values
 ('AD',N'Andorra')
,('AE',N'United Arab Emirates')
,('AF',N'Afghanistan')
,('AG',N'Antigua and Barbuda')
,('AI',N'Anguilla')
,('AL',N'Albania')
,('AM',N'Armenia')
,('AO',N'Angola')
,('AQ',N'Antarctica')
,('AR',N'Argentina')
,('AS',N'American Samoa')
,('AT',N'Austria')
,('AU',N'Australia')
,('AW',N'Aruba')
,('AX',N'Åland Islands')
,('AZ',N'Azerbaijan')
,('BA',N'Bosnia and Herzegovina')
,('BB',N'Barbados')
,('BD',N'Bangladesh')
,('BE',N'Belgium')
,('BF',N'Burkina Faso')
,('BG',N'Bulgaria')
,('BH',N'Bahrain')
,('BI',N'Burundi')
,('BJ',N'Benin')
,('BL',N'Saint Barthélemy')
,('BM',N'Bermuda')
,('BN',N'Brunei Darussalam')
,('BO',N'Bolivia')
,('BQ',N'Bonaire, Sint Eustatius and Saba')
,('BR',N'Brazil')
,('BS',N'Bahamas')
,('BT',N'Bhutan')
,('BV',N'Bouvet Island')
,('BW',N'Botswana')
,('BY',N'Belarus')
,('BZ',N'Belize')
,('CA',N'Canada')
,('CC',N'Cocos (Keeling) Islands')
,('CD',N'Congo, The Democratic Republic of the')
,('CF',N'Central African Republic')
,('CG',N'Congo')
,('CH',N'Switzerland')
,('CI',N'Côte d''Ivoire')
,('CK',N'Cook Islands')
,('CL',N'Chile')
,('CM',N'Cameroon')
,('CN',N'China')
,('CO',N'Colombia')
,('CR',N'Costa Rica')
,('CU',N'Cuba')
,('CV',N'Cabo Verde')
,('CW',N'Curaçao')
,('CX',N'Christmas Island')
,('CY',N'Cyprus')
,('CZ',N'Czechia')
,('DE',N'Germany')
,('DJ',N'Djibouti')
,('DK',N'Denmark')
,('DM',N'Dominica')
,('DO',N'Dominican Republic')
,('DZ',N'Algeria')
,('EC',N'Ecuador')
,('EE',N'Estonia')
,('EG',N'Egypt')
,('EH',N'Western Sahara')
,('ER',N'Eritrea')
,('ES',N'Spain')
,('ET',N'Ethiopia')
,('FI',N'Finland')
,('FJ',N'Fiji')
,('FK',N'Falkland Islands (Malvinas)')
,('FM',N'Micronesia, Federated States of')
,('FO',N'Faroe Islands')
,('FR',N'France')
,('GA',N'Gabon')
,('GB',N'United Kingdom')
,('GD',N'Grenada')
,('GE',N'Georgia')
,('GF',N'French Guiana')
,('GG',N'Guernsey')
,('GH',N'Ghana')
,('GI',N'Gibraltar')
,('GL',N'Greenland')
,('GM',N'Gambia')
,('GN',N'Guinea')
,('GP',N'Guadeloupe')
,('GQ',N'Equatorial Guinea')
,('GR',N'Greece')
,('GS',N'South Georgia and the South Sandwich Islands')
,('GT',N'Guatemala')
,('GU',N'Guam')
,('GW',N'Guinea-Bissau')
,('GY',N'Guyana')
,('HK',N'Hong Kong')
,('HM',N'Heard Island and McDonald Islands')
,('HN',N'Honduras')
,('HR',N'Croatia')
,('HT',N'Haiti')
,('HU',N'Hungary')
,('ID',N'Indonesia')
,('IE',N'Ireland')
,('IL',N'Israel')
,('IM',N'Isle of Man')
,('IN',N'India')
,('IO',N'British Indian Ocean Territory')
,('IQ',N'Iraq')
,('IR',N'Iran')
,('IS',N'Iceland')
,('IT',N'Italy')
,('JE',N'Jersey')
,('JM',N'Jamaica')
,('JO',N'Jordan')
,('JP',N'Japan')
,('KE',N'Kenya')
,('KG',N'Kyrgyzstan')
,('KH',N'Cambodia')
,('KI',N'Kiribati')
,('KM',N'Comoros')
,('KN',N'Saint Kitts and Nevis')
,('KP',N'North Korea')
,('KR',N'South Korea')
,('KW',N'Kuwait')
,('KY',N'Cayman Islands')
,('KZ',N'Kazakhstan')
,('LA',N'Laos')
,('LB',N'Lebanon')
,('LC',N'Saint Lucia')
,('LI',N'Liechtenstein')
,('LK',N'Sri Lanka')
,('LR',N'Liberia')
,('LS',N'Lesotho')
,('LT',N'Lithuania')
,('LU',N'Luxembourg')
,('LV',N'Latvia')
,('LY',N'Libya')
,('MA',N'Morocco')
,('MC',N'Monaco')
,('MD',N'Moldova')
,('ME',N'Montenegro')
,('MF',N'Saint Martin (French part)')
,('MG',N'Madagascar')
,('MH',N'Marshall Islands')
,('MK',N'North Macedonia')
,('ML',N'Mali')
,('MM',N'Myanmar')
,('MN',N'Mongolia')
,('MO',N'Macao')
,('MP',N'Northern Mariana Islands')
,('MQ',N'Martinique')
,('MR',N'Mauritania')
,('MS',N'Montserrat')
,('MT',N'Malta')
,('MU',N'Mauritius')
,('MV',N'Maldives')
,('MW',N'Malawi')
,('MX',N'Mexico')
,('MY',N'Malaysia')
,('MZ',N'Mozambique')
,('NA',N'Namibia')
,('NC',N'New Caledonia')
,('NE',N'Niger')
,('NF',N'Norfolk Island')
,('NG',N'Nigeria')
,('NI',N'Nicaragua')
,('NL',N'Netherlands')
,('NO',N'Norway')
,('NP',N'Nepal')
,('NR',N'Nauru')
,('NU',N'Niue')
,('NZ',N'New Zealand')
,('OM',N'Oman')
,('PA',N'Panama')
,('PE',N'Peru')
,('PF',N'French Polynesia')
,('PG',N'Papua New Guinea')
,('PH',N'Philippines')
,('PK',N'Pakistan')
,('PL',N'Poland')
,('PM',N'Saint Pierre and Miquelon')
,('PN',N'Pitcairn')
,('PR',N'Puerto Rico')
,('PS',N'Palestine, State of')
,('PT',N'Portugal')
,('PW',N'Palau')
,('PY',N'Paraguay')
,('QA',N'Qatar')
,('RE',N'Réunion')
,('RO',N'Romania')
,('RS',N'Serbia')
,('RU',N'Russian Federation')
,('RW',N'Rwanda')
,('SA',N'Saudi Arabia')
,('SB',N'Solomon Islands')
,('SC',N'Seychelles')
,('SD',N'Sudan')
,('SE',N'Sweden')
,('SG',N'Singapore')
,('SH',N'Saint Helena, Ascension and Tristan da Cunha')
,('SI',N'Slovenia')
,('SJ',N'Svalbard and Jan Mayen')
,('SK',N'Slovakia')
,('SL',N'Sierra Leone')
,('SM',N'San Marino')
,('SN',N'Senegal')
,('SO',N'Somalia')
,('SR',N'Suriname')
,('SS',N'South Sudan')
,('ST',N'Sao Tome and Principe')
,('SV',N'El Salvador')
,('SX',N'Sint Maarten (Dutch part)')
,('SY',N'Syria')
,('SZ',N'Eswatini')
,('TC',N'Turks and Caicos Islands')
,('TD',N'Chad')
,('TF',N'French Southern Territories')
,('TG',N'Togo')
,('TH',N'Thailand')
,('TJ',N'Tajikistan')
,('TK',N'Tokelau')
,('TL',N'Timor-Leste')
,('TM',N'Turkmenistan')
,('TN',N'Tunisia')
,('TO',N'Tonga')
,('TR',N'Türkiye')
,('TT',N'Trinidad and Tobago')
,('TV',N'Tuvalu')
,('TW',N'Taiwan')
,('TZ',N'Tanzania')
,('UA',N'Ukraine')
,('UG',N'Uganda')
,('UM',N'United States Minor Outlying Islands')
,('US',N'United States')
,('UY',N'Uruguay')
,('UZ',N'Uzbekistan')
,('VA',N'Holy See (Vatican City State)')
,('VC',N'Saint Vincent and the Grenadines')
,('VE',N'Venezuela')
,('VG',N'Virgin Islands, British')
,('VI',N'Virgin Islands, U.S.')
,('VN',N'Vietnam')
,('VU',N'Vanuatu')
,('WF',N'Wallis and Futuna')
,('WS',N'Samoa')
,('YE',N'Yemen')
,('YT',N'Mayotte')
,('ZA',N'South Africa')
,('ZM',N'Zambia')
,('ZW',N'Zimbabwe');
go
create table region
(regionid int identity primary key clustered
,regionname nvarchar(max)
)
go
insert into region(regionname) values
(N'Africa'),
(N'Arab States'),
(N'Asia and the Pacific'),
(N'Europe and North America'),
(N'Latin America and the Caribbean');
go
create table regions
(regions_row int
,regions_region int
)
go
create table category
(categoryid int identity primary key clustered
,categoryname nvarchar(max)
)
go
insert into category(categoryname) values
(N'Cultural'),
(N'Natural'),
(N'Mixed');

create table states
(states_row int
,states_country int
)
go
create table country
(countryid int identity primary key clustered
,countryname nvarchar(max)
)
go

insert into country(countryname) values
(N'Afghanistan'),
(N'Albania'),
(N'Algeria'),
(N'Andorra'),
(N'Angola'),
(N'Antigua and Barbuda'),
(N'Argentina'),
(N'Armenia'),
(N'Australia'),
(N'Austria'),
(N'Azerbaijan'),
(N'Bahrain'),
(N'Bangladesh'),
(N'Barbados'),
(N'Belarus'),
(N'Belgium'),
(N'Belize'),
(N'Benin'),
(N'Bolivia (Plurinational State of)'),
(N'Bosnia and Herzegovina'),
(N'Botswana'),
(N'Brazil'),
(N'Bulgaria'),
(N'Burkina Faso'),
(N'Cabo Verde'),
(N'Cambodia'),
(N'Cameroon'),
(N'Canada'),
(N'Central African Republic'),
(N'Chad'),
(N'Chile'),
(N'China'),
(N'Colombia'),
(N'Comoros'),
(N'Congo'),
(N'Costa Rica'),
(N'Croatia'),
(N'Cuba'),
(N'Cyprus'),
(N'Czechia'),
(N'Côte d''Ivoire'),
(N'Democratic People''s Republic of Korea'),
(N'Democratic Republic of the Congo'),
(N'Denmark'),
(N'Dominica'),
(N'Dominican Republic'),
(N'Ecuador'),
(N'Egypt'),
(N'El Salvador'),
(N'Eritrea'),
(N'Estonia'),
(N'Ethiopia'),
(N'Fiji'),
(N'Finland'),
(N'France'),
(N'Gabon'),
(N'Gambia'),
(N'Georgia'),
(N'Germany'),
(N'Ghana'),
(N'Greece'),
(N'Guatemala'),
(N'Guinea'),
(N'Guinea-Bissau'),
(N'Haiti'),
(N'Holy See'),
(N'Honduras'),
(N'Hungary'),
(N'Iceland'),
(N'India'),
(N'Indonesia'),
(N'Iran (Islamic Republic of)'),
(N'Iraq'),
(N'Ireland'),
(N'Israel'),
(N'Italy'),
(N'Jamaica'),
(N'Japan'),
(N'Jerusalem (Site proposed by Jordan)'),
(N'Jordan'),
(N'Kazakhstan'),
(N'Kenya'),
(N'Kiribati'),
(N'Kyrgyzstan'),
(N'Lao People''s Democratic Republic'),
(N'Latvia'),
(N'Lebanon'),
(N'Lesotho'),
(N'Libya'),
(N'Lithuania'),
(N'Luxembourg'),
(N'Madagascar'),
(N'Malawi'),
(N'Malaysia'),
(N'Mali'),
(N'Malta'),
(N'Marshall Islands'),
(N'Mauritania'),
(N'Mauritius'),
(N'Mexico'),
(N'Micronesia (Federated States of)'),
(N'Mongolia'),
(N'Montenegro'),
(N'Morocco'),
(N'Mozambique'),
(N'Myanmar'),
(N'Namibia'),
(N'Nepal'),
(N'Netherlands (Kingdom of the)'),
(N'New Zealand'),
(N'Nicaragua'),
(N'Niger'),
(N'Nigeria'),
(N'North Macedonia'),
(N'Norway'),
(N'Oman'),
(N'Pakistan'),
(N'Palau'),
(N'Panama'),
(N'Papua New Guinea'),
(N'Paraguay'),
(N'Peru'),
(N'Philippines'),
(N'Poland'),
(N'Portugal'),
(N'Qatar'),
(N'Republic of Korea'),
(N'Republic of Moldova'),
(N'Romania'),
(N'Russian Federation'),
(N'Rwanda'),
(N'Saint Kitts and Nevis'),
(N'Saint Lucia'),
(N'San Marino'),
(N'Sao Tome and Principe'),
(N'Saudi Arabia'),
(N'Senegal'),
(N'Serbia'),
(N'Seychelles'),
(N'Sierra Leone'),
(N'Singapore'),
(N'Slovakia'),
(N'Slovenia'),
(N'Solomon Islands'),
(N'South Africa'),
(N'South Sudan'),
(N'Spain'),
(N'Sri Lanka'),
(N'State of Palestine'),
(N'Sudan'),
(N'Suriname'),
(N'Sweden'),
(N'Switzerland'),
(N'Syrian Arab Republic'),
(N'Tajikistan'),
(N'Thailand'),
(N'Togo'),
(N'Tunisia'),
(N'Turkmenistan'),
(N'Türkiye'),
(N'Uganda'),
(N'Ukraine'),
(N'United Arab Emirates'),
(N'United Kingdom of Great Britain and Northern Ireland'),
(N'United Republic of Tanzania'),
(N'United States of America'),
(N'Uruguay'),
(N'Uzbekistan'),
(N'Vanuatu'),
(N'Venezuela (Bolivarian Republic of)'),
(N'Viet Nam'),
(N'Yemen'),
(N'Zambia'),
(N'Zimbabwe');

go
drop table [row]
go
create table [row]
(rowid int -- id_number 
,image_url varchar(255)
,row_category int
,danger bit
,date_inscribed smallint
,extension bit
,short_description nvarchar(max)
,sitename nvarchar(max)
,transnational bit
)
go
select * from row
where short_description like '%vast and isolated linear cluste%'

--create schema row authorization dbo
create or alter proc row.rnd as
select top 1 rowid,image_url,danger,date_inscribed,extension,short_description,sitename,transnational
	,categoryname
from row
left join category on row_category=categoryid
--where rowid=772
order by newid()
go
EXEC row.rnd

create table iso -- iso_codes csv
(iso_row int
,iso2 char(2)
)
go
select * from poi
--drop table poi

create table poi
(poiid int primary key clustered
,poi_row int
,lat decimal(13,10) -- 10.7749785403
,lng decimal(13,10)
,iso2 char(2)
)
go
create table ug -- The user's guess: UGH!
(ugid int identity primary key clustered
,ug_usr int
,ug_row int
,ug_lat decimal(13,10)
,ug_lng decimal(13,10)
,ugdate datetime2(0) 
)
go
--create schema ug authorization dbo
--create schema poi authorization dbo
create or alter proc poi.where_row
(@rowid int
) as
select lat,lng,iso2
	,iso2name
from poi
left join iso2 on iso2=iso2id
where poi_row=@rowid
go
create or alter proc ug.merge_row
(@id uniqueidentifier
,@rowid int
,@lat decimal(13,10)
,@lng decimal(13,10)
) as
declare @usrid int=(select usrid from lr2026fall2..usr where id=@id)
declare @ugid int=(select ugid from ug where ug_usr=@usrid and ug_row=@rowid)
if @ugid is null begin
	insert into ug(ug_usr,ug_row) values(@usrid,@rowid)
	select @ugid = scope_identity()
end
update ug set
 ug_lat=@lat
,ug_lng=@lng
,ugdate=getdate()
where ugid=@ugid
select codePoint,firstname,ug_lat,ug_lng,ugdate
from ug
join lr2026fall2..usr on ug_usr=usrid
where ug_row=@rowid
order by ugdate
go

select * from PhillipSenn.UNESCO.dbo.iso2
select * from PhillipSenn.UNESCO.dbo.region
insert into PhillipSenn.UNESCO.dbo.regions(regions_row,regions_region)
select regions_row,regions_region
from regions -- row, region

select * from PhillipSenn.UNESCO.dbo.category
select * from PhillipSenn.UNESCO.dbo.country
insert into PhillipSenn.UNESCO.dbo.states(states_row,states_country)
select states_row,states_country
from states -- row, country

insert into PhillipSenn.UNESCO.dbo.iso(iso_row,iso2)
select iso_row,iso2 from iso -- row,iso2

insert into PhillipSenn.UNESCO.dbo.poi(poiid,poi_row,lat,lng,iso2)
select poiid,poi_row,lat,lng,iso2 
from poi
order by poiid

insert into PhillipSenn.UNESCO.dbo.row(rowid,image_url,row_category,danger,date_inscribed,extension,short_description,sitename,transnational)
select rowid,image_url,row_category,danger,date_inscribed,extension,short_description,sitename,transnational
from row
order by rowid

where transnational <> 0


