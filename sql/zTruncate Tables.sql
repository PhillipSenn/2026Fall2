use lr2026Fall2
--
-- Make sure you're on the right server!
--
select @@SERVERNAME
-- 38C-86-C9B\SQLEXPRESS is Production
select * from INFORMATION_SCHEMA.tables order by table_name
/*
truncate table act
truncate table ans
truncate table cat
truncate table grade
truncate table grp
truncate table guess
truncate table poll
truncate table q
truncate table usr
*/

