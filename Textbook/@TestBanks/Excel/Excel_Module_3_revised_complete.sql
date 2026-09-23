insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 3',8,107,'Test/bank.cfm',3)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Nathan wants a formula to return "Yes" if the value in cell A1 is less than the value in cell B1, and to return "No" otherwise. Which of the following functions should he use?','Which function should return Yes when A1 is less than B1 and No otherwise?','NPEX 3-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IFERROR')
insert into ans(ans_q,ansname) values(@qid,'VLOOKUP')
insert into ans(ans_q,ansname,correct) values(@qid,'IF',1)
insert into ans(ans_q,ansname) values(@qid,'RAND')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The score of a student is inserted in cell B2. The passing score for the subject is 60. Which of the following functions should you insert in cell C2 to check whether the student has passed or failed?','Which formula returns Pass when B2 is at least 60 and Fail otherwise?','NPEX 3-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=IF(B2>=60, "Pass", "Fail")',1)
insert into ans(ans_q,ansname) values(@qid,'=IF(B2 < 60, "Pass", "Fail")')
insert into ans(ans_q,ansname) values(@qid,'=IF(B2 = 60, "Pass", "Fail")')
insert into ans(ans_q,ansname) values(@qid,'=IFERROR(IF((B2 >= 60, "Pass", "Fail"))')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Jason wants to average the sales in the range C3:C50, and then round the result to the nearest integer. Which of the following formulas should he use?','Which formula averages C3:C50 and rounds the result to the nearest whole number?','NPEX 3-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=ROUND(AVERAGE(C3:C50),0)',1)
insert into ans(ans_q,ansname) values(@qid,'=AVERAGE((C3:C50), ROUND, 0))')
insert into ans(ans_q,ansname) values(@qid,'=ROUND(C3:C50)')
insert into ans(ans_q,ansname) values(@qid,'AVERAGE(ROUND(C3:C50),0)')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To insert only the current date in cell B1, use the NOW function in cell B1.','The NOW function returns only the current date.','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Jose inserts the formula =DATE(2021, 2, 15) in cell A15. When he presses ENTER, 2/15/2021 will appear in the cell.','The formula =DATE(2021, 2, 15) displays February 15, 2021.','NPEX 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To preserve an exact cell address in a copied formula, you can use a relative cell reference.','A relative cell reference keeps the exact same cell address when a formula is copied.','NPEX 3-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Your worksheet contains a price in cell A5, and many formulas refer to that price. How would you refer to that price in the formulas?','Which reference should you use when formulas must always refer to the price in cell A5?','NPEX 3-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A5')
insert into ans(ans_q,ansname,correct) values(@qid,'$A$5',1)
insert into ans(ans_q,ansname) values(@qid,'$A5')
insert into ans(ans_q,ansname) values(@qid,'A$5')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You''ve copied a cell containing formula to the rows below it, and the results in the copied cells are all zeros. To find the problem, what should you check for in your original formula?','Copied formulas are returning zeros. What should you check in the original formula first?','NPEX 3-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'If it needs an absolute cell reference.',1)
insert into ans(ans_q,ansname) values(@qid,'If it needs a relative cell reference.')
insert into ans(ans_q,ansname) values(@qid,'If it needs landscape orientation.')
insert into ans(ans_q,ansname) values(@qid,'If it needs a function.')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the formula =B6*$B$2, which of the following describes $B$2?','In =B6*$B$2, what type of cell reference is $B$2?','NPEX 3-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Relative cell reference')
insert into ans(ans_q,ansname,correct) values(@qid,'Absolute cell reference',1)
insert into ans(ans_q,ansname) values(@qid,'Function')
insert into ans(ans_q,ansname) values(@qid,'Average')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Arlo wants to use Goal Seek to answer a what-if question in a worksheet. Which button should he click on the Data tab to access the Goal Seek command?','Which Data tab command gives access to Goal Seek?','NPEX 3-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'What-if Analysis',1)
insert into ans(ans_q,ansname) values(@qid,'Data Validation')
insert into ans(ans_q,ansname) values(@qid,'Consolidate')
insert into ans(ans_q,ansname) values(@qid,'Relationships')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To find the largest value in a cell range, use the MIN function.','The MIN function returns the largest value in a range.','NPEX 3-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You have selected a cell with a formula. Which of the following can you use to copy that formula to an adjacent cell?','Which feature can copy a formula into an adjacent cell?','NPEX 3-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'mode indicator')
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')
insert into ans(ans_q,ansname) values(@qid,'scroll bar')
insert into ans(ans_q,ansname,correct) values(@qid,'Fill handle',1)

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To have Excel enter the lowest price from a range of prices, which of the following would you use?','Which function returns the lowest value in a range of prices?','NPEX 3-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'MAX function')
insert into ans(ans_q,ansname) values(@qid,'COUNT function')
insert into ans(ans_q,ansname,correct) values(@qid,'MIN function',1)
insert into ans(ans_q,ansname) values(@qid,'COUNTA function')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions would you use to calculate the arithmetic mean of a price list?','Which function calculates the arithmetic mean of a list of prices?','NPEX 3-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'MAX')
insert into ans(ans_q,ansname) values(@qid,'COUNT')
insert into ans(ans_q,ansname) values(@qid,'SUM')
insert into ans(ans_q,ansname,correct) values(@qid,'AVERAGE',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A constant is a term in an equation whose value does not change.','A constant is a value in an equation that does not change.','NPEX 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following Excel tools displays the syntax for a selected function?','Which Excel tool shows the syntax for a selected function?','NPEX 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Formula bar')
insert into ans(ans_q,ansname,correct) values(@qid,'Insert Function dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Insert dialog box')
insert into ans(ans_q,ansname) values(@qid,'Function Library')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are true about entering a function using the Insert Function dialog box? Select all the options that apply.','Which statements about the Insert Function dialog box are true? Select 2 that apply.','NPEX 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You open the dialog box by typing "function" in the formula bar.')
insert into ans(ans_q,ansname,correct) values(@qid,'You can use the search tool in the Insert Function dialog box to find a function.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'You can select a category to explore functions by type.',1)
insert into ans(ans_q,ansname) values(@qid,'You can use the Insert Function dialog box to insert a function based on nearby formulas.')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Cell A5 contains the number 24.7835. In another cell, Ariane wants to enter the number from cell A5 but rounded to two decimal places. Which of these formulas can she use to do so?','Which formula rounds the value in A5 to two decimal places?','NPEX 3-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=ROUND(A5,2)',1)
insert into ans(ans_q,ansname) values(@qid,'=MROUND(A5,2)')
insert into ans(ans_q,ansname) values(@qid,'=ROUND(A5,2.0)')
insert into ans(ans_q,ansname) values(@qid,'=MROUND(A5,0.2)')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What is the correct formula to insert the date January 12, 1998 into a cell?','Which formula correctly enters January 12, 1998?','NPEX 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=DATE(1998,1,12)',1)
insert into ans(ans_q,ansname) values(@qid,'=DATE(1998,12,1)')
insert into ans(ans_q,ansname) values(@qid,'=DATE(12-1-1998)')
insert into ans(ans_q,ansname) values(@qid,'=DATE(1/12/1998)')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Ian needs to extract the day of the month from the date entered as a serial number in cell A1. Which formula can he use to do this?','Which formula extracts the day of the month from a date in A1?','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'=DAY(A1)',1)
insert into ans(ans_q,ansname) values(@qid,'=DAY("A1'''')')
insert into ans(ans_q,ansname) values(@qid,'=DATE(DAY(A1))')
insert into ans(ans_q,ansname) values(@qid,'=DATE("DAY"(A1))')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which formula can you use to extract the month number from the date entered in cell F5 as July 8, 2016?','Which formula returns the month number from the date in F5?','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'=MONTH(F5)')
insert into ans(ans_q,ansname) values(@qid,'=MONTH("F5")')
insert into ans(ans_q,ansname,correct) values(@qid,'=MONTH(DATE(2016,7,0))',1)
insert into ans(ans_q,ansname) values(@qid,'=MONTH(DAY(2016,7,0))')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A student types the formula ''= YEAR( TODAY())-2005'' to calculate the age of a person born in 2005. This formula will use the TODAY function as an argument for the YEAR function to obtain the current year, and then subtract 2005 returning the person''s age.','The formula =YEAR(TODAY())-2005 uses the current year to estimate the age of someone born in 2005.','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Rohan can display the current date in a cell using the TODAY() function.','The TODAY() function can display the current date in a cell.','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Kamala enters a date as the start date in cell E2 and a list of holidays in cells F2:F5. Now she wants to add 30 workdays to the start date. She can do this using the following formula: = WORKDAY (E2, 30, F2:F5).','The formula =WORKDAY(E2,30,F2:F5) adds 30 workdays to the date in E2 while excluding the listed holidays.','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Stuart inserts the formula ''=YEAR (''23-Aug-2012)'' into cell B12. When he presses ENTER, 23/08/2012 will appear in B12.','The formula =YEAR(''23-Aug-2012'') returns the full date 23/08/2012.','NPEX 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Cell A4 contains the time 10:27 pm. To round that time to the nearest 30-minute interval, use the formula =MROUND(A4,0:30).','The formula =MROUND(A4,0:30) correctly rounds a time in A4 to the nearest 30 minutes.','NPEX 3-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What does the third argument (3) refer to in the following formula: VLOOKUP(10005, A1:C6, 3, FALSE)?','In VLOOKUP(10005,A1:C6,3,FALSE), what does the third argument, 3, specify?','NPEX 3-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'number of the column containing the return value',1)
insert into ans(ans_q,ansname) values(@qid,'location of the lookup table')
insert into ans(ans_q,ansname) values(@qid,'cell with the lookup value')
insert into ans(ans_q,ansname) values(@qid,'whether to return a value only when an exact match is found')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Kathy wants to add the numbers entered in a range of selected cells. To do this, which tab will she click on the menu that appears after clicking on Totals in the Quick Analysis option?','Which Quick Analysis total should you choose to add the selected values?','NPEX 3-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Sum',1)
insert into ans(ans_q,ansname) values(@qid,'Count')
insert into ans(ans_q,ansname) values(@qid,'Average')
insert into ans(ans_q,ansname) values(@qid,'%Total')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following lets you extend any data pattern involving dates, times, numbers, or text?','Which feature extends a pattern involving dates, times, numbers, or text?','NPEX 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'AutoSum list')
insert into ans(ans_q,ansname,correct) values(@qid,'AutoFill Options button',1)
insert into ans(ans_q,ansname) values(@qid,'Paste Options button')
insert into ans(ans_q,ansname) values(@qid,'Quick Analysis')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can insert a formula by selecting a range of values, clicking the Quick Analysis button, and then clicking Tables.','To insert a formula with Quick Analysis, select a range and choose Tables.','NPEX 3-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Use Goal Seek to specify an output value and work backward to find the input value needed to reach that goal.','Goal Seek works backward from a desired result to determine the needed input value.','NPEX 3-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'AutoComplete can extend any data pattern involving dates, times, numbers, and text.','AutoComplete can extend patterns involving dates, times, numbers, and text.','NPEX 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To create a formula that provides a statistical analysis of data, include a function from the Text category.','To perform statistical analysis, use a function from the Text category.','NPEX 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To retrieve a return value from a vertical lookup table, you use the VTABLE function.','The VTABLE function retrieves a value from a vertical lookup table.','NPEX 3-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are functions you can use to calculate measures of central tendency? Select all the options that apply.','Which functions measure central tendency? Select 2 that apply.','NPEX 3-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'AVERAGE',1)
insert into ans(ans_q,ansname,correct) values(@qid,'MEDIAN',1)
insert into ans(ans_q,ansname) values(@qid,'SUM')
insert into ans(ans_q,ansname) values(@qid,'MAX')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The IF function can use which of the following comparison operators? Select all the options that apply.','Which comparison operators can be used with IF? Select 3 that apply.','NPEX 3-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'= (equal)',1)
insert into ans(ans_q,ansname,correct) values(@qid,'> (greater than)',1)
insert into ans(ans_q,ansname) values(@qid,'* (multiplication)')
insert into ans(ans_q,ansname,correct) values(@qid,'<> (not equal)',1)

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions does Excel provide for rounding values? Select all the options that apply.','Which functions can round values? Select 3 that apply.','NPEX 3-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'ROUNDIF')
insert into ans(ans_q,ansname,correct) values(@qid,'ROUND',1)
insert into ans(ans_q,ansname,correct) values(@qid,'ROUNDDOWN',1)
insert into ans(ans_q,ansname,correct) values(@qid,'ROUNDUP',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions generate random values? Select all the options that apply.','Which functions generate random values? Select 2 that apply.','NPEX 3-45')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'RAND',1)
insert into ans(ans_q,ansname) values(@qid,'RANDDOWN')
insert into ans(ans_q,ansname) values(@qid,'RANDUP')
insert into ans(ans_q,ansname,correct) values(@qid,'RANDBETWEEN',1)

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which Excel features can you use to extend a formula into a range with AutoFill? Select all the options that apply.','Which features can extend a formula through a range with AutoFill? Select 2 that apply.','NPEX 3-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Fill handle',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Fill button in the Editing group',1)
insert into ans(ans_q,ansname) values(@qid,'Quick Analysis tool')
insert into ans(ans_q,ansname) values(@qid,'AutoSum button in the Editing group')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When Valerie used AutoFill to copy a formula, Excel copied the format and removed shading from some cells. What can she do to prevent the formatting change?','AutoFill copied unwanted formatting. What option prevents the formatting from being copied?','NPEX 3-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Click the AutoFill Options button and then click Fill Without Formatting.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the AutoFill Options button and then click Fill Formatting Only.')
insert into ans(ans_q,ansname) values(@qid,'Click the Paste Options button and then click Undo.')
insert into ans(ans_q,ansname) values(@qid,'Click the Quick Analysis button and then click Fill Without Formatting.')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If the VLOOKUP function cannot find a match in the lookup table, what does it return?','What does VLOOKUP return when it cannot find a matching value?','NPEX 3-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'"Match not found" message')
insert into ans(ans_q,ansname,correct) values(@qid,'#N/A error value',1)
insert into ans(ans_q,ansname) values(@qid,'FALSE')
insert into ans(ans_q,ansname) values(@qid,'#NAME error value')

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In column D of a worksheet, Cal lists the number of hours each employee works. What function should he use to find the employee who worked the most hours?','Which function finds the largest number of hours worked in column D?','NPEX 3-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'MIN')
insert into ans(ans_q,ansname) values(@qid,'MEDIAN')
insert into ans(ans_q,ansname) values(@qid,'INT')
insert into ans(ans_q,ansname,correct) values(@qid,'MAX',1)

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a type of logical function?','Which function is a logical function?','NPEX 3-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'AVERAGE')
insert into ans(ans_q,ansname) values(@qid,'ROUND')
insert into ans(ans_q,ansname,correct) values(@qid,'IF',1)
insert into ans(ans_q,ansname) values(@qid,'VLOOKUP')

select * from q 
where q_act=@actid
