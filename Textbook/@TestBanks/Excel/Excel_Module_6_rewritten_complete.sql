--insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 6',8,107,'Test/bank.cfm',6)
--declare @actid int=scope_identity()
--print @actid
--select * from grp
--select * from cat
declare @actid int=(select actid from act where actname='Excel Module 6')
print 'actid: ' 
print cast(@actid as varchar)
delete from ans where ansid in(
	select ansid
	from ans 
	join q on ans_q=qid
	where q_act=@actid
)
delete from q where q_act=@actid
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To expand data views using the Outline feature, select the rows with similar data by clicking and dragging on the rows numbers to the left of your data. Then click on Data tab > Group > - sign.','To expand an outlined data group, click the minus sign beside the grouped rows.','NPEX 6-19')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 2
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Cedric has a table listing customer data, including the date of their purchase. He can sort the Date data in descending order to quickly find customers with recent purchases.','Cedric can sort purchase dates in descending order to find the most recent customers quickly.','NPEX 6-14')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To outline data, select the rows or columns you want to group, and then click the Group button on the Data tab.','How do you create an outline group for selected rows or columns?','NPEX 6-23')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Mia inserted a plain table in a worksheet. She wants to change the black borders and white fill to make the table more attractive and easier to use. What is the quickest way for her to change the appearance of the table?','Mia wants to quickly improve the appearance of a plain Excel table. What should she use?','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Change the shading and border colors of the cells.')
insert into ans(ans_q,ansname) values(@qid,'Filter the table.')
insert into ans(ans_q,ansname,correct) values(@qid,'Change the table style.',1)
insert into ans(ans_q,ansname) values(@qid,'Convert the table to a range.')

-- 5
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following buttons on the Home tab can you use to insert a row in a table?','Which Home tab button can insert a row in an Excel table?','NPEX 6-42')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Format as Table')
insert into ans(ans_q,ansname) values(@qid,'Insert & Merge')
insert into ans(ans_q,ansname,correct) values(@qid,'Insert',1)
insert into ans(ans_q,ansname) values(@qid,'Add Row')

-- 6
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Josh wants to insert a column in an Excel table to add the values from two other columns. Which of the following methods can he use to insert a table column?','How can Josh insert a new column in an Excel table?','NPEX 6-43')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Click a column header and then click the Insert button on the Home tab.',1)
insert into ans(ans_q,ansname) values(@qid,'Right-click a column header, click Format Cells on the shortcut menu, and then click Add New Column.')
insert into ans(ans_q,ansname) values(@qid,'Click a column header, click the filter arrow, and then click Insert.')
insert into ans(ans_q,ansname) values(@qid,'Double-click a column header and then click Insert on the shortcut menu.')

-- 7
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'A range of data Excel treats as a single object that can be managed independently from other data in the workbook I a(n) _________.','What do you call a range of data that Excel treats as one independently managed object?','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Outline')
insert into ans(ans_q,ansname) values(@qid,'Summary')
insert into ans(ans_q,ansname,correct) values(@qid,'Table',1)
insert into ans(ans_q,ansname) values(@qid,'Dashboard')

-- 8
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Kylie created a table with a Skill Number column that contains values from 400 to 500. What type of filter can she use to select records with skill numbers less than 450?','Kylie wants to show Skill Number values below 450. What type of filter should she use?','NPEX 6-30')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Text filter')
insert into ans(ans_q,ansname) values(@qid,'Top Values filter')
insert into ans(ans_q,ansname,correct) values(@qid,'Number filter',1)
insert into ans(ans_q,ansname) values(@qid,'Form filter')

-- 9
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Shelley creates a table containing the marks of Language Arts students in her class with these columns: Names of Students and Marks. She now wants to see the names of students who scored exactly 60 marks. What will Shelley do after selecting the column header arrow for the column with heading Marks?','Shelley wants to show only students who scored exactly 60. What should she choose from the Marks column filter?','NPEX 6-30')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Check the box beside Select All and the number 60 and click OK.')
insert into ans(ans_q,ansname,correct) values(@qid,'Uncheck (Select All),  select the box beside the number 60 and click OK.',1)
insert into ans(ans_q,ansname) values(@qid,'Select Number Filters > Between > (Enter value 0 in dialog box on top) > (Enter value 60 in dialog box below it) > OK.')
insert into ans(ans_q,ansname) values(@qid,'Select Number Filters > Less Than or Equal To > (Enter value 0 in dialog box on top) > (Enter value 60 in dialog box below it) > OK.')

-- 10
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Adele wants to filter a Customers table to show customers in Denver or customers with invoices over $2500. What type of filter should she use?','Adele wants to show customers in Denver OR customers with invoices over $2,500. What type of filter should she use?','NPEX 6-33')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Number AutoFilter')
insert into ans(ans_q,ansname,correct) values(@qid,'Advanced filter',1)
insert into ans(ans_q,ansname) values(@qid,'Text with wildcard filter')
insert into ans(ans_q,ansname) values(@qid,'Date AutoFilter')

-- 11
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'How can you hide the filter buttons in a table?','How can you hide the filter buttons in an Excel table?','NPEX 6-40')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Click the Filter Button check box in the Table Styles Options group.',1)
insert into ans(ans_q,ansname) values(@qid,'Clear the filters from the table.')
insert into ans(ans_q,ansname) values(@qid,'Right-click a filter button and then click Remove.')
insert into ans(ans_q,ansname) values(@qid,'Click a filter button and then click Hide.')

-- 12
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'An Excel table contains columns named Salary and Commission. Which of the following formulas uses a structural reference to sum the values in the Salary through Commission fields?','Which formula correctly uses a structured reference to sum the Salary through Commission fields?','NPEX 6-45')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'=SUM(Salary:Commission)')
insert into ans(ans_q,ansname) values(@qid,'=SUM(Salary!Commission)')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM([Salary]:[Commission])',1)
insert into ans(ans_q,ansname) values(@qid,'=SUM("Salary":"Commission")')

-- 13
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following boxes will you check after clicking on a table and then selecting Table Tools > Design, to add a row to the table that will display summary statistics of the different table columns.?','Which table option adds a row that displays summary statistics for table columns?','NPEX 6-41')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Total Row',1)
insert into ans(ans_q,ansname) values(@qid,'Header Row')
insert into ans(ans_q,ansname) values(@qid,'Footer Row')
insert into ans(ans_q,ansname) values(@qid,'Banded Rows')

-- 14
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Tracy created a table where the odd and even-numbered columns are formatted differently. She wants to remove this formatting. What setting should she change?','Tracy wants to remove alternating formatting from odd and even columns. Which setting should she change?','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Banded columns',1)
insert into ans(ans_q,ansname) values(@qid,'Calculated columns')
insert into ans(ans_q,ansname) values(@qid,'Odd/Even columns')
insert into ans(ans_q,ansname) values(@qid,'First column')

-- 15
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Bruno has a table with four fields and dozens of records. To make the fields easier to distinguish, he can apply filtered columns.','Applying filtered columns makes table fields easier to distinguish.','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 16
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Liza has a table with six fields and 50 records. To make it easier to distinguish the records, she can apply banded rows.','Applying banded rows makes table records easier to distinguish.','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 17
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'The Remove Duplicates tool locates and deletes records that are duplicated across multiple fields.','The Remove Duplicates tool can delete records duplicated across multiple fields.','NPEX 6-12')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 18
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'A teacher creates a table of student data that contains columns for First Name, Last Name, and Date of Birth. To list the students in alphabetical order by last name, she can sort the Last Name column in ascending order.','Sorting Last Name in ascending order lists students alphabetically by last name.','NPEX 6-14')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 19
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'A teacher creates a table for Sports Day events. The table includes columns for Event, Rank, First Name, and Last Name. To find the top-ranking participants for each event, the teacher can sort the table first by Event and then by Rank.','To find the top-ranking participant for each event, sort first by Event and then by Rank.','NPEX 6-15')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 20
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To display a preview of a table style applied to the selected table, point to a style in the Table Styles gallery.','Pointing to a style in the Table Styles gallery previews that style on the selected table.','NPEX 6-40')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'The best way to locate records with duplicates in more than one field is to apply conditional formatting.','Conditional formatting is the best way to locate records duplicated in more than one field.','NPEX 6-12')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 22
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following can help you quickly format a cell range with labels in the left column and top row, and totals in the bottom row?','What can quickly format a range with labels in the top row and left column and totals in the bottom row?','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'table style',1)
insert into ans(ans_q,ansname) values(@qid,'cell style')
insert into ans(ans_q,ansname) values(@qid,'font style')
insert into ans(ans_q,ansname) values(@qid,'number format')

-- 23
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Michelle finished a 5 kilometer run in 180th position. The organizers shared an Excel spreadsheet with names of all the participants and the time they took to complete the race. The top 15 finishers are listed in rows 2 to 16. Michelle wants to compare her time against theirs. How can she do so?','Michelle finished 180th and wants to compare her time with the top 15 finishers in rows 2 through 16. How can she do that?','NPEX 6-6')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Select row 17 and click View tab > Window group > Split.',1)
insert into ans(ans_q,ansname) values(@qid,'Select rows 2 to 16 and click View tab > Window group > Split.')
insert into ans(ans_q,ansname) values(@qid,'Select rows 2 to 16 and click View tab > Window group > New Window > Split.')
insert into ans(ans_q,ansname) values(@qid,'Select row 16 and click View tab > Window group > Split > Arrange All.')

-- 24
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Helen wants to resize slicer buttons to exact dimensions. What can she use to do so?','What can Helen use to resize slicer buttons to exact dimensions?','NPEX 6-54')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Slicer Settings button in the Slicer group')
insert into ans(ans_q,ansname,correct) values(@qid,'Height and Width boxes in the Buttons group',1)
insert into ans(ans_q,ansname) values(@qid,'Slicer Styles gallery')
insert into ans(ans_q,ansname) values(@qid,'Slicer Size box in the Slicer group')

-- 25
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Leigh-Ann used a slicer to filter a table on the Department field. Which of the following buttons should she click on the slicer to redisplay data for all the departments?','Which slicer button should Leigh-Ann click to show all departments again?','NPEX 6-51')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Multi-Select button')
insert into ans(ans_q,ansname,correct) values(@qid,'Clear Filter button',1)
insert into ans(ans_q,ansname) values(@qid,'Slicer Settings button')
insert into ans(ans_q,ansname) values(@qid,'Slicer Styles button')

-- 26
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Will has a table that includes a field with four product types. What kind of filter would be best to create for the table?','A table contains four product types. What kind of filter would be best for that field?','NPEX 6-52')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Date filter')
insert into ans(ans_q,ansname) values(@qid,'Custom number filter')
insert into ans(ans_q,ansname,correct) values(@qid,'Slicer',1)
insert into ans(ans_q,ansname) values(@qid,'Advanced filter')

-- 27
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'How can you remove the split bars from a worksheet?','How can you remove split bars from a worksheet?','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Click the View tab, and then click the Split button in the Windows group.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the Page Layout tab, and then click the Bring Forward button in the Arrange group.')
insert into ans(ans_q,ansname) values(@qid,'Click the View tab, and then click the Hide button in the Windows group.')
insert into ans(ans_q,ansname) values(@qid,'Click the Page layout tab, and then click the Remove Breaks button in the Page Setup group.')

-- 28
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following do Excel tables provide that data ranges do not? Select all the options that apply.','Which features do Excel tables provide that ordinary data ranges do not? Select 2 that apply.','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Built-in sorting and filtering tools',1)
insert into ans(ans_q,ansname) values(@qid,'What-if analysis tools')
insert into ans(ans_q,ansname,correct) values(@qid,'Styles that format different parts of the table',1)
insert into ans(ans_q,ansname) values(@qid,'Automatic subtotal rows')

-- 29
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following can you apply to an Excel table? Select all the options that apply.','Which features can you apply to an Excel table? Select 3 that apply.','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Header row',1)
insert into ans(ans_q,ansname) values(@qid,'Total column')
insert into ans(ans_q,ansname,correct) values(@qid,'Banded rows',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Table name',1)

-- 30
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following are ways to format the appearance of a slicer? Select all the options that apply.','Which methods can you use to format the appearance of a slicer? Select 4 that apply.','NPEX 6-54')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Number of columns',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Slicer size',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Button size',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Slicer style',1)

-- 31
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you split a worksheet pane, its contents are always visible, though you cannot scroll in the pane.','When a worksheet is split into panes, each pane remains visible but cannot be scrolled.','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 32
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which features do Excel tables support that are not available with data ranges? Select all the options that apply.','Which features are available in Excel tables but not ordinary data ranges? Select 3 that apply.','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Built-in sorting and filtering tools',1)
insert into ans(ans_q,ansname) values(@qid,'Number formats')
insert into ans(ans_q,ansname,correct) values(@qid,'Table styles',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Totals row',1)

-- 33
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'You cannot add totals to an Excel table because the table structure of fields and records must be preserved.','You cannot add totals to an Excel table because doing so would break its field-and-record structure.','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 34
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following are ways Excel provides to identify duplicate records in a table? Select all the options that apply.','Which methods can Excel use to identify duplicate records in a table? Select 2 that apply.','NPEX 6-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Highlight Duplicate Values conditional formatting',1)
insert into ans(ans_q,ansname) values(@qid,'Duplicate Values Wizard')
insert into ans(ans_q,ansname,correct) values(@qid,'Remove Duplicates tool',1)
insert into ans(ans_q,ansname) values(@qid,'Circle Duplicates tool')

-- 35
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To locate duplicate values in a selected range, start by clicking the Duplicate Formatting button on the Home tab.','To find duplicate values in a selected range, start by clicking a Duplicate Formatting button on the Home tab.','NPEX 6-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 36
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What does the Highlight Duplicate Values conditional formatting rule do when you apply it to a range?','What does the Highlight Duplicate Values conditional-formatting rule do to the selected range?','NPEX 6-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'It highlights duplicate values in the range.',1)
insert into ans(ans_q,ansname) values(@qid,'It deletes duplicate values from the range.')
insert into ans(ans_q,ansname) values(@qid,'It converts duplicate values so they are unique.')
insert into ans(ans_q,ansname) values(@qid,'It moves the duplicate values to another area of the worksheet.')

-- 37
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following are ways you can format a slicer? Select all the options that apply.','Which methods can you use to format a slicer? Select 3 that apply.','NPEX 6-54')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Change the size of the slicer buttons.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Change the number of columns in the slicer.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Apply a color scheme.',1)
insert into ans(ans_q,ansname) values(@qid,'Format the slicer button text.')

-- 38
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Splitting the workbook window affects all the worksheets in the workbook.','Splitting a workbook window affects every worksheet in the workbook.','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 39
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following parts of a worksheet can you freeze? Select all the options that apply.','Which parts of a worksheet can you freeze? Select 3 that apply.','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'top row',1)
insert into ans(ans_q,ansname,correct) values(@qid,'first column',1)
insert into ans(ans_q,ansname) values(@qid,'middle column')
insert into ans(ans_q,ansname,correct) values(@qid,'specified pane',1)

-- 40
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you freeze the top row of a worksheet, what part of the worksheet can you scroll?','After freezing the top row, which part of the worksheet can you still scroll?','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'all rows below the top row',1)
insert into ans(ans_q,ansname) values(@qid,'columns starting with column C')
insert into ans(ans_q,ansname) values(@qid,'rows starting with row 4')
insert into ans(ans_q,ansname) values(@qid,'only the lower-right pane of the worksheet')

-- 41
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'References to fields in an Excel table are called table references.','References to fields in an Excel table are called table references.','NPEX 6-45')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 42
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'In the formula =[SalesPrice]*.05, what do you call [SalesPrice]?','In =[SalesPrice]*.05, what is [SalesPrice] called?','NPEX 6-45')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'3-D reference')
insert into ans(ans_q,ansname) values(@qid,'external reference')
insert into ans(ans_q,ansname,correct) values(@qid,'structural reference',1)
insert into ans(ans_q,ansname) values(@qid,'absolute reference')

-- 43
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To count only records that match a filter criteria, you use the SUBTOTAL function.','The SUBTOTAL function can count only the records that match filter criteria.','NPEX 6-56')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 44
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'In the formula = SUBTOTAL(1, Customers_Table(ID]), what does the 1 refer to?','In =SUBTOTAL(1, Customers_Table[ID]), what does the 1 specify?','NPEX 6-56')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'the first field to analyze')
insert into ans(ans_q,ansname) values(@qid,'the number of the column to analyze')
insert into ans(ans_q,ansname) values(@qid,'the number of values to analyze')
insert into ans(ans_q,ansname,correct) values(@qid,'the number of the function to use',1)

-- 45
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To use the SUBTOTAL function to calculate the sum of filtered table records, set the Function_Num argument to _____.','Which Function_Num value makes SUBTOTAL calculate the sum of filtered table records?','NPEX 6-56')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'1 for AVERAGE')
insert into ans(ans_q,ansname,correct) values(@qid,'9 for SUM',1)
insert into ans(ans_q,ansname) values(@qid,'2 for COUNT')
insert into ans(ans_q,ansname) values(@qid,'10 for TOTAL')

-- 46
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following summary statistics can you display in a total row in an Excel table? Select all the options that apply.','Which summary statistics can a Total Row display in an Excel table? Select 3 that apply.','NPEX 6-41')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'lookup')
insert into ans(ans_q,ansname,correct) values(@qid,'average',1)
insert into ans(ans_q,ansname,correct) values(@qid,'minimum',1)
insert into ans(ans_q,ansname,correct) values(@qid,'sum',1)

-- 47
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'After splitting a worksheet window into four panes, how can you display a single pane? Select all the options that apply.','After splitting a worksheet into four panes, how can you return to a single pane? Select 2 that apply.','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Freeze the top row.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click the Split button on the View tab.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Double-click the split bar.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the Arrange All button on the View tab.')

-- 48
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'. To resize the panes, right-click the pane split bar.','You resize worksheet panes by right-clicking the pane split bar.','NPEX 6-8')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 49
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following are options you can select when using the Find and Replace dialog box to find text? Select all the options that apply.','Which options are available when using Find and Replace to search for text? Select 3 that apply.','NPEX 6-26')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Type of criteria')
insert into ans(ans_q,ansname,correct) values(@qid,'Look in',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Match case',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Within',1)

-- 50
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To find every cell that satisfies the criteria you enter in the Fine and Replace dialog box, you click the Find Next button.','To find every cell matching your criteria in Find and Replace, click Find Next.','NPEX 6-26')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 51
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Gwen wants to locate cells that contain the date 11/14/21. Which of the following tools should she use?','Gwen wants to find cells containing the date 11/14/21. Which tool should she use?','NPEX 6-26')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Locate & Change')
insert into ans(ans_q,ansname,correct) values(@qid,'Find & Select',1)
insert into ans(ans_q,ansname) values(@qid,'Fill')
insert into ans(ans_q,ansname) values(@qid,'Filter')

-- 52
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'If you want to sort data first by department, and then by last name, the last name field is the _____ sort field.','If you sort first by Department and then by Last Name, what kind of sort field is Last Name?','NPEX 6-15')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'primary')
insert into ans(ans_q,ansname) values(@qid,'limited')
insert into ans(ans_q,ansname,correct) values(@qid,'secondary',1)
insert into ans(ans_q,ansname) values(@qid,'minor')

-- 53
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Dmitri created a table of employee data and wants to list the records in order by most recent hire date. Which of the following should he do?','Dmitri wants employee records ordered from the most recent hire date to the oldest. What should he do?','NPEX 6-13')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Sort the records in descending order by hire date.',1)
insert into ans(ans_q,ansname) values(@qid,'Sort the records in ascending order by hire date.')
insert into ans(ans_q,ansname) values(@qid,'Sort the records first by name and then by hire date.')
insert into ans(ans_q,ansname) values(@qid,'Filter the records by hire date.')

-- 54
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Stacey filtered a table on the Product Type field and now wants to filter on the Price field instead. What should she do next?','Stacey has filtered by Product Type and now wants to filter by Price instead. What should she do next?','NPEX 6-33')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Click a filter button and then click Price.')
insert into ans(ans_q,ansname,correct) values(@qid,'Clear the existing filter from the table.',1)
insert into ans(ans_q,ansname) values(@qid,'Use a Number filter.')
insert into ans(ans_q,ansname) values(@qid,'Sort by the Price field.')

-- 55
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To explicitly indicate that a range contains fields and records, you create a(n) _____.','What should you create to explicitly identify a range as containing fields and records?','NPEX 6-37')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'outline')
insert into ans(ans_q,ansname,correct) values(@qid,'table',1)
insert into ans(ans_q,ansname) values(@qid,'advanced filter')
insert into ans(ans_q,ansname) values(@qid,'chart')

-- 56
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Maya created a table with the totals in the last column on the right. Which of the following table style options should she apply to call attention to the totals?','Maya has totals in the rightmost table column. Which table style option will emphasize that column?','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Total Row')
insert into ans(ans_q,ansname,correct) values(@qid,'Last Column',1)
insert into ans(ans_q,ansname) values(@qid,'Banded Columns')
insert into ans(ans_q,ansname) values(@qid,'Header Row')

-- 57
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'By default, table styles override the formatting applied to individual table cells.','By default, table styles override formatting applied to individual table cells.','NPEX 6-41')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 58
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following is an unacceptable name for an Excel table?','Which name is not valid for an Excel table?','NPEX 6-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Employee_Tbl')
insert into ans(ans_q,ansname) values(@qid,'_SalesTable')
insert into ans(ans_q,ansname,correct) values(@qid,'(Customers)',1)
insert into ans(ans_q,ansname) values(@qid,'ProductTable')

-- 59
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To add a field to a table, what can you do?','How can you add a field to an Excel table?','NPEX 6-43')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Click a row heading and then click the Insert button.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click a column header and then click the Insert button.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the Insert button and then click Field.')
insert into ans(ans_q,ansname) values(@qid,'Click the Field check box in the Table Style Options group.')

-- 60
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Antonio wants to calculate the sum of values in the Order Amt column in a table. What should he do?','Antonio wants to calculate the sum of the Order Amt column in a table. What should he do?','NPEX 6-41')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Add a total row and then choose Sum in the Order Amt column.',1)
insert into ans(ans_q,ansname) values(@qid,'Add a calculated field to the table that uses the SUM function.')
insert into ans(ans_q,ansname) values(@qid,'Use the SUBTOTAL function at the bottom of the Order Amt column.')
insert into ans(ans_q,ansname) values(@qid,'Add a total column and then choose Total to calculate all totals for the table.')

-- 61
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you select a cell in a worksheet that is not in the first row or first column and then click the Split button on the View tab, how many panes appear in the worksheet window?','If you select a cell outside the first row and first column and click Split, how many panes appear?','NPEX 6-6')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'six')
insert into ans(ans_q,ansname) values(@qid,'two')
insert into ans(ans_q,ansname,correct) values(@qid,'four',1)
insert into ans(ans_q,ansname) values(@qid,'three')

select * from q
where q_act=@actid
