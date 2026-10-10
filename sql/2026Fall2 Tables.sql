drop table if exists LR2026Fall2..usr
go
create table usr
(usrid int identity primary key nonclustered
,id uniqueidentifier default newid()
,email varchar(255)
,usrname nvarchar(max)
,firstname nvarchar(max)
,codePoint varchar(50) default '1F6E7'
,SpeechSynthesisUtterance int default 1
,SpeechRate   decimal(9,1) default 0.9 -- .1 to 10
,SpeechPitch  decimal(9,1) default 1
,SpeechVolume decimal(9,1) default 1
,voiceName nvarchar(200)
,isAdmin int default 0
,wordname varchar(20)
)
go
alter table usr add wordname varchar(20)
alter table usr
add constraint id
default newid() for id

alter table usr add constraint SpeechSynthesisUtterance default 1 for SpeechSynthesisUtterance
alter table usr add constraint SpeechRate default .9 for SpeechRate
alter table usr add constraint SpeechPitch default 1 for SpeechPitch
alter table usr add constraint SpeechVolume default 1 for SpeechVolume
alter table usr add constraint isAdmin default 0 for isAdmin
alter table usr add constraint x default x for x
alter table usr add constraint x default x for x
alter table usr add SpeechSynthesisUtterance int default 1
alter table usr add SpeechRate decimal(9,2) default .9
alter table usr add SpeechPitch decimal(9,2) default 1
alter table usr add SpeechVolume decimal(9,2) default 1
update usr set SpeechRate=.9,SpeechPitch=1,SpeechVolume=1
--alter table usr alter column SpeechRate decimal(9,1)
--alter table usr alter column SpeechPitch decimal(9,1)
--alter table usr alter column SpeechVolume decimal(9,1)
--alter table usr add voiceName nvarchar(200)
--alter table usr add isAdmin int default 0
create table grp
(grpid int identity primary key clustered
,grpname nvarchar(max)
)
go
create table cat
(catid int identity(101,1) primary key
,catname varchar(max)
)
go
create table act
(actid int identity primary key clustered
,act_grp int
,act_cat int
,actname nvarchar(max)
,actdesc nvarchar(max)
,actsort int
,actlink varchar(max)
,isHidden int default 0
)
go
create table q
(qid int identity primary key nonclustered
,q_act int
,q_cat int
,qname nvarchar(max)
,qdesc nvarchar(max)
,qhref varchar(255)
,qsort int
)
go
drop table if exists ans
go
create table ans
(ansid int identity primary key
,ans_q int
,ansname nvarchar(max)
,ansdesc nvarchar(max)
,correct int
)
go
--alter table ans add correct int

drop table if exists grade
create table grade
(gradeid int identity(1000,1) primary key
,grade_usr int
,grade_act int
,earned int default 0 -- max 100
-- ,score int to be determined on an individual basis
)
go
ALTER TABLE grade
ADD CONSTRAINT earned DEFAULT 0 FOR earned
update grade set earned=0 where earned is null
drop table if exists guess
go
create table guess
(guessid int identity primary key
,guess_grade int
,guess_ans int
,guessname nvarchar(max) -- feedback
)
go
drop table if exists poll
go
create table poll
(pollid int identity primary key
,poll_grade int
,poll_q int
,pollStart datetime2(0) default getdate()
,pollEnd datetime2(0)
,pollname nvarchar(max)
) 
go
select * from usr
update usr set SpeechSynthesisUtterance=1
update usr set isadmin=1 where usrid=1

