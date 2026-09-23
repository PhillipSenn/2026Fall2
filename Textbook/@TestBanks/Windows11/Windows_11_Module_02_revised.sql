declare @actid int
declare @qid int
-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you create a document using a program such as WordPad, the document is stored in the main memory of the computer.'
,'When you create a document in an app such as WordPad, it is initially stored in the computer''s main memory.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you exit the app without saving the document or if the computer accidentally loses electrical power, the document will be lost.','If you close an app without saving a document, or the computer loses power, the unsaved document can be lost.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'It is recommended that you save all your files on the desktop.','You should save all of your files on the desktop.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Files can be deleted only one at a time .','Windows allows you to delete only one file at a time.','SCWIN 2-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'All files are identified by a file name that should be descriptive of the saved file.','Every file has a file name, and the name should describe the file''s contents.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A plain text document allows for formatting text and inserting graphics.','A plain text document can include formatted text and graphics.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A Rich Text Format document does not allow for formatting text and inserting graphics.','A Rich Text Format document cannot include formatted text or graphics.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you delete a file or folder, Windows 11 places it in the Recycle Bin, which is an area on the hard drive that contains all the items you have deleted.','When you delete a file or folder, Windows places it in the Recycle Bin.','SCWIN 2-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One method of printing a document is to print it directly from an app.','You can print a document directly from an app.','SCWIN 2-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you forget to save a document after you have edited it, a dialog box will be displayed asking if you want to save the changes.','If you close an edited document without saving, Windows can ask whether you want to save your changes.','SCWIN 2-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Text files open in Microsoft Word by default.','Text files open in Microsoft Word by default.','SCWIN 2-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In all views, the default arrangement for the icons is to be listed chronologically by the file modified date.','In every folder view, files are arranged by modified date by default.','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Windows 11 allows you to place one or more documents into a folder in much the same manner as you might take a document written on a piece of paper and place it in a file folder.','Windows folders can be used to organize one or more documents.','SCWIN 2-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To keep multiple documents together in one place, you must first create a folder in which to store them.','To keep several documents together, you can create a folder to store them.','SCWIN 2-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can click the Documents arrow on the address bar to display a location menu that contains a list of folders in the Documents folder.','The Documents arrow in the address bar can display a menu of folders in the Documents folder.','SCWIN 2-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A shortcut is the actual document or app.','A shortcut is the actual document or app it points to.','SCWIN 2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you delete a shortcut, you delete the actual folder, document, or app.','Deleting a shortcut also deletes the folder, document, or app it points to.','SCWIN 2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Windows 11 allows you to have more than one document open and more than one app running at the same time.','Windows can have multiple documents open and multiple apps running at the same time.','SCWIN 2-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A file name cannot include spaces.','File names cannot contain spaces.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Any uppercase or lowercase character is valid when creating a file name.','Uppercase and lowercase letters can be used in Windows file names.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Groupings in a folder remain even after they are no longer needed.','Folder groupings remain permanently after you create them.','SCWIN 2-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You cannot close a window using the taskbar.','You cannot close a window from the taskbar.','SCWIN 2-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When editing a document, you can open the document directly instead of first running the app and then opening the document.','You can open a document directly without first opening its app.','SCWIN 2-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Not all files are identified by a file name.','Every file is identified by a file name.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you have several objects you want to delete in the same location, you can delete them all at one time.','You can select and delete several items in the same location at one time.','SCWIN 2-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Tiles view displays the files and folders as a list of file names without any extra details.','Tiles view shows only a list of file names with no additional details.','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can make it easier to locate and open a folder from the Start menu or on the desktop by placing a/n ________ to the folder.','What can you place on the Start menu or desktop to make a folder easier to open?','SCWIN 2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'flash')
insert into ans(ans_q,ansname) values(@qid,'agent')
insert into ans(ans_q,ansname,correct) values(@qid,'shortcut',1)
insert into ans(ans_q,ansname) values(@qid,'file key')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A word processing program available with Windows 11 is ________.','Which word-processing program is available with Windows 11 according to this module?','SCWIN 2-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Writer')
insert into ans(ans_q,ansname) values(@qid,'Microsoft Word')
insert into ans(ans_q,ansname) values(@qid,'Docs')
insert into ans(ans_q,ansname,correct) values(@qid,'WordPad',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To customize Windows 11, use shortcuts to start apps and open ________ or folders.','Shortcuts can be used to start apps and open what other type of item?','SCWIN2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'files',1)
insert into ans(ans_q,ansname) values(@qid,'settings')
insert into ans(ans_q,ansname) values(@qid,'directories')
insert into ans(ans_q,ansname) values(@qid,'hidden system files')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After you create a new folder, the next step is to ________.','What should you do immediately after creating a new folder?','SCWIN 2-19')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'name the folder',1)
insert into ans(ans_q,ansname) values(@qid,'save the folder')
insert into ans(ans_q,ansname) values(@qid,'move the folder')
insert into ans(ans_q,ansname) values(@qid,'copy the folder')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you save a document, you are creating a ________.','What do you create when you save a document?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'file',1)
insert into ans(ans_q,ansname) values(@qid,'key')
insert into ans(ans_q,ansname) values(@qid,'library entry')
insert into ans(ans_q,ansname) values(@qid,'link')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To associate a file with an app, Windows 11 assigns a/n ________ to the file name.','What does Windows add to a file name to associate the file with an app?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'linkage')
insert into ans(ans_q,ansname,correct) values(@qid,'extension',1)
insert into ans(ans_q,ansname) values(@qid,'ID')
insert into ans(ans_q,ansname) values(@qid,'PIN')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A file name extension consists of a period followed by ________ or more characters.','According to this module, a file name extension contains a period followed by at least how many characters?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'one')
insert into ans(ans_q,ansname) values(@qid,'two')
insert into ans(ans_q,ansname,correct) values(@qid,'three',1)
insert into ans(ans_q,ansname) values(@qid,'six')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Most documents created using the WordPad app are saved as ________ documents.','According to this module, what format is commonly used to save WordPad documents?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Microsoft Word')
insert into ans(ans_q,ansname) values(@qid,'plain text')
insert into ans(ans_q,ansname) values(@qid,'Portable Network Graphics')
insert into ans(ans_q,ansname,correct) values(@qid,'Rich Text Format',1)

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Most documents created using the WordPad program are saved with the ________ extension.','According to this module, which file extension is commonly used for WordPad documents?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'.rtf',1)
insert into ans(ans_q,ansname) values(@qid,'.wpd')
insert into ans(ans_q,ansname) values(@qid,'.doc')
insert into ans(ans_q,ansname) values(@qid,'.docx')

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to save a file with a different file name or in a different location, you would use the ________ command.','Which command lets you save a file with a different name or in a different location?','SCWIN 2-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Location')
insert into ans(ans_q,ansname) values(@qid,'File name')
insert into ans(ans_q,ansname) values(@qid,'New name')
insert into ans(ans_q,ansname,correct) values(@qid,'Save as',1)

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'WordPad documents can also be saved as ________.','According to this module, which other format can a WordPad document be saved as?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Microsoft Excel documents')
insert into ans(ans_q,ansname,correct) values(@qid,'plain text',1)
insert into ans(ans_q,ansname) values(@qid,'TIFFs')
insert into ans(ans_q,ansname) values(@qid,'PNGs')

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Plain text files have the ________ extension.','Which file extension is used for plain text files?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'.pla')
insert into ans(ans_q,ansname,correct) values(@qid,'.txt',1)
insert into ans(ans_q,ansname) values(@qid,'.pxt')
insert into ans(ans_q,ansname) values(@qid,'.pln')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Text files open with ________ by default.','According to this module, which app opens text files by default?','SCWIN 2-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'WordPad')
insert into ans(ans_q,ansname) values(@qid,'Writer')
insert into ans(ans_q,ansname) values(@qid,'Microsoft Word')
insert into ans(ans_q,ansname,correct) values(@qid,'Notepad',1)

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The default view in the Documents folder is ________ view.','According to this module, what is the default view in the Documents folder?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Details',1)
insert into ans(ans_q,ansname) values(@qid,'Medium icons')
insert into ans(ans_q,ansname) values(@qid,'Small icons')
insert into ans(ans_q,ansname) values(@qid,'Tiles')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The view that shows a list of files and folders in addition to common properties, such as Date Modified, Type, and Size, is called ________ view.','Which folder view shows file names along with properties such as Date Modified, Type, and Size?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Tiles')
insert into ans(ans_q,ansname,correct) values(@qid,'Details',1)
insert into ans(ans_q,ansname) values(@qid,'Medium icons')
insert into ans(ans_q,ansname) values(@qid,'Large icons')

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following does not provide a Live Preview option?','Which icon size does not provide Live Preview?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Extra large icons')
insert into ans(ans_q,ansname) values(@qid,'Large icons')
insert into ans(ans_q,ansname) values(@qid,'Medium icons')
insert into ans(ans_q,ansname,correct) values(@qid,'Small icons',1)

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The view that displays the files and folders as a list of file names without any extra details is ________ view.','Which folder view shows file names without additional details?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Roster')
insert into ans(ans_q,ansname) values(@qid,'Catalog')
insert into ans(ans_q,ansname) values(@qid,'Index')
insert into ans(ans_q,ansname,correct) values(@qid,'List',1)

-- 44
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following file names can be used?','Which of these names is valid for a Windows file?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'NUL')
insert into ans(ans_q,ansname) values(@qid,'CON')
insert into ans(ans_q,ansname) values(@qid,'AUX')
insert into ans(ans_q,ansname,correct) values(@qid,'COS',1)

-- 45
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following can be used in a file name?','Which of these characters can be used in a Windows file name?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Ampersand',1)
insert into ans(ans_q,ansname) values(@qid,'Slash')
insert into ans(ans_q,ansname) values(@qid,'Backslash')
insert into ans(ans_q,ansname) values(@qid,'Colon')

-- 46
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you find that you are no longer using a pinned icon on the Start menu, you should ________ it to minimize clutter.','What should you do with a pinned Start menu icon that you no longer use?','SCWIN 2-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'remove',1)
insert into ans(ans_q,ansname) values(@qid,'hide')
insert into ans(ans_q,ansname) values(@qid,'move')
insert into ans(ans_q,ansname) values(@qid,'rename')

-- 47
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is not a grouping option on the Group by submenu?','Which option is not available on the Group by submenu?','SCWIN 2-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Date modified')
insert into ans(ans_q,ansname) values(@qid,'Type')
insert into ans(ans_q,ansname,correct) values(@qid,'Resolution',1)
insert into ans(ans_q,ansname) values(@qid,'Size')

-- 48
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to remove a shortcut from the Start menu, which command do you use?','Which command removes a shortcut from the Start menu?','SCWIN 2-26')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Pin to taskbar')
insert into ans(ans_q,ansname,correct) values(@qid,'Unpin from Start',1)
insert into ans(ans_q,ansname) values(@qid,'Remove shortcut')
insert into ans(ans_q,ansname) values(@qid,'Remove app')

-- 49
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The view that displays the files and folders with an icon and an icon description is ________ view.','Which folder view displays files and folders with an icon and a description?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Tiles',1)
insert into ans(ans_q,ansname) values(@qid,'Details')
insert into ans(ans_q,ansname) values(@qid,'List')
insert into ans(ans_q,ansname) values(@qid,'Extra large icons')

-- 50
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A file name can contain up to ________ characters.','According to this module, what is the maximum number of characters allowed in a file name?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'125')
insert into ans(ans_q,ansname) values(@qid,'126')
insert into ans(ans_q,ansname,correct) values(@qid,'255',1)
insert into ans(ans_q,ansname) values(@qid,'256')

-- 51
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A link to any object on the computer or on a network, such as an app, file, folder, webpage, printer, or another computer is a/n ________.','What do you call a link to an app, file, folder, webpage, printer, computer, or other object?','SCWIN 2-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'shortcut',1)
insert into ans(ans_q,ansname) values(@qid,'agent')
insert into ans(ans_q,ansname) values(@qid,'flash')
insert into ans(ans_q,ansname) values(@qid,'file key')

-- 52
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If the windows are open on the desktop, you can click the Close button on the ________ of each open window to close them.','Where is the Close button located on an open window?','SCWIN 2-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'menu bar')
insert into ans(ans_q,ansname,correct) values(@qid,'title bar',1)
insert into ans(ans_q,ansname) values(@qid,'status bar')
insert into ans(ans_q,ansname) values(@qid,'address bar')

-- 53
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You have been working on a file and decide to save it. When you attempt to assign a new file name, the Save As dialog box displays a message that the file name is not valid. Which of the following file names could be causing your problem?','You try to save a file and Windows says the file name is invalid. Which file name shown below could cause the problem?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Michael''s project')
insert into ans(ans_q,ansname) values(@qid,'Projects by Michael...')
insert into ans(ans_q,ansname) values(@qid,'Projects by Michael!')
insert into ans(ans_q,ansname,correct) values(@qid,'Projects | Michael',1)

-- 54
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You are attempting to save a document consisting of your first communications to one of your clients. You have assigned the file name COM1. Why will this not work?','Why can''t you use COM1 as a Windows file name?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You cannot use all caps in a file name.')
insert into ans(ans_q,ansname) values(@qid,'You cannot use the numeral 1 in a file name.')
insert into ans(ans_q,ansname,correct) values(@qid,'The name is reserved by the operating system.',1)
insert into ans(ans_q,ansname) values(@qid,'This will, in fact, work')

-- 55
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: On your new Windows 11 computer, you have been using the default view in the Documents folder, but you have just become aware of the additional options for viewing your documents. You decide to experiment with the additional options. You are looking for an option that will permit you to use Live Preview because you appreciate having that extra resource available. Which of the following does not allow this?','Which icon size does not allow Live Preview?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Small icons',1)
insert into ans(ans_q,ansname) values(@qid,'Medium icons')
insert into ans(ans_q,ansname) values(@qid,'Large icons')
insert into ans(ans_q,ansname) values(@qid,'Extra large icons')

-- 56
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: On your new Windows 11 computer, you have been using the default view in the Documents folder, but you have just become aware of the additional options for viewing your documents. You would like to have a view option that lists your files and folders with their names but without any additional details because you find those extra details clutter your view. What option is best for you?','You want to see file and folder names without extra details. Which view should you use?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Details')
insert into ans(ans_q,ansname,correct) values(@qid,'List',1)
insert into ans(ans_q,ansname) values(@qid,'Tiles')
insert into ans(ans_q,ansname) values(@qid,'Open')

-- 57
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a file? Select all that apply.'
,'Which of these items are files? Select all that apply.','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'an Excel spreadsheet',1)
insert into ans(ans_q,ansname,correct) values(@qid,'a WordPad document',1)
insert into ans(ans_q,ansname) values(@qid,'an unsaved email message')
insert into ans(ans_q,ansname,correct) values(@qid,'a picture created using Paint',1)

-- 58
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Once you create documents in the Documents folder, you can continue to ________. Select all that apply.','After creating documents in the Documents folder, which actions can you perform on them? Select all that apply.','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'print the documents',1)
insert into ans(ans_q,ansname,correct) values(@qid,'modify the documents',1)
insert into ans(ans_q,ansname) values(@qid,'change the title bar')
insert into ans(ans_q,ansname,correct) values(@qid,'save the document',1)

-- 59
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The method of creating a blank document directly in the Documents folder and then using the app to enter text or data in it, rather than starting an app to create and modify a document, is known as the _________.','What is the approach called when you create a blank document first and then open it in an app to add content?','SCWIN 2-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'application-centric approach')
insert into ans(ans_q,ansname) values(@qid,'enhanced-centric approach')
insert into ans(ans_q,ansname,correct) values(@qid,'document-centric approach',1)
insert into ans(ans_q,ansname) values(@qid,'file-centric approach')

-- 60
insert into q(q_act,qname,qdesc,qhref) values(@actid,'An app is sometimes referred to as a/n ________.','What is another term for an app?','SCWIN 2-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'shortcut')
insert into ans(ans_q,ansname) values(@qid,'tile')
insert into ans(ans_q,ansname,correct) values(@qid,'program',1)
insert into ans(ans_q,ansname) values(@qid,'index')

-- 61
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To protect against the accidental loss of a document, and to allow you to modify the document easily in the future, you should ________ your document.','What should you do to protect a document from accidental loss and make it easy to edit later?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'save',1)
insert into ans(ans_q,ansname) values(@qid,'open')
insert into ans(ans_q,ansname) values(@qid,'close')
insert into ans(ans_q,ansname) values(@qid,'print')

-- 62
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you delete a file or folder, Windows 11 places these items in the ________.','Where does Windows place a deleted file or folder?','SCWIN 2-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Trash Can')
insert into ans(ans_q,ansname) values(@qid,'Deleted folder')
insert into ans(ans_q,ansname) values(@qid,'Recover folder')
insert into ans(ans_q,ansname,correct) values(@qid,'Recycle Bin',1)

-- 63
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A collection of information stored on your computer, such as a text document, spreadsheet, photo, or song, is referred to a/n ________.','What do you call a collection of information stored on a computer, such as a document, spreadsheet, photo, or song?','SCWIN 2-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'app')
insert into ans(ans_q,ansname,correct) values(@qid,'file',1)
insert into ans(ans_q,ansname) values(@qid,'list')
insert into ans(ans_q,ansname) values(@qid,'item')

-- 64
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The area on the hard drive that contains all the items you have deleted is the ________.','What Windows location contains items that you have deleted?','SCWIN 2-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Recycle Bin',1)
insert into ans(ans_q,ansname) values(@qid,'Deleted folder')
insert into ans(ans_q,ansname) values(@qid,'Recover folder')
insert into ans(ans_q,ansname) values(@qid,'Trash Can')

-- 65
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To change to other views, you can use the ________ menu.','Which menu lets you switch between different folder views?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Display')
insert into ans(ans_q,ansname,correct) values(@qid,'View',1)
insert into ans(ans_q,ansname) values(@qid,'Option')
insert into ans(ans_q,ansname) values(@qid,'Preview')

-- 66
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The icon option that displays images that closely reflect the actual contents of the files or folders is ________.','What feature displays images that closely represent the actual contents of files or folders?','SCWIN 2-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Details view')
insert into ans(ans_q,ansname,correct) values(@qid,'Live Preview',1)
insert into ans(ans_q,ansname) values(@qid,'List')
insert into ans(ans_q,ansname) values(@qid,'Small icons')

-- 67
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can group the files by any of the options on the Group by submenu. This includes options such as Name, Date modified, ________, and Size.','Which option can be used to group files along with Name, Date modified, and Size?','SCWIN 2-18')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'View')
insert into ans(ans_q,ansname,correct) values(@qid,'Type',1)
insert into ans(ans_q,ansname) values(@qid,'Index')
insert into ans(ans_q,ansname) values(@qid,'Document')

-- 68
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you select a document, a Live Preview of the document is displayed to the right of the list of files in the folder window in the ________ pane.','In which pane is a Live Preview of the selected document displayed?','SCWIN 2-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'View')
insert into ans(ans_q,ansname,correct) values(@qid,'Preview',1)
insert into ans(ans_q,ansname) values(@qid,'Display')
insert into ans(ans_q,ansname) values(@qid,'Document')

-- 69
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Provided you have created a shortcut, you can use the shortcut icon to open a folder directly from the desktop without having to start the app first.','If you have a desktop shortcut to a folder, you can use it to open the folder directly.','SCWIN 2-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 70
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can recover deleted files up until the time you empty the ________.','Deleted files can be recovered until you empty which location?','SCWIN 2-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Recover folder')
insert into ans(ans_q,ansname) values(@qid,'Deleted folder')
insert into ans(ans_q,ansname,correct) values(@qid,'Recycle Bin',1)
insert into ans(ans_q,ansname) values(@qid,'Trash Can')

-- 71
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The concept of multiple apps running at the same time is called ________.','What is it called when multiple apps run at the same time?','SCWIN 2-29')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'concurrent')
insert into ans(ans_q,ansname) values(@qid,'simultaneous')
insert into ans(ans_q,ansname,correct) values(@qid,'multitasking',1)
insert into ans(ans_q,ansname) values(@qid,'task manager')

-- 72
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Regardless of whether the windows are open on the desktop or are minimized, you can close the windows using the buttons on the taskbar.','You can close an open or minimized window by using its taskbar button.','SCWIN 2-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 73
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you accidentally put a file in the Recycle Bin and want to remove it, open the Recycle Bin window, click the item to select it, click the See more menu, and then click ''________ the selected items.''','Which command restores a selected item from the Recycle Bin?','SCWIN 2-35')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Undelete')
insert into ans(ans_q,ansname,correct) values(@qid,'Restore',1)
insert into ans(ans_q,ansname) values(@qid,'Move')
insert into ans(ans_q,ansname) values(@qid,'Return')
