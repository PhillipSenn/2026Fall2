use lr2026Fall2
--
-- Make sure you're on the right server!
--
select @@SERVERNAME -- 38C-86-C9B\SQLEXPRESS is Production
select @@version	-- Microsoft SQL Server 2017 (RTM-GDR) (KB5122775) - 14.0.2130.4 (X64)   Aug 21 2026 13:24:49   Copyright (C) 2017 Microsoft Corporation  Express Edition (64-bit) on Windows Server 2019 Datacenter 10.0 <X64> (Build 17763: ) (Hypervisor) 
					-- Microsoft SQL Server 2025 (RTM-GDR) (KB5122770) - 17.0.1135.8 (X64)   Aug 20 2026 00:56:11   Copyright (C) 2025 Microsoft Corporation  Express Edition (64-bit) on Windows 10 Home 10.0 <X64> (Build 19045: ) (Hypervisor) 
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

