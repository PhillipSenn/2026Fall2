--use lr2026Fall2
--insert into act(actname,actlink) values('MS-SQL Relationships','MS-SQL/') -- 335
--select * from act
select * from usr
-- https://PhillipSenn.dev/2026Fall2/?id=19C76747-5CF9-449C-9A52-FEF8906AD52E
use LR
create table student
(studentid int identity primary key
,studentname nvarchar(max)
,phone varchar(max)
,phonetypeid int
,curriculumid int
,classLevelid int
)
go
insert into student(studentname)
select firstname from lr2026Fall2..usr
go
create table course
(courseid int identity primary key
,coursename nvarchar(max)
,coursedesc nvarchar(max)
,credits int
)
go
insert into course(coursename,coursedesc,credits) values
 ('ACC231','Accounting Principles',3)
,('ART200','Art Appreciation',3)
,('ART341','History of Art I',3)
,('ART342','History of Art II',3)
,('AST110','Concepts in Astronomy',3)
,('BIO105','Principles of Biology',4)
,('BIO106','Principles of Biology',4)
,('BIO110','Concepts of Biology',3)
,('COM120','Communication Applications',3)
,('CSC115','Perspectives on Technology',1)
,('CSC175','Information Technology',3)
,('EAR110','Physical Geology',3)
,('ECO121','Principles of Macroeconomics',3)
,('ECO122','Principles of Microeconomics',3)
,('EDU219','English Language Learners: Culture and Literacy',1)
,('EDU274','Global Education',3)
,('ENG131','Critical Thinking and Writing',3)
,('ENG231','Writing About Literature',3)
,('HIS248','North Carolina History',3)
,('LRC101','Freshman Seminar',1)
,('MAT115','Elementary Statistics',3)
,('MUS200','Music Appreciation',3)
,('PHI116','Ethics',3)
,('POL120','American Government',3)
,('PSY100','General Psychology',3)
,('REL101','The Hebrew Bible',3)
go
create table enrollment
(enrollmentid int identity primary key
,studentid int
,courseid int
)
go
declare @courseid int=(select courseid from course where coursename='CSC175')
insert into enrollment(studentid,courseid)
select studentid,@courseid
from student
go
create table curriculum
(curriculumid int identity(1000,1000) primary key
,curriculumname nvarchar(max)
,curriculumdesc nvarchar(max)
)
go
insert into curriculum(curriculumname,curriculumdesc) values
 ('Accounting','Bachelor of Arts')
,('Biochemistry','Bachelor of Science')
,('Biology','Bachelor of Science')
,('Business Administration','Bachelor of Science')
,('Chemistry','Bachelor of Science')
,('Communication Studies','Bachelor of Arts')
,('Computer Science','Bachelor of Science')
,('Computer Science - Cybersecurity','Bachelor of Science')
,('Criminal Justice','Bachelor of Arts')
,('Economics','Bachelor of Arts')
,('Elementary and Special Education','Bachelor of Arts')
,('Engineering Physics','Bachelor of Science')
,('Information Technology','Bachelor of Arts')
,('Nursing','Bachelor of Science')
,('Hospitality and Tourism Management','Bachelor of Arts')

insert into curriculum(curriculumname,curriculumdesc) values
 ('Exercise Science','Bachelor of Science')
,('Finance','Bachelor of Arts')
,('History','Bachelor of Arts')

go
create table classLevel
(classLevelid int identity(100,100) primary key
,classLevelname nvarchar(max)
,mincredits int
,maxcredits int
)
go
insert into classlevel(classlevelname,mincredits,maxcredits) values
 ('Freshman',0,29)
,('Sophomore',30,59)
,('Junior',60,89)
,('Senior',90,null)
,('Graduate',null,null)
go
create table term
(termid int identity primary key
,termname nvarchar(max)
)
go
insert into term(termname) values('Fall')
insert into term(termname) values('Spring')
insert into term(termname) values('Fall Mini-term II')
insert into term(termname) values('Spring Mini-term I')
go
create table avail
(availid int identity primary key
,courseid int
,termid int
)
go
declare @courseid int=(select courseid from course where coursename='CSC175')
declare @termid int=(select termid from term where termname='Mini-term II')
insert into avail(courseid,termid) values(@courseid,@termid)
go
create table phonetype
(phonetypeid int identity primary key
,phonetypename nvarchar(max)
)
go
insert into phonetype(phonetypename) values
 ('Home')
,('Cell')
,('Work')
,('Fax')
,('Other')
go
use lr2026Fall2
--insert into act(actname,actlink) values('Database Relationships','dbs/') -- 336
declare @qid int
declare @actid int=336
update act set actname='Database Relationships',actlink='dbs/' where actid=336
insert into q(q_act,qname) values(@actid,'student')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'studentid')
insert into ans(ans_q,ansname) values(@qid,'studentname')
insert into ans(ans_q,ansname) values(@qid,'phone')
insert into ans(ans_q,ansname) values(@qid,'phonetypeid')
insert into ans(ans_q,ansname) values(@qid,'curriculumid')
insert into ans(ans_q,ansname) values(@qid,'classLevelid')
insert into q(q_act,qname) values(@actid,'course')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'courseid')
insert into ans(ans_q,ansname) values(@qid,'coursename')
insert into ans(ans_q,ansname) values(@qid,'coursedesc')
insert into ans(ans_q,ansname) values(@qid,'credits')
insert into q(q_act,qname) values(@actid,'enrollment')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'enrollmentid')
insert into ans(ans_q,ansname) values(@qid,'studentid')
insert into ans(ans_q,ansname) values(@qid,'courseid')
insert into q(q_act,qname) values(@actid,'curriculum')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'curriculumid')
insert into ans(ans_q,ansname) values(@qid,'curriculumname')
insert into ans(ans_q,ansname) values(@qid,'curriculumdesc')
insert into q(q_act,qname) values(@actid,'avail')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'availid')
insert into ans(ans_q,ansname) values(@qid,'courseid')
insert into ans(ans_q,ansname) values(@qid,'termid')
insert into q(q_act,qname) values(@actid,'phonetype')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'phonetypeid')
insert into ans(ans_q,ansname) values(@qid,'phonetypename')
insert into q(q_act,qname) values(@actid,'term')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'termid')
insert into ans(ans_q,ansname) values(@qid,'termname')
insert into q(q_act,qname) values(@actid,'classLevel')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'classLevelid')
insert into ans(ans_q,ansname) values(@qid,'classLevelname')
insert into ans(ans_q,ansname) values(@qid,'minCredits')
insert into ans(ans_q,ansname) values(@qid,'maxCredits')
select * from q where q_act=336
select * from curriculum
declare @classLevelid int=(select classLevelid from classLevel where classLevelname='Freshman')
update student set classLevelid=@classLevelid
go
declare @classLevelid int=(select classLevelid from classLevel where classLevelname='Sophomore')
update student set classLevelid=@classLevelid where studentname='Kaydence'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='Exercise Science')
update student set curriculumid=@curriculumid where studentname='Saoirse'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='Communication Studies')
update student set curriculumid=@curriculumid where studentname='Allyson'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='History')
update student set curriculumid=@curriculumid where studentname='Nathaniel'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='Biology')
update student set curriculumid=@curriculumid where studentname='Kaydence'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='Accounting')
update student set curriculumid=@curriculumid where studentname='Miles'
go
declare @curriculumid int=(select curriculumid from curriculum where curriculumname='Criminal Justice')
update student set curriculumid=@curriculumid where studentname='Zane'
go
select * from student
join classLevel on student.classLevelid=classLevel.classLevelid
update student set phonetypeid=2
select * from classLevel
select * from course
select * from enrollment
select * from curriculum
select * from avail
select * from phonetype
select * from term
