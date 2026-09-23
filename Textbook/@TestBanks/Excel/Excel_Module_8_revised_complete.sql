insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 8',8,107,'Test/bank.cfm',8)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A two-variable data table lets you view the relationship between two input cells and one result cell.','A two-variable data table lets you view the relationship between two input cells and one result cell.','NPEX 8-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Scenario Manager dialog box, the changing values are the input cells that change in the worksheet to show the effect of the scenario.','In the Scenario Manager dialog box, the changing values are the input cells that change in the worksheet to show the effect of the scenario.','NPEX 8-25')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One can create a one-variable data table in Excel to test a series of values for a single input cell and see the influence of these values on the result of a related formula.','One can create a one-variable data table in Excel to test a series of values for a single input cell and see the influence of these values on the result of a related formula.','NPEX 8-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'While creating a two-variable data table in Excel, you need to enter two ranges of possible input values, one in a row and another in a column.','While creating a two-variable data table in Excel, you need to enter two ranges of possible input values, one in a row and another in a column.','NPEX 8-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A program that adds commands and features to applications such as Microsoft Excel is called a(n) ________..','A program that adds commands and features to applications such as Microsoft Excel is called a(n) ________.','NPEX 8-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'data table')
insert into ans(ans_q,ansname) values(@qid,'scenario')
insert into ans(ans_q,ansname) values(@qid,'macro')
insert into ans(ans_q,ansname,correct) values(@qid,'add-in',1)

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following would click on the Reports list box in Solver Results dialog box to produce an Answer Report?','Which would click on the Reports list box in Solver Results dialog box to produce an Answer Report?','NPEX 8-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Limits')
insert into ans(ans_q,ansname,correct) values(@qid,'Answer',1)
insert into ans(ans_q,ansname) values(@qid,'Sensitivity')
insert into ans(ans_q,ansname) values(@qid,'Outline Reports')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following Excel features finds a numeric solution to a problem involving several input values?','Which Excel features finds a numeric solution to a problem involving several input values?','NPEX 8-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Solver',1)
insert into ans(ans_q,ansname) values(@qid,'PivotTable')
insert into ans(ans_q,ansname) values(@qid,'one-variable data table')
insert into ans(ans_q,ansname) values(@qid,'Goal Seek')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following Solver constraints should you delete if the range A5:F5 must contain exact dollar amounts such as $500.25?','Which Solver constraints should you delete if the range A5:F5 must contain exact dollar amounts such as $500.25?. Select 2 that apply.','NPEX 8-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A5:F5 = 500.25')
insert into ans(ans_q,ansname,correct) values(@qid,'A5:F5 = int',1)
insert into ans(ans_q,ansname,correct) values(@qid,'A5:F5 = bin',1)
insert into ans(ans_q,ansname) values(@qid,'A5:F5 >= 0')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What can you do to store the parameters of the current Solver model in a worksheet so you do not lose the model details when you create a new model?','What can you do to store the parameters of the current Solver model in a worksheet so you do not lose the model details when you create a new model?','NPEX 8-53')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Save the Solver model in the worksheet.',1)
insert into ans(ans_q,ansname) values(@qid,'Duplicate the Solver model.')
insert into ans(ans_q,ansname) values(@qid,'Merge the original Solver model with the new one.')
insert into ans(ans_q,ansname) values(@qid,'Run the Solver model.')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In Solver, A condition that limits the solution to a set of possible values is a(n) _______.','In Solver, A condition that limits the solution to a set of possible values is a(n) _______.','NPEX 8-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'changing cell')
insert into ans(ans_q,ansname,correct) values(@qid,'constraint',1)
insert into ans(ans_q,ansname) values(@qid,'objective cell')
insert into ans(ans_q,ansname) values(@qid,'solving method')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which type of constraint should you use to limit the answer to a whole number, such as for employees needed?','Which type of constraint should you use to limit the answer to a whole number, such as for employees needed?','NPEX 8-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'bin')
insert into ans(ans_q,ansname) values(@qid,'dif')
insert into ans(ans_q,ansname,correct) values(@qid,'int',1)
insert into ans(ans_q,ansname) values(@qid,'= (equals)')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you tell if Solver is activated in your version of Excel?','How can you tell if Solver is activated in your version of Excel?','NPEX 8-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'The Solver button appears in the Analyze group on the Data tab.',1)
insert into ans(ans_q,ansname) values(@qid,'A Solver tab appears on the ribbon.')
insert into ans(ans_q,ansname) values(@qid,'The Solver dialog box opens when you click the Data tab.')
insert into ans(ans_q,ansname) values(@qid,'Solver appears as the Add-in document property in Backstage view.')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To combine the results of four separate scenarios, you create an Answer report.','To combine the results of four separate scenarios, you create an Answer report.','NPEX 8-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A scenario is a defined collection of changing cells used to perform a what-if analysis.','A scenario is a defined collection of changing cells used to perform a what-if analysis.','NPEX 8-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To edit a scenario, open the Scenario Manager dialog box, select the scenario, and then click the Edit button.','To edit a scenario, open the Scenario Manager dialog box, select the scenario, and then click the Edit button.','NPEX 8-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to edit the changing values for a scenario, , select the cells directly in a spreadsheet.','If you want to edit the changing values for a scenario,, select the cells directly in a spreadsheet.','NPEX 8-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you are working with scenarios on one worksheet, you can merge scenarios from other worksheets or workbooks.','If you are working with scenarios on one worksheet, you can merge scenarios from other worksheets or workbooks.','NPEX 8-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When creating a one-variable data table, when you enter the input cell values in the first row of the table, you must enter the formulas referencing result cells in the table''s last column of the table.','When creating a one-variable data table, when you enter the input cell values in the first row of the table, you must enter the formulas referencing result cells in the table''s last column of the table.','NPEX 8-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Gabriel wants to see how changes to the sales price and number of units sold would affect his company''s profit. Which of the following should he create?','Gabriel wants to see how changes to the sales price and number of units sold would affect his company''s profit. Which should he create?','NPEX 8-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'forecast sheet')
insert into ans(ans_q,ansname,correct) values(@qid,'two-variable data table',1)
insert into ans(ans_q,ansname) values(@qid,'doughnut chart')
insert into ans(ans_q,ansname) values(@qid,'number filter')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you create a scenario, you can identify up to 50 changing cells whose values will change in each scenario.','When you create a scenario, you can identify up to 50 changing cells whose values will change in each scenario.','NPEX 8-25')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The scenario overview report lists the values for the changing and result cells within each scenario.','The scenario overview report lists the values for the changing and result cells within each scenario.','NPEX 8-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A scenario PivotTable report can used to merge scenarios created by multiple users.','A scenario PivotTable report can used to merge scenarios created by multiple users.','NPEX 8-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following do you need to provide when creating a Solver model? Select all the options that apply.','Which do you need to provide when creating a Solver model?. Select 2 that apply.','NPEX 8-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'report range')
insert into ans(ans_q,ansname,correct) values(@qid,'objective cell',1)
insert into ans(ans_q,ansname,correct) values(@qid,'one or more variable cells',1)
insert into ans(ans_q,ansname) values(@qid,'type of what-if analysis to perform')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Darryl has a worksheet that displays a product''s net profit in cell C20. He is using Solver to determine how he can achieve the most profit by changing the values in other cells. Where should he enter a reference to cell C20 in the Solver Parameters dialog box?','Darryl has a worksheet that displays a product''s net profit in cell C20. He is using Solver to determine how he can achieve the most profit by changing the values in other cells. Where should he enter a reference to cell C20 in the Solver Parameters dialog box?','NPEX 8-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Set Objective box',1)
insert into ans(ans_q,ansname) values(@qid,'By Changing Variable Cells box')
insert into ans(ans_q,ansname) values(@qid,'Subject to the Constraints box')
insert into ans(ans_q,ansname) values(@qid,'Load/Save box')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Lucy is creating a Solver model to determine the lowest total expenses she would incur producing 10,000 helmets. Where should she specify the limit of 10,000 helmets in the Solver Parameters dialog box?','Lucy is creating a Solver model to determine the lowest total expenses she would incur producing 10,000 helmets. Where should she specify the limit of 10,000 helmets in the Solver Parameters dialog box?','NPEX 8-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Set Objective box')
insert into ans(ans_q,ansname) values(@qid,'By Changing Variable Cells box')
insert into ans(ans_q,ansname,correct) values(@qid,'Subject to the Constraints box',1)
insert into ans(ans_q,ansname) values(@qid,'Load/Save box')

select * from q 
where q_act=@actid
