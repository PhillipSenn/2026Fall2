insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 4',8,107,'Test/bank.cfm',4)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Binay wants to create an X-Y scatter plot. To do so, he should select the data he wants to plot in the scatter chart, then click the Insert tab, and then click Insert Scatter (X, Y) or Bubble Chart.','To create an X-Y scatter chart, select the data, choose Insert, then select Insert Scatter (X, Y) or Bubble Chart.','NPEX 4-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To which of the following chart types can you not add axis titles?','Which chart type does not support axis titles?','NPEX 4-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Pie chart',1)
insert into ans(ans_q,ansname) values(@qid,'Line chart')
insert into ans(ans_q,ansname) values(@qid,'Area chart')
insert into ans(ans_q,ansname) values(@qid,'Column chart')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following chart types show how two numeric data series are related to each other?','Which chart type shows the relationship between two numeric data series?','NPEX 4-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Pie')
insert into ans(ans_q,ansname) values(@qid,'Bar')
insert into ans(ans_q,ansname) values(@qid,'Line')
insert into ans(ans_q,ansname,correct) values(@qid,'Scatter',1)

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Niki wants to insert a Line sparkline in Excel. To do this, she can click on the cell she wants to insert a Sparkline, then click Insert tab, select Line Sparkline from the Sparklines group and then OK.','To insert a Line sparkline, select its destination cell, choose Insert, select Line in the Sparklines group, and click OK.','NPEX 4-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A Line sparkline displays a green block for increasing values and a red block for declining values.','A Line sparkline uses green and red blocks to show increasing and decreasing values.','NPEX 4-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can add data markers to sparklines to indicate the high and low points in the chart.','You can add markers to sparklines to identify high and low values.','NPEX 4-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Because of their compact size, you cannot apply a style to a sparkline.','Sparklines are too small to have styles applied to them.','NPEX 4-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Before inserting sparklines into cells, make sure the cells are blank because sparklines replace cell contents.','Cells should be blank before inserting sparklines because sparklines replace existing cell contents.','NPEX 4-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change a chart title, you click the chart title, type the new title, and then press ENTER.','To rename a chart title, select the title, type the new text, and press Enter.','NPEX 4-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Column and line sparklines show a general trend without a legend, title, or gridlines.','Column and Line sparklines show trends without legends, titles, or gridlines.','NPEX 4-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You should move a chart to a chart sheet when you want the source data to appear with the chart.','Move a chart to a chart sheet when you want the chart and its source data displayed together.','NPEX 4-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following dialog boxes do you use to remove a data series from a chart?','Which dialog box lets you remove a data series from a chart?','NPEX 4-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Chart Elements dialog box')
insert into ans(ans_q,ansname) values(@qid,'Format Data Source dialog box')
insert into ans(ans_q,ansname,correct) values(@qid,'Select Data Source dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Insert Chart dialog box')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What can you do to make data series easier to distinguish from one another?','What can make multiple data series easier to distinguish from one another?','NPEX 4-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Change the chart type.')
insert into ans(ans_q,ansname,correct) values(@qid,'Change the color of the data series.',1)
insert into ans(ans_q,ansname) values(@qid,'Apply additional text styles.')
insert into ans(ans_q,ansname) values(@qid,'Increase the size of the data series.')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following can you do to make a chart title stand out on a chart?','What can you change to make a chart title more noticeable?','NPEX 4-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Change the text direction.')
insert into ans(ans_q,ansname) values(@qid,'Resize the chart.')
insert into ans(ans_q,ansname) values(@qid,'Display the title on the outside end of the data series.')
insert into ans(ans_q,ansname,correct) values(@qid,'Increase the font size.',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A treemap chart is a type of waterfall chart.','A treemap chart is a type of waterfall chart.','NPEX 4-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you see cells with blue fills of varying lengths representing the values, the cells most likely have ________ applied to them.','If cells contain blue bars of different lengths based on their values, what formatting is being used?','NPEX 4-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'themes')
insert into ans(ans_q,ansname) values(@qid,'icon sets')
insert into ans(ans_q,ansname,correct) values(@qid,'data bars',1)
insert into ans(ans_q,ansname) values(@qid,'cell styles')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following elements can you add to a chart to display a line representing the general direction in a data series?','Which chart element shows the overall direction of a data series?','NPEX 4-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Axes')
insert into ans(ans_q,ansname) values(@qid,'Legend')
insert into ans(ans_q,ansname) values(@qid,'Gridlines')
insert into ans(ans_q,ansname,correct) values(@qid,'Trendline',1)

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Use a sunburst chart to track the addition and subtraction of values in a sum.','A sunburst chart tracks additions and subtractions within a total.','NPEX 4-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A combination chart combines two chart types and can plot data on primary and secondary axes.','A combination chart can use two chart types and display data on both primary and secondary axes.','NPEX 4-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In a chart, a data table displays the data series in rows and the category values in columns.','A chart data table displays data series in rows and category values in columns.','NPEX 4-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following changes can you apply to a chart legend? Select all the options that apply.','Which properties of a chart legend can you change? Select 2 that apply.','NPEX 4-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Position',1)
insert into ans(ans_q,ansname) values(@qid,'Data Series colors')
insert into ans(ans_q,ansname,correct) values(@qid,'Fill color',1)
insert into ans(ans_q,ansname) values(@qid,'Number formatting')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To compare data from different categories where the values are indicated by the height of the data series, select a Stock chart on the Recommended Charts tab in the Insert Chart dialog box.','A Stock chart is the best choice for comparing categories using the height of each data series.','NPEX 4-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Alicia created a chart that shows months in rows and prices in columns. She can switch the rows and columns to show prices in rows and months in columns.','You can switch a chart''s rows and columns to reverse which data appears in rows and columns.','NPEX 4-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following can you change in a combination chart? Select all the options that apply.','Which combination-chart axis settings can you change? Select 3 that apply.','NPEX 4-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'The bounds of the secondary axis',1)
insert into ans(ans_q,ansname,correct) values(@qid,'The major tick marks on the primary axis',1)
insert into ans(ans_q,ansname) values(@qid,'The minor tick marks on all axes')
insert into ans(ans_q,ansname,correct) values(@qid,'The orientation of the axis titles',1)

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following statements describe a histogram chart? Select all the options that apply.','Which statements describe a histogram chart? Select 3 that apply.','NPEX 4-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'It is a column chart showing the distribution of values from a single data series.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Use it to display distribution of scores on an exam.,',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Data values are allocated to bins.',1)
insert into ans(ans_q,ansname) values(@qid,'It includes a secondary line chart.')

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A trendline is a line that extends from the chart''s horizontal or vertical axis into the plot area, making it easier to identify the values in the chart.','A trendline is a line extending from an axis into the plot area to help identify chart values.','NPEX 4-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To align the upper-left corner of a chart with the upper-left corner of a cell, press and hold CTRL as you drag the chart.','Hold CTRL while dragging a chart to align its upper-left corner with a cell''s upper-left corner.','NPEX 4-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following options can you set when you create or edit a data bar conditional formatting rule? Select all the options that apply.','Which data-bar formatting options can you change? Select 3 that apply.','NPEX 4-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'value used for the longest data bar',1)
insert into ans(ans_q,ansname,correct) values(@qid,'fill color of the data bars',1)
insert into ans(ans_q,ansname,correct) values(@qid,'how to display negative values',1)
insert into ans(ans_q,ansname) values(@qid,'font color of the text')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you create a custom combination chart, which of the following chart types can you use for the primary and secondary axis? Select all the options that apply.','Which chart types can be used for the primary and secondary axes in a custom combination chart? Select 2 that apply.','NPEX 4-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Line',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Clustered Column',1)
insert into ans(ans_q,ansname) values(@qid,'Treemap')
insert into ans(ans_q,ansname) values(@qid,'Waterfall')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Annemarie lists 12 months of product sales data in the range A3:M7. The products are listed in the range A3:A7 and the monthly sales data in the range B3:M7. She wants to display a simple chart at the end of each row in column N to track the monthly sales for each product. What can she insert in the range N3:N7?','Which feature can display a small monthly-sales chart in each cell of N3:N7?','NPEX 4-50')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Line chart')
insert into ans(ans_q,ansname,correct) values(@qid,'Line sparklines',1)
insert into ans(ans_q,ansname) values(@qid,'Scatter chart')
insert into ans(ans_q,ansname) values(@qid,'Data bars')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can add data markers to sparklines to highlight which of the following values? Select all the options that apply.','Which values can sparkline markers highlight? Select 4 that apply.','NPEX 4-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'low values',1)
insert into ans(ans_q,ansname,correct) values(@qid,'high values',1)
insert into ans(ans_q,ansname,correct) values(@qid,'ending values',1)
insert into ans(ans_q,ansname,correct) values(@qid,'negative values',1)

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Bree added data labels to a pie chart, where they appear on each slice. She wants the data labels to appear outside of the pie chart but close to each slice. Which Label Position option should she select for the data labels?','Which data-label position places pie-chart labels just outside the slices?','NPEX 4-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Center')
insert into ans(ans_q,ansname) values(@qid,'Inside End')
insert into ans(ans_q,ansname,correct) values(@qid,'Outside End',1)
insert into ans(ans_q,ansname) values(@qid,'Overlay')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A _____ chart tracks the addition and subtraction of values within a sum.','Which chart type tracks additions and subtractions within a total?','NPEX 4-47')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'waterfall',1)
insert into ans(ans_q,ansname) values(@qid,'histogram')
insert into ans(ans_q,ansname) values(@qid,'scatter')
insert into ans(ans_q,ansname) values(@qid,'combo')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which type of sparklines can most clearly display the daily fluctuations of the selling price of goods or commodities ?','Which sparkline type best shows daily fluctuations in prices?','NPEX 4-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Line',1)
insert into ans(ans_q,ansname) values(@qid,'Win/Loss')
insert into ans(ans_q,ansname) values(@qid,'Column')
insert into ans(ans_q,ansname) values(@qid,'Combo')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What can you change to coordinate the values represented by sparklines with the values of other charts and graphic objects on a worksheet?','What sparkline setting can you change to coordinate its values with other charts on the worksheet?','NPEX 4-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'sparkline type')
insert into ans(ans_q,ansname) values(@qid,'sparkline color')
insert into ans(ans_q,ansname) values(@qid,'show or hide data markers')
insert into ans(ans_q,ansname,correct) values(@qid,'scale of the sparkline axis',1)

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Descriptive text that appears next to a chart''s horizontal or vertical axis is called which of the following?','What is the descriptive text beside a chart''s horizontal or vertical axis called?','NPEX 4-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'major tick mark')
insert into ans(ans_q,ansname) values(@qid,'display units')
insert into ans(ans_q,ansname,correct) values(@qid,'axis title',1)
insert into ans(ans_q,ansname) values(@qid,'data label')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which type of chart combines a column chart and a line chart to indicate which factors are the largest contributors to the whole?','Which chart combines columns and a line to show the largest contributors to a total?','NPEX 4-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'sunburst')
insert into ans(ans_q,ansname,correct) values(@qid,'Pareto',1)
insert into ans(ans_q,ansname) values(@qid,'area')
insert into ans(ans_q,ansname) values(@qid,'doughnut')

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which type of conditional formatting rule would you create to add a horizontal bar to a cell background, where the length of the bar reflects the value in the cell?','Which conditional formatting rule adds a horizontal bar whose length represents the cell''s value?','NPEX 4-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Top Values')
insert into ans(ans_q,ansname,correct) values(@qid,'Data Bar',1)
insert into ans(ans_q,ansname) values(@qid,'Icon Sets')
insert into ans(ans_q,ansname) values(@qid,'Color Scales')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A label that appears as a text bubble attached to a data marker is called which of the following?','What do you call a text bubble attached to a chart''s data marker?','NPEX 4-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'data callout',1)
insert into ans(ans_q,ansname) values(@qid,'histogram')
insert into ans(ans_q,ansname) values(@qid,'data bar')
insert into ans(ans_q,ansname) values(@qid,'sparkline')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Amir wants an exploded pie chart. Which of the following should he do?','How do you explode one or more slices of a pie chart?','NPEX 4-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the Explode Pie button')
insert into ans(ans_q,ansname,correct) values(@qid,'Drag the pie slice(s) away from the pie.',1)
insert into ans(ans_q,ansname) values(@qid,'Right-click on the slice(s) of pie and select Explode Piece.')
insert into ans(ans_q,ansname) values(@qid,'There is no way he can explode the pie chart.')

select * from q 
where q_act=@actid
