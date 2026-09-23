insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 10',8,107,'Test/bank.cfm',10)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A single PivotTable can draw information from two tables if the tables are _____.','A single PivotTable can draw information from two tables if the tables are _____.','NPEX 10-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'related',1)
insert into ans(ans_q,ansname) values(@qid,'similar')
insert into ans(ans_q,ansname) values(@qid,'from the same source')
insert into ans(ans_q,ansname) values(@qid,'filtered')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One advantage of forecast sheets is that they can analyze seasonal data in which the values follow a periodic pattern during the calendar year.','One advantage of forecast sheets is that they can analyze seasonal data in which the values follow a periodic pattern during the calendar year.','NPEX 10-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When creating a data query in Excel, you create a dynamic connection to an existing Excel table and refresh the connection when the data in table changes.','When creating a data query in Excel, you create a dynamic connection to an existing Excel table and refresh the connection when the data in table changes.','NPEX 10-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To transform the data from the data source before loading the data into an Excel table, use the Power Query Editor window','To transform the data from the data source before loading the data into an Excel table, use the Power Query Editor window','NPEX 10-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Queried data can be imported into an Excel table, PivotTable, or PivotChart.','Queried data can be imported into an Excel table, PivotTable, or PivotChart.','NPEX 10-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Alberto wants to remove columns he doesn''t need from his query. To do so, he can select the columns he wants to remove and then select Remove Columns in the Query Editor ribbon.','Alberto wants to remove columns he doesn''t need from his query. To do so, he can select the columns he wants to remove and then select Remove Columns in the Query Editor ribbon.','NPEX 10-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To retrieve data values from a comma-separated values (CSV) file, you use the From Text/CSV button in the Get & Transform group on the Data tab.','To retrieve data values from a comma-separated values (CSV) file, you use the From Text/CSV button in the Get & Transform group on the Data tab.','NPEX 10-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following map charts assign the same color to regions in the same category?','Which map charts assign the same color to regions in the same category?','NPEX 10-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'value map')
insert into ans(ans_q,ansname) values(@qid,'waterfall map')
insert into ans(ans_q,ansname,correct) values(@qid,'category map',1)
insert into ans(ans_q,ansname) values(@qid,'surface map')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which trendlines cannot be used with a scatter plot whose data contains negative values or zero? Select all the options that apply.','Which trendlines cannot be used with a scatter plot whose data contains negative values or zero?. Select 2 that apply.','NPEX 10-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Exponential',1)
insert into ans(ans_q,ansname) values(@qid,'Linear')
insert into ans(ans_q,ansname,correct) values(@qid,'Power',1)
insert into ans(ans_q,ansname) values(@qid,'Polynomial')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In what Power Pivot view can you define a relationship by dragging a common field between two tables to connect them?','In what Power Pivot view can you define a relationship by dragging a common field between two tables to connect them?','NPEX 10-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Diagram view',1)
insert into ans(ans_q,ansname) values(@qid,'Design view')
insert into ans(ans_q,ansname) values(@qid,'Datasheet view')
insert into ans(ans_q,ansname) values(@qid,'Query view')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Where can you rename a data query?','Where can you rename a data query?','NPEX 10-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Query Settings pane',1)
insert into ans(ans_q,ansname) values(@qid,'Connections pane')
insert into ans(ans_q,ansname) values(@qid,'Query tab')
insert into ans(ans_q,ansname) values(@qid,'Power Pivot Table view')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following tools do you use to view the contents of the Data Model?','Which tools do you use to view the contents of the Data Model?','NPEX 10-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Power Pivot',1)
insert into ans(ans_q,ansname) values(@qid,'PivotChart')
insert into ans(ans_q,ansname) values(@qid,'Power Query')
insert into ans(ans_q,ansname) values(@qid,'Model View')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you import a query into an Excel table, what does Excel use for the table name?','When you import a query into an Excel table, what does Excel use for the table name?','NPEX 10-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'name of the current worksheet')
insert into ans(ans_q,ansname,correct) values(@qid,'name of the imported query',1)
insert into ans(ans_q,ansname) values(@qid,'Table1')
insert into ans(ans_q,ansname) values(@qid,'Query1')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a relationship between two tables, the first step would be to click on Relationships in the Relationships group on the Database Tools tab.','To create a relationship between two tables, the first step would be to click on Relationships in the Relationships group on the Database Tools tab.','NPEX 10-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A structured collection of data values, often organized into tables with each table focusing on a single subject, is a ________.','A structured collection of data values, often organized into tables with each table focusing on a single subject, is a ________.','NPEX 10-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'webpage,')
insert into ans(ans_q,ansname) values(@qid,'CSV text file')
insert into ans(ans_q,ansname,correct) values(@qid,'database',1)
insert into ans(ans_q,ansname) values(@qid,'form')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Maureen added a trendline to a chart that shows sales trends for the past 10 years. To extend the trendline to forecast sales for the next two years, she enters 2 in the Backward box in the Format Trendline pane.','Maureen added a trendline to a chart that shows sales trends for the past 10 years. To extend the trendline to forecast sales for the next two years, she enters 2 in the Backward box in the Format Trendline pane.','NPEX 10-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you display all the queries in the current workbook?','How can you display all the queries in the current workbook?','NPEX 10-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Open the Power Query Editor window.')
insert into ans(ans_q,ansname,correct) values(@qid,'Open the Queries & Connections pane.',1)
insert into ans(ans_q,ansname) values(@qid,'Open the Business Intelligence pane.')
insert into ans(ans_q,ansname) values(@qid,'Open the Get Data dialog box.')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Because loading data from a query creates a snapshot of the data, if the values in the data source change, you need to _____ the connection..','Because loading data from a query creates a snapshot of the data, if the values in the data source change, you need to _____ the connection.','NPEX 10-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'freeze')
insert into ans(ans_q,ansname) values(@qid,'save')
insert into ans(ans_q,ansname,correct) values(@qid,'refresh',1)
insert into ans(ans_q,ansname) values(@qid,'delete')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Access to the Data Model a database attached to an Excel workbook, is provided by which of the following?','Access to the Data Model a database attached to an Excel workbook, is provided by which?','NPEX 10-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A PivotChart')
insert into ans(ans_q,ansname,correct) values(@qid,'Power Pivot',1)
insert into ans(ans_q,ansname) values(@qid,'Solver')
insert into ans(ans_q,ansname) values(@qid,'A timeline slicer')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Sheila imported a Clients table and a Projects table and wants to create a PivotTable that uses fields from both tables. She can link the tables using their common ClientID field. Because one client can have many projects, she will create a one-to-many connection.','Sheila imported a Clients table and a Projects table and wants to create a PivotTable that uses fields from both tables. She can link the tables using their common ClientID field. Because one client can have many projects, she will create a one-to-many connection.','NPEX 10-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A(n) hierarchy is an organization of fields that start with the most general and go down to the most specific.','A(n) hierarchy is an organization of fields that start with the most general and go down to the most specific.','NPEX 10-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are types of trendlines you can add to scatter charts? Select all the options that apply.','Which are types of trendlines you can add to scatter charts?. Select 3 that apply.','NPEX 10-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Linear',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Logarithmic',1)
insert into ans(ans_q,ansname) values(@qid,'Weighted')
insert into ans(ans_q,ansname,correct) values(@qid,'Exponential',1)

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Andrea wants to import data from a file that contains numbers organized in columns separated by tab characters. Which option should she select in the Get & Transform group on the Data tab?','Andrea wants to import data from a file that contains numbers organized in columns separated by tab characters. Which option should she select in the Get & Transform group on the Data tab?','NPEX 10-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'From Web')
insert into ans(ans_q,ansname,correct) values(@qid,'From Text/CSV',1)
insert into ans(ans_q,ansname) values(@qid,'From Table/Range')
insert into ans(ans_q,ansname) values(@qid,'From Delimited')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After clicking the Get Data button on the Data tab, what do you select to import an Access database table into Excel?','After clicking the Get Data button on the Data tab, what do you select to import an Access database table into Excel?','NPEX 10-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Point to From Database and click From Microsoft Access Database.',1)
insert into ans(ans_q,ansname) values(@qid,'Click Import and then click Access.')
insert into ans(ans_q,ansname) values(@qid,'Click Access Database Wizard.')
insert into ans(ans_q,ansname) values(@qid,'Click Navigate and then click Microsoft Access.')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is (are) sections in a 3-D map window? Select all the options that apply.','Which is (are) sections in a 3-D map window?. Select 4 that apply.','NPEX 10-60')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'The Layer pane',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Field List pane',1)
insert into ans(ans_q,ansname,correct) values(@qid,'A map of the data',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Tour Editor pane',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which type of map displays markers with colors of increasing intensity determined by the values of a numeric field?','Which type of map displays markers with colors of increasing intensity determined by the values of a numeric field?','NPEX 10-62')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Stacked Column map')
insert into ans(ans_q,ansname,correct) values(@qid,'Heat map',1)
insert into ans(ans_q,ansname) values(@qid,'Bubble map')
insert into ans(ans_q,ansname) values(@qid,'Region map')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you remove columns from a query, it affects only the data imported into Excel, not the data in the data source.','When you remove columns from a query, it affects only the data imported into Excel, not the data in the data source.','NPEX 10-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the Remove Rows command in the Power Query Editor to remove which of the following rows? Select all the options that apply.','You can use the Remove Rows command in the Power Query Editor to remove which rows?. Select 4 that apply.','NPEX 10-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'top rows',1)
insert into ans(ans_q,ansname,correct) values(@qid,'bottom rows',1)
insert into ans(ans_q,ansname,correct) values(@qid,'duplicate rows',1)
insert into ans(ans_q,ansname,correct) values(@qid,'blank rows',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are ways you can transform data using Power Query? Select all the options that apply.','Which are ways you can transform data using Power Query?. Select 3 that apply.','NPEX 10-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Calculate summary statistics',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Create new columns',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Group data values',1)
insert into ans(ans_q,ansname) values(@qid,'Apply conditional formats')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Gina is working with a query that includes an Income field and a Month field. She wants the query to return the total income for each month. She can sort the query by the values in the Month column and then create a column that sums the Income field.','Gina is working with a query that includes an Income field and a Month field. She wants the query to return the total income for each month. She can sort the query by the values in the Month column and then create a column that sums the Income field.','NPEX 10-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Brian wants to filter a PivotTable by the Appointment Date field. To do so, he should create a calendar slicer.','Brian wants to filter a PivotTable by the Appointment Date field. To do so, he should create a calendar slicer.','NPEX 10-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a worksheet containing forecasted values, including those that follow a seasonal pattern, click the _____ button on the Data tab.','To create a worksheet containing forecasted values, including those that follow a seasonal pattern, click the _____ button on the Data tab.','NPEX 10-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Outline')
insert into ans(ans_q,ansname) values(@qid,'Data Model')
insert into ans(ans_q,ansname) values(@qid,'Trendline')
insert into ans(ans_q,ansname,correct) values(@qid,'Forecast Sheet',1)

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you want to load data such as an Access table into the Data Model, which option do you select in the Import Data dialog box?','When you want to load data such as an Access table into the Data Model, which option do you select in the Import Data dialog box?','NPEX 10-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Add this data to the Data Model',1)
insert into ans(ans_q,ansname) values(@qid,'Existing worksheet')
insert into ans(ans_q,ansname) values(@qid,'New worksheet')
insert into ans(ans_q,ansname) values(@qid,'Queries pane')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After Eduardo adds three fields to the Rows area of a PivotTable, he can use the open and collapse buttons to drill up and down the data.','After Eduardo adds three fields to the Rows area of a PivotTable, he can use the open and collapse buttons to drill up and down the data.','NPEX 10-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You import data from an external source into a worksheet using the _____.','You import data from an external source into a worksheet using the _____.','NPEX 10-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Data Model')
insert into ans(ans_q,ansname) values(@qid,'default PivotTable')
insert into ans(ans_q,ansname) values(@qid,'Import Wizard')
insert into ans(ans_q,ansname,correct) values(@qid,'Power Query Editor',1)

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you are importing financial data from a text file that uses commas in currency values, make sure it uses _____ to separate the columns of values.','If you are importing financial data from a text file that uses commas in currency values, make sure it uses _____ to separate the columns of values.','NPEX 10-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'periods')
insert into ans(ans_q,ansname,correct) values(@qid,'tab characters',1)
insert into ans(ans_q,ansname) values(@qid,'paragraph marks')
insert into ans(ans_q,ansname) values(@qid,'commas')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A limitation of Excel map charts is that they cannot be used directly with PivotTables.','A limitation of Excel map charts is that they cannot be used directly with PivotTables.','NPEX 10-59')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Janelle created a data query to import data into Excel. She can now load the data into which of the following? Select all the options that apply.','Janelle created a data query to import data into Excel. She can now load the data into which?. Select 3 that apply.','NPEX 10-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Excel table',1)
insert into ans(ans_q,ansname) values(@qid,'text file')
insert into ans(ans_q,ansname,correct) values(@qid,'PivotTable',1)
insert into ans(ans_q,ansname,correct) values(@qid,'PivotChart',1)

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Davis wants to create a 3-D map in Excel Which of the following windows does he open to create the map?','Davis wants to create a 3-D map in Excel Which windows does he open to create the map?','NPEX 10-60')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Create a New Map window')
insert into ans(ans_q,ansname) values(@qid,'New Map Chart window')
insert into ans(ans_q,ansname,correct) values(@qid,'3-D Maps window',1)
insert into ans(ans_q,ansname) values(@qid,'Map Outline window')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the Query Properties dialog box to have Excel automatically refresh data in a query.','You can use the Query Properties dialog box to have Excel automatically refresh data in a query.','NPEX 10-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you group data in a query, Power Query adds a new column that summarizes the numeric values in the group. What information do you need to provide to create a group using the Group By dialog box? Select all the options that apply.','When you group data in a query, Power Query adds a new column that summarizes the numeric values in the group. What information do you need to provide to create a group using the Group By dialog box?. Select 3 that apply.','NPEX 10-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'column to group by',1)
insert into ans(ans_q,ansname,correct) values(@qid,'name of the new column',1)
insert into ans(ans_q,ansname,correct) values(@qid,'operation to use for summarizing the numeric values',1)
insert into ans(ans_q,ansname) values(@qid,'name of the worksheet containing the query')

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Abby created a scatter chart showing her company''s annual expenses for the past 15 years. She also wants to highlight the general pattern of expense amounts. What can she add to the scatter chart?','Abby created a scatter chart showing her company''s annual expenses for the past 15 years. She also wants to highlight the general pattern of expense amounts. What can she add to the scatter chart?','NPEX 10-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'data labels')
insert into ans(ans_q,ansname) values(@qid,'gridlines')
insert into ans(ans_q,ansname,correct) values(@qid,'trendline',1)
insert into ans(ans_q,ansname) values(@qid,'secondary axis')

select * from q 
where q_act=@actid
