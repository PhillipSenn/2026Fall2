insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 1',8,107,'Test/bank.cfm',1)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you use the Windows Start menu to start Excel, it opens in Backstage view.','Starting Excel from the Windows Start menu opens Excel in Backstage view.','NPEX 1-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you print in portrait orientation, the page is wider than it is tall.','In portrait orientation, a printed page is wider than it is tall.','NPEX 1-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you enter a number, date, or time in a cell, it is left-aligned by default.','Numbers, dates, and times are left-aligned by default when entered in a cell.','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A good practice is to move the most important worksheets to the end of the workbook.','Important worksheets should be moved to the end of a workbook.','NPEX 1-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To preview and print a workbook, click the File tab to display Backstage view.','To preview or print a workbook, use the File tab to open Backstage view.','NPEX 1-57')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can set a scaling option to resize a worksheet to fit within a single page.','A worksheet can be scaled so it fits on a single printed page.','NPEX 1-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can edit cell contents in the formula bar or in the cell itself.','You can edit a cell either in the cell itself or in the formula bar.','NPEX 1-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To enter a typed number into a cell, you can press Tab or Backspace.','Pressing Tab or Backspace enters a typed number into a cell.','NPEX 1-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To increase the magnification of a worksheet from 100% to 120%, you use the Magnification slider.','To change worksheet magnification from 100% to 120%, use the Magnification slider.','NPEX 1-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the formula =SUM(A6:A9), which of the following best describes A6:A9?','In =SUM(A6:A9), what does A6:A9 represent?','NPEX 1-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'argument',1)
insert into ans(ans_q,ansname) values(@qid,'function')
insert into ans(ans_q,ansname) values(@qid,'labels')
insert into ans(ans_q,ansname) values(@qid,'active cells')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following lets you edit the contents of a cell?','Which method lets you edit a cell''s contents?','NPEX 1-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the cell, click the status bar, and press Enter.')
insert into ans(ans_q,ansname) values(@qid,'Click the cell and click in the status bar.')
insert into ans(ans_q,ansname) values(@qid,'Double-click the cell, click in the status bar, or just start typing.')
insert into ans(ans_q,ansname,correct) values(@qid,'Double-click the cell or click in the formula bar.',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following views shows how a worksheet will appear when printed?','Which view shows how a worksheet will look when printed?','NPEX 1-53')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Page Layout',1)
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')
insert into ans(ans_q,ansname) values(@qid,'Normal')
insert into ans(ans_q,ansname) values(@qid,'Reading')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following formulas most efficiently adds the values from cells B6, B7, B8, B9, and B10?','Which formula most efficiently adds the values in cells B6 through B10?','NPEX 1-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=TOTAL(B6+B7+B8+B9+B10)')
insert into ans(ans_q,ansname) values(@qid,'=TOTAL(B6-B10)')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM(B6:B10)',1)
insert into ans(ans_q,ansname) values(@qid,'=SUM(B6-B10)')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you click the File tab and then click Print, which of the following elements appears in the preview of the printout of the worksheet in Backstage view?','What appears in the print preview when you choose File and then Print?','NPEX 1-57')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'row headings')
insert into ans(ans_q,ansname) values(@qid,'column headings')
insert into ans(ans_q,ansname) values(@qid,'gridlines')
insert into ans(ans_q,ansname,correct) values(@qid,'worksheet data',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you discover an error immediately after you have confirmed a cell entry, which of the following could you do to reverse the error? Select all the options that apply.','Which actions can reverse a cell-entry error you just confirmed? Select 2 that apply.','NPEX 1-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click the Undo button on the Quick Access toolbar.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the Cancel button on the Formula bar.')
insert into ans(ans_q,ansname,correct) values(@qid,'Press CTRL+Z.',1)
insert into ans(ans_q,ansname) values(@qid,'Press CTRL+Y.')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To select a single worksheet cell so you can work with it, which of the following would you do?','How do you select a single worksheet cell?','NPEX 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click the cell.',1)
insert into ans(ans_q,ansname) values(@qid,'Move the cell pointer over the cell.')
insert into ans(ans_q,ansname) values(@qid,'Click the status bar.')
insert into ans(ans_q,ansname) values(@qid,'Click the Name box.')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following formulas calculates the total value of a range?','Which formula totals the values in a range?','NPEX 1-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=SUM(A3-A9)')
insert into ans(ans_q,ansname) values(@qid,'=AUTOSUM(A3-A9)')
insert into ans(ans_q,ansname) values(@qid,'=AUTOSUM(A3:A9)')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM(A3:A9)',1)

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you reverse your most recent action in Excel?','How do you undo your most recent action in Excel?','NPEX 1-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the Redo button.')
insert into ans(ans_q,ansname) values(@qid,'Click the Reverse button.')
insert into ans(ans_q,ansname) values(@qid,'Click the Escape button.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click the Undo button.',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following keys do you press to copy selected cells while you drag and drop the selected cells to their new location?','Which key do you hold while dragging selected cells to copy them to a new location?','NPEX 1-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'ALT')
insert into ans(ans_q,ansname) values(@qid,'SHIFT')
insert into ans(ans_q,ansname) values(@qid,'TAB')
insert into ans(ans_q,ansname,correct) values(@qid,'CTRL',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following formulas adds 25 and 10, and then multiplies the result by 50?','Which formula adds 25 and 10 first, then multiplies the result by 50?','NPEX 1-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=25+10*50')
insert into ans(ans_q,ansname) values(@qid,'=25+10x50')
insert into ans(ans_q,ansname) values(@qid,'=50x25+10')
insert into ans(ans_q,ansname,correct) values(@qid,'=50*(25+10)',1)

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Your worksheet is too wide to fit on one page in portrait orientation. Which of the following options could you choose to fix this problem?','A worksheet is too wide to fit on one portrait page. What can you change to fix this?','NPEX 1-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Hide the column headings.')
insert into ans(ans_q,ansname) values(@qid,'Insert a function.')
insert into ans(ans_q,ansname) values(@qid,'Copy columns to the next page.')
insert into ans(ans_q,ansname,correct) values(@qid,'Change the page orientation to landscape.',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following tabs in the ribbon provides immediate access to worksheet print options such as changing orientation and scaling to fit?','Which ribbon tab contains print-related options such as orientation and scaling?','NPEX 1-56')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Preview')
insert into ans(ans_q,ansname) values(@qid,'Home')
insert into ans(ans_q,ansname,correct) values(@qid,'Page Layout',1)
insert into ans(ans_q,ansname) values(@qid,'View')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following options can you set to make sure the active worksheet will print on one page?','Which setting can make the active worksheet print on one page?','NPEX 1-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Zoom percentage')
insert into ans(ans_q,ansname,correct) values(@qid,'Scaling',1)
insert into ans(ans_q,ansname) values(@qid,'Print selection')
insert into ans(ans_q,ansname) values(@qid,'Gridlines')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is the temporary storage area that holds selections you copy or cut?','What temporary storage area holds items you copy or cut?','NPEX 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Clipboard',1)
insert into ans(ans_q,ansname) values(@qid,'Backstage')
insert into ans(ans_q,ansname) values(@qid,'Name box')
insert into ans(ans_q,ansname) values(@qid,'Worksheet')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A named operation that replaces the arithmetic expression in a formula and can help you simplify complex formulas is called _____ in Excel.','What does Excel call a named operation that simplifies a formula?','NPEX 1-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'an argument')
insert into ans(ans_q,ansname) values(@qid,'a calculator')
insert into ans(ans_q,ansname) values(@qid,'a named range')
insert into ans(ans_q,ansname,correct) values(@qid,'a function',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If a worksheet contains data that is not of interest to the user and is better summarized in another part of the workbook, consider _____ the worksheet.','If a worksheet is not useful to view but its data is still needed elsewhere, what should you consider doing?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'deleting')
insert into ans(ans_q,ansname,correct) values(@qid,'hiding',1)
insert into ans(ans_q,ansname) values(@qid,'renaming')
insert into ans(ans_q,ansname) values(@qid,'moving')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following can you use to insert a formula using a function? Select all the options that apply.','Which methods can insert a formula that uses a function? Select 4 that apply.','NPEX 1-37, NPEX 1-38, NPEX 1-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Enter the formula including the function.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Click the AutoSum button.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Click the AutoSum arrow.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Copy and paste a cell containing a function.',1)

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a new, blank workbook, which of the following can you use? Select all the options that apply.','Which methods create a new blank workbook? Select 2 that apply.','NPEX 1-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click Open in Backstage view')
insert into ans(ans_q,ansname,correct) values(@qid,'Click New in Backstage view',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Press CTRL+N',1)
insert into ans(ans_q,ansname) values(@qid,'Press CTRL+W')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you double-click the right border of a column heading, which of the following occurs?','What happens when you double-click the right border of a column heading?','NPEX 1-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Excel hides the column to the left of the double-clicked border.')
insert into ans(ans_q,ansname) values(@qid,'AutoFit resizes the column to the default width of 8.43 characters.')
insert into ans(ans_q,ansname) values(@qid,'Excel adds a column to the right of the double-clicked border.')
insert into ans(ans_q,ansname,correct) values(@qid,'AutoFit resizes the column to accommodate the widest cell entry.',1)

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The default font size for worksheets is _____ points.','What is the default worksheet font size in points?','NPEX 1-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'10')
insert into ans(ans_q,ansname,correct) values(@qid,'11',1)
insert into ans(ans_q,ansname) values(@qid,'12')
insert into ans(ans_q,ansname) values(@qid,'14')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is true about adding cell borders?','Which statement about cell borders is true?','NPEX 1-51')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You cannot apply borders to all worksheet cells.')
insert into ans(ans_q,ansname) values(@qid,'A cell border underlines the cell text, not the entire cell.')
insert into ans(ans_q,ansname,correct) values(@qid,'You can add a border to the left, top, right, or bottom edge of a cell or range.',1)
insert into ans(ans_q,ansname) values(@qid,'Borders are always single or double black lines.')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Your worksheet contains confidential information in column C; to prevent others who use your worksheet from seeing the data, you can _____ column C.','How can you keep users from seeing confidential data in column C without deleting it?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'delete')
insert into ans(ans_q,ansname) values(@qid,'undo')
insert into ans(ans_q,ansname) values(@qid,'edit')
insert into ans(ans_q,ansname,correct) values(@qid,'hide',1)

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You receive a worksheet in which the rows are numbered 1, 2, 3, 5,6. This means that row 4 is _____.','If worksheet row numbers jump from 3 to 5, what happened to row 4?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'deleted')
insert into ans(ans_q,ansname,correct) values(@qid,'hidden',1)
insert into ans(ans_q,ansname) values(@qid,'cut')
insert into ans(ans_q,ansname) values(@qid,'conditionally formatted')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Sam wants to count the number of cells between B1 and B20 that contain numbers in them. Which of the following formula should he use to do so?','Which formula counts the cells in B1:B20 that contain numbers?','NPEX 1-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=COUNT(B1:B20)',1)
insert into ans(ans_q,ansname) values(@qid,'=COUNTIF(B1:B20)')
insert into ans(ans_q,ansname) values(@qid,'=COUNTNUM(B1:B20)')
insert into ans(ans_q,ansname) values(@qid,'=COUNTNUMERIC(B1:B20)')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Abdul needs to count the number of nonblank cells in the range of cells B1 to B20. Which of the following formulas should he use to do so?','Which formula counts the nonblank cells in B1:B20?','NPEX 1-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=COUNT(B1:B20)')
insert into ans(ans_q,ansname) values(@qid,'=COUNTIF(B1:B20)')
insert into ans(ans_q,ansname,correct) values(@qid,'=COUNTA(B1:B20)',1)
insert into ans(ans_q,ansname) values(@qid,'=DCOUNTA(B1:B20)')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Flash Fill enters text based on patterns it finds in the data.','Flash Fill enters text by recognizing patterns in existing data.','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Changing a worksheet window to Normal view changes the contents of the worksheet.','Switching a worksheet to Normal view changes the worksheet''s contents.','NPEX 1-53')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In formulas, calculations in square brackets are calculated first.','In Excel formulas, operations inside square brackets are calculated first.','NPEX 1-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you click a cell to insert a cell reference in a formula, you must type a number to lock the cell reference in the formula.','When inserting a cell reference into a formula, you must type a number to lock that reference.','NPEX 1-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Furaha has entered a column of expense values. What feature can she use to insert the total expenses at the end of the column? Select all the options that apply.','Which methods can quickly total a column of expenses? Select 3 that apply.','NPEX 1-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click the AutoSum button.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the SUM button.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click the AutoSum arrow.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Press ALT+=.',1)

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following statements is true about COUNT functions?','Which statement about the COUNT function is true?','NPEX 1-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The COUNT function returns the number of calls in a range that are not blank.')
insert into ans(ans_q,ansname) values(@qid,'The COUNT function returns the number of calls in a range that contain any data at all.')
insert into ans(ans_q,ansname) values(@qid,'Using the COUNT function is useful for computing the average of a cell range.')
insert into ans(ans_q,ansname,correct) values(@qid,'The COUNT function returns the number of cells in a range that contain numeric data.',1)

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Ayanda entered customer first names in column A and last names in column B. In cell C2, they entered the corresponding full name by typing the first name from cell A2, pressing SPACEBAR, and then typing the last name from cell B2. What feature can they use next to enter the remaining full names in column C?','A full name has been entered in C2 using first name from A2 and last name from B2. Which feature can fill the remaining names in column C?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Business Intelligence')
insert into ans(ans_q,ansname,correct) values(@qid,'Flash Fill',1)
insert into ans(ans_q,ansname) values(@qid,'Quick Analysis')
insert into ans(ans_q,ansname) values(@qid,'What-if analysis')

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following indicates the column and row where a cell is located?','What identifies a cell by its column and row?','NPEX 1-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'cell reference',1)
insert into ans(ans_q,ansname) values(@qid,'active cell')
insert into ans(ans_q,ansname) values(@qid,'column heading')
insert into ans(ans_q,ansname) values(@qid,'formula bar')

-- 44
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can view the cell reference of the active cell in the _____ in the area above the worksheet grid.','Where can you see the reference of the active cell above the worksheet grid?','NPEX 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'formula bar')
insert into ans(ans_q,ansname,correct) values(@qid,'Name box',1)
insert into ans(ans_q,ansname) values(@qid,'worksheet title')
insert into ans(ans_q,ansname) values(@qid,'status bar')

-- 45
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Your worksheet appears with a reduced view of each page and blue dividers where new pages begin. What view are you in?','Which view shows reduced pages with blue lines marking page breaks?','NPEX 1-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Normal view')
insert into ans(ans_q,ansname) values(@qid,'Page Layout view')
insert into ans(ans_q,ansname,correct) values(@qid,'Page Break Preview',1)
insert into ans(ans_q,ansname) values(@qid,'Print screen in Backstage view')

-- 46
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In a complex formula, how does Excel determine which calculation to perform first?','How does Excel decide which operation to perform first in a complex formula?','NPEX 1-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'It calculates the leftmost formulas first.')
insert into ans(ans_q,ansname) values(@qid,'It calculates operations outside parentheses first.')
insert into ans(ans_q,ansname,correct) values(@qid,'It follows the order of operations.',1)
insert into ans(ans_q,ansname) values(@qid,'It calculates functions first.')

-- 47
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Prasad wants to insert two blank rows above row 5. To do so, he can click the row 5 heading, and then click the Insert button in the Cells group two times.','To insert two blank rows above row 5, you can select row 5 and use Insert twice.','NPEX 1-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 48
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you copy cell contents, the data is removed from its original location and placed on the Clipboard.','Copying cell contents removes them from the original location and places them on the Clipboard.','NPEX 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 49
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is true about moving cell contents?','Which statement about moving cell contents is true?','NPEX 1-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You can move cells using the Copy command.')
insert into ans(ans_q,ansname) values(@qid,'You cannot move cells from one worksheet to another.')
insert into ans(ans_q,ansname) values(@qid,'When you move cell contents, they remain in their original location.')
insert into ans(ans_q,ansname,correct) values(@qid,'You can move cells using the drag-and-drop feature.',1)

-- 50
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Excel retrieves the most recently copied formula from the Clipboard and places it into the selected cell when you _____ a formula.','What action places the most recently copied formula from the Clipboard into the selected cell?','NPEX 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'copy')
insert into ans(ans_q,ansname,correct) values(@qid,'paste',1)
insert into ans(ans_q,ansname) values(@qid,'cut')
insert into ans(ans_q,ansname) values(@qid,'move')

-- 51
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Zaida stored the formula =SUM(E12:G12) into cell A12. She then copied and pasted the formula to the cell 3 rows directly below A12. Which of the following depicts the change to the cell references in the cell that contains the pasted contents?','If =SUM(E12:G12) is copied from A12 to A15, how do the cell references change?','NPEX 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=SUM(E12:G12)')
insert into ans(ans_q,ansname,correct) values(@qid,'=SUM(E15:G15)',1)
insert into ans(ans_q,ansname) values(@qid,'=SUM(H12:J:12)')
insert into ans(ans_q,ansname) values(@qid,'=SUM(H15:J:15)')

-- 52
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Min has selected a cell range and then pasted the most recently copied formula into the range by using the Paste button in the Clipboard group. Which of the following applies to this situation?','After pasting a copied formula into a selected range, what happens?','NPEX 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'A button appeared below the selected cells, providing options for pasting formulas and values.',1)
insert into ans(ans_q,ansname) values(@qid,'They must adjust the cell references in the pasted formulas in the selected range.')
insert into ans(ans_q,ansname) values(@qid,'The Auto Fill Options button appeared, providing options for pasting in the selected range.')
insert into ans(ans_q,ansname) values(@qid,'They can preview the pasted formulas by pointing to each cell in the selected range.')

-- 53
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is not a way to move cell contents?','Which method does NOT move cell contents?','NPEX 1-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the Cut button, right-click the selection, then click the Paste button.')
insert into ans(ans_q,ansname) values(@qid,'Press CTRL+X, right-click the selection, then press CTRL+V.')
insert into ans(ans_q,ansname,correct) values(@qid,'Press and hold CTRL while dragging selected cells to a new location.',1)
insert into ans(ans_q,ansname) values(@qid,'Drag-and-drop selected cells to a new location.')

-- 54
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Bohdan wants to cut the range A1:A5 and paste it to C1:C5. Which of the following statements is true? Select all the options that apply.','When cutting A1:A5 and pasting it to C1:C5, which statements are true? Select 2 that apply.','NPEX 1-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Before he pastes it, he needs to select C1:C5.')
insert into ans(ans_q,ansname,correct) values(@qid,'Before he pastes it, he only needs to select cell C1.',1)
insert into ans(ans_q,ansname) values(@qid,'After he pastes it, the information is deleted from the Clipboard.')
insert into ans(ans_q,ansname,correct) values(@qid,'After he pastes it, the information is deleted from the original location.',1)

-- 55
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you insert a worksheet row, a row is inserted above the cell pointer and the sheet contents move downward.','Inserting a worksheet row adds the row above the cell pointer and shifts existing content downward.','NPEX 1-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 56
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To move a worksheet, you can drag its sheet tab to the left or right.','You can move a worksheet by dragging its sheet tab left or right.','NPEX 1-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 57
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you select a cell range, the cells must be adjacent to each other.','A selected cell range must always contain adjacent cells.','NPEX 1-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 58
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To paste a copied cell range, you only need to specify the upper right cell of the range where you want to paste it.','To paste a copied range, you only need to select the upper-right cell of the destination range.','NPEX 1-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 59
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is not true about setting column width?','Which statement about setting column width is NOT true?','NPEX 1-27, NPEX 1-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Column widths are expressed as the number of characters a column can contain.')
insert into ans(ans_q,ansname) values(@qid,'The default column width is 8.43 standard-sized characters.')
insert into ans(ans_q,ansname,correct) values(@qid,'You can change the width of only one column at a time.',1)
insert into ans(ans_q,ansname) values(@qid,'You can use the Format button in the Cells group to set an exact column width.')

-- 60
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is true about deleting a worksheet row?','Which statement about deleting a worksheet row is true?','NPEX 1-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'After you delete a row, the rows below it shift down one row.')
insert into ans(ans_q,ansname) values(@qid,'Deleting a row and clearing a row have the same results.')
insert into ans(ans_q,ansname,correct) values(@qid,'Deleting a row removes both the data and the selected cells from the worksheet.',1)
insert into ans(ans_q,ansname) values(@qid,'Deleting a row removes the data but preserves the worksheet structure.')

-- 61
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you insert a column in a worksheet, what happens to formulas you already entered?','What happens to existing formulas when you insert a worksheet column?','NPEX 1-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Excel updates the cell references in their formulas to reflect the moved cell locations.',1)
insert into ans(ans_q,ansname) values(@qid,'Excel does not change the formulas in the moved cells.')
insert into ans(ans_q,ansname) values(@qid,'Excel displays an error in the moved cells that contain formulas..')
insert into ans(ans_q,ansname) values(@qid,'You need to manually update the cell references in the formulas of the moved cells.')

-- 62
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After you delete a worksheet column, Excel removes the data from its cells and _____.','After deleting a worksheet column, what happens to the cells to its right?','NPEX 1-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'the cells to its right shift left to fill the vacated space',1)
insert into ans(ans_q,ansname) values(@qid,'the cells to its left shift right to fill the vacated space')
insert into ans(ans_q,ansname) values(@qid,'the cells below it shift up to fill the vacated space')
insert into ans(ans_q,ansname) values(@qid,'preserves the worksheet structure')

-- 63
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You need to add another product to your inventory worksheet, which shows product names in row A. Which of the following should you add?','Your inventory worksheet has product names arranged in row A. What should you add for another product?','NPEX 1-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'a row')
insert into ans(ans_q,ansname,correct) values(@qid,'a column',1)
insert into ans(ans_q,ansname) values(@qid,'a button')
insert into ans(ans_q,ansname) values(@qid,'conditional formatting')

-- 64
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Semra wanted to rename a worksheet, so she double-clicked the sheet _____, typed a new name, and then pressed ENTER.','What part of the worksheet did Semra double-click to rename the sheet?','NPEX 1-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'columns')
insert into ans(ans_q,ansname) values(@qid,'rows')
insert into ans(ans_q,ansname) values(@qid,'header')
insert into ans(ans_q,ansname,correct) values(@qid,'tab',1)

-- 65
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To select nonadjacent cells or ranges on a worksheet, you can press and hold _____ while selecting each one.','Which key do you hold while selecting nonadjacent cells or ranges?','NPEX 1-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'CTRL',1)
insert into ans(ans_q,ansname) values(@qid,'ALT')
insert into ans(ans_q,ansname) values(@qid,'SHIFT')
insert into ans(ans_q,ansname) values(@qid,'ESC')

-- 66
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following type of data can you wrap within a cell?','Which type of data can be wrapped within a cell?','NPEX 1-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'text',1)
insert into ans(ans_q,ansname) values(@qid,'numbers')
insert into ans(ans_q,ansname) values(@qid,'dates')
insert into ans(ans_q,ansname) values(@qid,'times')

-- 67
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To redisplay a hidden worksheet, you _____ the worksheet.','What do you do to make a hidden worksheet visible again?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'unhide',1)
insert into ans(ans_q,ansname) values(@qid,'redisplay')
insert into ans(ans_q,ansname) values(@qid,'review')
insert into ans(ans_q,ansname) values(@qid,'undo')

-- 68
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Myra does not want a worksheet of sensitive data to be available to other users, but she does want to use its data in formulas in other worksheets. What can she do?','Myra wants to hide sensitive worksheet data but still use that data in formulas on other sheets. What should she do?','NPEX 1-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Move the worksheet to the end of the workbook.')
insert into ans(ans_q,ansname) values(@qid,'Display the worksheet in Privacy view.')
insert into ans(ans_q,ansname,correct) values(@qid,'Hide the worksheet.',1)
insert into ans(ans_q,ansname) values(@qid,'Rename the worksheet.')

-- 69
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you specify that you want worksheet gridlines to appear on the screen, they will automatically appear on the printout as well.','If gridlines are visible on screen, they automatically print as well.','NPEX 1-56')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 70
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To preserve the original version of a workbook so you can make changes to a copy of it, which of the following would you do after opening the workbook?','How can you preserve an original workbook while making changes to a separate copy?','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Copy the cells below the last line of data, and then make changes.')
insert into ans(ans_q,ansname) values(@qid,'Change the first worksheet, and save it using the same name.')
insert into ans(ans_q,ansname) values(@qid,'Save it using the same name, and then make changes.')
insert into ans(ans_q,ansname,correct) values(@qid,'Save it using a different name,, and then make changes.',1)

-- 71
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Where do you rename a workbook and adjust its save location?','Where can you rename a workbook and change where it is saved?','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Save As dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Home tab')
insert into ans(ans_q,ansname) values(@qid,'Name box')
insert into ans(ans_q,ansname) values(@qid,'Active cell')

-- 72
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is true about deleting a worksheet? Select all the options that apply.','Which statements about deleting a worksheet are true? Select 2 that apply.','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'You can right-click a sheet tab and then click Delete on the shortcut menu.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Deleting a worksheet deletes any text and data it contains.',1)
insert into ans(ans_q,ansname) values(@qid,'You can click the Delete button in the Worksheet group on the Insert tab.')
insert into ans(ans_q,ansname) values(@qid,'You cannot delete a worksheet from a workbook.')

-- 73
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To save a workbook for the first time, you use the Save As dialog box to name the file and choose where to save it.','When saving a workbook for the first time, Save As lets you name the file and choose its location.','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 74
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Tendai can copy a worksheet instead of moving it by pressing and holding SHIFT as they drag the sheet tab.','Holding SHIFT while dragging a sheet tab copies the worksheet instead of moving it.','NPEX 1-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 75
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To add a worksheet to a workbook, you would use the New sheet tab below the worksheet.','To add a worksheet to a workbook, use the New sheet tab below the worksheet.','NPEX 1-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 76
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which worksheet view shows headers and footers?','Which worksheet view displays headers and footers?','NPEX 1-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Normal view')
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')
insert into ans(ans_q,ansname,correct) values(@qid,'Page Layout view',1)
insert into ans(ans_q,ansname) values(@qid,'Formula view')

-- 77
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following will display a worksheet as it will appear when printed? Select all the options that apply.','Which views show a worksheet as it will appear when printed? Select 3 that apply.','NPEX 1-33, NPEX 1-56')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Page Layout view',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Print screen in Backstage view',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Page Break Preview',1)
insert into ans(ans_q,ansname) values(@qid,'Normal view')

-- 78
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After inserting a new worksheet, what should you do to indicate the purpose and content of the sheet?','After adding a new worksheet, what should you do so its purpose is clear?','NPEX 1-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Move the worksheet.')
insert into ans(ans_q,ansname) values(@qid,'Hide the worksheet.')
insert into ans(ans_q,ansname) values(@qid,'Protect the worksheet.')
insert into ans(ans_q,ansname,correct) values(@qid,'Rename the worksheet.',1)

-- 79
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following methods copies an existing worksheet within the same workbook?','Which method copies an existing worksheet within the same workbook?','NPEX 1-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Drag its sheet tab to a new location.')
insert into ans(ans_q,ansname,correct) values(@qid,'Press and hold CTRL and drag its sheet tab to a new location.',1)
insert into ans(ans_q,ansname) values(@qid,'Press and hold SHIFT and drag its sheet tab to a new location.')
insert into ans(ans_q,ansname) values(@qid,'Press and hold ALT and drag its sheet tab to a new location.')

-- 80
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you are using a workbook and want to open another one, you can display Backstage view and then click Open.','To open another workbook while one is already open, you can use Open in Backstage view.','NPEX 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 81
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To format a cell so that text that exceeds the column width will create a new line in the same cell, you can change the row height.','Changing row height makes text wider than the column wrap onto a new line in the same cell.','NPEX 1-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 82
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following methods will save an existing workbook to your OneDrive account? Select all the options that apply.','Which methods save an existing workbook to OneDrive? Select 2 that apply.','NPEX 1-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click the file name in the title bar and then click Upload.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Use the Save As dialog box to select a OneDrive folder as the file location.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the File tab, then select Save As to select a OneDrive folder as the file location.')
insert into ans(ans_q,ansname) values(@qid,'Click the File tab, then select Save to select a OneDrive folder as the file location.')

-- 83
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following helps you move different parts of a worksheet into view when the worksheet is too large to fit on the screen at once?','What lets you move different parts of a large worksheet into view?','NPEX 1-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'sheet tabs')
insert into ans(ans_q,ansname) values(@qid,'arguments')
insert into ans(ans_q,ansname,correct) values(@qid,'scroll bars',1)
insert into ans(ans_q,ansname) values(@qid,'operators')

-- 84
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a fast and convenient way to enter a commonly-used function into a selected cell or range?','What is a quick way to enter a commonly used function into a selected cell or range?','NPEX 1-39')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'function injector')
insert into ans(ans_q,ansname,correct) values(@qid,'AutoSum button',1)
insert into ans(ans_q,ansname) values(@qid,'argument')
insert into ans(ans_q,ansname) values(@qid,'formula prefix (=)')

-- 85
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A template is a preformatted workbook that contains document design and some content already entered into the document.','A template is a preformatted workbook that already contains design elements and some content.','NPEX 1-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 86
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can relocate a page break by dragging the dotted blue border in the Page Break Preview window..','In Page Break Preview, you can move a page break by dragging its dotted blue border.','NPEX 1-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')
select * from q 
where q_act=@actid
