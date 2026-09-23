insert into act(actname,act_grp,act_cat,actlink,actsort) values('Windows 11 Module 3',5,107,'Test/bank.cfm',1)
declare @actid int=scope_identity()
declare @qid int

-- 1
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The folder window will display the same toolbar options regardless of the folder content you are working with.','A folder window shows the same toolbar options no matter what type of content the folder contains.','SCWIN 3-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 2
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A hard drive generally has less storage space than a USB flash drive.','A hard drive usually has less storage capacity than a USB flash drive.','SCWIN 3-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 3
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Windows-SSD (C:) properties are displayed in the details pane of the This PC window.','The details pane in This PC can display properties for the Windows-SSD (C:) drive.','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 4
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The contents of any folder or drive on the computer will be displayed in a folder window.','Windows displays the contents of a folder or drive in a folder window.','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 5
insert into q(q_act,qname,qdesc,qhref) values(@actid,'By default, Windows uses the active window to display the contents of a newly opened drive or folder.','By default, Windows uses the active window to show the contents of a drive or folder you open.','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 6
insert into q(q_act,qname,qdesc,qhref) values(@actid,'ScreenTips appear for every object.','Every object in Windows displays a ScreenTip.','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 7
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You should exercise caution when working with the contents of the Windows folder because changing the contents of the folder might cause the operating system to stop working correctly.','Changing files in the Windows folder can cause Windows to stop working correctly.','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You might want to look at a folder''s properties to configure it for sharing over a network.','You can use a folder''s properties to configure the folder for network sharing.','SCWIN 3-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 9
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If something happens to the original files on your hard drive, you can restore the files or folders from the recycle bin.','If original files on your hard drive are lost or damaged, you can restore them from the Recycle Bin.','SCWIN 3-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 10
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Stop button is displayed when you clear the Search box and search results.','The Stop button appears after you clear the Search box and the search results.','SCWIN 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 11
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Too many open windows on the desktop can become difficult to use and manage.','Having too many windows open can make the desktop harder to manage.','SCWIN 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 12
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you drag the title bar to the left side of the screen, the window will resize to fill only the left half of the screen.','Dragging a window''s title bar to the left side of the screen resizes the window to fill the left half of the screen.','SCWIN 3-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 13
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you save pictures from a digital camera, scanner, smartphone, or the Internet, you must specify the Pictures folder for the save location.','Pictures saved from a camera, scanner, smartphone, or the Internet must be saved in the Pictures folder.','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 14
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You cannot use the Photos app to work with pictures if they are stored in the Pictures folder.','The Photos app cannot work with pictures stored in the Pictures folder.','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 15
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Most pictures that you did not create yourself are copyrighted.','Most pictures created by someone else are protected by copyright.','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The pictures that come with Windows are part of Windows, and they are yours to use as you see fit.','Pictures included with Windows can be used for any purpose without copyright restrictions.','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 17
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Before using pictures and other multimedia files, you should be aware of any copyrights associated with them.','Before using pictures or other multimedia files, you should check for copyright restrictions.','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 18
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Copying files and moving files are the same.','Copying a file and moving a file perform the same action.','SCWIN 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 19
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Whenever you are not using a window, it is a good idea to close it so as not to clutter your desktop.','Closing windows you are no longer using can help reduce desktop clutter.','SCWIN 3-24')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 20
insert into q(q_act,qname,qdesc,qhref) values(@actid,'You can view the images in a folder in the Photos app or as a slide show.','Pictures in a folder can be viewed in the Photos app or as a slide show.','SCWIN 3-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 21
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The slide show automatically will display one picture at a time while everything else on the desktop is hidden from sight.','A slide show displays one picture at a time and hides the rest of the desktop.','SCWIN 3-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 22
insert into q(q_act,qname,qdesc,qhref) values(@actid,'OneDrive is a cloud storage location used for storing files on the Internet and for sharing files with other users.','OneDrive is cloud storage that can store files online and let you share them with other users.','SCWIN 3-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 23
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Storing data on a hard disk is less convenient than storing data on a USB flash drive.','Storing data on a hard drive is less convenient than storing it on a USB flash drive.','SCWIN 3-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 24
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The details pane is used to highlight the most popular properties of a hard drive.','The details pane highlights important properties of a hard drive.','SCWIN 3-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 25
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The majority of objects displayed in the Windows folder are file icons.','Most objects shown in the Windows folder are file icons.','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 26
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you have another type of drive, such as an optical drive, installed in or connected to your computer, the drive also will appear in the ________ group.','Where does Windows list an optical drive or another drive connected to the computer?','SCWIN 3-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Desktop')
insert into ans(ans_q,ansname) values(@qid,'Downloads')
insert into ans(ans_q,ansname,correct) values(@qid,'Devices and drives',1)
insert into ans(ans_q,ansname) values(@qid,'OneDrive')

-- 27
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The hard drive is normally designated as drive ________.','Which drive letter normally identifies the computer''s hard drive?','SCWIN 3-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A')
insert into ans(ans_q,ansname) values(@qid,'B')
insert into ans(ans_q,ansname,correct) values(@qid,'C',1)
insert into ans(ans_q,ansname) values(@qid,'D')

-- 28
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The pane of a folder window that displays the properties of devices, apps, files, and folders is called the ________ pane.','Which pane displays properties for devices, apps, files, and folders?','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'attributes')
insert into ans(ans_q,ansname) values(@qid,'properties')
insert into ans(ans_q,ansname) values(@qid,'qualities')
insert into ans(ans_q,ansname,correct) values(@qid,'details',1)

-- 29
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A characteristic of an object, such as the amount of storage space on a storage device or the number of items in a folder is called a/n ___________________.','What do you call a characteristic of an object, such as storage capacity or the number of items in a folder?','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'property',1)
insert into ans(ans_q,ansname) values(@qid,'icon')
insert into ans(ans_q,ansname) values(@qid,'quality')
insert into ans(ans_q,ansname) values(@qid,'detail')

-- 30
insert into q(q_act,qname,qdesc,qhref) values(@actid,'To determine a drive''s capacity, you would view the ________ property.','Which property shows the total capacity of a drive?','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Capacity')
insert into ans(ans_q,ansname,correct) values(@qid,'Total size',1)
insert into ans(ans_q,ansname) values(@qid,'Volume')
insert into ans(ans_q,ansname) values(@qid,'Dimension')

-- 31
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Windows-SSD (C:) Properties dialog box, you can check for errors on the hard drive by clicking the ________ tab.','Which tab in the Windows-SSD (C:) Properties dialog box lets you check the drive for errors?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Tools',1)
insert into ans(ans_q,ansname) values(@qid,'Errors')
insert into ans(ans_q,ansname) values(@qid,'Troubleshooting')
insert into ans(ans_q,ansname) values(@qid,'Security')

-- 32
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Windows-SSD (C:) Properties dialog box, you can defragment the hard drive by clicking the ________ tab.','Which tab in the Windows-SSD (C:) Properties dialog box lets you defragment the drive?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Utilities')
insert into ans(ans_q,ansname) values(@qid,'Defragment')
insert into ans(ans_q,ansname,correct) values(@qid,'Tools',1)
insert into ans(ans_q,ansname) values(@qid,'Security')

-- 33
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Windows-SSD (C:) Properties dialog box, you can share the contents of a hard drive with other computer users using the ________ sheet.','Which sheet in the Windows-SSD (C:) Properties dialog box is used to share the drive with other users?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Sharing',1)
insert into ans(ans_q,ansname) values(@qid,'Global')
insert into ans(ans_q,ansname) values(@qid,'Permissions')
insert into ans(ans_q,ansname) values(@qid,'Users')

-- 34
insert into q(q_act,qname,qdesc,qhref) values(@actid,'What is the primary purpose of the Personal Vault?','What is the main purpose of OneDrive Personal Vault?','SCWIN 3-36')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'To organize files and folders more efficiently.')
insert into ans(ans_q,ansname,correct) values(@qid,'To provide additional security to protect sensitive information.',1)
insert into ans(ans_q,ansname) values(@qid,'To share files with others more easily.')
insert into ans(ans_q,ansname) values(@qid,'To increase the total storage space available in OneDrive')

-- 35
insert into q(q_act,qname,qdesc,qhref) values(@actid,'After you press DELETE to delete a folder, a dialog box is displayed asking for confirmation to delete the folder. What should you do?','After pressing DELETE on a folder, which choice confirms that the folder should be moved to the Recycle Bin?','SCWIN 3-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Click Delete to move the folder to the Recycle Bin.')
insert into ans(ans_q,ansname) values(@qid,'Click Remove to move the folder to the Recycle Bin.')
insert into ans(ans_q,ansname) values(@qid,'Click Recycle to move the folder to the Recycle Bin.')
insert into ans(ans_q,ansname,correct) values(@qid,'Click Yes to move the folder to the Recycle Bin.',1)

-- 36
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The folder windows feature that indicates which folder you are viewing is called the ________.','Which part of a folder window shows which folder you are currently viewing?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'address bar',1)
insert into ans(ans_q,ansname) values(@qid,'menu bar')
insert into ans(ans_q,ansname) values(@qid,'status bar')
insert into ans(ans_q,ansname) values(@qid,'navigation bar')

-- 37
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you move the pointer over a folder icon, a preview of the folder properties will display in a ________.','What appears when you point to a folder icon to preview its properties?','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Live Preview')
insert into ans(ans_q,ansname,correct) values(@qid,'ScreenTip',1)
insert into ans(ans_q,ansname) values(@qid,'AutoTip')
insert into ans(ans_q,ansname) values(@qid,'QuickShot')

-- 38
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Properties dialog box always will have the ________ tab, although what it displays may differ.','Which tab always appears in a Properties dialog box?','SCWIN 3-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Previous Versions')
insert into ans(ans_q,ansname,correct) values(@qid,'General',1)
insert into ans(ans_q,ansname) values(@qid,'Command')
insert into ans(ans_q,ansname) values(@qid,'Quota')

-- 39
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you want to find a particular file or folder in the currently displayed folder, you can use the ________ in the folder window.','Which box in a folder window lets you find a file or folder in the current location?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Find box')
insert into ans(ans_q,ansname) values(@qid,'Result box')
insert into ans(ans_q,ansname,correct) values(@qid,'Search box',1)
insert into ans(ans_q,ansname) values(@qid,'Goto box')

-- 40
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to search for a file and know that the file starts with the letters MSP, you can type ________ in the Search box.','If a file name begins with MSP, what can you type in the Search box to find it?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'msp*',1)
insert into ans(ans_q,ansname) values(@qid,'msp?')
insert into ans(ans_q,ansname) values(@qid,'msp&')
insert into ans(ans_q,ansname) values(@qid,'msp^')

-- 41
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to search for all files with a particular extension, you can use the ________ to substitute for the name of the files.','Which wildcard can stand in for a file name when you are searching for all files with a particular extension?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'question mark (?)')
insert into ans(ans_q,ansname,correct) values(@qid,'asterisk (*)',1)
insert into ans(ans_q,ansname) values(@qid,'ampersand (&)')
insert into ans(ans_q,ansname) values(@qid,'caret (^)')

-- 42
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A window occupies the entire screen and cannot be confused with other open windows if you ________ the window.','What do you do to make a window fill the entire screen?','SCWIN 3-12')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'restore')
insert into ans(ans_q,ansname) values(@qid,'index')
insert into ans(ans_q,ansname,correct) values(@qid,'maximize',1)
insert into ans(ans_q,ansname) values(@qid,'shake')

-- 43
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you are done viewing a slide show, what do you do to end the show?','Which key ends a slide show?','SCWIN 3-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Press ALT and ESC')
insert into ans(ans_q,ansname,correct) values(@qid,'Press ESC',1)
insert into ans(ans_q,ansname) values(@qid,'Press DELETE')
insert into ans(ans_q,ansname) values(@qid,'Press ALT and DELETE')

-- 44
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you copy a file, you place a copy of the file in a temporary storage area of the computer called the ________.','When you copy a file, where is the copy temporarily stored before you paste it?','SCWIN 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Silo')
insert into ans(ans_q,ansname) values(@qid,'Recycle Bin')
insert into ans(ans_q,ansname) values(@qid,'Warehouse')
insert into ans(ans_q,ansname,correct) values(@qid,'Clipboard',1)

-- 45
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a common type of file for picture files?','Which file extension is commonly used for picture files?','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'.fig')
insert into ans(ans_q,ansname) values(@qid,'.gra')
insert into ans(ans_q,ansname,correct) values(@qid,'.tif',1)
insert into ans(ans_q,ansname) values(@qid,'.img')

-- 46
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The Windows feature that allows you to maximize a window by dragging its title bar to the top of the screen is called ________.','What Windows feature maximizes a window when you drag its title bar to the top of the screen?','SCWIN 3-20')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Restore')
insert into ans(ans_q,ansname) values(@qid,'Drag')
insert into ans(ans_q,ansname) values(@qid,'Shake')
insert into ans(ans_q,ansname,correct) values(@qid,'Snap',1)

-- 47
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When Windows copies a file from the Clipboard to the location you specify, you ________ the file, giving you two copies of the same file.','What action copies a file from the Clipboard to a location you choose?','SCWIN 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'paste',1)
insert into ans(ans_q,ansname) values(@qid,'install')
insert into ans(ans_q,ansname) values(@qid,'place')
insert into ans(ans_q,ansname) values(@qid,'insert')

-- 48
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you want to move a file, you first use the ________ button on the toolbar.','Which toolbar command do you use first when moving a file?','SCWIN 3-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Place')
insert into ans(ans_q,ansname,correct) values(@qid,'Cut',1)
insert into ans(ans_q,ansname) values(@qid,'Move')
insert into ans(ans_q,ansname) values(@qid,'Restore')

-- 49
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is a picture property?','Which of these is a picture property?','SCWIN 3-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Authors',1)
insert into ans(ans_q,ansname) values(@qid,'Usage')
insert into ans(ans_q,ansname) values(@qid,'Placement')
insert into ans(ans_q,ansname) values(@qid,'Copyright')

-- 50
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Keywords that you associate with a picture file to aid in its classification are ________.','What are keywords assigned to a picture to help classify it called?','SCWIN 3-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Icons')
insert into ans(ans_q,ansname,correct) values(@qid,'Tags',1)
insert into ans(ans_q,ansname) values(@qid,'Strokes')
insert into ans(ans_q,ansname) values(@qid,'Indices')

-- 51
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When assigning stars to a picture, you use the ______ picture property.','Which picture property is used when you assign stars to a picture?','SCWIN 3-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Tag')
insert into ans(ans_q,ansname) values(@qid,'Title')
insert into ans(ans_q,ansname) values(@qid,'Dimension')
insert into ans(ans_q,ansname,correct) values(@qid,'Rating',1)

-- 52
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If files are large or numerous, you can make them easier to manage by ________ the files.','What can you do to large or numerous files to make them easier to manage?','SCWIN 3-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'compressing',1)
insert into ans(ans_q,ansname) values(@qid,'restoring')
insert into ans(ans_q,ansname) values(@qid,'tagging')
insert into ans(ans_q,ansname) values(@qid,'minimizing')

-- 53
insert into q(q_act,qname,qdesc,qhref) values(@actid,'If you need to email large files, you can create a ________________..','What type of file can you create to make large files easier to email?','SCWIN 3-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'shared file')
insert into ans(ans_q,ansname,correct) values(@qid,'zipped file',1)
insert into ans(ans_q,ansname) values(@qid,'protected file')
insert into ans(ans_q,ansname) values(@qid,'unsecured file')

-- 54
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You have purchased a brand-new Windows 11 computer for the new semester of your coursework, and you decide to spend some time learning about all of the properties of the computer''s hard drive in order to make sure that you are using the computer to its fullest potential. One of the earliest lessons you learned as a computer user is the importance of backing up your work. Which of the following could you use?','Which device can be used to back up files from your computer?','SCWIN 3-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'External hard drive',1)
insert into ans(ans_q,ansname) values(@qid,'This PC')
insert into ans(ans_q,ansname) values(@qid,'Tools tab')
insert into ans(ans_q,ansname) values(@qid,'Backup tab')

-- 55
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You have purchased a brand-new Windows 11 computer for the new semester of your coursework, and you decide to spend some time learning about all of the properties of the computer''s hard drive to make sure that you are using the computer to its fullest potential. As you have been using the computer for a while, you are experiencing some issues with the hard drive. Which of the following Properties dialog box tabs is your best bet for troubleshooting problems?','Which Properties dialog box tab is useful for troubleshooting hard-drive problems?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Sharing')
insert into ans(ans_q,ansname) values(@qid,'Quota')
insert into ans(ans_q,ansname,correct) values(@qid,'Hardware',1)
insert into ans(ans_q,ansname) values(@qid,'Security')

-- 56
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You have enjoyed using your new computer - so much so that you have created a large number of files very quickly. As a result, you find yourself regularly needing to search for files to find what you need among all that you have created. In your first effort at using the Search box, you see that there are visual cues to indicate that the search is in progress. Which of the following is not an indication that your search is under way?','Which item is NOT a sign that a file search is currently in progress?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A searching message displayed in the list area.')
insert into ans(ans_q,ansname) values(@qid,'An animated progress bar on the address bar that provides live feedback about how much of the search has been completed.')
insert into ans(ans_q,ansname) values(@qid,'An animated circle attached to the pointer.')
insert into ans(ans_q,ansname,correct) values(@qid,'An asterisk that blinks to indicate a search using a wildcard value.',1)

-- 57
insert into q(q_act,qname,qdesc,qhref) values(@actid,'CASE: You have enjoyed using your new computer - so much so that you have created a large number of files very quickly. As a result, you find yourself regularly needing to search for files to find what you need among all that you have created. In using your new computer, you have been doing some freelance work, including producing files for a company named RSM Industries. You created an image file as part of one of your projects, but you cannot remember if it was a GIF or a JPEG image. You do know, however, that the file name begins with RSM. Which of the following would help you find that file?','You need to find an image whose file name begins with RSM, but you do not know its extension. Which search would help find it?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'rsm^')
insert into ans(ans_q,ansname,correct) values(@qid,'rsm*',1)
insert into ans(ans_q,ansname) values(@qid,'rsm&')
insert into ans(ans_q,ansname) values(@qid,'rsm?')

-- 58
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the File Explorer window, you can navigate to the This PC window using the ________.','Which part of File Explorer can you use to navigate to This PC?','SCWIN 3-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'address bar')
insert into ans(ans_q,ansname) values(@qid,'toolbar')
insert into ans(ans_q,ansname,correct) values(@qid,'navigation bar',1)
insert into ans(ans_q,ansname) values(@qid,'search box')

-- 59
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The group that contains the icon that represents the hard drive on the computer is called the ________ group.','Which group in This PC contains the computer''s hard drive?','SCWIN 3-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Primary')
insert into ans(ans_q,ansname,correct) values(@qid,'Devices and drives',1)
insert into ans(ans_q,ansname) values(@qid,'This PC')
insert into ans(ans_q,ansname) values(@qid,'Network location')

-- 60
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The characteristic of an object such as the amount of storage space on a storage device or the number of items in a folder is called a/n ________.','What do you call a characteristic such as a drive''s storage space or the number of items in a folder?','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'property',1)
insert into ans(ans_q,ansname) values(@qid,'app')
insert into ans(ans_q,ansname) values(@qid,'devices')
insert into ans(ans_q,ansname) values(@qid,'file')

-- 61
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the Windows-SSD (C:) properties, you could check the file system being used on the drive using the ________ property.','Which property tells you what file system drive C is using?','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'File system',1)
insert into ans(ans_q,ansname) values(@qid,'Hardware')
insert into ans(ans_q,ansname) values(@qid,'Device')
insert into ans(ans_q,ansname) values(@qid,'This PC')

-- 62
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A useful feature that has the capability to allow you to switch to different folder windows by clicking the arrows preceding or following the folder names is the ________.','Which feature lets you move between folder locations by clicking arrows before or after folder names?','SCWIN 3-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'toolbar')
insert into ans(ans_q,ansname) values(@qid,'navigation bar')
insert into ans(ans_q,ansname) values(@qid,'search box')
insert into ans(ans_q,ansname,correct) values(@qid,'address bar',1)

-- 63
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A brief description that appears when you position the pointer over an object on the screen is called a/n ________.','What do you call the brief description that appears when you point to an object?','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'title')
insert into ans(ans_q,ansname) values(@qid,'note')
insert into ans(ans_q,ansname) values(@qid,'image')
insert into ans(ans_q,ansname,correct) values(@qid,'ScreenTip',1)

-- 64
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A backup that is made according to predetermined dates and times is a ________ backup.','What type of backup runs automatically at predetermined dates and times?','SCWIN 3-33')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'differential')
insert into ans(ans_q,ansname,correct) values(@qid,'scheduled',1)
insert into ans(ans_q,ansname) values(@qid,'complete')
insert into ans(ans_q,ansname) values(@qid,'manual')

-- 65
insert into q(q_act,qname,qdesc,qhref) values(@actid,'In the name of a file or folder for which you are searching, to represent unknown characters you can use a/n ________.','Which wildcard can represent unknown characters in a file or folder name?','SCWIN 3-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'percent sign')
insert into ans(ans_q,ansname) values(@qid,'dollar sign')
insert into ans(ans_q,ansname,correct) values(@qid,'asterisk',1)
insert into ans(ans_q,ansname) values(@qid,'ampersand')

-- 66
insert into q(q_act,qname,qdesc,qhref) values(@actid,'One way to organize windows on the desktop is to apply a/n ________.','Which Windows feature can organize open windows into a predefined arrangement?','SCWIN 3-14')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'shake layout')
insert into ans(ans_q,ansname) values(@qid,'preview layout')
insert into ans(ans_q,ansname,correct) values(@qid,'snap layout',1)
insert into ans(ans_q,ansname) values(@qid,'arrange all layout')

-- 67
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Shake lets you minimize all windows except the active window and then restore all those windows by shaking the ________ of the active window.','To use Shake, which part of the active window do you shake?','SCWIN 3-13')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'status bar')
insert into ans(ans_q,ansname) values(@qid,'ribbon tab')
insert into ans(ans_q,ansname) values(@qid,'navigation bar')
insert into ans(ans_q,ansname,correct) values(@qid,'title bar',1)

-- 68
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Point to the File Explorer button on the taskbar to see an ________ of the open File Explorer windows.','What appears when you point to the File Explorer taskbar button to preview open File Explorer windows?','SCWIN 3-21')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Snap Preview')
insert into ans(ans_q,ansname,correct) values(@qid,'Live Preview',1)
insert into ans(ans_q,ansname) values(@qid,'Quick View')
insert into ans(ans_q,ansname) values(@qid,'Quick Preview')

-- 69
insert into q(q_act,qname,qdesc,qhref) values(@actid,'When you save pictures from a scanner, they are saved to the ________ by default.','According to this module, where are pictures from a scanner saved by default?','SCWIN 3-22')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Document folder')
insert into ans(ans_q,ansname,correct) values(@qid,'Pictures folder',1)
insert into ans(ans_q,ansname) values(@qid,'Download folder')
insert into ans(ans_q,ansname) values(@qid,'Windows folder')

-- 70
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Using the Photos app, you can view pictures in a presentation format known as a ________.','What presentation format in the Photos app displays pictures one after another?','SCWIN 3-30')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'slide show',1)
insert into ans(ans_q,ansname) values(@qid,'Live Preview')
insert into ans(ans_q,ansname) values(@qid,'live show')
insert into ans(ans_q,ansname) values(@qid,'slide preview')

-- 71
insert into q(q_act,qname,qdesc,qhref) values(@actid,'A file that contains compressed copies of a file or files is ________.','What do you call a file that contains compressed copies of one or more files?','SCWIN 3-31')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'zipped',1)
insert into ans(ans_q,ansname) values(@qid,'minimized')
insert into ans(ans_q,ansname) values(@qid,'restricted')
insert into ans(ans_q,ansname) values(@qid,'secured')

-- 72
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which of the following is part of a folder window? Select all that apply.','Which items are parts of a folder window? Select 3 that apply.','SCWIN 3-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Tabs at the top that display the ribbon with multiple commands')
insert into ans(ans_q,ansname,correct) values(@qid,'A status bar on the bottom of the window',1)
insert into ans(ans_q,ansname,correct) values(@qid,'An address bar below the toolbar',1)
insert into ans(ans_q,ansname,correct) values(@qid,'A navigation pane on the left of the toolbar',1)

-- 73
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The details pane of a folder window displays the properties of ____________________. Select all that apply.','Which types of objects can have properties displayed in the details pane? Select 3 that apply.','SCWIN 3-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'user accounts')
insert into ans(ans_q,ansname,correct) values(@qid,'files',1)
insert into ans(ans_q,ansname,correct) values(@qid,'apps',1)
insert into ans(ans_q,ansname,correct) values(@qid,'folders',1)

-- 74
insert into q(q_act,qname,qdesc,qhref) values(@actid,'Which are properties of drive C? Select all that apply.','Which are properties of drive C? Select 3 that apply.','SCWIN 3-4')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Space used',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Space free',1)
insert into ans(ans_q,ansname) values(@qid,'Resolution')
insert into ans(ans_q,ansname,correct) values(@qid,'Total size',1)

-- 75
insert into q(q_act,qname,qdesc,qhref) values(@actid,'The properties of a folder typically consist of the ________. Select all that apply.','Which are typical properties of a folder? Select 3 that apply.','SCWIN 3-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'date and time created',1)
insert into ans(ans_q,ansname,correct) values(@qid,'folder size',1)
insert into ans(ans_q,ansname,correct) values(@qid,'name of the folder',1)
insert into ans(ans_q,ansname) values(@qid,'device name')

select * from q 
where q_act=@actid

