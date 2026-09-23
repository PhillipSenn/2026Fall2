use lr2025Fall
use lr2026Fall
select * from act
order by actid

select * from lr2025Fall..act

set identity_insert q on
insert into q(qid,q_act,q_cat,qname,qdesc,qsort)
select qid,q_act,q_cat,qname,qdesc,qsort from lr2025fall..q where q_act=178
order by qid
set identity_insert q on

set identity_insert act on
insert into act(actid,actname,actlink) values(178,'Airports','Google/Maps/8.cfm')
set identity_insert act off
