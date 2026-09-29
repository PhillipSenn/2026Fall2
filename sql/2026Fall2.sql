use lr2026Fall2
/*
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
*/
--create schema usr authorization dbo
create proc usr.where_id
(@id uniqueidentifier
) as
select * from usr
where id=@id
go
--create schema act authorization dbo
create or alter proc act.where_usr
(@id uniqueidentifier
) as
declare @usrid int=(select usrid from usr where id=@id)
select actid,actname,actlink
	,grpname
	,catname
	,earned
from act
left join grp on act_grp=grpid
left join cat on act_cat=catid
left join(
	select grade_act,earned
	from grade
	where grade_usr=@usrid
) grade
on grade_act=actid
where actsort is null
or actsort <> 0
order by actsort,actid
go
create or alter proc act.where_act
(@actid int
) as
select actname
	,act_cat as catid
from act
where actid=@actid
go
--create schema grade authorization dbo
create or alter proc grade.where_act
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select earned
from act
left join grade on grade_usr=@usrid and grade_act=@actid
where actid=@actid
go
--create schema ans authorization dbo
create or alter proc ans.where_act
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select ansid,ansname,qname
	,guess_ans
from ans
join q on ans_q=qid
outer apply (
	select guess_ans
	from guess
	join grade on guess_grade=gradeid
	where grade_usr=@usrid
	and guess_ans=ansid
) guess
where q_act=@actid
order by qname
go
--create schema guess authorization dbo
create or alter proc guess.merge_ans
(@id uniqueidentifier
,@ansid int
,@redo int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @qid int=(select ans_q from ans where ansid=@ansid)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end
if @redo = 1 begin
	delete from guess where guessid in(
		select guessid
		from guess
		join grade on guess_grade=gradeid
		join ans on guess_ans=ansid
		where grade_usr=@usrid
		and ans_q=@qid
	)
end
declare @guessid int=(
	select guessid 
	from guess 
	join grade on guess_grade=gradeid 
	where grade_usr=@usrid
	and guess_ans=@ansid
)
if @guessid is null begin
	insert into guess(guess_grade,guess_ans) values(@gradeid,@ansid)
end
declare @possible int=(select count(*) from q where q_act=@actid)
declare @answered int=(
	select count(distinct ans_q) 
	from guess 
	join ans on guess_ans=ansid
	where guess_grade=@gradeid
	and correct=1 -- This grades only correct answers
)
update grade set
 earned=ceiling(100.0 * @answered / @possible)
where gradeid=@gradeid
select earned
from grade
where gradeid=@gradeid
go












create or alter proc q.where_act
(@actid int
) as
select qid,qname,qdesc,qhref
--	,ansnames
from q
--left join (
--	select ans_q
--		,string_agg(ansname,'|') as ansnames
--	from ans
--	where correct=1
--	group by ans_q
--) ans on ans.ans_q=q.qid
where q_act=@actid
order by qsort,qid
go

create or alter proc q.usr_act
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select qid,qname,qdesc,qhref
	,correct_ansnames
	,incorrect_ansnames
	,pollStart,pollEnd
from q
left join (
	select ans_q as correct_q
		,string_agg(ansname,'|') as correct_ansnames
	from ans
	where correct=1
	group by ans_q
) correct on correct_q=q.qid

left join (
	select ans_q as incorrect_q
		,string_agg(ansname,'|') as incorrect_ansnames
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	where grade_usr=@usrid and isnull(correct,0)=0
	group by ans_q
) incorrect on incorrect_q=q.qid

left join(
	select poll_q,pollStart,pollEnd
	from poll
	join grade on poll_grade=gradeid
	where grade_usr=@usrid
) poll
on poll_q=qid
where q_act=@actid
order by qsort,qid
go

create or alter proc latlng.where_act
(@actid int
) as
select * from latlng
where latlng_act=@actid
go
create or alter proc poll.unanswered
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select qid,qname
	,qdesc,qhref -- Key Terms
from q
left join(
	select poll_q
	from poll
	join grade on poll_grade=gradeid
	where grade_usr=@usrid
	and pollEnd is not null -- They've answered it
) poll
on poll_q = qid
where q_act=@actid
and poll_q is null
order by qsort,qid
go
-- We don't really need to do poll.start_q
-- It just shows how long they thought before answering.
create or alter proc poll.start_q
(@id uniqueidentifier
,@qid int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end

declare @pollid int=(
	select pollid 
	from poll 
	join grade on poll_grade=gradeid
	where poll_grade=@gradeid
	and poll_q=@qid
)
if @pollid is null begin
	insert into poll(poll_grade,poll_q) values(@gradeid,@qid)
	select @pollid=scope_identity()
end
update poll set -- If they revisit, it will reset pollStart
 pollStart=getdate()
where pollid=@pollid
select pollid=@pollid
go
create or alter proc poll.update_poll -- Doesn't affect grade.earned
(@id uniqueidentifier
,@pollid int
) as
declare @usrid int=(select usrid from usr where id=@id)
update poll set
 pollEnd=getdate()
where pollid in(
	select pollid
	from poll
	join grade on poll_grade=gradeid
	where grade_usr=@usrid
	and pollid=@pollid
)
go
create or alter proc poll.merge_q
(@id uniqueidentifier
,@qid int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end

declare @pollid int=(
	select pollid 
	from poll 
	join grade on poll_grade=gradeid
	where poll_grade=@gradeid
	and poll_q=@qid
)
if @pollid is null begin
	insert into poll(poll_grade,poll_q) values(@gradeid,@qid)
	select @pollid=scope_identity()
end
update poll set
 pollEnd=getdate()
where pollid=@pollid

declare @possible int=(select count(*) from q where q_act=@actid)
declare @answered int=(
	select count(*) 
	from poll 
	where poll_grade=@gradeid
	and pollEnd is not null
)
update grade set
 earned=ceiling(100.0 * @answered / @possible)
where gradeid=@gradeid
select earned
from grade
where gradeid=@gradeid
go
create or alter proc ans.where_q
(@qid int
) as
select ansid,ansname,ansdesc
	,isnull(correct,0) as correct -- Test/bank.cfm
from ans
where ans_q=@qid
order by ansid
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

create or alter proc q.keyTerms
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select qid,qname,qdesc
	,qhref -- Key Terms setup
from q
join(
	select ans_q as group_q
		,count(*) as answers
	from ans
	group by ans_q
) group_ans
on group_q = qid
left join (
	select ans_q
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	where grade_usr=@usrid
) guess
on ans_q=qid
where q_act=@actid
and ans_q is null
and answers > 1
order by qid
go
create or alter proc q.where_ans_gt_1
(@actid int
) as
select qid,qname,qdesc,qhref
from q
join (
	select ans_q 
		,count(*) as answers
	from ans
	group by ans_q
) ans
on ans_q=qid
where q_act=@actid
and answers > 1
order by qid
go

create or alter proc guess.merge_keyterm -- possible = questions with > 1 available answers
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
declare @possible int=(
	select count(*) 
	from q 
	join (
		select ans_q 
			,count(*) as answers
		from ans
		group by ans_q
	) ans
	on ans_q=qid
	where q_act=@actid
	and answers > 1
)
declare @answered int=(select count(*) from guess where guess_grade=@gradeid)
update grade set
 earned=round(100.0 * @answered / @possible,0)
where gradeid=@gradeid
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
create or alter proc poll.unanswered_keyTerms
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @actname nvarchar(max)=(select actname from act where actid=@actid)
select qid,qname
	,qdesc
	,q2_href as qhref
	,ansdesc
from q
left join( -- This is the image that they chose
	select qname as ans_qname
		,ansdesc
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	join q on ans_q=qid
	join act on q_act=actid
	join cat on act_cat=catid
	where grade_usr=@usrid
	and actname = @actname
	and catname='Key Terms setup'
) ans
on ans_qname=qname
join (
	select qname as q2_qname
		,qhref as q2_href
	from q
	join act on q_act=actid
	join cat on act_cat=catid
	where actname = @actname
	and catname='Key Terms setup'
) q2
on q2_qname = qname
left join(
	select poll_q
	from poll
	join grade on poll_grade=gradeid
	where grade_usr=@usrid
	and pollEnd is not null -- They've answered it
) poll
on poll_q = qid
where q_act=@actid
and poll_q is null
order by newid()
go


create or alter proc q.unanswered
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)

;with questions as (
	select
		row_number() over(order by qsort,qid) as rowNumber
		,qid,qname,qdesc,qhref
	from q
	where q_act=@actid
)
select
	rowNumber
	,qid,qname,qdesc,qhref
from questions
left join (
	select ans_q
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	where grade_usr=@usrid
) guess
on ans_q=qid
where ans_q is null
order by rowNumber
go
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


create or alter proc guess.merge_ans_name
(@id uniqueidentifier
,@ansid int
,@guessname nvarchar(max)
) as
declare @usrid int=(select usrid from usr where id=@id)
declare @qid int=(select ans_q from ans where ansid=@ansid)
declare @actid int=(select q_act from q where qid=@qid)

declare @gradeid int=(select gradeid from grade where grade_usr=@usrid and grade_act=@actid)
if @gradeid is null begin
	insert into grade(grade_usr,grade_act) values(@usrid,@actid)
	select @gradeid=scope_identity()
end

declare @guessid int=(
	select DISTINCT guessid -- Because the join to the ans table produces multiple rows
	from guess
	join ans on guess_ans=@ansid
	where guess_grade=@gradeid
	and ans_q=@qid
)
if @guessid is null begin
	insert into guess(guess_grade,guess_ans) values(@gradeid,@ansid)
	select @guessid=scope_identity()
end
update guess set 
 guess_ans=@ansid 
,guessname=@guessname
where guessid=@guessid
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




exec guess.merge_ans '19C76747-5CF9-449C-9A52-FEF8906AD52E',52,'test2'
exec guess.merge_ans '21E468EC-A70C-46F5-BB9F-5B5A21F7F32F',52,'John Doe'
exec guess.merge_ans '21E468EC-A70C-46F5-BB9F-5B5A21F7F32F',61,'John Doe'
select * from usr
select * from ans
select * from guess
select * from grade

create or alter proc guess.where_act
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select qid,qname
	,ansname
	,(select count(*)
		from guess
		join ans on guess_ans=ansid
		where ans_q=qid
	) possible
	,(select count(*)
		from guess
		where guess_ans = (
			select DISTINCT guess_ans
			from guess
			join grade on guess_grade=gradeid
			join ans on guess_ans=ansid
			where grade_usr=@usrid
			and ans_q = qid
		)
	) score
from q
left join (
	select ans_q,ansname
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	where grade_usr=@usrid
) guess
on ans_q=qid
where q_act=@actid
order by qid
go
create or alter proc guess.where_q
(@id uniqueidentifier
,@qid int
) as
declare @usrid int=(select usrid from usr where id=@id)
select guess_ans,guessname
from guess
join grade on guess_grade=gradeid
join ans on guess_ans=ansid
where grade_usr=@usrid
and ans_q=@qid
go
--exec guess.where_q '19C76747-5CF9-449C-9A52-FEF8906AD52E',24759
create or alter proc q.where_q
(@qid int
) as
declare @actid int=(select q_act from q where qid=@qid)
select qid -- Test/bank.cfm
	,qname,qdesc
	,qhref -- Test/bank.cfm
	,rowNumber
from (
	select qid
		,qname
		,qdesc
		,qhref
		,row_number() over(order by qsort,qid) as rowNumber
	from q
	where q_act=@actid
) x
where qid=@qid
go
create or alter proc q.update_desc
(@qid int
,@qdesc varchar(max) 
) as
update q set
 qdesc=@qdesc
where qid=@qid
go
--create schema cat authorization dbo
create or alter proc cat.where_cat
(@catid int
) as
select catname
from cat
where catid=@catid
go
create or alter proc poll.gt_q
(@actid int
,@old_qid int
) as
declare @qid int
if @old_qid=0 begin
	select top 1 qid,qname,qdesc
	from q
	where q_act=@actid
	order by qsort,qid
end else begin
	select top 1 qid,qname,qdesc
	from q
	where q_act=@actid
	and qid > @old_qid
	order by qsort,qid
end
go
create or alter proc usr.update_firstname
(@id uniqueidentifier
,@firstname nvarchar(max)
) as
update usr set
 firstname=@firstname
where id=@id
select * from usr
where id=@id
go
create or alter proc usr.update_SpeechSynthesisUtterance
(@id uniqueidentifier
,@SpeechSynthesisUtterance int
,@SpeechRate decimal(9,2)
,@SpeechPitch decimal(9,2)
,@SpeechVolume decimal(9,2)
,@voiceName nvarchar(200)
) as
update usr set
 SpeechSynthesisUtterance=@SpeechSynthesisUtterance
,SpeechRate=@SpeechRate
,SpeechPitch=@SpeechPitch
,SpeechVolume=@SpeechVolume
,voiceName=@voiceName
where id=@id
select * from usr
where id=@id
go
create or alter proc act.rightWrong
(@id uniqueidentifier
,@actid int
) as
declare @usrid int=(select usrid from usr where id=@id)

select
	sum(case
		when correct_count > 0
		and wrong_count = 0
		then 1
		else 0
	end) as count_right
	,sum(case
		when wrong_count > 0
		then 1
		else 0
	end) as count_wrong
from (
	select qid
		,sum(case when correct=1 then 1 else 0 end) as correct_count
		,sum(case when isnull(correct,0)=0 then 1 else 0 end) as wrong_count
	from guess
	join grade on guess_grade=gradeid
	join ans on guess_ans=ansid
	join q on ans_q=qid
	where grade_usr=@usrid
	and q_act=@actid
	group by qid
) x
go
exec act.rightWrong '19C76747-5CF9-449C-9A52-FEF8906AD52E',224
go
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
