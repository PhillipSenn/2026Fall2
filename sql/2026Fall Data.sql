use lr2026Fall
insert into usr(id,usrname,firstname,email) values('19C76747-5CF9-449C-9A52-FEF8906AD52E',N'Professor Senn',N'Professor','sennp@lr.edu')
insert into usr(id,usrname,firstname,email) values('21E468EC-A70C-46F5-BB9F-5B5A21F7F32F',N'Phillip Senn',N'Phillip','PhillipSenn@gmail.com')
insert into usr(usrname,email,firstname) values('Nguyen, Tommy David','Tommy.Nguyen@my.lr.edu','Tommy')
insert into usr(usrname,email,firstname) values('Ramsey, Nathaniel','Nathaniel.Ramsey@my.lr.edu','Nathaniel')
insert into usr(usrname,email,firstname) values('Rose, Miles','Miles.Rose@my.lr.edu','Rose')
insert into usr(usrname,email,firstname) values('Taylor, Zane M','Zane.Taylor@my.lr.edu','Zane')
--select newid()
go

select * from act
order by actid

select * from lr2025Fall..act

set identity_insert q on
insert into q(qid,q_act,q_cat,qname,qdesc,qsort)
select qid,q_act,q_cat,qname,qdesc,qsort from lr2025fall..q where q_act=178
order by qid
set identity_insert q on

set identity_insert act on
insert into act(actid,actname,actlink) values(178,'Airports','Google/Maps/8.cfm')
set identity_insert act off

select * from LR2025Fall..ans
where ans_q in(
	select qid from q
)
drop table latlng
go
create table latlng
(latlng_act int
,latlngname nvarchar(max)
,latlngdesc nvarchar(max)
,lat decimal(9,5)
,lng decimal(9,5)
,countryName nvarchar(max)
,countryCode varchar(max) -- ISO
)
go
insert into latlng(latlng_act,latlngname,latlngdesc,lat,lng,countryName,countryCode)
select 178,qname,qdesc,ansname,ansdesc,catname,catdesc
from LR2025Fall..ans
join lr2025fall..q on ans_q=qid
join lr2025Fall..cat on q_cat=catid
where q_act=178
order by qid
GO
create or alter proc usr.codePoint
(@id uniqueidentifier
,@codePoint varchar(50)
) as
update usr set
 codePoint=@codePoint
where id=@id
go
insert into grp(grpname) values('Getting to Know Microsoft Office Versions')
insert into grp(grpname) values('Using SAM Projects and Textbook Projects')
insert into grp(grpname) values('Getting Started')
insert into grp(grpname) values('Technology for Success')
insert into grp(grpname) values('Windows')
insert into grp(grpname) values('Teams')
insert into grp(grpname) values('Word')
insert into grp(grpname) values('Excel')
insert into grp(grpname) values('PowerPoint')
insert into grp(grpname) values('Access')
insert into grp(grpname) values('Outlook')
insert into grp(grpname) values('Embracing Change')
insert into grp(grpname) values('Career Readiness')
insert into grp(grpname) values('MacOS Instructions and Projects')





insert into cat(catname) values('Review Questions')
declare @catid int=101
insert into act(act_cat,actname) values(@catid,'Technology For Success')
go



select * from usr
update usr usrname='',firstname='' where usrid=2

select * from ans

/*
truncate table grade
truncate table poll
truncate table guess
*/
