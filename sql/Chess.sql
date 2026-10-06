--select * from act order by actid desc
--delete from ans where ansid in(
--select ansid from ans join q on ans_q=qid where q_act=240
--)
--DELETE from q where q_act=240

--insert into act(actname,actlink) values('Chess','Chess/')
declare @actid int=240
declare @qid int
-- Black pieces

insert into q(q_act,qname,qdesc) values(@actid,N'♜','rook')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♞','knight')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♝','bishop')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♛','queen')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♚','king')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♝','bishop')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♞','knight')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♜','rook')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')

insert into q(q_act,qname,qdesc) values(@actid,N'♟','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'black')


-- White pieces

insert into q(q_act,qname,qdesc) values(@actid,N'♖','rook')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♘','knight')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♗','bishop')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♕','queen')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♔','king')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♗','bishop')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♘','knight')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♖','rook')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')

insert into q(q_act,qname,qdesc) values(@actid,N'♙','pawn')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'white')
--select * from ans join q on ans_q=qid where q_act=@actid
select * from q where q_act=@actid
