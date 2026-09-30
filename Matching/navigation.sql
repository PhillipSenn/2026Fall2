use lr2026Fall2
declare @qid int
insert into act(actname,act_grp,act_cat,actlink) values('Navigation shortcuts',8,109,'Matching/matching.cfm')
declare @actid int=scope_identity()
insert into q(q_act,qname) values(@actid,N'↑ ↓ ← →')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Up, down, left, or right one cell')
insert into q(q_act,qname) values(@actid,'HOME')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'To column A of the current row')
insert into q(q_act,qname) values(@actid,'CTRL+HOME')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'To cell A1')
insert into q(q_act,qname) values(@actid,'CTRL+END')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'To the last cell in the worksheet that contains data')
insert into q(q_act,qname) values(@actid,'ENTER')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Down one row or to the start of the next row of data')
insert into q(q_act,qname) values(@actid,'SHIFT+ENTER')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Up one row')
insert into q(q_act,qname) values(@actid,'TAB')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'One column to the right')
insert into q(q_act,qname) values(@actid,'SHIFT+TAB')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'One column to the left')
insert into q(q_act,qname) values(@actid,'PGUP, PGDN')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Up or down one screen')
insert into q(q_act,qname) values(@actid,'CTRL+PGUP, CTRL+PGDN')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'To the previous or next sheet in the workbook')
select * from ans
join q on ans_q=qid
where q_act=@actid

select * from act
go
select * from grp
select * from cat
insert into cat(catname) values('Matching')
