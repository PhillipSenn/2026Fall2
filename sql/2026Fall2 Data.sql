/*
Prerequisite: Satisfactory completion of LRU 050 or LRU 060 
This course provides literacy in computers and information systems. 
Concepts covered include:
	the Internet, 
	software (both system and application), 
	hardware, 
	networking, 
	security and 
	privacy, and 
	databases. 
The goal of the course is to relate computer concepts to the students’ daily life. 
In addition, students will learn how to use Microsoft Excel and Access. 
The course is delivered through lecture and laboratory work, or as an online offering. 
Three credits. (Offered: Fall, Spring, Summer) 
This is a HYBRID class. 
It will meet TR 8:00 - 9:15 AM and the remainder of the work will be completed asynchronously online.
*/
use lr2026Fall2
truncate table usr

insert into usr(usrname,email,id,isAdmin) values('Senn, Professor','sennp@lr.edu','19C76747-5CF9-449C-9A52-FEF8906AD52E',1)
insert into usr(usrname,email,id) values('F327FB4F-D2C5-498E-8C8F-93B3DFB62C5F','Mcnulty, Saoirse Rose','Saoirse.Mcnulty@my.lr.edu','F327FB4F-D2C5-498E-8C8F-93B3DFB62C5F')
insert into usr(usrname,email,id) values('F2AE71B9-C271-46BD-AFC6-BE72AE2A7EC2','O''Sullivan, Allyson F','Allyson.OSullivan@my.lr.edu','F2AE71B9-C271-46BD-AFC6-BE72AE2A7EC2')
insert into usr(usrname,email,id) values('8C12D623-1255-4FC0-9655-963A2BD7CC7F','Ramsey, Nathaniel','Nathaniel.Ramsey@my.lr.edu','8C12D623-1255-4FC0-9655-963A2BD7CC7F')
insert into usr(usrname,email,id) values('8F620C23-ACEE-4A36-8E73-4553775ED0F4','Rodatz, Kaydence Emery','Kaydence.Rodatz@my.lr.edu','8F620C23-ACEE-4A36-8E73-4553775ED0F4')
insert into usr(usrname,email,id) values('D2F47675-4362-4413-B151-26F49FEBA593','Rose, Miles','Miles.Rose@my.lr.edu','D2F47675-4362-4413-B151-26F49FEBA593')
insert into usr(usrname,email,id) values('AC4B03B9-80AE-4723-943E-7C53D2EC5968','Taylor, Zane M','Zane.Taylor@my.lr.edu','AC4B03B9-80AE-4723-943E-7C53D2EC5968')


update usr
set firstname = left(trim(substring(usrname,charindex(',',usrname)+1,100))
	,charindex(' ',trim(substring(usrname,charindex(',',usrname)+1,100))+' ')-1)
where usrname like '%,%'
insert into usr(usrname,email,firstname,id) values('Computer','PhillipSenn@gmail.com','Computer','237DB729-5FCE-4569-A914-CDDB5D2E8422')
select * from usr


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
