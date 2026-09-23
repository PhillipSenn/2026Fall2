insert into act(actname,act_grp,act_cat,actlink,actsort) values('Excel Module 2',8,107,'Test/bank.cfm',2)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Currency is an example of a number format.','Currency is a type of number format in Excel.','NPEX 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A theme is a predefined coordinated set of colors, fonts, graphical effects, and other formats.','A theme is a coordinated set of colors, fonts, effects, and other formatting.','NPEX 2-44')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change the background color of a cell, you use the Background color button.','To change a cell''s background color, use the Background Color button.','NPEX 2-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To format the cell value 44.54 as 44.540, you can use the Increase Decimal button.','To display 44.54 as 44.540, you can increase the number of decimal places.','NPEX 2-17')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You use conditional formatting to format a cell based on its value.','Conditional formatting can format a cell based on its value.','NPEX 2-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Percent style formats numbers as percentages with _____ decimal places by default.','By default, how many decimal places does Percent Style display?','NPEX 2-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'one')
insert into ans(ans_q,ansname) values(@qid,'two')
insert into ans(ans_q,ansname) values(@qid,'three')
insert into ans(ans_q,ansname,correct) values(@qid,'zero',1)

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To help you easily identify sheets in a workbook, you can add _____ to the sheet tab.','What can you add to a sheet tab to make worksheets easier to identify?','NPEX 2-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Alignment')
insert into ans(ans_q,ansname) values(@qid,'Fonts')
insert into ans(ans_q,ansname,correct) values(@qid,'Color',1)
insert into ans(ans_q,ansname) values(@qid,'Styles')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To format a range so that all values greater than $500 appear in red, which of the following can you use?','Which feature can make values greater than $500 appear in red?','NPEX 2-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'conditional formatting',1)
insert into ans(ans_q,ansname) values(@qid,'cell formatting')
insert into ans(ans_q,ansname) values(@qid,'cell styles')
insert into ans(ans_q,ansname) values(@qid,'Quick Access toolbar')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change conditional formatting that applies a red fill color to one that applies a green fill color, which of the following can you do?','How can you change an existing conditional formatting rule from red fill to green fill?','NPEX 2-49')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Delete the conditional formatting rule.')
insert into ans(ans_q,ansname,correct) values(@qid,'Edit the conditional formatting rule.',1)
insert into ans(ans_q,ansname) values(@qid,'Format the range in the Font dialog box.')
insert into ans(ans_q,ansname) values(@qid,'Format the range as a table.')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following are ways to align cell contents in relation to cell edges? Select all the options that apply.','Which options align cell contents horizontally? Select 2 that apply.','NPEX 2-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'left',1)
insert into ans(ans_q,ansname,correct) values(@qid,'center',1)
insert into ans(ans_q,ansname) values(@qid,'bold')
insert into ans(ans_q,ansname) values(@qid,'underline')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Steffie needs a wider left margin in her worksheet. Which of the following can she do to change the margin?','How can Steffie make the left worksheet margin wider?','NPEX 2-61')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'On the Margins tab of the Page Setup dialog box, change the number in the Left box.',1)
insert into ans(ans_q,ansname) values(@qid,'On the Page Layout tab, set the Width and Height to Automatic and the Scale to 100%.')
insert into ans(ans_q,ansname) values(@qid,'On the Page tab of the Page Setup dialog box, change the Orientation setting.')
insert into ans(ans_q,ansname) values(@qid,'On the Margins tab of the Page Setup dialog box, click the Preset button.')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Comma Style format adds a comma and a dollar sign to a cell value.','Comma Style adds both a comma and a dollar sign to a number.','NPEX 2-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A predesigned combination of formats, such as font size and color, is called a cell default.','A predefined combination of formats such as font size and color is called a cell default.','NPEX 2-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you align a range, you combine the cells into one cell.','Aligning a range combines the selected cells into one cell.','NPEX 2-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change the color of cell content, you use the ________ color list arrow.','Which color control changes the color of cell contents?','NPEX 2-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Cell')
insert into ans(ans_q,ansname) values(@qid,'Text')
insert into ans(ans_q,ansname) values(@qid,'Pattern')
insert into ans(ans_q,ansname,correct) values(@qid,'Font',1)

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A _______ refers to a collection of characters with a similar, specific design.','What term describes a collection of characters with a consistent design?','NPEX 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'symbol')
insert into ans(ans_q,ansname,correct) values(@qid,'font',1)
insert into ans(ans_q,ansname) values(@qid,'point')
insert into ans(ans_q,ansname) values(@qid,'keyword')

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can use the Find and Replace dialog box to find and replace _____.','What can Find and Replace locate and replace besides text?','NPEX 2-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'cell formatting',1)
insert into ans(ans_q,ansname) values(@qid,'cell references')
insert into ans(ans_q,ansname) values(@qid,'font styles')
insert into ans(ans_q,ansname) values(@qid,'worksheet names')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you underline cell content, you are using _____.','Underlining cell contents changes which type of formatting?','NPEX 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'a font style',1)
insert into ans(ans_q,ansname) values(@qid,'an orientation setting')
insert into ans(ans_q,ansname) values(@qid,'an indent setting')
insert into ans(ans_q,ansname) values(@qid,'a centering style')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Jacquan wants to use a cell style similar to the default Title style, but with a larger font size and different font color. What can he do?','Jacquan wants a variation of the Title style with a larger font and different color. What should he create?','NPEX 2-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Apply a different theme.')
insert into ans(ans_q,ansname,correct) values(@qid,'Create a custom cell style.',1)
insert into ans(ans_q,ansname) values(@qid,'Transpose the Title style.')
insert into ans(ans_q,ansname) values(@qid,'Apply conditional formats.')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To apply a cell style, you would use the Cell Styles command on the _____ tab.','On which ribbon tab is the Cell Styles command located?','NPEX 2-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Layout')
insert into ans(ans_q,ansname) values(@qid,'Insert')
insert into ans(ans_q,ansname) values(@qid,'View')
insert into ans(ans_q,ansname,correct) values(@qid,'Home',1)

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To combine multiple cells into one combined cell and center the contents, which of the following do you use?','Which command combines multiple cells into one and centers the contents?','NPEX 2-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Column Width command')
insert into ans(ans_q,ansname) values(@qid,'Center button')
insert into ans(ans_q,ansname,correct) values(@qid,'Merge and Center button',1)
insert into ans(ans_q,ansname) values(@qid,'Increase Indent button')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following lets you apply bold formatting to a selected cell? Select all the options that apply.','Which methods can apply bold formatting to a selected cell? Select 3 that apply.','NPEX 2-8')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Home tab',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Format Cells dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Insert tab')
insert into ans(ans_q,ansname,correct) values(@qid,'Mini toolbar',1)

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you distinguish between a manually added page break and an automatic page break in a worksheet?','How do manual page breaks differ visually from automatic page breaks?','NPEX 2-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Automatic page breaks appear as dashed lines while manual page breaks appear as solid lines.',1)
insert into ans(ans_q,ansname) values(@qid,'Automatic page breaks appear as curved lines while manual page breaks appear as jagged lines.')
insert into ans(ans_q,ansname) values(@qid,'Automatic page breaks appear as dashed lines while manual page breaks appear as wavy lines.')
insert into ans(ans_q,ansname) values(@qid,'Automatic page breaks appear as zigzag lines while manual page breaks appear as solid lines.')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What must you do before removing a page break?','What must you select before removing a page break?','NPEX 2-55')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the heading of the column containing the page break.')
insert into ans(ans_q,ansname,correct) values(@qid,'Select a cell below or to the right of the page break.',1)
insert into ans(ans_q,ansname) values(@qid,'Click the heading of the row containing the page break.')
insert into ans(ans_q,ansname) values(@qid,'Set the print area.')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to paste values and number formatting only, click the Paste Numbers button that appears below the pasted cell.','The Paste Numbers button pastes only values and number formatting.','NPEX 2-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Marisol wants the date on her spreadsheet to include the weekday name, month name, day, and year. Which of the following formats should she use?','Which date format includes the weekday, month name, day, and year?','NPEX 2-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'DateTime')
insert into ans(ans_q,ansname) values(@qid,'Text')
insert into ans(ans_q,ansname) values(@qid,'Short Date')
insert into ans(ans_q,ansname,correct) values(@qid,'Long Date',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Decreasing a cell''s indent moves its contents to the right one space.','Decreasing a cell''s indent moves its contents one space to the right.','NPEX 2-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you change cell contents to italics, you are changing the cell''s alignment.','Changing cell contents to italics changes the cell''s alignment.','NPEX 2-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To move cell contents one space to the right, you can use the Increase Space button.','To move cell contents one space to the right, use the Increase Space button.','NPEX 2-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To copy a cell''s formatting to another cell, which of the following can you use?','Which tool copies formatting from one cell to another?','NPEX 2-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Format Cells dialog box')
insert into ans(ans_q,ansname,correct) values(@qid,'Format Painter',1)
insert into ans(ans_q,ansname) values(@qid,'Quick Analysis Tool')
insert into ans(ans_q,ansname) values(@qid,'Format as Table')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You double-click the Format Painter button when you want to _____.','Why would you double-click the Format Painter button?','NPEX 2-38')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'copy a cell''s data to another cell')
insert into ans(ans_q,ansname,correct) values(@qid,'paste the same format multiple times',1)
insert into ans(ans_q,ansname) values(@qid,'paste conditional formatting only')
insert into ans(ans_q,ansname) values(@qid,'clear a cell''s formatting')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Eleanor wants to repeat the first row of the worksheet on each printed page of a four-page worksheet. Which of the following options should she use in the Page Setup dialog box?','Which Page Setup option repeats the first row on every printed page?','NPEX 2-56')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Print titles',1)
insert into ans(ans_q,ansname) values(@qid,'Print area')
insert into ans(ans_q,ansname) values(@qid,'Gridlines')
insert into ans(ans_q,ansname) values(@qid,'Row and column headings')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following conditional formatting options can you use to highlight the top 10 values in a range of cells?','Which conditional formatting option can highlight the top 10 values in a range?','NPEX 2-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Icon Sets')
insert into ans(ans_q,ansname) values(@qid,'Color Scales')
insert into ans(ans_q,ansname) values(@qid,'Data Bars')
insert into ans(ans_q,ansname,correct) values(@qid,'Highlight Cells Rules',1)

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Using Excel formula to find the average of the numbers 15, 20, 25, 23 and 32, you would enter =AVERAGE(15, 20, 25, 23, 32) in a cell.','The formula =AVERAGE(15, 20, 25, 23, 32) correctly calculates the average of those values.','NPEX 2-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To format a cell range so that values between 100 and 500 appear in red, which of the following can you use?','Which conditional formatting rule can highlight values between 100 and 500?','NPEX 2-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'icon sets')
insert into ans(ans_q,ansname) values(@qid,'themes')
insert into ans(ans_q,ansname) values(@qid,'Top/Bottom Rules')
insert into ans(ans_q,ansname,correct) values(@qid,'Highlight Cells Rules',1)

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Igor wants to set 1-inch margins on the left and right and 0.5-inch margins on the top and bottom of a printed page. Which of the following dialog boxes should he use to change the margins?','Which dialog box lets you set custom worksheet margins?','NPEX 2-61')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Footer dialog box')
insert into ans(ans_q,ansname,correct) values(@qid,'Page Setup dialog box',1)
insert into ans(ans_q,ansname) values(@qid,'Format Cells dialog box')
insert into ans(ans_q,ansname) values(@qid,'Workbook Setup dialog box')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To insert information that appears at the bottom of every worksheet page, you can use a command on the Home tab.','Information that appears at the bottom of every printed page is inserted from the Home tab.','NPEX 2-58')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can edit a worksheet footer in _____.','In which view can you edit a worksheet footer?','NPEX 2-58')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Page Layout view',1)
insert into ans(ans_q,ansname) values(@qid,'Normal view')
insert into ans(ans_q,ansname) values(@qid,'Page Break Preview')
insert into ans(ans_q,ansname) values(@qid,'Print Preview')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'How can you enter your name so it appears in the lower-right corner of each page of the printout?','How can you put your name in the lower-right corner of every printed page?','NPEX 2-60')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click the header section on the right and type your name.')
insert into ans(ans_q,ansname) values(@qid,'Click a cell in the lower-right part of the worksheet and type your name.')
insert into ans(ans_q,ansname,correct) values(@qid,'Open the Footer dialog box and type your name in the Right section box.',1)
insert into ans(ans_q,ansname) values(@qid,'Switch to Print Preview and type your name in the lower-right corner of the preview.')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can create conditional cell formats using either the Home tab or the _____.','Besides the Home tab, which tool can create conditional formatting?','NPEX 2-48')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Quick Analysis tool',1)
insert into ans(ans_q,ansname) values(@qid,'Cell Styles dialog box')
insert into ans(ans_q,ansname) values(@qid,'Font formatting buttons on the Home tab')
insert into ans(ans_q,ansname) values(@qid,'Number formatting buttons on the Home tab')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To paste a data range so that column data appears in rows and row data appears in columns, you can _____ the data using the Paste list arrow.','What Paste option switches rows to columns and columns to rows?','NPEX 2-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'reverse')
insert into ans(ans_q,ansname,correct) values(@qid,'transpose',1)
insert into ans(ans_q,ansname) values(@qid,'fill')
insert into ans(ans_q,ansname) values(@qid,'merge')

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to change all occurrences of "Radio" to "TV" in a worksheet, you can use the _____ command.','Which command changes every occurrence of one value, such as Radio, to another value, such as TV?','NPEX 2-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Find')
insert into ans(ans_q,ansname,correct) values(@qid,'Replace',1)
insert into ans(ans_q,ansname) values(@qid,'Select')
insert into ans(ans_q,ansname) values(@qid,'Paste')

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Alba wants to use a watermark image as the background of her worksheet. She goes to the Page Setup group on the Page Layout tab. What option should she click to begin choosing the image file to use as a watermark?','Which Page Layout option lets you choose an image to use as a worksheet background?','NPEX 2-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Breaks')
insert into ans(ans_q,ansname) values(@qid,'Margins')
insert into ans(ans_q,ansname) values(@qid,'Orientation')
insert into ans(ans_q,ansname,correct) values(@qid,'Background',1)

-- 44
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following settings can you change when you create a custom theme?','Which setting can be changed when creating a custom theme?','NPEX 2-46')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'column widths')
insert into ans(ans_q,ansname) values(@qid,'print titles')
insert into ans(ans_q,ansname) values(@qid,'sort orders')
insert into ans(ans_q,ansname,correct) values(@qid,'fonts',1)

-- 45
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to print only part of a worksheet, you can set a _____.','What should you set if you want to print only part of a worksheet?','NPEX 2-54')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'print area',1)
insert into ans(ans_q,ansname) values(@qid,'print title')
insert into ans(ans_q,ansname) values(@qid,'page break')
insert into ans(ans_q,ansname) values(@qid,'scaling option')

-- 46
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To paste only a copied cell''s formats, use the Paste Special command.','Paste Special can be used to paste only a copied cell''s formatting.','NPEX 2-40')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 47
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To rotate cell contents, you use the Orientation button in the Alignment group on the Home tab.','The Orientation button in the Alignment group can rotate cell contents.','NPEX 2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

select * from q 
where q_act=@actid
