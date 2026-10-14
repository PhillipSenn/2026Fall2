--insert into act(actname,actlink) values('LR opoly','LRopoly/')
select * from act -- 327
--https://PhillipSenn.dev/2026Fall2/LRopoly/?id=19C76747-5CF9-449C-9A52-FEF8906AD52E&actid=327

-- qsort is the space id.
-- qname is the name. 
-- qdesc is the icon.
-- catname is the kind. 
-- grpname is the bar (cat_grp = grpid).
create table spc
(spcid int identity primary key
,spc_q int
,spcRow int
,spcCol int
,spcSide nvarchar(max)
,spcPrice int
)
go

declare @actid int=327
delete from q where q_act=@actid
declare @grpid int
declare @catid int
declare @qid int

insert into grp(grpname) values
 ('')
,('brown')
,('lightblue')
,('pink')
,('orange')
,('red')
,('yellow')
,('green')
,('darkblue')

--select * from grp order by grpid
--select * from cat order by catid
delete from cat where cat_grp=15
select @grpid=grpid from grp where grpname=''
insert into cat(cat_grp,catname) values
 (@grpid,'go')
,(@grpid,'chest')
,(@grpid,'tax')
,(@grpid,'railroad')
,(@grpid,'chance')
,(@grpid,'jail')
,(@grpid,'utility')
,(@grpid,'parking')
,(@grpid,'gotojail')

select @grpid=grpid from grp where grpname='brown'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='lightblue'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='pink'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='orange'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='red'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='yellow'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='green'
insert into cat(cat_grp,catname) values(@grpid,'property')
select @grpid=grpid from grp where grpname='darkblue'
insert into cat(cat_grp,catname) values(@grpid,'property')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='go'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'GO','bi-arrow-left',0)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,11,'corner','Collect $200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='brown' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Mediterranean Avenue','',1)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,10,'bottom','$60')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chest'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Community Chest','bi-archive-fill',2)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,9,'bottom','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='brown' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Baltic Avenue','',3)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,8,'bottom','$60')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='tax'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Income Tax','bi-cash-stack',4)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,7,'bottom','Pay $200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='railroad'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Reading Railroad','bi-train-front-fill',5)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,6,'bottom','$200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='lightblue' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Oriental Avenue','',6)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,5,'bottom','$100')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chance'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Chance','bi-question-lg',7)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,4,'bottom','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='lightblue' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Vermont Avenue','',8)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,3,'bottom','$100')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Connecticut Avenue','',9)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,2,'bottom','$120')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='jail'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Jail','bi-lock-fill',10)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,11,1,'corner','Just Visiting')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='pink' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'St. Charles Place','',11)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,10,1,'left','$140')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='utility'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Electric Company','bi-lightbulb-fill',12)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,9,1,'left','$150')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='pink' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'States Avenue','',13)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,8,1,'left','$140')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Virginia Avenue','',14)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,7,1,'left','$160')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='railroad'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Pennsylvania Railroad','bi-train-front-fill',15)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,6,1,'left','$200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='orange' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'St. James Place','',16)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,5,1,'left','$180')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chest'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Community Chest','bi-archive-fill',17)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,4,1,'left','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='orange' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Tennessee Avenue','',18)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,3,1,'left','$180')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'New York Avenue','',19)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,2,1,'left','$200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='parking'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Free Parking','bi-p-square-fill',20)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,1,'corner','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='red' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Kentucky Avenue','',21)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,2,'top','$220')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chance'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Chance','bi-question-lg',22)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,3,'top','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='red' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Indiana Avenue','',23)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,4,'top','$220')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Illinois Avenue','',24)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,5,'top','$240')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='railroad'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'B. & O. Railroad','bi-train-front-fill',25)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,6,'top','$200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='yellow' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Atlantic Avenue','',26)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,7,'top','$260')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Ventnor Avenue','',27)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,8,'top','$260')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='utility'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Water Works','bi-droplet-fill',28)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,9,'top','$150')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='yellow' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Marvin Gardens','',29)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,10,'top','$280')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='gotojail'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Go To Jail','bi-person-walking',30)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,1,11,'corner','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='green' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Pacific Avenue','',31)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,2,11,'right','$300')

insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'North Carolina Avenue','',32)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,3,11,'right','$300')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chest'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Community Chest','bi-archive-fill',33)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,4,11,'right','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='green' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Pennsylvania Avenue','',34)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,5,11,'right','$320')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='railroad'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Short Line','bi-train-front-fill',35)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,6,11,'right','$200')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='chance'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Chance','bi-question-lg',36)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,7,11,'right','')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='darkblue' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Park Place','',37)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,8,11,'right','$350')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='' and catname='tax'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Luxury Tax','bi-cash-stack',38)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,9,11,'right','$100')

select @catid=catid from cat join grp on cat_grp=grpid where grpname='darkblue' and catname='property'
insert into q(q_act,q_cat,qname,qdesc,qsort) values(@actid,@catid,'Boardwalk','',39)
select @qid=scope_identity()
insert into spc(spc_q,spcRow,spcCol,spcSide,spcPrice) values(@qid,10,11,'right','$400')
go
--create schema spc authorization dbo
create proc spc.list as
select spc.*,q.*
from spc
join q on spc_q=qid
order by spcid
go
