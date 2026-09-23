declare @actid int
declare @qid int
-- 1
insert into q(q_act,qname,qdesc) values(@actid,'The Windows operating system simplifies the process of working with documents and apps by organizing the manner in which you interact with the computer.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 2
insert into q(q_act,qname,qdesc) values(@actid,'The operating system simplifies working with documents and programs, transferring data between documents, interacting with the different components of the computer, and using the computer to access information on the Internet or an intranet.','SCWIN 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 3
insert into q(q_act,qname,qdesc) values(@actid,'Windows 11 cannot be customized to fit individual needs.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 4
insert into q(q_act,qname,qdesc) values(@actid,'When you sign in to your Microsoft account with another Windows device, your settings will appear very differently than they do on your other Windows 11 devices.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 5
insert into q(q_act,qname,qdesc) values(@actid,'One of the uses of the drag gesture is to display a shortcut menu.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 6
insert into q(q_act,qname,qdesc) values(@actid,'One of the uses of the press and hold gesture is to activate a mode enabling you to move an item with one finger to a new location.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 7
insert into q(q_act,qname,qdesc) values(@actid,'The Sleep command saves your work, turns off the computer fans and hard drive, and places the computer in a lower-power state.','SCWIN 1-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 8
insert into q(q_act,qname,qdesc) values(@actid,'If you want to move files around on your hard drive, the File Explorer can help you perform these operations.','SCWIN 1-15')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 9
insert into q(q_act,qname,qdesc) values(@actid,'The Windows Store app can be accessed only through the pinned app button on the taskbar.','SCWIN 1-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 10
insert into q(q_act,qname,qdesc) values(@actid,'Some apps are free, allowing you to download them without making a payment.','SCWIN 1-28')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 11
insert into q(q_act,qname,qdesc) values(@actid,'You can access the Search box from the Search button or the Start button on the taskbar.','SCWIN 1-41')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 12
insert into q(q_act,qname,qdesc) values(@actid,'If you are leaving the computer but do not want to turn it off, you can choose to sign out of your account.','SCWIN 1-42')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 13
insert into q(q_act,qname,qdesc) values(@actid,'For a computer, minimum system requirements specify that the processor is 4 GHz or faster.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 14
insert into q(q_act,qname,qdesc) values(@actid,'With a picture password, you swipe across a picture using gestures you previously set for that image.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 15
insert into q(q_act,qname,qdesc) values(@actid,'The Recycle Bin, which is the location of files and other objects that have been deleted, appears on the desktop by default.','SCWIN 1-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 16
insert into q(q_act,qname,qdesc) values(@actid,'When you start an app, that app''s button appears on the taskbar.','SCWIN 1-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'True',1)
insert into ans(ans_q,ansname) values(@qid,'False')

-- 17
insert into q(q_act,qname,qdesc) values(@actid,'You can type in a custom size for Widgets on the widgets board.','SCWIN 1-23')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'True')
insert into ans(ans_q,ansname,correct) values(@qid,'False',1)

-- 18
insert into q(q_act,qname,qdesc) values(@actid,'A computer program that manages the complete operation of your computer or mobile device and lets you interact with it is the ________ system.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'operating',1)
insert into ans(ans_q,ansname) values(@qid,'application')
insert into ans(ans_q,ansname) values(@qid,'indexed')
insert into ans(ans_q,ansname) values(@qid,'baseline')

-- 19
insert into q(q_act,qname,qdesc) values(@actid,'When you install an app, one or more commands or icons are added to the ________.','SCWIN 1-11')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'grid')
insert into ans(ans_q,ansname) values(@qid,'nexus')
insert into ans(ans_q,ansname,correct) values(@qid,'Start menu',1)
insert into ans(ans_q,ansname) values(@qid,'cell')

-- 20
insert into q(q_act,qname,qdesc) values(@actid,'A computer that controls access to the hardware and software on a network and provides a centralized storage location for programs, data, and information is a ________.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'workstation')
insert into ans(ans_q,ansname) values(@qid,'microcomputer')
insert into ans(ans_q,ansname) values(@qid,'mainframe')
insert into ans(ans_q,ansname,correct) values(@qid,'server',1)

-- 21
insert into q(q_act,qname,qdesc) values(@actid,'A computer connected to a server is a ________.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'workstation',1)
insert into ans(ans_q,ansname) values(@qid,'microcomputer')
insert into ans(ans_q,ansname) values(@qid,'mainframe')
insert into ans(ans_q,ansname) values(@qid,'server')

-- 22
insert into q(q_act,qname,qdesc) values(@actid,'Which Windows 11 version is designed for businesses and technical professionals?','SCWIN 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Home')
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Enterprise')
insert into ans(ans_q,ansname,correct) values(@qid,'Windows 11 Pro',1)
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Education')

-- 23
insert into q(q_act,qname,qdesc) values(@actid,'Which Windows 11 version has the same features as Windows 11 Pro but is designed for large businesses?','SCWIN 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Home')
insert into ans(ans_q,ansname,correct) values(@qid,'Windows 11 Enterprise',1)
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Large Business')
insert into ans(ans_q,ansname) values(@qid,'Windows 11 Education')

-- 24
insert into q(q_act,qname,qdesc) values(@actid,'For a computer, minimum system requirements specify that the video card supports DirectX 12 graphics with WDDM (Windows Display Driver Model) ________ or higher driver.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'0.1')
insert into ans(ans_q,ansname) values(@qid,'1.0')
insert into ans(ans_q,ansname) values(@qid,'1.5')
insert into ans(ans_q,ansname,correct) values(@qid,'2.0',1)

-- 25
insert into q(q_act,qname,qdesc) values(@actid,'For a computer, minimum system requirements specify that the hard drive has at least ________ GB available.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'8')
insert into ans(ans_q,ansname) values(@qid,'16')
insert into ans(ans_q,ansname) values(@qid,'32')
insert into ans(ans_q,ansname,correct) values(@qid,'64',1)

-- 26
insert into q(q_act,qname,qdesc) values(@actid,'You can sign in to the account and then sync your information with all of your Windows devices when you add a ________ account.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'cross-app')
insert into ans(ans_q,ansname) values(@qid,'custom')
insert into ans(ans_q,ansname,correct) values(@qid,'Microsoft',1)
insert into ans(ans_q,ansname) values(@qid,'touch')

-- 27
insert into q(q_act,qname,qdesc) values(@actid,'A motion you make on a touch screen with the tip of one or more fingers or your hand is a ________.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'swipe')
insert into ans(ans_q,ansname,correct) values(@qid,'gesture',1)
insert into ans(ans_q,ansname) values(@qid,'pass')
insert into ans(ans_q,ansname) values(@qid,'touch base')

-- 28
insert into q(q_act,qname,qdesc) values(@actid,'Windows enables each user to establish a user ________, which identifies to Windows the resources a user can access when working with the computer.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'access')
insert into ans(ans_q,ansname) values(@qid,'index')
insert into ans(ans_q,ansname) values(@qid,'password')
insert into ans(ans_q,ansname,correct) values(@qid,'account',1)

-- 29
insert into q(q_act,qname,qdesc) values(@actid,'A unique combination of letters or numbers that identifies a specific user to Windows is a/n ________.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'user name',1)
insert into ans(ans_q,ansname) values(@qid,'administrative code')
insert into ans(ans_q,ansname) values(@qid,'password')
insert into ans(ans_q,ansname) values(@qid,'PIN')

-- 30
insert into q(q_act,qname,qdesc) values(@actid,'A picture associated with a user name is a user ________.','SCWIN1- 6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'graphic')
insert into ans(ans_q,ansname,correct) values(@qid,'icon',1)
insert into ans(ans_q,ansname) values(@qid,'link')
insert into ans(ans_q,ansname) values(@qid,'tag')

-- 31
insert into q(q_act,qname,qdesc) values(@actid,'When you turn on a computer, Windows starts and displays a/n ________ screen.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'home base')
insert into ans(ans_q,ansname) values(@qid,'open')
insert into ans(ans_q,ansname,correct) values(@qid,'lock',1)
insert into ans(ans_q,ansname) values(@qid,'access')

-- 32
insert into q(q_act,qname,qdesc) values(@actid,'A powerful, high-capacity computer you access using the Internet or other network is a ________.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'workstation')
insert into ans(ans_q,ansname) values(@qid,'microcomputer')
insert into ans(ans_q,ansname) values(@qid,'mainframe')
insert into ans(ans_q,ansname,correct) values(@qid,'server',1)

-- 33
insert into q(q_act,qname,qdesc) values(@actid,'In Windows, you can switch between apps easily by clicking the app button on the ________.','SCWIN 1-16')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'taskbar',1)
insert into ans(ans_q,ansname) values(@qid,'Start menu')
insert into ans(ans_q,ansname) values(@qid,'icon tray')
insert into ans(ans_q,ansname) values(@qid,'widget board')

-- 34
insert into q(q_act,qname,qdesc) values(@actid,'In addition to starting apps using icons or commands on the Start menu or by using buttons on the taskbar, what other option can you use to start an app?','SCWIN 1-27')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Split View menu')
insert into ans(ans_q,ansname) values(@qid,'widget board')
insert into ans(ans_q,ansname) values(@qid,'icon tray')
insert into ans(ans_q,ansname,correct) values(@qid,'Search box',1)

-- 35
insert into q(q_act,qname,qdesc) values(@actid,'For a computer, minimum system requirements specify that the RAM is at least ________ GB for 64-bit systems.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'5')
insert into ans(ans_q,ansname) values(@qid,'1')
insert into ans(ans_q,ansname) values(@qid,'2')
insert into ans(ans_q,ansname,correct) values(@qid,'4',1)

-- 36
insert into q(q_act,qname,qdesc) values(@actid,'The digital personal assistant that comes with Windows 11 and that is an app that enables you to search using your computer or mobile device''s microphone is ________.','SCWIN 1-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Search box')
insert into ans(ans_q,ansname,correct) values(@qid,'Cortana',1)
insert into ans(ans_q,ansname) values(@qid,'Microsoft Edge')
insert into ans(ans_q,ansname) values(@qid,'File Explorer')

-- 37
insert into q(q_act,qname,qdesc) values(@actid,'The horizontal bar at the bottom of the Windows 11 desktop that displays app buttons, icons, and a notification area is the ________.','SCWIN 1-9')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Quick Access Toolbar')
insert into ans(ans_q,ansname,correct) values(@qid,'taskbar',1)
insert into ans(ans_q,ansname) values(@qid,'menu bar')
insert into ans(ans_q,ansname) values(@qid,'Start bar')

-- 38
insert into q(q_act,qname,qdesc) values(@actid,'Which of the following is true of Cortana? Select all that apply.','SCWIN 1-32')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'It is a digital personal assistant that comes with Windows 11.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'It is intuitive; the more you use it, the more it learns about you and forms its search results accordingly.',1)
insert into ans(ans_q,ansname,correct) values(@qid,'To use Cortana, you must be signed in to Windows with a Microsoft account.',1)
insert into ans(ans_q,ansname) values(@qid,'Cortana can be accessed only through the app button on the taskbar.')

-- 39
insert into q(q_act,qname,qdesc) values(@actid,'In addition to entering search text to locate search results in files, in folders, or on the Internet, you also can type questions in the ________ in the Search screen.','SCWIN 1-34')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Search button')
insert into ans(ans_q,ansname) values(@qid,'notification area')
insert into ans(ans_q,ansname) values(@qid,'taskbar')
insert into ans(ans_q,ansname,correct) values(@qid,'Search box',1)

-- 40
insert into q(q_act,qname,qdesc) values(@actid,'You also can use Cortana and the To Do app to set ________.','SCWIN 1-37')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'reminders',1)
insert into ans(ans_q,ansname) values(@qid,'notices')
insert into ans(ans_q,ansname) values(@qid,'prompts')
insert into ans(ans_q,ansname) values(@qid,'cues')

-- 41
insert into q(q_act,qname,qdesc) values(@actid,'When you press a key or a combination of keys to access a feature or perform a command, this is a keyboard ________.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'quickstart')
insert into ans(ans_q,ansname) values(@qid,'link')
insert into ans(ans_q,ansname,correct) values(@qid,'shortcut',1)
insert into ans(ans_q,ansname) values(@qid,'command')

-- 42
insert into q(q_act,qname,qdesc) values(@actid,'The screen that makes the computer available for use is the ________.','SCWIN 1-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'desktop')
insert into ans(ans_q,ansname) values(@qid,'icon')
insert into ans(ans_q,ansname,correct) values(@qid,'sign-in screen',1)
insert into ans(ans_q,ansname) values(@qid,'lock screen')

-- 43
insert into q(q_act,qname,qdesc) values(@actid,'CASE: You have never used a tablet before, and your new Windows 11-enabled tablet has just arrived. You decide to take a brief online tutorial in touch screen gestures so that you will know exactly what some common gestures are, and which gestures correspond to which uses. In the tutorial, you learn that a particular gesture involves quickly touching and releasing one finger one time. What is the name for this gesture?','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Tap',1)
insert into ans(ans_q,ansname) values(@qid,'Press and hold')
insert into ans(ans_q,ansname) values(@qid,'Double-tap')
insert into ans(ans_q,ansname) values(@qid,'Swipe')

-- 44
insert into q(q_act,qname,qdesc) values(@actid,'CASE: You have never used a tablet before, and your new Windows 11-enabled tablet has just arrived. You decide to take a brief online tutorial in touch screen gestures so that you will know exactly what some common gestures are, and which gestures correspond to which uses. Which of the following gestures does the tutorial tell you is to be used to start an app?','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Swipe')
insert into ans(ans_q,ansname) values(@qid,'Press and hold')
insert into ans(ans_q,ansname,correct) values(@qid,'Double-tap',1)
insert into ans(ans_q,ansname) values(@qid,'Drag')

-- 45
insert into q(q_act,qname,qdesc) values(@actid,'CASE: You have had an older computer for a long time, but you have just invested in a brand-new one, which comes with a new mouse with some features you have never had before. You know that you should be able to use the mouse to scroll vertically up and down. Which mouse operation do you use for this?','SCWIN 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Right-drag')
insert into ans(ans_q,ansname,correct) values(@qid,'Rotate wheel',1)
insert into ans(ans_q,ansname) values(@qid,'Press wheel')
insert into ans(ans_q,ansname) values(@qid,'Tilt wheel')

-- 46
insert into q(q_act,qname,qdesc) values(@actid,'CASE: You have had an older computer for a long time, but you have just invested in a brand-new one, which comes with a new mouse with some features you have never had before. You know that you should be able to use the mouse to scroll vertically up and down. Another feature of your new mouse is the ability to scroll continuously. Which mouse operation do you use for this?','SCWIN 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'tilt wheel')
insert into ans(ans_q,ansname) values(@qid,'rotate wheel')
insert into ans(ans_q,ansname) values(@qid,'right-drag')
insert into ans(ans_q,ansname,correct) values(@qid,'press wheel',1)

-- 47
insert into q(q_act,qname,qdesc) values(@actid,'What commands appear when you click the Shut down button? Select all options that apply.','SCWIN 1-7')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'Sleep',1)
insert into ans(ans_q,ansname) values(@qid,'Open')
insert into ans(ans_q,ansname,correct) values(@qid,'Shut down',1)
insert into ans(ans_q,ansname,correct) values(@qid,'Restart',1)

-- 48
insert into q(q_act,qname,qdesc) values(@actid,'The notification area can tell you ________. Select all options that apply.','SCWIN 1-10')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'if your virus protection is out of date',1)
insert into ans(ans_q,ansname,correct) values(@qid,'whether you are connected to a network',1)
insert into ans(ans_q,ansname,correct) values(@qid,'how much battery life you have remaining in your laptop',1)
insert into ans(ans_q,ansname) values(@qid,'which operating system is running')

-- 49
insert into q(q_act,qname,qdesc) values(@actid,'A computer program that manages the complete operation of your computer or mobile device and lets you interact with it is a/n ________.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'operating system',1)
insert into ans(ans_q,ansname) values(@qid,'application')
insert into ans(ans_q,ansname) values(@qid,'server')
insert into ans(ans_q,ansname) values(@qid,'workstation')

-- 50
insert into q(q_act,qname,qdesc) values(@actid,'A computer program that performs specific tasks is a/n ________.','SCWIN 1-1')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'workstation')
insert into ans(ans_q,ansname,correct) values(@qid,'app',1)
insert into ans(ans_q,ansname) values(@qid,'mainframe')
insert into ans(ans_q,ansname) values(@qid,'system')

-- 51
insert into q(q_act,qname,qdesc) values(@actid,'A global collection of millions of computers linked together to share information that gives users the ability to use this information, send messages, and obtain products and services is the ________.','SCWIN 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'intranet')
insert into ans(ans_q,ansname) values(@qid,'server')
insert into ans(ans_q,ansname,correct) values(@qid,'Internet',1)
insert into ans(ans_q,ansname) values(@qid,'network')

-- 52
insert into q(q_act,qname,qdesc) values(@actid,'An internal network site used by a group of people who work together that uses Internet technologies is a/n ________.','SCWIN 1-2')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'mainframe')
insert into ans(ans_q,ansname) values(@qid,'server')
insert into ans(ans_q,ansname) values(@qid,'app')
insert into ans(ans_q,ansname,correct) values(@qid,'intranet',1)

-- 53
insert into q(q_act,qname,qdesc) values(@actid,'For a computer, it is a minimum system requirement that the video card supports DirectX 12 graphics with ________ 2.0 or higher driver.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'processor')
insert into ans(ans_q,ansname) values(@qid,'hard drive')
insert into ans(ans_q,ansname,correct) values(@qid,'Windows Display Driver Model',1)
insert into ans(ans_q,ansname) values(@qid,'RAM')

-- 54
insert into q(q_act,qname,qdesc) values(@actid,'Windows can be customized using a ________ account.','SCWIN 1-3')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'guest')
insert into ans(ans_q,ansname,correct) values(@qid,'Microsoft',1)
insert into ans(ans_q,ansname) values(@qid,'standard')
insert into ans(ans_q,ansname) values(@qid,'personal')

-- 55
insert into q(q_act,qname,qdesc) values(@actid,'To display different parts of a window, you use a scroll bar that contains a ________ box.','SCWIN 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'slider')
insert into ans(ans_q,ansname,correct) values(@qid,'scroll',1)
insert into ans(ans_q,ansname) values(@qid,'navigation')
insert into ans(ans_q,ansname) values(@qid,'pointer')

-- 56
insert into q(q_act,qname,qdesc) values(@actid,'To move up or down a section on the screen, you can click above or below the ________.','SCWIN 1-5')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'status bar')
insert into ans(ans_q,ansname) values(@qid,'title bar')
insert into ans(ans_q,ansname) values(@qid,'menu bar')
insert into ans(ans_q,ansname,correct) values(@qid,'scroll box',1)

-- 57
insert into q(q_act,qname,qdesc) values(@actid,'A string of uppercase and lowercase letters, numbers, and symbols that, when entered correctly, allow you to obtain access to a Window user''s account is a________.','SCWIN 1-6')
select @qid=scope_identity()
insert into ans(ans_q,ansname,correct) values(@qid,'password',1)
insert into ans(ans_q,ansname) values(@qid,'passcode')
insert into ans(ans_q,ansname) values(@qid,'PIN')
insert into ans(ans_q,ansname) values(@qid,'passphrase')
