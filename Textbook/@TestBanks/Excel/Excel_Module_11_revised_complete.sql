insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 11',8,107,'Test/bank.cfm',11)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The DAVERAGE function returns the maximum value in a column for cells matching the criteria.','The DAVERAGE function returns the maximum value in a column for cells matching the criteria.','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To illustrate different data levels using small graphics representing values, which of the following can you use?','To illustrate different data levels using small graphics representing values, which can you use?','NPEX 11-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'icon sets',1)
insert into ans(ans_q,ansname) values(@qid,'data bars')
insert into ans(ans_q,ansname) values(@qid,'Highlight Cells Rules')
insert into ans(ans_q,ansname) values(@qid,'color scales')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When items in a PivotTable field are combined to create a new group, and appear as a new field in the PivotTable, the new field is called a(n) ________.','When items in a PivotTable field are combined to create a new group, and appear as a new field in the PivotTable, the new field is called a(n) ________.','NPEX 11-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'field header')
insert into ans(ans_q,ansname) values(@qid,'value filter')
insert into ans(ans_q,ansname) values(@qid,'autocategory')
insert into ans(ans_q,ansname,correct) values(@qid,'manual group',1)

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Isabel has a PivotTable listing revenue from 100 campground rentals, with campgrounds listed by capacity. She wants to display campgrounds with capacity of 1-20, 21-40, and so on. How can she do so?','Isabel has a PivotTable listing revenue from 100 campground rentals, with campgrounds listed by capacity. She wants to display campgrounds with capacity of 1-20, 21-40, and so on. How can she do so?','NPEX 11-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Group the campgrounds by reservation date.')
insert into ans(ans_q,ansname,correct) values(@qid,'Group the campgrounds by capacity.',1)
insert into ans(ans_q,ansname) values(@qid,'Sort the campgrounds by revenue.')
insert into ans(ans_q,ansname) values(@qid,'Filter the campgrounds by capacity.')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the GETPIVOTDATA function to display a summarized PivotTable on a worksheet.','You can use the GETPIVOTDATA function to display a summarized PivotTable on a worksheet.','NPEX 11-61')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The three PivotTable layouts differ in how they arrange fields in the Rows area and where they display _____.','The three PivotTable layouts differ in how they arrange fields in the Rows area and where they display _____.','NPEX 11-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'subtotals',1)
insert into ans(ans_q,ansname) values(@qid,'grand totals')
insert into ans(ans_q,ansname) values(@qid,'column headings')
insert into ans(ans_q,ansname) values(@qid,'filters')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Marcos has a PivotTable that shows revenue by quarter. He wants to calculate the differences between the revenue for one quarter and another. What can he do?','Marcos has a PivotTable that shows revenue by quarter. He wants to calculate the differences between the revenue for one quarter and another. What can he do?','NPEX 11-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Ungroup the date field.')
insert into ans(ans_q,ansname,correct) values(@qid,'Create a calculated item.',1)
insert into ans(ans_q,ansname) values(@qid,'Create a measure.')
insert into ans(ans_q,ansname) values(@qid,'Change the summary function to SUMGROUP.')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Leila has a table listing the number of houses each real estate agent sold, if any, each month. She can use the DCOUNTA function to find the number of agents with sales in June.','Leila has a table listing the number of houses each real estate agent sold, if any, each month. She can use the DCOUNTA function to find the number of agents with sales in June.','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Nolan wants to display a red triangle in a PivotTable cell for increased expenses, a blue triangle for steady expenses, and a green triangle for declining expenses. He can create a custom icon set to do so.','Nolan wants to display a red triangle in a PivotTable cell for increased expenses, a blue triangle for steady expenses, and a green triangle for declining expenses. He can create a custom icon set to do so.','NPEX 11-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Excel limits you to one calculated field per PivotTable.','Excel limits you to one calculated field per PivotTable.','NPEX 11-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'PivotTables are automatically sorted in ascending order if the fields contain numeric data.','PivotTables are automatically sorted in ascending order if the fields contain numeric data.','NPEX 11-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When Flynn added a date field to a PivotTable, Excel grouped the date values into quarters, months, and years. What can Flynn do if he does not want to group the PivotTable this way? Select all the options that apply.','When Flynn added a date field to a PivotTable, Excel grouped the date values into quarters, months, and years. What can Flynn do if he does not want to group the PivotTable this way?. Select 2 that apply.','NPEX 11-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Regroup the dates to show quarters only.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Ungroup the dates.',1)
insert into ans(ans_q,ansname) values(@qid,'Regroup the dates to show holidays only.')
insert into ans(ans_q,ansname) values(@qid,'The groups cannot be changed.')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are types of filters to apply to PivotTable fields? Select all the options that apply.','Which are types of filters to apply to PivotTable fields?. Select 4 that apply.','NPEX 11-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Value filter',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Manual filter',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Label filter',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Date filter',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Use the DGET function to count the numeric values in a column for cells that match the criteria.','Use the DGET function to count the numeric values in a column for cells that match the criteria.','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can sort a PivotTable on a single field using which of the following methods? Select all the options that apply.','You can sort a PivotTable on a single field using which methods?. Select 3 that apply.','NPEX 11-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Manual',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Ascending',1)
insert into ans(ans_q,ansname) values(@qid,'Multiple')
insert into ans(ans_q,ansname,correct) values(@qid,'Descending',1)

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following calculations can you perform with PivotTables? Select all the options that apply.','Which calculations can you perform with PivotTables?. Select 4 that apply.','NPEX 11-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'percent differences',1)
insert into ans(ans_q,ansname,correct) values(@qid,'percent totals',1)
insert into ans(ans_q,ansname,correct) values(@qid,'ranks',1)
insert into ans(ans_q,ansname,correct) values(@qid,'running totals',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One way of creating a PivotTable group in a date field is through a custom group, where you select items in the field to create a new group, such as the September to December items to create a Semester group.','One way of creating a PivotTable group in a date field is through a custom group, where you select items in the field to create a new group, such as the September to December items to create a Semester group.','NPEX 11-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Allison wants to sort the Reservation data in a PivotTable by days of the week, Sunday through Monday. What does Allison need to create?','Allison wants to sort the Reservation data in a PivotTable by days of the week, Sunday through Monday. What does Allison need to create?','NPEX 11-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'a calculated field')
insert into ans(ans_q,ansname,correct) values(@qid,'a custom list',1)
insert into ans(ans_q,ansname) values(@qid,'a new date field')
insert into ans(ans_q,ansname) values(@qid,'a relationship')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When James added a date field to a PivotTable, Excel grouped the date values into quarters, months, and years. He does not want to group the data this way, so he clicks the Remove button on the PivotTable Tools Analyze tab.','When James added a date field to a PivotTable, Excel grouped the date values into quarters, months, and years. He does not want to group the data this way, so he clicks the Remove button on the PivotTable Tools Analyze tab.','NPEX 11-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A PivotTable Expanded layout expands fields into an outline of separate columns and displays subtotal rows at the top of each group.','A PivotTable Expanded layout expands fields into an outline of separate columns and displays subtotal rows at the top of each group.','NPEX 11-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are PivotTable layouts? Select all the options that apply.','Which are PivotTable layouts?. Select 3 that apply.','NPEX 11-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Horizontal')
insert into ans(ans_q,ansname,correct) values(@qid,'Compact',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Tabular',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Outline',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following PivotTable layouts displays all fields in separate columns and subtotal rows at the bottom of each group, similar to a table?','Which PivotTable layouts displays all fields in separate columns and subtotal rows at the bottom of each group, similar to a table?','NPEX 11-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Compact')
insert into ans(ans_q,ansname) values(@qid,'Outline')
insert into ans(ans_q,ansname,correct) values(@qid,'Tabular',1)
insert into ans(ans_q,ansname) values(@qid,'Condense')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Dana added a report filter to a PivotTable, but the list of filter values is long and difficult to use. What can she do to reduce the filter values in the list?','Dana added a report filter to a PivotTable, but the list of filter values is long and difficult to use. What can she do to reduce the filter values in the list?','NPEX 11-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Use a slicer instead of a report filter.')
insert into ans(ans_q,ansname,correct) values(@qid,'Enter search text in the Search box above the list of field item values.',1)
insert into ans(ans_q,ansname) values(@qid,'Sort the PivotTable first.')
insert into ans(ans_q,ansname) values(@qid,'Use the Approximate Filter feature.')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A(n) Summary function calculates summary statistics including AVERAGE, COUNT, and SUM, using criteria specified in a range.','A(n) Summary function calculates summary statistics including AVERAGE, COUNT, and SUM, using criteria specified in a range.','NPEX 11-65')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Tamara wants to count the number of values in the Rating column that are greater than 7. Which of the following functions should she use?','Tamara wants to count the number of values in the Rating column that are greater than 7. Which functions should she use?','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'DCOUNT',1)
insert into ans(ans_q,ansname) values(@qid,'DCOUNTA')
insert into ans(ans_q,ansname) values(@qid,'COUNTIF')
insert into ans(ans_q,ansname) values(@qid,'COUNTAIF')

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Edie has a worksheet listing lectures scheduled for the year. She wants to know how many cells in the Rating column contain "Excellent." Which of the following functions should she use?','Edie has a worksheet listing lectures scheduled for the year. She wants to know how many cells in the Rating column contain "Excellent." Which functions should she use?','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'DCOUNTA',1)
insert into ans(ans_q,ansname) values(@qid,'COUNT')
insert into ans(ans_q,ansname) values(@qid,'COUNTIF')
insert into ans(ans_q,ansname) values(@qid,'COUNTAIF')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Rodrigo has a worksheet that lists the revenue earned per month from technology consulting services. He wants to know how much total revenue his company collected during September. Which of the following functions should he use?','Rodrigo has a worksheet that lists the revenue earned per month from technology consulting services. He wants to know how much total revenue his company collected during September. Which functions should he use?','NPEX 11-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'DGET')
insert into ans(ans_q,ansname) values(@qid,'DAVERAGE')
insert into ans(ans_q,ansname,correct) values(@qid,'DSUM',1)
insert into ans(ans_q,ansname) values(@qid,'DMAX')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The two kinds of PivotTable are the Standard PivotTable and the PivotTable created from the Data Model.','The two kinds of PivotTable are the Standard PivotTable and the PivotTable created from the Data Model.','NPEX 11-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Ian has a PivotTable that includes a Product Name column and wants to filter a PivotTable so it shows only product names containing the word "Double." He should apply a Value filter.','Ian has a PivotTable that includes a Product Name column and wants to filter a PivotTable so it shows only product names containing the word "Double." He should apply a Value filter.','NPEX 11-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Juanita is working with a PivotTable based on the Power Pivot Data Model. She needs to create a calculation that summarizes data, which is called a(n) ______. ?','Juanita is working with a PivotTable based on the Power Pivot Data Model. She needs to create a calculation that summarizes data, which is called a(n) ______.?','NPEX 11-53')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'filter')
insert into ans(ans_q,ansname) values(@qid,'calculated field')
insert into ans(ans_q,ansname) values(@qid,'calculated item')
insert into ans(ans_q,ansname,correct) values(@qid,'measure',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Nathan has a PivotTable listing income from promotional events. He wants to multiple the value of a Tickets Sold field by a Price per Ticket field to find the total income from each type of ticket. He should create a calculated field.','Nathan has a PivotTable listing income from promotional events. He wants to multiple the value of a Tickets Sold field by a Price per Ticket field to find the total income from each type of ticket. He should create a calculated field.','NPEX 11-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Harry has a PivotTable listing Stores and the revenue they produce. He wants to calculate the difference between the revenue from one store and another. What should he create?','Harry has a PivotTable listing Stores and the revenue they produce. He wants to calculate the difference between the revenue from one store and another. What should he create?','NPEX 11-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'calculated item',1)
insert into ans(ans_q,ansname) values(@qid,'measure')
insert into ans(ans_q,ansname) values(@qid,'hierarchy')
insert into ans(ans_q,ansname) values(@qid,'custom list')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you create a measure, you must associate it with the correct table in a Data Model.','When you create a measure, you must associate it with the correct table in a Data Model.','NPEX 11-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Nicole has a PivotTable that groups Order dates by quarters, months, and years. She wants to group the data by year only. To do so, she can use the Grouping dialog box to regroup the dates.','Nicole has a PivotTable that groups Order dates by quarters, months, and years. She wants to group the data by year only. To do so, she can use the Grouping dialog box to regroup the dates.','NPEX 11-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Marilyn added a few calculated fields and items to a PivotTable and wants to document the calculations on a separate worksheet. She can click the Fields, Items, & Sets button, and then click _____.','Marilyn added a few calculated fields and items to a PivotTable and wants to document the calculations on a separate worksheet. She can click the Fields, Items, & Sets button, and then click _____.','NPEX 11-47')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Document Calculations')
insert into ans(ans_q,ansname,correct) values(@qid,'List Formulas',1)
insert into ans(ans_q,ansname) values(@qid,'Show Formulas')
insert into ans(ans_q,ansname) values(@qid,'Formula Sheet')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To reduce the width of the PivotTable by placing all fields from the Rows area in one column, use which of the following PivotTable layouts?','To reduce the width of the PivotTable by placing all fields from the Rows area in one column, use which PivotTable layouts?','NPEX 11-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Outline')
insert into ans(ans_q,ansname,correct) values(@qid,'Compact',1)
insert into ans(ans_q,ansname) values(@qid,'Tabular')
insert into ans(ans_q,ansname) values(@qid,'Subtotals')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The PivotTable layouts different mainly in how they arrange fields in the Rows area and where they display grand totals.','The PivotTable layouts different mainly in how they arrange fields in the Rows area and where they display grand totals.','NPEX 11-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A calculated field is a user-defined formula for calculations across one or more fields.','A calculated field is a user-defined formula for calculations across one or more fields.','NPEX 11-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

select * from q 
where q_act=@actid
