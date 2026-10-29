create table geoguessr
(geoguessrid int identity primary key
,geoguessr_usr int
,locationname nvarchar(max)
,lat decimal(10,7)
,lng decimal(10,7)
,heading decimal(7,4)
,pitch decimal(6,3)
,zoom decimal(5,2)
,panoid varchar(255)
)
go
--create schema geoguessr authorization dbo
create or alter proc geoguessr.insert_location -- All the puzzles
(@id uniqueidentifier
,@locationname nvarchar(max)
,@lat decimal(10,7)
,@lng decimal(10,7)
,@heading decimal(7,4)
,@pitch decimal(6,3)
,@zoom decimal(5,2)
,@panoid varchar(255)
) as
declare @usrid int=(select usrid from usr where id=@id)
insert into geoguessr(geoguessr_usr,locationname,lat,lng,heading,pitch,zoom,panoid)
values(@usrid,@locationname,@lat,@lng,@heading,@pitch,@zoom,@panoid)
go
select * from geoguessr
go
create or alter proc geoguessr.where_geoguessr -- The 1 puzzle you are trying to solve
(@geoguessrid int
) as
select *
from geoguessr
where geoguessrid=@geoguessrid
go
create table guessr
(guessrid int identity primary key
,guessr_usr int
,guessr_geo int
,guessr_lat decimal(10,7)
,guessr_lng decimal(10,7)
,guessrdate datetime2(0) default getdate()
)
go
create or alter proc geoguessr.list
(@id uniqueidentifier
) as
declare @usrid int=(select usrid from usr where id=@id)
select geoguessrid,locationname
	,usrid,firstname -- The usr that created the puzzle
	,guessr_geo -- Whether you have tried to solve it already
from geoguessr
join usr on geoguessr_usr=usrid
left join (
	select guessr_geo
	from guessr
	where guessr_usr=@usrid
) guessr
on guessr_geo = geoguessrid
order by geoguessrid
go

--create schema guessr authorization dbo
create or alter proc guessr.merge_geo -- This is what they guessed
(@id uniqueidentifier
,@geoguessrid int
,@lat decimal(10,7)
,@lng decimal(10,7)
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @guessrid int=(select guessrid from guessr where guessr_usr=@usrid and guessr_geo=@geoguessrid)
if @guessrid is null begin
	insert into guessr(guessr_usr,guessr_geo,guessr_lat,guessr_lng)
	values(@usrid,@geoguessrid,@lat,@lng)
	select @guessrid=scope_identity()
end
update guessr set
 guessrdate=getdate()
where guessrid=@guessrid
go
create or alter proc guessr.where_geo -- results
(@geoguessrid int
) as
select guessr_lat,guessr_lng,guessrdate
	,firstname
from guessr
join usr on guessr_usr=usrid
where guessr_geo=@geoguessrid
order by guessrdate
go
select * from guessr

