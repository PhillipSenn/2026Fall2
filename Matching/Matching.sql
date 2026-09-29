use lr2026Fall2
declare @qid int
insert into act(actname,actlink) values('Excel keyboard shortcuts','Matching/matching.cfm')
declare @actid int=scope_identity()
insert into q(q_act,qname) values(@actid,'ALT')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Display the Key Tips for the commands and tools on the ribbon')
insert into q(q_act,qname) values(@actid,'CTRL+V')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Paste content that was cut or copied')
insert into q(q_act,qname) values(@actid,'CTRL+A')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Select all objects in a range')
insert into q(q_act,qname) values(@actid,'CTRL+W')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Close the current workbook')
insert into q(q_act,qname) values(@actid,'CTRL+C')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Copy the selected object(s)')
insert into q(q_act,qname) values(@actid,'CTRL+X')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Cut the selected object(s)')
insert into q(q_act,qname) values(@actid,'CTRL+G')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Go to a location in the workbook')
insert into q(q_act,qname) values(@actid,'CTRL+Y')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Repeat the last command')
insert into q(q_act,qname) values(@actid,'CTRL+N')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Open a new blank workbook')
insert into q(q_act,qname) values(@actid,'CTRL+Z')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Undo the last command')
insert into q(q_act,qname) values(@actid,'CTRL+O')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Open a saved workbook file')
insert into q(q_act,qname) values(@actid,'F1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Open the Excel Help window')
insert into q(q_act,qname) values(@actid,'CTRL+P')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Print the current workbook')
--insert into q(q_act,qname) values(@actid,'F5')
--select @qid=scope_identity()
--insert into ans(ans_q,ansname) values(@qid,'Go to a location in the workbook')
insert into q(q_act,qname) values(@actid,'CTRL+S')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Save the current workbook')
insert into q(q_act,qname) values(@actid,'F12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Save the current workbook with a new name or to a new location')
select * from ans
join q on ans_q=qid
where q_act=@actid

select * from act
go
declare @actid int=235
update ans set correct=1
where ansid in(
	select ansid
	from ans 
	join q on ans_q=qid
	where q_act=@actid
)
go
declare @actid int=235
select ansname,count(*)
from ans 
join q on ans_q=qid
where q_act=@actid
group by ansname
