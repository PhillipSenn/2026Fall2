insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 12',8,107,'Test/bank.cfm',12)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you protect a worksheet, you prevent users from renaming or deleting the worksheet.','When you protect a worksheet, you prevent users from renaming or deleting the worksheet.','NPEX 12-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Doug is using WordArt for a chart title that displays an outline of letters with shadows. To display filled letters with reflections, he can change the Transform effect.','Doug is using WordArt for a chart title that displays an outline of letters with shadows. To display filled letters with reflections, he can change the Transform effect.','NPEX 12-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Every cell in a workbook has a locked property, but the property is unused until the worksheet is protected.','Every cell in a workbook has a locked property, but the property is unused until the worksheet is protected.','NPEX 12-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To unprotect a worksheet, open the worksheet, click the Review tab, and then click the Unprotect Sheet button.','To unprotect a worksheet, open the worksheet, click the Review tab, and then click the Unprotect Sheet button.','NPEX 12-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to rename a worksheet in a protected workbook, you must first unprotect the workbook.','If you want to rename a worksheet in a protected workbook, you must first unprotect the workbook.','NPEX 12-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you set up worksheet protection, you specify which actions users are allowed to perform in the protected sheet.','When you set up worksheet protection, you specify which actions users are allowed to perform in the protected sheet.','NPEX 12-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When Kai right-clicks a sheet tab in a workbook, some commands on the shortcut menu are gray. That means the worksheet is hidden.','When Kai right-clicks a sheet tab in a workbook, some commands on the shortcut menu are gray. That means the worksheet is hidden.','NPEX 12-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To define what data values are allowed in a cell, create a ______.','To define what data values are allowed in a cell, create a ______.','NPEX 12-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'custom error')
insert into ans(ans_q,ansname) values(@qid,'macro')
insert into ans(ans_q,ansname) values(@qid,'conditional formatting rule')
insert into ans(ans_q,ansname,correct) values(@qid,'validation rule',1)

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What appears next to a cell with data validation to indicate the type of data to enter in the cell?','What appears next to a cell with data validation to indicate the type of data to enter in the cell?','NPEX 12-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Title')
insert into ans(ans_q,ansname) values(@qid,'Heading')
insert into ans(ans_q,ansname,correct) values(@qid,'Input message',1)
insert into ans(ans_q,ansname) values(@qid,'Insert message')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Even if a validation error message with the Stop style appears next to a cell, users can still enter any value in the cell.','Even if a validation error message with the Stop style appears next to a cell, users can still enter any value in the cell.','NPEX 12-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following tools can you use to validate data already entered in a workbook?','Which tools can you use to validate data already entered in a workbook?','NPEX 12-25')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'What-If Analysis')
insert into ans(ans_q,ansname,correct) values(@qid,'Circle Invalid Data',1)
insert into ans(ans_q,ansname) values(@qid,'Remove Duplicates')
insert into ans(ans_q,ansname) values(@qid,'Consolidate worksheet data.')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you edit a macro to change its actions?','How can you edit a macro to change its actions?','NPEX 12-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Open the macro in the VBA Editor.',1)
insert into ans(ans_q,ansname) values(@qid,'Step into the macro.')
insert into ans(ans_q,ansname) values(@qid,'Convert the macro to a function.')
insert into ans(ans_q,ansname) values(@qid,'Run the macro.')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Esperanza wants to save a series of commands she performs often. Which of the following should she do?','Esperanza wants to save a series of commands she performs often. Which should she do?','NPEX 12-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Create a protected commands worksheet.')
insert into ans(ans_q,ansname) values(@qid,'Turn on automatic calculations.')
insert into ans(ans_q,ansname) values(@qid,'Run a procedure.')
insert into ans(ans_q,ansname,correct) values(@qid,'Record a macro.',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Laurence created a workbook with macros designed to save users time. However, he does not want users to use the ribbon to run the macros. What can he do instead?','Laurence created a workbook with macros designed to save users time. However, he does not want users to use the ribbon to run the macros. What can he do instead?','NPEX 12-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Convert the macros to hyperlinks.,')
insert into ans(ans_q,ansname,correct) values(@qid,'Assign the macros to shapes.',1)
insert into ans(ans_q,ansname) values(@qid,'List the macros on a password-protected worksheet.')
insert into ans(ans_q,ansname) values(@qid,'Assign voice commands to the macros.')

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One way to run a macro is to click the Run button in the Macros dialog box. What is another way?','One way to run a macro is to click the Run button in the Macros dialog box. What is another way?','NPEX 12-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Press the shortcut key assigned to the macro.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the Run Macros button on the Formulas tab.')
insert into ans(ans_q,ansname) values(@qid,'Create a formula using the MACRO function.')
insert into ans(ans_q,ansname) values(@qid,'Assign the macro to a hyperlink.')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What is the file extension of macro-enabled workbook?','What is the file extension of macro-enabled workbook?','NPEX 12-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'.xls')
insert into ans(ans_q,ansname) values(@qid,'.xlx')
insert into ans(ans_q,ansname) values(@qid,'.xlsx')
insert into ans(ans_q,ansname,correct) values(@qid,'.xlsm',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following form controls can you use to run a macro?','Which form controls can you use to run a macro?','NPEX 12-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Button',1)
insert into ans(ans_q,ansname) values(@qid,'Input Box')
insert into ans(ans_q,ansname) values(@qid,'Label')
insert into ans(ans_q,ansname) values(@qid,'Dialog box')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Arlo wants to use the shape to run a macro. He creates a rectangle on a worksheet, right-clicks the shape, and then clicks _____ on the shortcut menu.','Arlo wants to use the shape to run a macro. He creates a rectangle on a worksheet, right-clicks the shape, and then clicks _____ on the shortcut menu.','NPEX 12-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Assign Macro',1)
insert into ans(ans_q,ansname) values(@qid,'Run Macro')
insert into ans(ans_q,ansname) values(@qid,'Set as Macro')
insert into ans(ans_q,ansname) values(@qid,'View Macros')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What must you add to the Excel ribbon before you can insert a form control or create a macro?','What must you add to the Excel ribbon before you can insert a form control or create a macro?','NPEX 12-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Macro tab')
insert into ans(ans_q,ansname) values(@qid,'Form tab')
insert into ans(ans_q,ansname,correct) values(@qid,'Developer tab',1)
insert into ans(ans_q,ansname) values(@qid,'Power User tab')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To insert WordArt in Excel, click the WordArt button on the Insert tab, select the WordArt style, and then type to replace the placeholder text.','To insert WordArt in Excel, click the WordArt button on the Insert tab, select the WordArt style, and then type to replace the placeholder text.','NPEX 12-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A(n) _____ marks a workbook as coming from a trusted author.','A(n) _____ marks a workbook as coming from a trusted author.','NPEX 12-57')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Electronic certificate')
insert into ans(ans_q,ansname) values(@qid,'Security mark')
insert into ans(ans_q,ansname,correct) values(@qid,'Digital signature',1)
insert into ans(ans_q,ansname) values(@qid,'Password')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How do you change the placeholder text that appears on a selected form control?','How do you change the placeholder text that appears on a selected form control?','NPEX 12-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Type the new text.',1)
insert into ans(ans_q,ansname) values(@qid,'Open the Properties dialog box for the control and then change the Title text.')
insert into ans(ans_q,ansname) values(@qid,'Link the control to a cell containing the new text.')
insert into ans(ans_q,ansname) values(@qid,'Switch to Design mode and then type the new text.')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A _____ is a form element used for entering data and running commands.','A _____ is a form element used for entering data and running commands.','NPEX 12-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'macro')
insert into ans(ans_q,ansname) values(@qid,'module')
insert into ans(ans_q,ansname,correct) values(@qid,'form control',1)
insert into ans(ans_q,ansname) values(@qid,'form command')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the VBA Editor, the Code window displays the VBA code of every recorded macro.','In the VBA Editor, the Code window displays the VBA code of every recorded macro.','NPEX 12-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change the contents of a macro, you must use the Record Macro button to step into the macro.','To change the contents of a macro, you must use the Record Macro button to step into the macro.','NPEX 12-50')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In VBA, macros are stored in blocks of code called sub procedures.','In VBA, macros are stored in blocks of code called sub procedures.','NPEX 12-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To edit a macro, you open the Macro editor, which is a separate application that works with Excel.','To edit a macro, you open the Macro editor, which is a separate application that works with Excel.','NPEX 12-50')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To remove validation circles, you can use the Clear Validation Circles command or you can _____.','To remove validation circles, you can use the Clear Validation Circles command or you can _____.','NPEX 12-25')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Hide the rows containing the circles.')
insert into ans(ans_q,ansname,correct) values(@qid,'Edit the cells to make them valid.',1)
insert into ans(ans_q,ansname) values(@qid,'Change the error-checking rules.')
insert into ans(ans_q,ansname) values(@qid,'Apply a conditional format.')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'By default, Excel allows users to only select cells on a protected sheet. Which of the following tasks can you also allow? Select all the options that apply.','By default, Excel allows users to only select cells on a protected sheet. Which tasks can you also allow?. Select 2 that apply.','NPEX 12-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'formatting cells',1)
insert into ans(ans_q,ansname,correct) values(@qid,'sorting data',1)
insert into ans(ans_q,ansname) values(@qid,'deleting the worksheet')
insert into ans(ans_q,ansname) values(@qid,'renaming the worksheet')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A chart that compares values within a hierarchy is called a hierarchy chart.','A chart that compares values within a hierarchy is called a hierarchy chart.','NPEX 12-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following can you use as validation criteria for a validation rule? Select all the options that apply.','Which can you use as validation criteria for a validation rule?. Select 3 that apply.','NPEX 12-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Any value',1)
insert into ans(ans_q,ansname,correct) values(@qid,'List',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Date',1)
insert into ans(ans_q,ansname) values(@qid,'Group')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In a protected worksheet, you lock cells so that users can change their values.','In a protected worksheet, you lock cells so that users can change their values.','NPEX 12-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

select * from q 
where q_act=@actid
