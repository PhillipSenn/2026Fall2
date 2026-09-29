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
)
go
--alter table usr add SpeechSynthesisUtterance int default 1
--alter table usr add SpeechRate decimal(9,2) default .9
--alter table usr add SpeechPitch decimal(9,2) default 1
--alter table usr add SpeechVolume decimal(9,2) default 1
--update usr set SpeechRate=.9,SpeechPitch=1,SpeechVolume=1
--alter table usr alter column SpeechRate decimal(9,1)
--alter table usr alter column SpeechPitch decimal(9,1)
--alter table usr alter column SpeechVolume decimal(9,1)
--alter table usr add voiceName nvarchar(200)

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
,actsort int
,actlink varchar(max)
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
,earned int -- max 100
-- ,score int to be determined on an individual basis
)
go
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
) 
go
select * from usr
update usr set SpeechSynthesisUtterance=1
