insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 7',8,107,'Test/bank.cfm',7)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Edwin wants to insert a PivotChart to summarize sales data. On which of the following should he base the new PivotChart?','Edwin wants to insert a PivotChart to summarize sales data. On which should he base the new PivotChart?','NPEX 7-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'an existing PivotTable',1)
insert into ans(ans_q,ansname) values(@qid,'another PivotChart')
insert into ans(ans_q,ansname) values(@qid,'a column or bar chart on another worksheet')
insert into ans(ans_q,ansname) values(@qid,'a slicer on the same worksheet')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following groups and summarizes data in a concise format of rows and columns?','Which groups and summarizes data in a concise format of rows and columns?','NPEX 7-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Area chart')
insert into ans(ans_q,ansname,correct) values(@qid,'PivotTable',1)
insert into ans(ans_q,ansname) values(@qid,'Slicer')
insert into ans(ans_q,ansname) values(@qid,'Filter')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Jin wants to insert a recommended PivotTable. After clicking a cell in a data range, what should he select?','Jin wants to insert a recommended PivotTable. After clicking a cell in a data range, what should he select?','NPEX 7-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'PivotTable button on the Charts tab')
insert into ans(ans_q,ansname) values(@qid,'PivotTable button on the Insert tab')
insert into ans(ans_q,ansname,correct) values(@qid,'Recommended PivotTables button on the Insert tab',1)
insert into ans(ans_q,ansname) values(@qid,'Recent PivotTables button on the Insert tab')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To which of the following locations can you move a PivotChart?','To which locations can you move a PivotChart?','NPEX 7-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'New workbook')
insert into ans(ans_q,ansname,correct) values(@qid,'Worksheet in the current workbook',1)
insert into ans(ans_q,ansname) values(@qid,'Worksheet in a different workbook')
insert into ans(ans_q,ansname) values(@qid,'You cannot move a PivotChart')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of these is the default layout for a newly created Pivot table?','Which of these is the default layout for a newly created Pivot table?','NPEX 7-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Compact Form',1)
insert into ans(ans_q,ansname) values(@qid,'Outline Form')
insert into ans(ans_q,ansname) values(@qid,'Tabular Form')
insert into ans(ans_q,ansname) values(@qid,'Chart Form')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is the default name assigned to the first PivotTable in a workbook?','Which is the default name assigned to the first PivotTable in a workbook?','NPEX 7-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Table1')
insert into ans(ans_q,ansname) values(@qid,'New PivotTable')
insert into ans(ans_q,ansname,correct) values(@qid,'PivotTable1',1)
insert into ans(ans_q,ansname) values(@qid,'Pivot1')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If a PivotTable field is expanded, you can click the minus button to collapse the field and hide field details.','If a PivotTable field is expanded, you can click the minus button to collapse the field and hide field details.','NPEX 7-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is the default function Excel uses to summarize non-numeric data in a PivotTable?','Which is the default function Excel uses to summarize non-numeric data in a PivotTable?','NPEX 7-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'SUM')
insert into ans(ans_q,ansname,correct) values(@qid,'COUNT',1)
insert into ans(ans_q,ansname) values(@qid,'MIN')
insert into ans(ans_q,ansname) values(@qid,'VAR')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The PivotTable Fields pane lists the fields available to the PivotTable.','The PivotTable Fields pane lists the fields available to the PivotTable.','NPEX 7-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you add two fields to the Rows area of a PivotTable, you can click the plus box to expand the fields and display their values.','If you add two fields to the Rows area of a PivotTable, you can click the plus box to expand the fields and display their values.','NPEX 7-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You use the Values area to limit a PivotChart to values that satisfy a specified criteria.','You use the Values area to limit a PivotChart to values that satisfy a specified criteria.','NPEX 7-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To hide the PivotTable Fields pane, deselect the Field List button on the PivotTable Tools Analyze tab.','To hide the PivotTable Fields pane, deselect the Field List button on the PivotTable Tools Analyze tab.','NPEX 7-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a PivotTable layout, you can drag fields from the field list to an area box in the PivotTable Fields pane.','To create a PivotTable layout, you can drag fields from the field list to an area box in the PivotTable Fields pane.','NPEX 7-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To remove a field from a PivotTable, drag the field''s icon from the area box and drop it on an empty section of the worksheet.','To remove a field from a PivotTable, drag the field''s icon from the area box and drop it on an empty section of the worksheet.','NPEX 7-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you create a PivotTable and then add data to its data source, you must refresh the PivotTable to update the data.','If you create a PivotTable and then add data to its data source, you must refresh the PivotTable to update the data.','NPEX 7-66')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Xan wants to change the number format in a PivotTable and its PivotChart. To do so, she can use the Number Format button in the Value Field Settings dialog box.','Xan wants to change the number format in a PivotTable and its PivotChart. To do so, she can use the Number Format button in the Value Field Settings dialog box.','NPEX 7-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you add fields to the Columns area of a PivotTable, they appear as headings at the top of the table.','When you add fields to the Columns area of a PivotTable, they appear as headings at the top of the table.','NPEX 7-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you add a field to the Filters area of a PivotTable, Excel displays a slicer near the top of the worksheet.','When you add a field to the Filters area of a PivotTable, Excel displays a slicer near the top of the worksheet.','NPEX 7-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Every PivotTable includes a Totals area as one of its four primary areas.','Every PivotTable includes a Totals area as one of its four primary areas.','NPEX 7-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Add a numeric field to the Values area to sum values for each intersection of a row category and column category.','Add a numeric field to the Values area to sum values for each intersection of a row category and column category.','NPEX 7-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The scores of a student in two subjects are inserted in cells B2 and C2. The passing score for each subject is 60. Which of the following formulas returns TRUE if at least one score is greater than or equal to 60, or else it returns FALSE?','The scores of a student in two subjects are inserted in cells B2 and C2. The passing score for each subject is 60. Which formulas returns TRUE if at least one score is greater than or equal to 60, or else it returns FALSE?','NPEX 7-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=IF(B2>=60, C2>=60)')
insert into ans(ans_q,ansname,correct) values(@qid,'=OR(B2>=60, C2>=60)',1)
insert into ans(ans_q,ansname) values(@qid,'=AND(B2>=60, C2>=60)')
insert into ans(ans_q,ansname) values(@qid,'=NOT(OR(B2>=60, C2>=60))')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The value in cell B2 cell is 65. In cell C2, the value is 75. Which of the following formulas returns FALSE if any of the conditions are false for the values in cells B2 and C2?','The value in cell B2 cell is 65. In cell C2, the value is 75. Which formulas returns FALSE if any of the conditions are false for the values in cells B2 and C2?','NPEX 7-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=IF(B2>=70, C2>=80)')
insert into ans(ans_q,ansname) values(@qid,'=OR(B2>=70, C2>=80)')
insert into ans(ans_q,ansname,correct) values(@qid,'=AND(B2>=70, C2>=80)',1)
insert into ans(ans_q,ansname) values(@qid,'=NOT(OR(B2>=70, C2>=80))')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions would you use to find the column location of specified text?','Which functions would you use to find the column location of specified text?','NPEX 7-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'MATCH',1)
insert into ans(ans_q,ansname) values(@qid,'INDEX')
insert into ans(ans_q,ansname) values(@qid,'VLOOKUP')
insert into ans(ans_q,ansname) values(@qid,'HLOOKUP')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If a worksheet arranges lookup values in rows rather than columns, which function is best for retrieving data from the lookup table?','If a worksheet arranges lookup values in rows rather than columns, which function is best for retrieving data from the lookup table?','NPEX 7-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'VLOOKUP')
insert into ans(ans_q,ansname,correct) values(@qid,'HLOOKUP',1)
insert into ans(ans_q,ansname) values(@qid,'INDEX')
insert into ans(ans_q,ansname) values(@qid,'MATCH')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The _____ function returns the value from a range of data at the intersection of the specified row and column indexes.','The _____ function returns the value from a range of data at the intersection of the specified row and column indexes.','NPEX 7-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'INDEX',1)
insert into ans(ans_q,ansname) values(@qid,'MATCH')
insert into ans(ans_q,ansname) values(@qid,'LOOKUP')
insert into ans(ans_q,ansname) values(@qid,'ARRAY')

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you drill down a PivotTable to display detailed data?','How can you drill down a PivotTable to display detailed data?','NPEX 7-65')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Double-click a cell in the PivotTable.',1)
insert into ans(ans_q,ansname) values(@qid,'Right-click a cell in the PivotTable, and then click Details.')
insert into ans(ans_q,ansname) values(@qid,'Add a field to the Drill area of the PivotTable.')
insert into ans(ans_q,ansname) values(@qid,'Click the minus button next to a field in the PivotTable.')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following chart types can be created as a PivotChart? Select all the options that apply.','Which chart types can be created as a PivotChart?. Select 3 that apply.','NPEX 7-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Column',1)
insert into ans(ans_q,ansname) values(@qid,'Scatter')
insert into ans(ans_q,ansname,correct) values(@qid,'Line',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Area',1)

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You should not move a PivotChart because it must be on the same worksheet as its PivotTable.','You should not move a PivotChart because it must be on the same worksheet as its PivotTable.','NPEX 7-53')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following formatting options can you apply to PivotCharts ? Select all the options that apply.','Which formatting options can you apply to PivotCharts?. Select 4 that apply.','NPEX 7-58')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Quick Layout',1)
insert into ans(ans_q,ansname,correct) values(@qid,'chart style',1)
insert into ans(ans_q,ansname,correct) values(@qid,'show/hide field buttons',1)
insert into ans(ans_q,ansname,correct) values(@qid,'value number format',1)

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In a PivotTable, when Romy adds a field to the Values area , he creates a filter button that can limit the PivotTable to only those values in the field matching specified criteria.','In a PivotTable, when Romy adds a field to the Values area, he creates a filter button that can limit the PivotTable to only those values in the field matching specified criteria.','NPEX 7-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What must you do to hide the field buttons of a PivotTable?','What must you do to hide the field buttons of a PivotTable?','NPEX 7-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click Field Buttons on the PivotChart Analyze tab.',1)
insert into ans(ans_q,ansname) values(@qid,'Right-click the field buttons and select Delete.')
insert into ans(ans_q,ansname) values(@qid,'Remove any slicers.')
insert into ans(ans_q,ansname) values(@qid,'Remove the fields from the PivotTable.')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The VLOOKUP function returns the position of a value found within a row or column','The VLOOKUP function returns the position of a value found within a row or column','NPEX 7-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a timeline slicer for a PivotTable, at least one date field is required','To create a timeline slicer for a PivotTable, at least one date field is required','NPEX 7-63')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To return a true value if any one of multiple conditions is true, use the IF function.','To return a true value if any one of multiple conditions is true, use the IF function.','NPEX 7-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions do you often use with the INDEX function to find data from a specified row and column of data?','Which functions do you often use with the INDEX function to find data from a specified row and column of data?','NPEX 7-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'MATCH',1)
insert into ans(ans_q,ansname) values(@qid,'OR')
insert into ans(ans_q,ansname) values(@qid,'HLOOKUP')
insert into ans(ans_q,ansname) values(@qid,'RANGE')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are functions that calculate statistics only on those cells that match a logical condition? Select all the options that apply.','Which are functions that calculate statistics only on those cells that match a logical condition?. Select 3 that apply.','NPEX 7-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IF')
insert into ans(ans_q,ansname,correct) values(@qid,'COUNTIF',1)
insert into ans(ans_q,ansname,correct) values(@qid,'SUMIF',1)
insert into ans(ans_q,ansname,correct) values(@qid,'AVERAGEIF',1)

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'. One way to filter a PivotChart and PivotTable is to use a slicer.','. One way to filter a PivotChart and PivotTable is to use a slicer.','NPEX 7-60')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To apply a slicer to multiple PivotTables, which of the following should you do?','To apply a slicer to multiple PivotTables, which should you do?','NPEX 7-62')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Copy the slicer and connect them individually to each PivotTables.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click the Report Connections on the Slicer tab and check the appropriate PivotTables.',1)
insert into ans(ans_q,ansname) values(@qid,'Right-click the slicer and select Connect to All PivotTables.')
insert into ans(ans_q,ansname) values(@qid,'A slicer can only be connected to one PivotTable.')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Roberta added a calculated field to the Values area of a PivotTable, where it appears as "Sum of ORDERS." Where can she change the text displayed for this field?','Roberta added a calculated field to the Values area of a PivotTable, where it appears as "Sum of ORDERS." Where can she change the text displayed for this field?','NPEX 7-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Number Format dialog box')
insert into ans(ans_q,ansname) values(@qid,'Calculated Field Format dialog box')
insert into ans(ans_q,ansname,correct) values(@qid,'Value Field Settings dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'PivotTable Options dialog box')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Kevin formatted the values in a PivotTable by selecting the values and then clicking the Accounting Number Format button on the Home tab. When he changed the layout of the PivotTable, he lost the number formatting. Which dialog box should he use instead to ensure the Accounting Number Format persists?','Kevin formatted the values in a PivotTable by selecting the values and then clicking the Accounting Number Format button on the Home tab. When he changed the layout of the PivotTable, he lost the number formatting. Which dialog box should he use instead to ensure the Accounting Number Format persists?','NPEX 7-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Format Cells dialog box')
insert into ans(ans_q,ansname,correct) values(@qid,'Value Field Settings dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'PivotTable Format dialog box')
insert into ans(ans_q,ansname) values(@qid,'Value Properties dialog box')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To select a range of months, click the selection box in the timeline and drag the left or right selection handles over the range of months.','To select a range of months, click the selection box in the timeline and drag the left or right selection handles over the range of months.','NPEX 7-64')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

select * from q 
where q_act=@actid
