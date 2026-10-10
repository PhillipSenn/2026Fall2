create or alter proc latlng.where_act
(@actid int
) as
select * from latlng
where latlng_act=@actid
go
create or alter proc grade.update_act
(@actid int
) as
-- Each majority vote gets x points
declare @questions int

select @questions = count(*)
from q
join (
	select ans_q
		,count(*) as answers
	from ans
	group by ans_q
) ans
on ans.ans_q = q.qid
where q_act = @actid
and answers > 1

;with answerVotes as(
	select
		ans.ans_q,
		guess.guess_ans,
		count(*) as votes
	from guess
	join grade on grade.gradeid = guess.guess_grade
	join ans on ans.ansid = guess.guess_ans
	where grade.grade_act = @actid
	group by
		ans.ans_q,
		guess.guess_ans
)
,rankedAnswers as(
	select
		ans_q,
		guess_ans,
		rank() over
		(
			partition by ans_q
			order by votes desc
		) as voteRank
	from answerVotes
)
,winningAnswers as(
	select
		ans_q,
		max(guess_ans) as guess_ans
	from rankedAnswers
	where voteRank = 1
	group by ans_q
	having count(*) = 1
)
,scores as(
	select
		grade.gradeid,
		ceiling(count(winningAnswers.guess_ans) * (100.0 / @questions)) as earned
	from grade
	left join guess on guess.guess_grade = grade.gradeid
	left join winningAnswers on winningAnswers.guess_ans = guess.guess_ans
	where grade.grade_act = @actid
	group by grade.gradeid
)
update grade set
 earned = scores.earned
from grade
join scores
on scores.gradeid = grade.gradeid
where grade_act=@actid
go



--create or alter proc poll.unanswered_keyTerm
--(@id uniqueidentifier
--,@actid int -- Key Terms
--) as
--declare @usrid int=(select usrid from usr where id=@id)
--declare @actname nvarchar(max)=(select actname from act where actid=@actid)
--declare @qid int=(
--	select top 1 qid
--	from q
--	left join(
--		select poll_q
--		from poll
--		join grade on poll_grade=gradeid
--		where grade_usr=@usrid
--		and pollEnd is not null -- They've answered it
--	) poll
--	on poll_q = qid
--	where q_act=@actid
--	and poll_q is null
--	order by newid()
--)
--declare @qname nvarchar(max)=(select qname from q where qid=@qid)
--declare @catid int=(select catid from cat where catname = 'Key Terms Setup')
--declare @setupQ int=(
--	select qid 
--	from q
--	join act on q_act=actid
--	where q_cat=@catid
--	and qname = @qname
--	and actname = @actname
--)
--select qid,qname,qdesc,qhref
--	,ansname,ansdesc
--from q
--left join(
--	select ans_q,ansname,ansdesc
--	from ans 
--	join(
--		select guess_ans,count(*) as votes
--		from guess
--		join ans on guess_ans=ansid
--		group by guess_ans
--	) guess
--	on guess_ans=ansid
--) ans
--on ans_q=qid
--where qid=@qid
--go


--create schema guess authorization dbo
create or alter proc guess.change_ans
(@id uniqueidentifier
,@ansid int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @qid int=(select ans_q from ans where ansid=@ansid)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end

delete from guess where guessid in(
	select guessid
	from guess
	join ans on guess_ans=@ansid
	where guess_grade=@gradeid
	and ans_q=@qid
)
insert into guess(guess_grade,guess_ans) values(@gradeid,@ansid)
declare @possible int=(select count(*) from q where q_act=@actid)
declare @answered int=(
	select count(distinct ans_q) 
	from guess 
	join ans on guess_ans=ansid
	where guess_grade=@gradeid
)
update grade set
 earned=ceiling(100.0 * @answered / @possible)
where gradeid=@gradeid
go


/*
declare @id uniqueidentifier='19C76747-5CF9-449C-9A52-FEF8906AD52E'
declare @ansid int=3638
exec guess.merge_ans_name @id,@ansid,'x'
*/
/*
declare @id uniqueidentifier='19C76747-5CF9-449C-9A52-FEF8906AD52E'
declare @actid int=179
exec guess.where_act @id,@actid
*/

--exec guess.where_q '19C76747-5CF9-449C-9A52-FEF8906AD52E',24759
declare @id uniqueidentifier = '19C76747-5CF9-449C-9A52-FEF8906AD52E'
declare @actid int=242
declare @usrid int=(select usrid from usr where id=@id)
select *
from guess 
join grade on guess_grade=gradeid
join ans on guess_ans=ansid
where grade_usr=@usrid
and grade_act=@actid
and correct=1


--drop proc poll.where_q
--(@id uniqueidentifier
--,@qid int
--) as
--declare @usrid int=(select usrid from usr where id=@id)
--select pollname
--from poll
--join grade on poll_grade=gradeid
--where grade_usr=@usrid
--and poll_q=@qid
--go
select * from usr

select * from act
order by actid desc
select * from usr

--create schema poll authorization dbo
select * from usr
select * from ans
select * from act
select * from cat
select * from q
where q_act=179
select * from poll
/*
truncate table guess
truncate table grade
*/


select * from cat

select * from usr
select * from ans 
order by ansid desc
select * from poll
join q on poll_q=qid
order by pollid desc
select * from cat


select * from grade
select * from guess 
join ans on guess_ans=ansid
order by guessid desc
