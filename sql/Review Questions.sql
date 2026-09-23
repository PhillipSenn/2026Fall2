/*
(@id uniqueidentifier
) as
declare @usrid int=(select usrid from usr where id=@id)

*/
declare @actid int
select @actid=179
delete from ans where ans_q in(
	select qid from q where q_act=@actid
)
delete from q where q_act=@actid
declare @qid int
insert into q(q_act,qname) values(@actid,'A microprocessor is the “brains” of a computer.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'Embedded computers are standalone products that have many functions.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'The basic premise of (blank) is that objects can be tagged, tracked, and monitored through a local network, or across the Internet.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'intelligent workspaces')
insert into ans(ans_q,ansname) values(@qid,'the digital divide')
insert into ans(ans_q,ansname) values(@qid,'the Internet of Things')
insert into ans(ans_q,ansname) values(@qid,'artificial intelligence')

insert into q(q_act,qname) values(@actid,'Computers with AI use human intelligence to make decisions.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'A digital citizen uses technology to be productive and efficient.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'A kiosk is a freestanding booth usually placed in a public area that can contain a display device used to show information to the public or event attendees.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'(blank) are smart devices that respond to a user’s verbal commands by using search technology to provide an answer to a question or perform a task.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'ATMs')
insert into ans(ans_q,ansname) values(@qid,'Green computers')
insert into ans(ans_q,ansname) values(@qid,'Integrated circuits')
insert into ans(ans_q,ansname) values(@qid,'Digital assistants')

insert into q(q_act,qname) values(@actid,'(blank) text is descriptive text added to an object.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Associative')
insert into ans(ans_q,ansname) values(@qid,'Alternative')
insert into ans(ans_q,ansname) values(@qid,'Accessible')
insert into ans(ans_q,ansname) values(@qid,'Assistive')

insert into q(q_act,qname) values(@actid,'The ENERGY STAR program encourages manufacturers to reduce the amount of electricity used by computers and related devices.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'BYOD stands for Bring Your Own (blank).')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Device')
insert into ans(ans_q,ansname) values(@qid,'Daily planner')
insert into ans(ans_q,ansname) values(@qid,'Database')
insert into ans(ans_q,ansname) values(@qid,'Data')

insert into q(q_act,qname) values(@actid,'An intelligent classroom is one in which technology is used to facilitate learning and communication.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'Colleges use (blank) management systems (LMSs) to set up web-based training sites where students can check their progress in a course, take practice tests, and exchange messages with the instructor or other students.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'learning')
insert into ans(ans_q,ansname) values(@qid,'linked')
insert into ans(ans_q,ansname) values(@qid,'locational')
insert into ans(ans_q,ansname) values(@qid,'live')

insert into q(q_act,qname) values(@actid,'Automated vehicles decrease independent transportation options for people with disabilities.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'The mobile health (mHealth) trend refers to doctors and nurses using smartphones or tablets to access health records stored on mobile devices.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')

insert into q(q_act,qname) values(@actid,'A company’s computers monitor assembly lines and equipment using (blank) communications.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'CAM')
insert into ans(ans_q,ansname) values(@qid,'AI')
insert into ans(ans_q,ansname) values(@qid,'IT')
insert into ans(ans_q,ansname) values(@qid,'M2M')

insert into q(q_act,qname) values(@actid,'A company’s (blank) department oversees the centralized computer equipment and administers the network.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'operations')
insert into ans(ans_q,ansname) values(@qid,'management')
insert into ans(ans_q,ansname) values(@qid,'technical support')
insert into ans(ans_q,ansname) values(@qid,'information security')

insert into q(q_act,qname) values(@actid,'When looking for a job, you should use humorous or informal names for your account profiles, blog, or domain name to make yourself stand out.')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname) values(@qid,'False')
go
