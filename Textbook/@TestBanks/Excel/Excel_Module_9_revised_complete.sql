insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 9',8,107,'Test/bank.cfm',9)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To examine each part of a formula individually, click Evaluate Formula on the Formulas tab after selecting the cell containing the formula.','To examine each part of a formula individually, click Evaluate Formula on the Formulas tab after selecting the cell containing the formula.','NPEX 9-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To calculate a column of running totals for the net cash flow to investors, use Running Totals on the Totals tab of the Quick Analysis toolbar.','To calculate a column of running totals for the net cash flow to investors, use Running Totals on the Totals tab of the Quick Analysis toolbar.','NPEX 9-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To remove trace arrows in a cell, click the Remove Arrows button on the Formulas tab.','To remove trace arrows in a cell, click the Remove Arrows button on the Formulas tab.','NPEX 9-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To display a tracer arrow to each cell providing direct data that is dependent on the active cell, click Trace Dependents on the Formulas tab','To display a tracer arrow to each cell providing direct data that is dependent on the active cell, click Trace Dependents on the Formulas tab','NPEX 9-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To display a tracer arrow to each cell providing direct data to the active cell, click Trace Dependents on the Formulas tab.','To display a tracer arrow to each cell providing direct data to the active cell, click Trace Dependents on the Formulas tab.','NPEX 9-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To calculate the total interest paid on a loan over a full year, you use the CUMPRINC function.','To calculate the total interest paid on a loan over a full year, you use the CUMPRINC function.','NPEX 9-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To use the SLN function to calculate the depreciation of an asset, you need to know the cost, salvage value, and life of the asset.','To use the SLN function to calculate the depreciation of an asset, you need to know the cost, salvage value, and life of the asset.','NPEX 9-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You use the Evaluate Formula dialog box to enter a formula that uses a financial function.','You use the Evaluate Formula dialog box to enter a formula that uses a financial function.','NPEX 9-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Allison''s small business earns $10,000 in January. She expects income to increase by 5 percent per month until the end of the year. To use Excel to calculate monthly income from February to December, Allison can fill a series with a trend.','Allison''s small business earns $10,000 in January. She expects income to increase by 5 percent per month until the end of the year. To use Excel to calculate monthly income from February to December, Allison can fill a series with a trend.','NPEX 9-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To calculate the number of payments required either to repay a loan or to reach an investment goal, you use the _____ function.','To calculate the number of payments required either to repay a loan or to reach an investment goal, you use the _____ function.','NPEX 9-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'NPV')
insert into ans(ans_q,ansname) values(@qid,'PV')
insert into ans(ans_q,ansname,correct) values(@qid,'NPER',1)
insert into ans(ans_q,ansname) values(@qid,'PMT')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following formulas would you use to calculate the fourth year of depreciation of a $100,000 loan that declines to a salvage value of $25,000 after 10 years?','Which formulas would you use to calculate the fourth year of depreciation of a $100,000 loan that declines to a salvage value of $25,000 after 10 years?','NPEX 9-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'DB(100000, 25000, 10, 4)',1)
insert into ans(ans_q,ansname) values(@qid,'SLN(100000, 25000, 4)')
insert into ans(ans_q,ansname) values(@qid,'DB(100000, 10, 4)')
insert into ans(ans_q,ansname) values(@qid,'SLN(25000, 10, 4)')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The RATE function has the syntax RATE(Nper, Pmt, Pv, Fv, Type, Guess). What do you enter for the Type argument?','The RATE function has the syntax RATE(Nper, Pmt, Pv, Fv, Type, Guess). What do you enter for the Type argument?','NPEX 9-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Enter the number of payment periods.')
insert into ans(ans_q,ansname,correct) values(@qid,'Enter when the payments are made, (0 if payments are made at the end of the period, or enter 1 if payments are made at the start).',1)
insert into ans(ans_q,ansname) values(@qid,'Enter the interest rate of the loan or investment.')
insert into ans(ans_q,ansname) values(@qid,'Enter the starting and ending payment periods.')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What does the IRR function calculate?','What does the IRR function calculate?','NPEX 9-47')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The present value of an investment')
insert into ans(ans_q,ansname) values(@qid,'The payback period for an investment')
insert into ans(ans_q,ansname) values(@qid,'The interest rate for repayment of a loan')
insert into ans(ans_q,ansname,correct) values(@qid,'The internal rate of return for an investment',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which function should you use to calculate the present value of an investment that pays different amounts each year?','Which function should you use to calculate the present value of an investment that pays different amounts each year?','NPEX 9-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'NPV',1)
insert into ans(ans_q,ansname) values(@qid,'PMT')
insert into ans(ans_q,ansname) values(@qid,'DPV')
insert into ans(ans_q,ansname) values(@qid,'FV')

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Jamal bought $100,000 worth of equipment for his business. Which function can he use to calculate the equal amounts of value the equipment will lose each year?','Jamal bought $100,000 worth of equipment for his business. Which function can he use to calculate the equal amounts of value the equipment will lose each year?','NPEX 9-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'DB')
insert into ans(ans_q,ansname,correct) values(@qid,'SLN',1)
insert into ans(ans_q,ansname) values(@qid,'NPV')
insert into ans(ans_q,ansname) values(@qid,'CUMDB')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which formula auditing tool can you use to display the value of each part of a formula?','Which formula auditing tool can you use to display the value of each part of a formula?','NPEX 9-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Trace Precedents')
insert into ans(ans_q,ansname) values(@qid,'Trace Dependents')
insert into ans(ans_q,ansname,correct) values(@qid,'Evaluate Formula dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Formula Validation')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The observation that money received today is often worth more than the same amount received later is called the _______.','The observation that money received today is often worth more than the same amount received later is called the _______.','NPEX 9-43')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'payback period')
insert into ans(ans_q,ansname,correct) values(@qid,'time value of money',1)
insert into ans(ans_q,ansname) values(@qid,'internal rate of return')
insert into ans(ans_q,ansname) values(@qid,'interest expense')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To calculate the loan''s future value after a specified number of periods, which of the following functions should be used?','To calculate the loan''s future value after a specified number of periods, which functions should be used?','NPEX 9-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IRR')
insert into ans(ans_q,ansname) values(@qid,'PV')
insert into ans(ans_q,ansname) values(@qid,'NPV')
insert into ans(ans_q,ansname,correct) values(@qid,'FV',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is(are) true for Excel financial functions? Select all the options that apply.','Which is(are) true for Excel financial functions?. Select 2 that apply.','NPEX 9-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Calculated values are formatted to three decimal places.')
insert into ans(ans_q,ansname) values(@qid,'Calculated values are formatted in Number format.')
insert into ans(ans_q,ansname,correct) values(@qid,'Negative cash flows appear in red font inside parentheses.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Calculated values are formatted in currency format.',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Samira has a workbook containing many worksheets with interconnected formulas. What can she use to display the values of specified cells located throughout the workbook?','Samira has a workbook containing many worksheets with interconnected formulas. What can she use to display the values of specified cells located throughout the workbook?','NPEX 9-57')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Observe Formula dialog box')
insert into ans(ans_q,ansname) values(@qid,'Show Formulas command')
insert into ans(ans_q,ansname,correct) values(@qid,'Watch Window',1)
insert into ans(ans_q,ansname) values(@qid,'Automatic Update Window')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you correct an error such as the #NAME? error in a worksheet?','How can you correct an error such as the #NAME? error in a worksheet?','NPEX 9-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Ignore the error.')
insert into ans(ans_q,ansname) values(@qid,'Open the Watch Window.')
insert into ans(ans_q,ansname) values(@qid,'Use absolute references in the formula.')
insert into ans(ans_q,ansname,correct) values(@qid,'Trace the cell precedents and dependents to find the source of the error.',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You use the IPMT function to calculate the sum of several interest payments for a loan.','You use the IPMT function to calculate the sum of several interest payments for a loan.','NPEX 9-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The DB function calculates declining balance depreciation.','The DB function calculates declining balance depreciation.','NPEX 9-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Investments that have low internal rate of returns are preferred to those investments with higher internal rate of returns, which are calculated with the IRR function.','Investments that have low internal rate of returns are preferred to those investments with higher internal rate of returns, which are calculated with the IRR function.','NPEX 9-47')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Marco wants to estimate his annual expenses for the next five years. He thinks they will increase by 5 percent each year. He should use a growth trend to calculate the expenses.','Marco wants to estimate his annual expenses for the next five years. He thinks they will increase by 5 percent each year. He should use a growth trend to calculate the expenses.','NPEX 9-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Cell B5 contains the formula =A5*10. Cell A5 is a dependent cell for cell B5.','Cell B5 contains the formula =A5*10. Cell A5 is a dependent cell for cell B5.','NPEX 9-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions calculate the net present value of cash flows? Select all the options that apply.','Which functions calculate the net present value of cash flows?. Select 2 that apply.','NPEX 9-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'NPV',1)
insert into ans(ans_q,ansname) values(@qid,'IRR')
insert into ans(ans_q,ansname,correct) values(@qid,'XNPV',1)
insert into ans(ans_q,ansname) values(@qid,'NPER')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions calculate depreciation of an asset? Select all the options that apply.','Which functions calculate depreciation of an asset?. Select 2 that apply.','NPEX 9-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IRR')
insert into ans(ans_q,ansname,correct) values(@qid,'DB',1)
insert into ans(ans_q,ansname,correct) values(@qid,'SLN',1)
insert into ans(ans_q,ansname) values(@qid,'FV')

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following arguments are required for the CUMIPMT function? Select all the options that apply.','Which arguments are required for the CUMIPMT function?. Select 3 that apply.','NPEX 9-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Rate',1)
insert into ans(ans_q,ansname) values(@qid,'Int')
insert into ans(ans_q,ansname,correct) values(@qid,'Nper',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Pv',1)

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions calculate the cumulative total of payments made toward the principal of a loan?','Which functions calculate the cumulative total of payments made toward the principal of a loan?','NPEX 9-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IPMT')
insert into ans(ans_q,ansname) values(@qid,'CUMIPMT')
insert into ans(ans_q,ansname) values(@qid,'PPMT')
insert into ans(ans_q,ansname,correct) values(@qid,'CUMPRINC',1)

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following do you need to know to calculate the straight-line depreciation of an asset? Select all the options that apply.','Which do you need to know to calculate the straight-line depreciation of an asset?. Select 3 that apply.','NPEX 9-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'asset''s original cost',1)
insert into ans(ans_q,ansname,correct) values(@qid,'length of the asset''s useful life',1)
insert into ans(ans_q,ansname,correct) values(@qid,'asset''s salvage value',1)
insert into ans(ans_q,ansname) values(@qid,'rate at which the asset is depreciated over time')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following functions calculate the internal rate of return for a series of cash flows made at specified dates?','Which functions calculate the internal rate of return for a series of cash flows made at specified dates?','NPEX 9-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IRR')
insert into ans(ans_q,ansname) values(@qid,'NPV')
insert into ans(ans_q,ansname) values(@qid,'XPV')
insert into ans(ans_q,ansname,correct) values(@qid,'XIRR',1)

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are true of the NPER function? Select all the options that apply.','Which are true of the NPER function?. Select 2 that apply.','NPEX 9-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The function returns the number of payments left on the loan.')
insert into ans(ans_q,ansname,correct) values(@qid,'The function returns the total number of payments to fully repay the loan.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'If the function returns #NUM!, payments for each period are less than the interest due.',1)
insert into ans(ans_q,ansname) values(@qid,'The function requires only the rate and the present value of the loan.')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What types of trends can you project using the Series dialog box? Select all the options that apply.','What types of trends can you project using the Series dialog box?. Select 2 that apply.','NPEX 9-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'growth',1)
insert into ans(ans_q,ansname,correct) values(@qid,'linear',1)
insert into ans(ans_q,ansname) values(@qid,'logarithm')
insert into ans(ans_q,ansname) values(@qid,'algebra')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In which of the following scenarios would you use a linear trend? Select all the options that apply.','In which scenarios would you use a linear trend?. Select 2 that apply.','NPEX 9-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'To estimate revenues for five years, assuming revenue will grow by $10,000 a year',1)
insert into ans(ans_q,ansname,correct) values(@qid,'To estimate expenses for three years, assuming expenses decrease by $5,000 per year',1)
insert into ans(ans_q,ansname) values(@qid,'To calculate gross profit by subtracting expenses from revenue')
insert into ans(ans_q,ansname) values(@qid,'To calculate the depreciation of an asset over 10 years')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What must you provide in the Series dialog box to extrapolate a series? Select all the options that apply.','What must you provide in the Series dialog box to extrapolate a series?. Select 2 that apply.','NPEX 9-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'starting value')
insert into ans(ans_q,ansname,correct) values(@qid,'step value',1)
insert into ans(ans_q,ansname,correct) values(@qid,'type of series',1)
insert into ans(ans_q,ansname) values(@qid,'ending value')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is displayed in the Watch Window? Select all the options that apply.','Which is displayed in the Watch Window?. Select 3 that apply.','NPEX 9-57')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'name of the watched cell',1)
insert into ans(ans_q,ansname) values(@qid,'dependents of the watched cell')
insert into ans(ans_q,ansname,correct) values(@qid,'value of the watched cell',1)
insert into ans(ans_q,ansname,correct) values(@qid,'formula in the watched cell',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you trace errors in a workbook, what types of cells does Excel identify? Select all the options that apply.','When you trace errors in a workbook, what types of cells does Excel identify?. Select 3 that apply.','NPEX 9-52')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'independent cells on the current worksheet')
insert into ans(ans_q,ansname,correct) values(@qid,'precedent cells on the current worksheet',1)
insert into ans(ans_q,ansname,correct) values(@qid,'precedent cells on other worksheets',1)
insert into ans(ans_q,ansname,correct) values(@qid,'dependent cells on the current worksheet',1)

select * from q 
where q_act=@actid
