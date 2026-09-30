select * from PhillipSenn.lr2026Fall2.INFORMATION_SCHEMA.tables
order by table_name
select * from act
truncate table PhillipSenn.lr2026Fall2.dbo.act
truncate table PhillipSenn.lr2026Fall2.dbo.ans
truncate table PhillipSenn.lr2026Fall2.dbo.cat
--truncate table PhillipSenn.lr2026Fall2.dbo.grade
truncate table PhillipSenn.lr2026Fall2.dbo.grp
--truncate table PhillipSenn.lr2026Fall2.dbo.guess
--truncate table PhillipSenn.lr2026Fall2.dbo.poll
truncate table PhillipSenn.lr2026Fall2.dbo.q


select grpname,catname,act.* from act
left join grp on act_grp=grpid
left join cat on act_cat=catid
select * from ans
select * from cat
select * from grade
select * from grp
select * from guess
select * from poll
select actname,catname,q.* from q
left join act on q_act=actid
left join cat on q_cat=catid
where actid is null


set identity_insert PhillipSenn.lr2026Fall2.dbo.act on
insert into PhillipSenn.lr2026Fall2.dbo.act(actid,actname,actlink,act_grp,act_cat,actsort)
select actid,actname,actlink,act_grp,act_cat,actsort from act
set identity_insert PhillipSenn.lr2026Fall2.dbo.act off

set identity_insert PhillipSenn.lr2026Fall2.dbo.ans on
insert into PhillipSenn.lr2026Fall2.dbo.ans(ansid,ans_q,ansname,ansdesc,correct)
select ansid,ans_q,ansname,ansdesc,correct from ans
join q on ans_q=qid
join act on q_act=actid
set identity_insert PhillipSenn.lr2026Fall2.dbo.ans off

set identity_insert PhillipSenn.lr2026Fall2.dbo.cat on
insert into PhillipSenn.lr2026Fall2.dbo.cat(catid,catname)
select catid,catname from cat
set identity_insert PhillipSenn.lr2026Fall2.dbo.cat off

--set identity_insert PhillipSenn.lr2026Fall2.dbo.grade on
--insert into PhillipSenn.lr2026Fall2.dbo.grade(gradeid,grade_usr,grade_act,earned)
--select gradeid,grade_usr,grade_act,earned from grade
--set identity_insert PhillipSenn.lr2026Fall2.dbo.grade off

set identity_insert PhillipSenn.lr2026Fall2.dbo.grp on
insert into PhillipSenn.lr2026Fall2.dbo.grp(grpid,grpname)
select grpid,grpname from grp
set identity_insert PhillipSenn.lr2026Fall2.dbo.grp off

--set identity_insert PhillipSenn.lr2026Fall2.dbo.guess on
--insert into PhillipSenn.lr2026Fall2.dbo.guess(guessid,guess_grade,guess_ans,guessname)
--select guessid,guess_grade,guess_ans,guessname from guess
--set identity_insert PhillipSenn.lr2026Fall2.dbo.guess off

--set identity_insert PhillipSenn.lr2026Fall2.dbo.poll on
--insert into PhillipSenn.lr2026Fall2.dbo.poll(pollid,poll_grade,poll_q,pollStart,pollEnd)
--select pollid,poll_grade,poll_q,pollStart,pollEnd from poll
--set identity_insert PhillipSenn.lr2026Fall2.dbo.poll off

set identity_insert PhillipSenn.lr2026Fall2.dbo.q on
insert into PhillipSenn.lr2026Fall2.dbo.q(qid,q_act,q_cat,qname,qdesc,qsort,qhref)
select qid,q_act,q_cat,qname,qdesc,qsort,qhref from q
join act on q_act=actid
set identity_insert PhillipSenn.lr2026Fall2.dbo.q off
