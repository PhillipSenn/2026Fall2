-- Run once: creates crossword.crossword and crossword.merge_q
if not exists (select 1 from sys.schemas where name = N'crossword')
	exec(N'create schema crossword authorization dbo')
go
if object_id(N'crossword.crossword', N'U') is not null
	drop table crossword.crossword
go
create table crossword.crossword
(crosswordid int identity primary key clustered
,crossword_grade int
,crossword_q int
,crossword_row int
,crossword_col int
,crossword_dir int
)
go
create or alter proc crossword.merge_q
(@id uniqueidentifier
,@qid int
,@row int
,@col int
,@dir int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end
declare @crosswordid int=(select crosswordid
from crossword.crossword
where crossword_grade=@gradeid
and crossword_q=@qid
)
if @crosswordid is null begin
	insert into crossword.crossword(crossword_grade,crossword_q,crossword_row,crossword_col,crossword_dir)
	values(@gradeid,@qid,@row,@col,@dir)
	select @crosswordid=scope_identity()
end
else begin
	update crossword.crossword set
		crossword_row=@row
		,crossword_col=@col
		,crossword_dir=@dir
	where crosswordid=@crosswordid
end
declare @cnt int=(select count(*) from crossword.crossword where crossword_grade=@gradeid)
declare @earned int=@cnt*10
update grade set
 earned=@earned
where gradeid=@gradeid
and @earned <= 100
select earned
from grade
where gradeid=@gradeid
go
