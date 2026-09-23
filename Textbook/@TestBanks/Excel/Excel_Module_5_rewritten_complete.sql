--insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 5',5,107,'Test/bank.cfm',5)
--declare @actid int=scope_identity()
declare @actid int=(select actid from act where actname='Excel Module 5')
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
values(@actid,'Evelyn wants to work on different parts of a workbook at the same time by displaying worksheets in separate windows. Which option on the View tab should she select?','Evelyn wants to view different parts of the same workbook in separate windows. Which View tab option should she use?','NPEX 5-6')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Arrange All')
insert into ans(ans_q,ansname,correct) values(@qid,'New Window',1)
insert into ans(ans_q,ansname) values(@qid,'Zoom')
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')

-- 2
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To ungroup worksheets after grouping them and working on them simultaneously, right-click any worksheet tab in the group and click Ungroup Sheets.','You can ungroup grouped worksheets by right-clicking any worksheet tab in the group and choosing Ungroup Sheets.','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'You can use the DELETE key to clear cell contents.','Pressing the DELETE key clears the contents of selected cells.','NPEX 5-17')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'You use the Apply Names command to have Excel replace all cell references in formulas with the equivalent defined name.','The Apply Names command replaces cell references in formulas with their equivalent defined names.','NPEX 5-44')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To create a workbook containing text, formulas, macros, and formatting that you use repeatedly, you create a _____.','What do you create when you want to reuse a workbook containing text, formulas, macros, and formatting?','NPEX 5-48')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'master')
insert into ans(ans_q,ansname) values(@qid,'model')
insert into ans(ans_q,ansname,correct) values(@qid,'template',1)
insert into ans(ans_q,ansname) values(@qid,'standard')

-- 6
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Ricki has an Analysis workbook containing many worksheets of sales data that she wants to use in a new workbook. What is the easiest way for her to use the sales data in the new workbook?','Ricki wants to reuse several worksheets of sales data from an Analysis workbook in a new workbook. What is the easiest way to do this?','NPEX 5-4')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Copy the cells containing sales data to the new workbook.')
insert into ans(ans_q,ansname) values(@qid,'Insert hyperlinks from the Analysis workbook to the new workbook.')
insert into ans(ans_q,ansname,correct) values(@qid,'Copy the worksheets from the Analysis workbook to the new workbook.',1)
insert into ans(ans_q,ansname) values(@qid,'Hide the worksheets in the Analysis workbook.')

-- 7
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Joe wants to format several worksheets at the same time. What is the easiest way for him to perform this task?','Joe wants to format several worksheets at the same time. What should he do?','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Create a custom view of the worksheets.')
insert into ans(ans_q,ansname,correct) values(@qid,'Group the worksheets.',1)
insert into ans(ans_q,ansname) values(@qid,'View the worksheets side by side.')
insert into ans(ans_q,ansname) values(@qid,'Link the worksheets.')

-- 8
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Ttext or an image you click to open a webpage or file is which of the following?','What do you call text or an image that you click to open a webpage or file?','NPEX 5-29')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'3-D reference')
insert into ans(ans_q,ansname,correct) values(@qid,'Hyperlink',1)
insert into ans(ans_q,ansname) values(@qid,'ScreenTip')
insert into ans(ans_q,ansname) values(@qid,'Template')

-- 9
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following techniques can you use to remove hyperlink from a cell?','How can you remove a hyperlink from a cell?','NPEX 5-29')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Click the Clear button on the Home tab and then click Remove Hyperlink.')
insert into ans(ans_q,ansname) values(@qid,'Click the Delete button on the Home tab and then click Remove Hyperlink.')
insert into ans(ans_q,ansname) values(@qid,'Right-click the hyperlink and then click Restore on the shortcut menu.')
insert into ans(ans_q,ansname,correct) values(@qid,'Right-click the hyperlink and then click Remove Hyperlink on the shortcut menu.',1)

-- 10
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Calista wants to provide additional information about a hyperlink she is creating. Which of the following can she do?','Calista wants to provide extra information about a hyperlink. What can she add?','NPEX 5-29')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Add a description.')
insert into ans(ans_q,ansname,correct) values(@qid,'Add a ScreenTip.',1)
insert into ans(ans_q,ansname) values(@qid,'Change the Link to location.')
insert into ans(ans_q,ansname) values(@qid,'Add a HyperTip.')

-- 11
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'How do you select a cell containing a hyperlink without activating the link?','How can you select a cell containing a hyperlink without opening the link?','NPEX 5-32')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Double-click the cell.')
insert into ans(ans_q,ansname,correct) values(@qid,'Right-click the cell.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the cell and then click Do Not Activate.')
insert into ans(ans_q,ansname) values(@qid,'Click the cell and then click Edit Hyperlink.')

-- 12
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you open a trusted workbook containing external links, you can update the workbook with the latest data.','When you open a trusted workbook with external links, you can update it with the latest linked data.','NPEX 5-26')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 13
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What happens when you click a link to a Word document while working in Excel?','What happens when you click a hyperlink to a Word document from Excel?','NPEX 5-29')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Excel displays the Word document within Excel.')
insert into ans(ans_q,ansname) values(@qid,'Excel closes, and then Word starts so you can navigate to the document.')
insert into ans(ans_q,ansname,correct) values(@qid,'Word starts and opens the linked document.',1)
insert into ans(ans_q,ansname) values(@qid,'Your default browser opens and displays the Word document.')

-- 14
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'The only way to update a link to another workbook is to insert a new link.','You must insert a new link whenever you want to update a link to another workbook.','NPEX 5-27')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Pam inserted links to data in another workbook, but now wants to replace the links with data and calculated values. She can break the links to the other workbook.','Pam wants to replace links to another workbook with the current data and calculated values. She can do this by breaking the links.','NPEX 5-27')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'A workbook template has which of the following file extensions?','Which file extension is used for an Excel workbook template?','NPEX 5-49')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'.xltx',1)
insert into ans(ans_q,ansname) values(@qid,'.xls')
insert into ans(ans_q,ansname) values(@qid,'.xlsx')
insert into ans(ans_q,ansname) values(@qid,'.xlst')

-- 17
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What types of resources can you access using a hyperlink in Excel? Select all the options that apply.','Which resources can an Excel hyperlink open? Select 3 that apply.','NPEX 5-29')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Email address',1)
insert into ans(ans_q,ansname) values(@qid,'Current cell')
insert into ans(ans_q,ansname,correct) values(@qid,'Worksheet in the workbook',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Webpage',1)

-- 18
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What information can you provide to create a link to an email address? Select all the options that apply.','Which information can you provide when creating a hyperlink to an email address? Select 3 that apply.','NPEX 5-32')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Text to display',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Email address',1)
insert into ans(ans_q,ansname) values(@qid,'Text of the email message')
insert into ans(ans_q,ansname,correct) values(@qid,'Subject of the email message',1)

-- 19
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Workbook styles are predesigned workbooks that contain formulas and design elements.','Workbook styles are predesigned workbooks that contain formulas and design elements.','NPEX 5-47')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 20
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Lucinda wants to apply conditional formats to three worksheets that have the same structure. She can apply the conditional formats to the three worksheets at the same time by grouping the worksheets.','Lucinda can apply conditional formatting to three similarly structured worksheets at the same time by grouping the worksheets.','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'The expression Overview!D12 is a mixed reference to cell D12 on the Overview worksheet.','Overview!D12 is a mixed reference to cell D12 on the Overview worksheet.','NPEX 5-14')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 22
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To delete a defined name, open the Name Manager dialog box, click the defined name, and then click Deleted.','You can delete a defined name from the Name Manager dialog box.','NPEX 5-43')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 23
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'A named range, also called a descriptive range, uses descriptive names instead of cell or range references.','A named range is also called a descriptive range.','NPEX 5-36')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 24
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To insert defined names in existing formulas, you use the Create Names command on the Formulas tab.','The Create Names command on the Formulas tab inserts defined names into existing formulas.','NPEX 5-44')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 25
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When Micah opens a workbook containing external references, a dialog box appears indicating the workbook contains links to external sources. Micah trusts the linked data, so he can click the Trust button to update the data.','When a workbook contains external references, clicking a Trust button updates the linked data.','NPEX 5-26')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following tasks can you perform using the Edit Links dialog box? Select all the options that apply.','Which tasks can you perform in the Edit Links dialog box? Select 3 that apply.','NPEX 5-27')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Update each link.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Change a link''s data source.',1)
insert into ans(ans_q,ansname) values(@qid,'Change the formula containing the external reference.')
insert into ans(ans_q,ansname,correct) values(@qid,'Break a link.',1)

-- 27
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you select a range of values, you can create defined names based on the text in which of the following locations within the range? Select all the options that apply.','Which locations in a selected range can supply text for creating defined names? Select 2 that apply.','NPEX 5-38')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Top row',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Left column',1)
insert into ans(ans_q,ansname) values(@qid,'Same column')
insert into ans(ans_q,ansname) values(@qid,'Specified row')

-- 28
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following are external references? Select all the options that apply.','Which expressions are external references? Select 3 that apply.','NPEX 5-22')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'[Sales.xlsx]January!A14',1)
insert into ans(ans_q,ansname,correct) values(@qid,'''[Annual Sales.xlsx]January''!A14',1)
insert into ans(ans_q,ansname) values(@qid,'January!A14')
insert into ans(ans_q,ansname,correct) values(@qid,'[Sales.xlsx]Jan:March!A14',1)

-- 29
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'In the Expenses workbook, Cassie defined the range D10:G10 with the name RentExpenses. Which of the following formulas can replace the formula =SUM(Expenses!D10:G10)?','Cassie named the range D10:G10 in the Expenses workbook RentExpenses. Which formula can replace =SUM(Expenses!D10:G10)?','NPEX 5-39')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'''=SUM([Expenses]!Rent),')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM(RentExpenses)',1)
insert into ans(ans_q,ansname) values(@qid,'=SUM([RentExpenses], D10:G10)')
insert into ans(ans_q,ansname) values(@qid,'=SUM(D10:G10)')

-- 30
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'You can use the Name Manager dialog box to view and manage named ranges, including the _____, which indicates where the named range is recognized.','In Name Manager, what identifies where a named range is recognized?','NPEX 5-42')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'scope',1)
insert into ans(ans_q,ansname) values(@qid,'external reference')
insert into ans(ans_q,ansname) values(@qid,'filter')
insert into ans(ans_q,ansname) values(@qid,'extent')

-- 31
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following is an acceptable name for a range in Excel?','Which name is valid for an Excel range?','NPEX 5-36')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Net-Income')
insert into ans(ans_q,ansname) values(@qid,'Profit!')
insert into ans(ans_q,ansname,correct) values(@qid,'_TotalExpenses',1)
insert into ans(ans_q,ansname) values(@qid,'Average')

-- 32
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Which of the following is a simpler way to write the following formula: June!C5+July!C5+Aug!C5?','Which 3-D reference is equivalent to June!C5+July!C5+Aug!C5?','NPEX 5-14')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'[June-Aug]!C5')
insert into ans(ans_q,ansname) values(@qid,'June:Aug+C5')
insert into ans(ans_q,ansname,correct) values(@qid,'June:Aug!C5',1)
insert into ans(ans_q,ansname) values(@qid,'(June:Aug), C5')

-- 33
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'After beginning a formula, what can you do instead of typing the syntax of a 3-D reference?','After starting a formula, how can you create a 3-D reference without typing its syntax?','NPEX 5-15')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Click a sheet tab, click a cell range, and then press ENTER.',1)
insert into ans(ans_q,ansname) values(@qid,'Copy a sheet tab and then press CTRL+V to paste it in the formula.')
insert into ans(ans_q,ansname) values(@qid,'Use the fill handle to select the external range.')
insert into ans(ans_q,ansname) values(@qid,'Click the Enter button on the formula bar, click a sheet tab, and then click a cell range.')

-- 34
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you use the Arrange All button to arrange more than one workbook window, which of the following layout options can you use? Select all the options that apply.','Which layouts are available when you use Arrange All to arrange multiple workbook windows? Select 3 that apply.','NPEX 5-7')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Tiled',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Cascade',1)
insert into ans(ans_q,ansname) values(@qid,'Scrolling')
insert into ans(ans_q,ansname,correct) values(@qid,'Vertical',1)

-- 35
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you save a workbook as a template, which of the following file name extensions does Excel apply?','Which file extension does Excel use when you save a workbook as a template?','NPEX 5-49')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'XLSX')
insert into ans(ans_q,ansname) values(@qid,'XLSM')
insert into ans(ans_q,ansname,correct) values(@qid,'XLTX',1)
insert into ans(ans_q,ansname) values(@qid,'XLS')

-- 36
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'If you click Existing File or Web Page in the Insert Hyperlink dialog box, select a workbook, click the Bookmark button, enter a cell reference, and then click OK, what are you linking to?','In the Insert Hyperlink dialog box, you select another workbook, click Bookmark, and enter a cell reference. What will the hyperlink open?','NPEX 5-30')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'A hidden location in another workbook')
insert into ans(ans_q,ansname,correct) values(@qid,'A cell in another workbook',1)
insert into ans(ans_q,ansname) values(@qid,'Another workbook file')
insert into ans(ans_q,ansname) values(@qid,'A worksheet in another workbook')

-- 37
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you insert a defined name into a formula, Excel treats the defined name as a(n) _____.','How does Excel treat a defined name when you insert it into a formula?','NPEX 5-38')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'relative cell reference')
insert into ans(ans_q,ansname) values(@qid,'mixed cell reference')
insert into ans(ans_q,ansname) values(@qid,'static cell reference')
insert into ans(ans_q,ansname,correct) values(@qid,'absolute cell reference',1)

-- 38
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What happens when you click the sheet tab of a worksheet not included in a worksheet group?','What happens to a worksheet group when you click the tab of a worksheet that is not in the group?','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'You add the worksheet to the group.')
insert into ans(ans_q,ansname) values(@qid,'You create a new group of the first and last worksheets.')
insert into ans(ans_q,ansname,correct) values(@qid,'You ungroup the worksheets.',1)
insert into ans(ans_q,ansname) values(@qid,'The worksheet grouping does not change.')

-- 39
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'How does Excel indicate that worksheets are grouped? Select all the options that apply.','How does Excel show that worksheets are grouped? Select 2 that apply.','NPEX 5-11')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'The word "Group" appears in large letters in the background of each worksheet.')
insert into ans(ans_q,ansname,correct) values(@qid,'The word "Group" is added to the title bar.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'The sheet tab names are bold.',1)
insert into ans(ans_q,ansname) values(@qid,'The word "Group" is added to the sheet tab names.')

-- 40
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'You can edit several worksheets at the same time by outlining the worksheets.','Outlining worksheets lets you edit several worksheets at the same time.','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 41
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'What can you do to a worksheet group to change each worksheet within the group? Select all the options that apply.','Which changes can you make to all worksheets in a worksheet group? Select 4 that apply.','NPEX 5-10')
select @qid=scope_identity()

insert into ans(ans_q,ansname,correct) values(@qid,'Enter formulas and data.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Change row heights and column widths.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Apply conditional formats.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Set view options.',1)

-- 42
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'When you arrange windows in a Vertical or Side by Side layout, you can more easily compare the two worksheets by using synchronized _____ .','When comparing worksheets in a Vertical or Side by Side layout, synchronized _____ makes comparison easier.','NPEX 5-9')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'grouping')
insert into ans(ans_q,ansname) values(@qid,'updating')
insert into ans(ans_q,ansname) values(@qid,'inking')
insert into ans(ans_q,ansname,correct) values(@qid,'scrolling',1)

-- 43
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'Before Barry inserts new formulas in the range A5:F5, he wants to clear the cell contents. How can he do so?','Barry wants to clear the contents of cells A5:F5 before entering new formulas. What should he do?','NPEX 5-17')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Drag the fill handle from cell A5 to cell F5.')
insert into ans(ans_q,ansname,correct) values(@qid,'Select the range and then press DELETE.',1)
insert into ans(ans_q,ansname) values(@qid,'Select the range and then click the Clear Formats button.')
insert into ans(ans_q,ansname) values(@qid,'Select the range and then click Clear on the AutoFill Options menu.')

-- 44
insert into q(q_act,qname,qdesc,qhref)
values(@actid,'To use defined names in existing formulas, click the Define Name arrow, and then click _____.','Which command applies defined names to references in existing formulas?','NPEX 5-44')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'Get Defined Names')
insert into ans(ans_q,ansname,correct) values(@qid,'Apply Names',1)
insert into ans(ans_q,ansname) values(@qid,'Use Defined Names')
insert into ans(ans_q,ansname) values(@qid,'Named Ranges')

select * from q
where q_act=@actid
