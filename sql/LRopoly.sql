--insert into act(actname,actlink) values('LR opoly','LRopoly/')
select * from act -- 327
--https://PhillipSenn.dev/2026Fall2/LRopoly/?id=19C76747-5CF9-449C-9A52-FEF8906AD52E&actid=327
select * from usr
select * from q
insert into grp(grpname) values('Monopoly')
select * from grp -- 15
select * from cat

go
declare @grpid int=15
insert into cat(cat_grp,catname) values
 (@grpid,'Corner')
,(@grpid,'Brown')
,(@grpid,'Community Chest')
,(@grpid,'Tax')
,(@grpid,'Railroad')
,(@grpid,'Light Blue')
,(@grpid,'Chance')
,(@grpid,'Pink')
,(@grpid,'Utility')
,(@grpid,'Orange')
,(@grpid,'Red')
,(@grpid,'Yellow')
,(@grpid,'Green')
,(@grpid,'Dark Blue')

declare @grpid int=15
declare @catid int
declare @actid int=327
select @catid=catid from cat where cat_grp=@grpid and catname='Corner'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'GO',0)

select @catid=catid from cat where cat_grp=@grpid and catname='Brown'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Mediterranean',1)

select @catid=catid from cat where cat_grp=@grpid and catname='Community Chest'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Community Chest',2)

select @catid=catid from cat where cat_grp=@grpid and catname='Brown'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Baltic',3)

select @catid=catid from cat where cat_grp=@grpid and catname='Tax'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Income Tax',4)

select @catid=catid from cat where cat_grp=@grpid and catname='Railroad'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Reading Railroad',5)

select @catid=catid from cat where cat_grp=@grpid and catname='Light Blue'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Oriental',6)

select @catid=catid from cat where cat_grp=@grpid and catname='Chance'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Chance',7)

select @catid=catid from cat where cat_grp=@grpid and catname='Light Blue'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Vermont',8)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Connecticut',9)

select @catid=catid from cat where cat_grp=@grpid and catname='Corner'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Jail / Just Visiting',10)

select @catid=catid from cat where cat_grp=@grpid and catname='Pink'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'St. Charles',11)

select @catid=catid from cat where cat_grp=@grpid and catname='Utility'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Electric Company',12)

select @catid=catid from cat where cat_grp=@grpid and catname='Pink'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'States',13)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Virginia',14)

select @catid=catid from cat where cat_grp=@grpid and catname='Railroad'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Pennsylvania Railroad',15)

select @catid=catid from cat where cat_grp=@grpid and catname='Orange'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'St. James',16)

select @catid=catid from cat where cat_grp=@grpid and catname='Community Chest'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Community Chest',17)

select @catid=catid from cat where cat_grp=@grpid and catname='Orange'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Tennessee',18)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'New York',19)

select @catid=catid from cat where cat_grp=@grpid and catname='Corner'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Free Parking',20)

select @catid=catid from cat where cat_grp=@grpid and catname='Red'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Kentucky',21)

select @catid=catid from cat where cat_grp=@grpid and catname='Chance'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Chance',22)

select @catid=catid from cat where cat_grp=@grpid and catname='Red'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Indiana',23)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Illinois',24)

select @catid=catid from cat where cat_grp=@grpid and catname='Railroad'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'B&O Railroad',25)

select @catid=catid from cat where cat_grp=@grpid and catname='Yellow'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Atlantic',26)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Ventnor',27)

select @catid=catid from cat where cat_grp=@grpid and catname='Utility'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Water Works',28)

select @catid=catid from cat where cat_grp=@grpid and catname='Yellow'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Marvin Gardens',29)

select @catid=catid from cat where cat_grp=@grpid and catname='Corner'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Go to Jail',30)

select @catid=catid from cat where cat_grp=@grpid and catname='Green'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Pacific',31)
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'North Carolina',32)

select @catid=catid from cat where cat_grp=@grpid and catname='Community Chest'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Community Chest',33)

select @catid=catid from cat where cat_grp=@grpid and catname='Green'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Pennsylvania',34)

select @catid=catid from cat where cat_grp=@grpid and catname='Railroad'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Short Line',35)

select @catid=catid from cat where cat_grp=@grpid and catname='Chance'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Chance',36)

select @catid=catid from cat where cat_grp=@grpid and catname='Dark Blue'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Park Place',37)

select @catid=catid from cat where cat_grp=@grpid and catname='Tax'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Luxury Tax',38)

select @catid=catid from cat where cat_grp=@grpid and catname='Dark Blue'
insert into q(q_act,q_cat,qname,qsort) values(@actid,@catid,'Boardwalk',39)
