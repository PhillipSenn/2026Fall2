insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 5',8,107,'Test/bank.cfm',5)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Evelyn wants to work on different parts of a workbook at the same time by displaying worksheets in separate windows. Which option on the View tab should she select?','Evelyn wants to work on different parts of a workbook at the same time by displaying worksheets in separate windows. Which option on the View tab should she select?','NPEX 5-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Arrange All')
insert into ans(ans_q,ansname,correct) values(@qid,'New Window',1)
insert into ans(ans_q,ansname) values(@qid,'Zoom')
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To ungroup worksheets after grouping them and working on them simultaneously, right-click any worksheet tab in the group and click Ungroup Sheets.','To ungroup worksheets after grouping them and working on them simultaneously, right-click any worksheet tab in the group and click Ungroup Sheets.','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the DELETE key to clear cell contents.','You can use the DELETE key to clear cell contents.','NPEX 5-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You use the Apply Names command to have Excel replace all cell references in formulas with the equivalent defined name.','You use the Apply Names command to have Excel replace all cell references in formulas with the equivalent defined name.','NPEX 5-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a workbook containing text, formulas, macros, and formatting that you use repeatedly, you create a _____.','To create a workbook containing text, formulas, macros, and formatting that you use repeatedly, you create a _____.','NPEX 5-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'master')
insert into ans(ans_q,ansname) values(@qid,'model')
insert into ans(ans_q,ansname,correct) values(@qid,'template',1)
insert into ans(ans_q,ansname) values(@qid,'standard')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Ricki has an Analysis workbook containing many worksheets of sales data that she wants to use in a new workbook. What is the easiest way for her to use the sales data in the new workbook?','Ricki has an Analysis workbook containing many worksheets of sales data that she wants to use in a new workbook. What is the easiest way for her to use the sales data in the new workbook?','NPEX 5-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Copy the cells containing sales data to the new workbook.')
insert into ans(ans_q,ansname) values(@qid,'Insert hyperlinks from the Analysis workbook to the new workbook.')
insert into ans(ans_q,ansname,correct) values(@qid,'Copy the worksheets from the Analysis workbook to the new workbook.',1)
insert into ans(ans_q,ansname) values(@qid,'Hide the worksheets in the Analysis workbook.')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Joe wants to format several worksheets at the same time. What is the easiest way for him to perform this task?','Joe wants to format several worksheets at the same time. What is the easiest way for him to perform this task?','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Create a custom view of the worksheets.')
insert into ans(ans_q,ansname,correct) values(@qid,'Group the worksheets.',1)
insert into ans(ans_q,ansname) values(@qid,'View the worksheets side by side.')
insert into ans(ans_q,ansname) values(@qid,'Link the worksheets.')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Ttext or an image you click to open a webpage or file is which of the following?','Text or an image you click to open a webpage or file is which?','NPEX 5-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'3-D reference')
insert into ans(ans_q,ansname,correct) values(@qid,'Hyperlink',1)
insert into ans(ans_q,ansname) values(@qid,'ScreenTip')
insert into ans(ans_q,ansname) values(@qid,'Template')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following techniques can you use to remove hyperlink from a cell?','Which techniques can you use to remove hyperlink from a cell?','NPEX 5-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the Clear button on the Home tab and then click Remove Hyperlink.')
insert into ans(ans_q,ansname) values(@qid,'Click the Delete button on the Home tab and then click Remove Hyperlink.')
insert into ans(ans_q,ansname) values(@qid,'Right-click the hyperlink and then click Restore on the shortcut menu.')
insert into ans(ans_q,ansname,correct) values(@qid,'Right-click the hyperlink and then click Remove Hyperlink on the shortcut menu.',1)

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Calista wants to provide additional information about a hyperlink she is creating. Which of the following can she do?','Calista wants to provide additional information about a hyperlink she is creating. Which can she do?','NPEX 5-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Add a description.')
insert into ans(ans_q,ansname,correct) values(@qid,'Add a ScreenTip.',1)
insert into ans(ans_q,ansname) values(@qid,'Change the Link to location.')
insert into ans(ans_q,ansname) values(@qid,'Add a HyperTip.')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How do you select a cell containing a hyperlink without activating the link?','How do you select a cell containing a hyperlink without activating the link?','NPEX 5-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Double-click the cell.')
insert into ans(ans_q,ansname,correct) values(@qid,'Right-click the cell.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the cell and then click Do Not Activate.')
insert into ans(ans_q,ansname) values(@qid,'Click the cell and then click Edit Hyperlink.')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you open a trusted workbook containing external links, you can update the workbook with the latest data.','When you open a trusted workbook containing external links, you can update the workbook with the latest data.','NPEX 5-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What happens when you click a link to a Word document while working in Excel?','What happens when you click a link to a Word document while working in Excel?','NPEX 5-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Excel displays the Word document within Excel.')
insert into ans(ans_q,ansname) values(@qid,'Excel closes, and then Word starts so you can navigate to the document.')
insert into ans(ans_q,ansname,correct) values(@qid,'Word starts and opens the linked document.',1)
insert into ans(ans_q,ansname) values(@qid,'Your default browser opens and displays the Word document.')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The only way to update a link to another workbook is to insert a new link.','The only way to update a link to another workbook is to insert a new link.','NPEX 5-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Pam inserted links to data in another workbook, but now wants to replace the links with data and calculated values. She can break the links to the other workbook.','Pam inserted links to data in another workbook, but now wants to replace the links with data and calculated values. She can break the links to the other workbook.','NPEX 5-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A workbook template has which of the following file extensions?','A workbook template has which file extensions?','NPEX 5-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'.xltx',1)
insert into ans(ans_q,ansname) values(@qid,'.xls')
insert into ans(ans_q,ansname) values(@qid,'.xlsx')
insert into ans(ans_q,ansname) values(@qid,'.xlst')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What types of resources can you access using a hyperlink in Excel? Select all the options that apply.','What types of resources can you access using a hyperlink in Excel?. Select 3 that apply.','NPEX 5-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Email address',1)
insert into ans(ans_q,ansname) values(@qid,'Current cell')
insert into ans(ans_q,ansname,correct) values(@qid,'Worksheet in the workbook',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Webpage',1)

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What information can you provide to create a link to an email address? Select all the options that apply.','What information can you provide to create a link to an email address?. Select 3 that apply.','NPEX 5-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Text to display',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Email address',1)
insert into ans(ans_q,ansname) values(@qid,'Text of the email message')
insert into ans(ans_q,ansname,correct) values(@qid,'Subject of the email message',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Workbook styles are predesigned workbooks that contain formulas and design elements.','Workbook styles are predesigned workbooks that contain formulas and design elements.','NPEX 5-47')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Lucinda wants to apply conditional formats to three worksheets that have the same structure. She can apply the conditional formats to the three worksheets at the same time by grouping the worksheets.','Lucinda wants to apply conditional formats to three worksheets that have the same structure. She can apply the conditional formats to the three worksheets at the same time by grouping the worksheets.','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The expression Overview!D12 is a mixed reference to cell D12 on the Overview worksheet.','The expression Overview!D12 is a mixed reference to cell D12 on the Overview worksheet.','NPEX 5-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To delete a defined name, open the Name Manager dialog box, click the defined name, and then click Deleted.','To delete a defined name, open the Name Manager dialog box, click the defined name, and then click Deleted.','NPEX 5-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A named range, also called a descriptive range, uses descriptive names instead of cell or range references.','A named range, also called a descriptive range, uses descriptive names instead of cell or range references.','NPEX 5-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To insert defined names in existing formulas, you use the Create Names command on the Formulas tab.','To insert defined names in existing formulas, you use the Create Names command on the Formulas tab.','NPEX 5-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When Micah opens a workbook containing external references, a dialog box appears indicating the workbook contains links to external sources. Micah trusts the linked data, so he can click the Trust button to update the data.','When Micah opens a workbook containing external references, a dialog box appears indicating the workbook contains links to external sources. Micah trusts the linked data, so he can click the Trust button to update the data.','NPEX 5-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following tasks can you perform using the Edit Links dialog box? Select all the options that apply.','Which tasks can you perform using the Edit Links dialog box?. Select 3 that apply.','NPEX 5-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Update each link.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Change a link''s data source.',1)
insert into ans(ans_q,ansname) values(@qid,'Change the formula containing the external reference.')
insert into ans(ans_q,ansname,correct) values(@qid,'Break a link.',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you select a range of values, you can create defined names based on the text in which of the following locations within the range? Select all the options that apply.','When you select a range of values, you can create defined names based on the text in which locations within the range?. Select 2 that apply.','NPEX 5-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Top row',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Left column',1)
insert into ans(ans_q,ansname) values(@qid,'Same column')
insert into ans(ans_q,ansname) values(@qid,'Specified row')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are external references? Select all the options that apply.','Which are external references?. Select 3 that apply.','NPEX 5-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'[Sales.xlsx]January!A14',1)
insert into ans(ans_q,ansname,correct) values(@qid,'''[Annual Sales.xlsx]January''!A14',1)
insert into ans(ans_q,ansname) values(@qid,'January!A14')
insert into ans(ans_q,ansname,correct) values(@qid,'[Sales.xlsx]Jan:March!A14',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Expenses workbook, Cassie defined the range D10:G10 with the name RentExpenses. Which of the following formulas can replace the formula =SUM(Expenses!D10:G10)?','In the Expenses workbook, Cassie defined the range D10:G10 with the name RentExpenses. Which formulas can replace the formula =SUM(Expenses!D10:G10)?','NPEX 5-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'''=SUM([Expenses]!Rent),')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM(RentExpenses)',1)
insert into ans(ans_q,ansname) values(@qid,'=SUM([RentExpenses], D10:G10)')
insert into ans(ans_q,ansname) values(@qid,'=SUM(D10:G10)')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the Name Manager dialog box to view and manage named ranges, including the _____, which indicates where the named range is recognized.','You can use the Name Manager dialog box to view and manage named ranges, including the _____, which indicates where the named range is recognized.','NPEX 5-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'scope',1)
insert into ans(ans_q,ansname) values(@qid,'external reference')
insert into ans(ans_q,ansname) values(@qid,'filter')
insert into ans(ans_q,ansname) values(@qid,'extent')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is an acceptable name for a range in Excel?','Which is an acceptable name for a range in Excel?','NPEX 5-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Net-Income')
insert into ans(ans_q,ansname) values(@qid,'Profit!')
insert into ans(ans_q,ansname,correct) values(@qid,'_TotalExpenses',1)
insert into ans(ans_q,ansname) values(@qid,'Average')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a simpler way to write the following formula: June!C5+July!C5+Aug!C5?','Which is a simpler way to write the following formula: June!C5+July!C5+Aug!C5?','NPEX 5-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'[June-Aug]!C5')
insert into ans(ans_q,ansname) values(@qid,'June:Aug+C5')
insert into ans(ans_q,ansname,correct) values(@qid,'June:Aug!C5',1)
insert into ans(ans_q,ansname) values(@qid,'(June:Aug), C5')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After beginning a formula, what can you do instead of typing the syntax of a 3-D reference?','After beginning a formula, what can you do instead of typing the syntax of a 3-D reference?','NPEX 5-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click a sheet tab, click a cell range, and then press ENTER.',1)
insert into ans(ans_q,ansname) values(@qid,'Copy a sheet tab and then press CTRL+V to paste it in the formula.')
insert into ans(ans_q,ansname) values(@qid,'Use the fill handle to select the external range.')
insert into ans(ans_q,ansname) values(@qid,'Click the Enter button on the formula bar, click a sheet tab, and then click a cell range.')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you use the Arrange All button to arrange more than one workbook window, which of the following layout options can you use? Select all the options that apply.','When you use the Arrange All button to arrange more than one workbook window, which layout options can you use?. Select 3 that apply.','NPEX 5-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Tiled',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Cascade',1)
insert into ans(ans_q,ansname) values(@qid,'Scrolling')
insert into ans(ans_q,ansname,correct) values(@qid,'Vertical',1)

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you save a workbook as a template, which of the following file name extensions does Excel apply?','When you save a workbook as a template, which file name extensions does Excel apply?','NPEX 5-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'XLSX')
insert into ans(ans_q,ansname) values(@qid,'XLSM')
insert into ans(ans_q,ansname,correct) values(@qid,'XLTX',1)
insert into ans(ans_q,ansname) values(@qid,'XLS')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you click Existing File or Web Page in the Insert Hyperlink dialog box, select a workbook, click the Bookmark button, enter a cell reference, and then click OK, what are you linking to?','If you click Existing File or Web Page in the Insert Hyperlink dialog box, select a workbook, click the Bookmark button, enter a cell reference, and then click OK, what are you linking to?','NPEX 5-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A hidden location in another workbook')
insert into ans(ans_q,ansname,correct) values(@qid,'A cell in another workbook',1)
insert into ans(ans_q,ansname) values(@qid,'Another workbook file')
insert into ans(ans_q,ansname) values(@qid,'A worksheet in another workbook')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you insert a defined name into a formula, Excel treats the defined name as a(n) _____.','When you insert a defined name into a formula, Excel treats the defined name as a(n) _____.','NPEX 5-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'relative cell reference')
insert into ans(ans_q,ansname) values(@qid,'mixed cell reference')
insert into ans(ans_q,ansname) values(@qid,'static cell reference')
insert into ans(ans_q,ansname,correct) values(@qid,'absolute cell reference',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What happens when you click the sheet tab of a worksheet not included in a worksheet group?','What happens when you click the sheet tab of a worksheet not included in a worksheet group?','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You add the worksheet to the group.')
insert into ans(ans_q,ansname) values(@qid,'You create a new group of the first and last worksheets.')
insert into ans(ans_q,ansname,correct) values(@qid,'You ungroup the worksheets.',1)
insert into ans(ans_q,ansname) values(@qid,'The worksheet grouping does not change.')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How does Excel indicate that worksheets are grouped? Select all the options that apply.','How does Excel indicate that worksheets are grouped?. Select 2 that apply.','NPEX 5-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The word "Group" appears in large letters in the background of each worksheet.')
insert into ans(ans_q,ansname,correct) values(@qid,'The word "Group" is added to the title bar.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'The sheet tab names are bold.',1)
insert into ans(ans_q,ansname) values(@qid,'The word "Group" is added to the sheet tab names.')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can edit several worksheets at the same time by outlining the worksheets.','You can edit several worksheets at the same time by outlining the worksheets.','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What can you do to a worksheet group to change each worksheet within the group? Select all the options that apply.','What can you do to a worksheet group to change each worksheet within the group?. Select 4 that apply.','NPEX 5-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Enter formulas and data.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Change row heights and column widths.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Apply conditional formats.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Set view options.',1)

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you arrange windows in a Vertical or Side by Side layout, you can more easily compare the two worksheets by using synchronized _____ .','When you arrange windows in a Vertical or Side by Side layout, you can more easily compare the two worksheets by using synchronized _____.','NPEX 5-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'grouping')
insert into ans(ans_q,ansname) values(@qid,'updating')
insert into ans(ans_q,ansname) values(@qid,'inking')
insert into ans(ans_q,ansname,correct) values(@qid,'scrolling',1)

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Before Barry inserts new formulas in the range A5:F5, he wants to clear the cell contents. How can he do so?','Before Barry inserts new formulas in the range A5:F5, he wants to clear the cell contents. How can he do so?','NPEX 5-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Drag the fill handle from cell A5 to cell F5.')
insert into ans(ans_q,ansname,correct) values(@qid,'Select the range and then press DELETE.',1)
insert into ans(ans_q,ansname) values(@qid,'Select the range and then click the Clear Formats button.')
insert into ans(ans_q,ansname) values(@qid,'Select the range and then click Clear on the AutoFill Options menu.')

-- 44
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To use defined names in existing formulas, click the Define Name arrow, and then click _____.','To use defined names in existing formulas, click the Define Name arrow, and then click _____.','NPEX 5-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Get Defined Names')
insert into ans(ans_q,ansname,correct) values(@qid,'Apply Names',1)
insert into ans(ans_q,ansname) values(@qid,'Use Defined Names')
insert into ans(ans_q,ansname) values(@qid,'Named Ranges')

select * from q 
where q_act=@actid
