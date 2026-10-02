<cfscript>
include '/Inc/header.cfm'
</cfscript>

<cfoutput>
<form class="card">
	<div class="card-body">
		<div class="row">
			<div class="col-6">
				<a href="https://faculty.cengage.com/works/9780357671993?q=contents">From the Textbook</a>:
			</div>
			<div class="col-6 d-flex justify-content-end mb-3">
				<div class="btn-group btn-group-sm" role="group" aria-label="View options">
				<cfif StructKeyExists(url,'accordion')>
					<button formaction="toc.cfm?accordion" class="btn-primary">
					Accordion View
					</div>
					<button formaction="toc.cfm" class="btn-outline-secondary">
					List View
					</button>
				<cfelse>
					<button formaction="toc.cfm?accordion" class="btn-outline-secondary">
					Accordion View
					</button>
					<button formaction="toc.cfm?" class="btn-primary">
					List View
					</button>
				</cfif>
				</div>
			</div>
		</div>
		<ul>
			 <li>Cover Page
				<ul>
					<li>Title Page</li>
					<li>Copyright Page</li>
				 </ul>
			 </li>
			 <li>Getting to Know Microsoft Office Versions
				<ul>
					<li>Getting to Know Microsoft Office Versions 2021 Content</li>
				 </ul>
			 </li>
			 <li>Using SAM Projects and Textbook Projects
				<ul>
					<li>Using SAM Projects and Textbook Projects 2021 Content</li>
				 </ul>
			 </li>
			 <li>Getting Started
				<ul>
					 <li>Introduction to MindTap
						<ul>
							<li>Creating a Cengage Account</li>
							<li>Getting Started with MindTap</li>
							<li>Using MindTap Reader</li>
							<li>Using MindTap Learning Apps</li>
							<li>Getting Help with MindTap</li>
						</ul>
					</li>
					 <li>Introduction to SAM
						<ul>
							<li>Displaying the SAM Calendar and Activity List</li>
							<li>Using SAM Training and Exams for Mastery</li>
							<li>Completing SAM Projects</li>
						</ul>
					</li>
					 <li>Getting Started with File Management
						<ul>
							<li>Managing Your Files</li>
							<li>Creating a Folder</li>
							<li>Renaming a Folder</li>
							<li>Moving and Copying Files and Folders</li>
						</ul>
					</li>
					 <li>Getting Started with Windows 11
						<ul>
							<li>Upgrading to Windows 11</li>
							<li>The Start Menu and Taskbar in Windows 11</li>
							<li>Search Box</li>
							<li>Multiple Desktops</li>
							<li>Chat with Microsoft Teams</li>
							<li>File Explorer in Windows 11</li>
							<li>Quick Settings</li>
							<li>Accessibility in Windows 11</li>
							<li>Snap Assist and Multitasking</li>
							<li>Wonderful World of Widgets</li>
							<li>Themes</li>
							<li>Android App Support</li>
							<li>Gaming in Windows 11</li>
							<li>Built-in Browser in Windows 11</li>
							<li>Windows Security</li>
							<li>Activity: Try Windows 11 Features on Your PC</li>
						</ul>
					</li>
					 <li>Getting Started with Microsoft OneNote
						<ul>
							<li>Creating a OneNote Notebook</li>
							<li>Syncing a Notebook to the Cloud</li>
							<li>Taking Notes with OneNote</li>
							<li>Converting Handwriting to Text</li>
							<li>Recording a Lecture</li>
							<li>Using a OneNote Class Notebook</li>
						</ul>
					</li>
					 <li>Getting Started with Microsoft Office Online and OneDrive
						<ul>
							<li>Identifying the Differences between Office Online and Office 2021/Microsoft 365</li>
							<li>Signing up for a Microsoft Account</li>
							<li>Saving Files to OneDrive</li>
							<li>Creating a OneDrive Folder</li>
							<li>Uploading and Downloading Files into a OneDrive Folder</li>
							<li>Syncing Local Files with OneDrive</li>
							<li>Activity: Creating a Microsoft OneDrive Account with Folders</li>
						 </ul>
					</li>
					 <li>Building an Online Portfolio with Pathbrite
						<ul>
							<li>Telling a Compelling Story with Visuals</li>
							<li>Activity: Building an ePortfolio Using Pathbrite</li>
						</ul>
					</li>
					 <li>Using Resume Assistant Powered by LinkedIn in Microsoft Word
						<ul>
							<li>Reviewing Work Experience Samples</li>
							<li>Viewing the Top Skills in a Career Path</li>
							<li>Discovering Your Next Job</li>
						</ul>
					</li>
					 <li>Getting Started with Microsoft Teams with Planner and SharePoint
						<ul>
							<li>Enhancing the Team Experience</li>
							<li>Collaborating as a Team with Integrated Office 365 Apps and beyond</li>
							<li>Together Mode in Teams</li>
							<li>Accessibility in Microsoft Teams</li>
							<li>Microsoft Planner</li>
							<li>Microsoft SharePoint</li>
							<li>Teams with SharePoint and Planner</li>
							<li>Partner Activity: Exploring Teams</li>
						</ul>
					</li>
				 </ul>
			</li>
			 <li>Technology for Success
			 <ul>
				<li>Introduction to Technology for Success: Computer Concepts
					<ul>
						<li>Key Features</li>
						<li>Digital Learning Experience</li>
					</ul>
				 </li>
				<li>
					Module 1. Impact of Digital Technology
					
					<ul>
						<li>1.1. Explain Society’s Reliance on Technology</li>
						<li>Outline the History of Computers</li>
						<li>Explain the Impact of the Internet of Things and Embedded Computers</li>
						<li>ATMs and Kiosks</li>
						<li>IoT at Home</li>
						<li>IoT in Business</li>
						<li>Discover Uses for Artificial Intelligence</li>
						<li>Explore the Impact of Virtual Reality</li>
						<li>The Digital Divide</li>
						<li>1.2. Develop Personal Uses for Technology</li>
						<li>Explore Personal Uses for Technology</li>
						<li>Use Robotics and Virtual Reality</li>
						<li>Utilize Technology in Daily Life</li>
						<li>Use Technology to Assist Users with Disabilities</li>
						<li>Apply Green Computing Concepts to Daily Life</li>
						<li>Enterprise Computing</li>
						<li>1.3. Explain the Role of Technology in the Professional World</li>
						<li>List the Ways That Professionals Might Use Technology in the Workplace</li>
						<li>Technology in K-12 Education</li>
						<li>Technology in Higher Education</li>
						<li>Technology in Healthcare</li>
						<li>Technology in the Transportation Industry</li>
						<li>Technology in Manufacturing</li>
						<li>Explore Technology Careers</li>
						<li>Explore How You Might Prepare for a Career in Technology</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				
				<li>
					Module 2. The Web
					
					<ul>
						<li>2.1. Explain the Role of the Web in Daily Life</li>
						<li>Define Web Browsing Terms</li>
						<li>Explain the Purpose of a Top-Level Domain</li>
						<li>Describe Internet Standards</li>
						<li>2.2. Describe Websites and Webpages</li>
						<li>Identify the Types of Websites</li>
						<li>Explain the Pros and Cons of Web Apps</li>
						<li>Identify the Major Components of a Webpage</li>
						<li>Identify Secure and Insecure Websites</li>
						<li>2.3. Use E-Commerce</li>
						<li>Explain the Role of E-Commerce in Daily Life</li>
						<li>Use E-Commerce in Business Transactions</li>
						<li>Use E-Commerce in Personal Transactions</li>
						<li>Find E-Commerce Deals</li>
						<li>2.4. Apply Information Literacy Skills to Web Searches</li>
						<li>Define Information Literacy</li>
						<li>Explain How Search Engines Work</li>
						<li>Use Search Tools and Strategies</li>
						<li>Refine Web Searches</li>
						<li>2.5. Conduct Online Research</li>
						<li>Use Specialty Search Engines</li>
						<li>Evaluate Online Information</li>
						<li>Gather Content from Online Sources</li>
						<li>Apply Information Literacy Standards</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				
				<li>
					Module 3. Computer Hardware
					
					<ul>
						<li>3.1. Categorize the Various Types of Computer Hardware</li>
						<li>Define Each Component of Computer Hardware</li>
						<li>Visually Identify Types of Computer Hardware</li>
						<li>Explain How Computers Represent Data</li>
						<li>Explain the Benefits of Internal, External, and Cloud-Based Storage Solutions</li>
						<li>Explain the Pros and Cons of Using Different Types of Computers, Including All-in-Ones, Tablets, Mobile Devices, and Desktop Computers</li>
						<li>Determine Which Hardware Features Are Personally Necessary to Consider When Purchasing a Computer</li>
						<li>3.2. Demonstrate Familiarity with Input and Output Devices</li>
						<li>Experiment with Input Devices</li>
						<li>Experiment with Output Devices</li>
						<li>Explain How to Install Computer Hardware</li>
						<li>3.3. Maintain Hardware Components</li>
						<li>Measure the Performance of Computer Hardware</li>
						<li>Explain How to Troubleshoot Problems with Hardware and Peripherals</li>
						<li>Explain the Necessary Steps to Maintain Computer Hardware</li>
						<li>Explain How to Restore a Device and Its Associated Hardware and Software</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 4. Operating Systems and File Management
					<ul>
						<li>4.1. Compare Operating Systems</li>
						<li>Differentiate between an Operating System and System Software</li>
						<li>Differentiate between Operating Systems</li>
						<li>Identify Desktop Components</li>
						<li>4.2. Explain How an Operating System Works</li>
						<li>The Purpose of an Operating System</li>
						<li>How an Operating System Manages Memory</li>
						<li>Steps in the Boot Process</li>
						<li>How Operating Systems Manage Input and Output</li>
						<li>4.3. Personalize an Operating System to Increase Productivity</li>
						<li>Customize System Software</li>
						<li>Customize Hardware Using System Software</li>
						<li>Manage Desktop Windows</li>
						<li>Use Administrative Tools</li>
						<li>4.4. Manage Files and Folders</li>
						<li>Compress and Uncompress Files</li>
						<li>Save Files to Folders and File Systems</li>
						<li>Determine File Properties</li>
						<li>Manage File Names and File Placement</li>
						<li>Manage Folder Names and Folder Placement</li>
						<li>Organize Files Using File Management Tools</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
						</ul>
				</li>
				<li>Module 5. Software and Apps
					<ul>
						<li>5.1. Explain How to Use Apps as Part of Your Daily Life
						<li>Define Application Software</li>
						<li>Describe the Purpose of Each Key Type of App</li>
						<li>Describe Types of Apps</li>
						<li>Identify Common Features of Apps</li>
						<li>Use Mobile Apps</li>
						<li>5.2. Use Common Features of Productivity and Graphics Apps</li>
						<li>Identify Apps and Productivity Suites Related to Word Processing, Spreadsheet, Presentation, and Database Software</li>
						<li>Use Word Processing Software for Basic Word Processing Functions</li>
						<li>Format Documents Using Word Processing Software</li>
						<li>Use Spreadsheet Software to Manage Basic Workbooks</li>
						<li>Use Presentation Software to Create and Share Presentations</li>
						<li>Use Database Software to Manage Basic Databases</li>
						<li>Use Graphics Software</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
					<li>Module 6. Security and Safety
						<ul>
							<li>6.1. Discuss Computer Safety and Health Risks</li>
							<li>Determine the Risks to Computer Security and Safety</li>
							<li>Understand the Risks to Physical, Behavioral, and Social Health</li>
							<li>Describe Common Cybersecurity Attacks</li>
							<li>6.2. Use Protective Measures to Safeguard Computers and Data</li>
							<li>Explain the Steps to Protect Computer Equipment</li>
							<li>Protect Mobile Devices and Your Privacy</li>
							<li>Use Strong Authentication</li>
							<li>Explain the Benefits of Encryption</li>
							<li>Discuss Measures to Prevent Identity Theft and Protect Financial Information</li>
							<li>Protect Yourself While Online</li>
							<li>Summary</li>
							<li>Review Questions</li>
							<li>Discussion Questions</li>
							<li>Critical Thinking Activities</li>
							<li>Key Terms</li>
						</ul>
					</li>
				<li>Module 7. Digital Media
					<ul>
						<li>7.1. Explain How Digital Media Represents the Real World</li>
						<li>Define Digital Media Concepts</li>
						<li>Describe How Computers Represent Images and Sounds</li>
						<li>Define Digital Graphics</li>
						<li>Identify Digital Media File Formats</li>
						<li>Compare 2-D and 3-D Animation</li>
						<li>7.2. Use Digital Media</li>
						<li>Use Gaming Systems</li>
						<li>Use Animations</li>
						<li>Use Graphics</li>
						<li>Use Computer-Aided Technology</li>
						<li>Stream Digital Media</li>
						<li>7.3. Record and Edit Digital Media</li>
						<li>Create Graphics and Animation</li>
						<li>Record and Play Sounds and Music</li>
						<li>Develop Original Videos</li>
						<li>Edit Digital Media Files</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 8. Program and App Use and Development
					<ul>
						<li>8.1. Use Programs and Apps for Everyday Tasks</li>
						<li>Learn about Legal Uses of Programs and Apps</li>
						<li>Acquire Legitimate Programs and Apps</li>
						<li>Install and Uninstall Programs and Apps</li>
						<li>Update Programs and Apps</li>
						<li>Use Programs and Apps</li>
						<li>Use Free Programs and Apps</li>
						<li>Troubleshoot Programs and Apps</li>
						<li>8.2. Categorize Types of Development and Programming</li>
						<li>The Basics of Development</li>
						<li>Define Object-Oriented Programming</li>
						<li>Differentiate between Types of Programs and Apps</li>
						<li>8.3. Explore Development Methods</li>
						<li>Components of the Development Process</li>
						<li>Discuss the Phases in the Software Development Life Cycle</li>
						<li>Differentiate between Development Methodologies</li>
						<li>8.4. Describe Tools and Strategies in Development</li>
						<li>Differentiate between Programming Languages</li>
						<li>Explain the Differences between Various Types of Programming Tools</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 9. Web Development
					<ul>
						<li>9.1. Explain the Uses of HTML, CSS, and JavaScript When Developing Websites</li>
						<li>Explain How to Use HTML</li>
						<li>Explain How to Use CSS</li>
						<li>Explain How to Use JavaScript</li>
						<li>9.2. Explain Strategies for Creating and Publishing Websites</li>
						<li>Describe When to Use Static and Dynamic Websites</li>
						<li>Describe the Importance of Responsive Design</li>
						<li>Describe Tools for Creating Websites</li>
						<li>Text Editors and IDEs</li>
						<li>Host and Publish a Website</li>
						<li>9.3. Manage Websites Using Analytics and Data Tools</li>
						<li>Use Analytics Tools and Track Website Usage</li>
						<li>Leverage XML to Update and Structure Data</li>
						<li>9.4. Code and Publish a Website</li>
						<li>Describe Steps Involved When Coding and Publishing a Website</li>
						<li>Code a Website</li>
						<li>Case Study: Create a Website for Café Unlimited</li>
						<li>Add Titles, Headings, Paragraphs, and Line Breaks</li>
						<li>Case Study: Add a Title, Headings, Paragraphs, and Line Breaks to the Café Unlimited Home Page</li>
						<li>Add Images</li>
						<li>Case Study: Add a Banner and Images to the Café Unlimited Website</li>
						<li>Add Links</li>
						<li>Describe When to Use Absolute References and Relative References</li>
						<li>Case Study: Add Links to the Café Unlimited Website</li>
						<li>Add Unordered and Ordered Lists</li>
						<li>Case Study: Add Unordered Lists to the Café Unlimited Website</li>
						<li>Add Multimedia Content to a Webpage</li>
						<li>Case Study: Add a Map and a YouTube Video to the Café Unlimited Website</li>
						<li>Check the Validity of Your HTML Code</li>
						<li>Case Study: Validate Your HTML Code for the Café Unlimited Website</li>
						<li>Publish Your Website Online</li>
						<li>Case Study: Publish the Café Unlimited Website Files to a Web Server</li>
						<li>Modify the Appearance of a Webpage Using CSS</li>
						<li>Case Study: Add Styles to the Café Unlimited Website</li>
						<li>Control a Webpage’s Behavior with JavaScript</li>
						<li>Case Study: Add JavaScript to Change the Font Size of the Café Unlimited Home Page</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 10. Networking
					<ul>
						<li>10.1. Explore Key Features of Connected Networks</li>
						<li>Explain How a Network Operates</li>
						<li>Define the Elements of a Connected Network</li>
						<li>Identify the Devices Necessary to Create a Network</li>
						<li>Explain the Physical Connections between Networks and Network Parts</li>
						<li>Explain the Differences between Various Types of Networks</li>
						<li>10.2. Discuss Issues of Network Safety and Neutrality in a Connected World</li>
						<li>Identify the Risks and Benefits Associated with Using a Connected Network</li>
						<li>Explain How Unauthorized Network Use Threatens Communication Technology</li>
						<li>Explain How to Secure a Network</li>
						<li>Secure Data Stored on a Network</li>
						<li>Explain How to Encrypt a Network</li>
						<li>Explain the Pros and Cons of Net Neutrality</li>
						<li>10.3. Connect to Different Types of Networks</li>
						<li>Explain How to Follow Network Standards and Protocols</li>
						<li>Connect Network Devices</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 11. Digital Communication
					<ul>
						<li>11.1. Explain Digital Communication and Its Purpose</li>
						<li>Common Types of Digital Communication</li>
						<li>Define Types of Blogs, Social Networks, and Wikis</li>
						<li>Types of Social Networks</li>
						<li>11.2. Evaluate the Impact of Digital Communication on Everyday Life</li>
						<li>The Significance of Email</li>
						<li>Explain the Importance of Netiquette</li>
						<li>Evaluate Social Media and Social Networking</li>
						<li>Evaluate Social Networking</li>
						<li>11.3. Use and Create Multiple Types of Digital Communication</li>
						<li>Use Digital Communication Following Netiquette Guidelines</li>
						<li>Use Sharing Economy Networks</li>
						<li>Create Digital Communications That Follow Netiquette</li>
						<li>Attend Video Conferences or Webinars</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 12. Digital Transformation: Cloud, E-commerce, and AI
					<ul>
						<li>12.1. Explain the Basic Concepts of Cloud Computing</li>
						<li>Identify Defining Characteristics of Cloud Computing</li>
						<li>Compare the Most Common Cloud Computing Models</li>
						<li>List Major Cloud Providers and Services</li>
						<li>Explain How Cloud Services Are Used in the Workplace</li>
						<li>12.2. Describe Ways Companies Do Business on the Internet</li>
						<li>Describe the Roles of Physical and Virtual Stores in Omnichannel Marketing</li>
						<li>Compare Types of E-Commerce Platforms</li>
						<li>Describe High-Growth Jobs in the E-Commerce Industry</li>
						<li>Build Trust through a Good E-Commerce Website</li>
						<li>12.3. Explain the Basic Concepts of Artificial Intelligence (AI)</li>
						<li>Identify Ways People Use AI in Daily Life</li>
						<li>Compare Common AI Learning Models</li>
						<li>12.4. Use AI Technologies</li>
						<li>Describe How AI Supports Smart Devices and the Internet of Things</li>
						<li>Identify Ways People Use AI in the Workplace</li>
						<li>12.5. Analyze Ways to Communicate More Proficiently with AI Systems</li>
						<li>Phrase Effective AI Commands</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 13. Databases
					<ul>
						<li>13.1. Discuss the Importance of Databases</li>
						<li>Compare Spreadsheets and Databases</li>
						<li>Define Relational Databases</li>
						<li>13.2. Use a Database Management System</li>
						<li>Identify Popular Database Management Systems</li>
						<li>Compare Front-End and Back-End Database Components</li>
						<li>Organize Data in a Database</li>
						<li>Interact with Data</li>
						<li>Use Structured Query Language (SQL)</li>
						<li>Secure a Database</li>
						<li>Back up and Recover a Database</li>
						<li>13.3. Discuss How Data Informs Business Decisions</li>
						<li>Explain the Significance of Big Data</li>
						<li>Define Nonrelational Databases</li>
						<li>Explore the Impact of Business Intelligence</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
				<li>Module 14. Digital Ethics and Lifestyle
					<ul>
						<li>14.1. Describe Legal and Ethical Responsibilities of a Digital Citizen</li>
						<li>How Digital Technology Has Revolutionized Society</li>
						<li>Characteristics of Digital Citizenship</li>
						<li>Describe Legal, Ethical, and Moral Issues Related to Technology</li>
						<li>Describe Digital Inclusion and the Importance of Digital Access</li>
						<li>Describe How to Create Online Content without Infringing on Copyright Protections</li>
						<li>14.2. How to Be a Responsible Digital Citizen</li>
						<li>Recognize How to Cultivate a Polite Online Presence</li>
						<li>Describe What Makes an Online Source Reliable</li>
						<li>Describe How to Develop Accessible Online Content</li>
						<li>Identify Best Practices for Avoiding Risks Related to Digital Technology</li>
						<li>Explain How to Create a Digital Wellness Plan</li>
						<li>Identify Best Practices for Responsible Tech Disposal</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Discussion Questions</li>
						<li>Critical Thinking Activities</li>
						<li>Key Terms</li>
					</ul>
				 </li>
			</ul>
			<li>Windows
				<ul>
					<li>Windows 11 Module 1. Introduction to Windows 11
						<ul>
							<li>WIN 1-1. What Is Windows 11?</li>
							<li>WIN 1-2. Multiple Editions of Windows 11</li>
							<li>WIN 1-3. Navigating Using Touch or a Mouse
								<ul>
									<li>WIN 1-3a. Using a Touch Screen</li>
									<li>WIN 1-3b. Using an On-Screen Keyboard</li>
									<li>WIN 1-3c. Using a Mouse</li>
									<li>WIN 1-3d. Scrolling</li>
									<li>WIN 1-3e. Using Keyboard Shortcuts</li>
								</ul>
							</li>
							<li>WIN 1-4. Starting Windows 11
								<ul>
									<li>WIN 1-4a. To Sign In to an Account</li>
									<li>WIN 1-4b. The Windows 11 Desktop</li>
								</ul>
							</li>
							<li>WIN 1-5. Working with Apps
								<ul>
									<li>WIN 1-5a. To Start an App Using the Start Menu</li>
									<li>WIN 1-5b. To Navigate within an App</li>
									<li>WIN 1-5c. To Open and Maximize the File Explorer Window</li>
									<li>WIN 1-5d. To Switch between Apps</li>
									<li>WIN 1-5e. To Exit an App</li>
									<li>WIN 1-5f. To Display the Windows Desktop</li>
									<li>WIN 1-5g. Start Menu Folders</li>
									<li>WIN 1-5h. To Display a Folder on the Start Menu</li>
									<li>WIN 1-5i. To Pin an App to the Start Menu</li>
									<li>WIN 1-5j. Widgets</li>
									<li>WIN 1-5k. To Add a Widget to the Widgets Board</li>
									<li>WIN 1-5l. To Move a Widget on the Widgets Board</li>
									<li>WIN 1-5m. To Resize a Widget on the Widgets Board</li>
									<li>WIN 1-5n. To Remove a Pinned App from the Start Menu</li>
									<li>WIN 1-5o. To Pin an App to the Taskbar</li>
									<li>WIN 1-5p. To Remove a Pinned App from the Taskbar</li>
									<li>WIN 1-5q. To Start an App Using the Search Box</li>
									<li>WIN 1-5r. Free and Paid Apps</li>
									<li>WIN 1-5s. To Install an App Using the Microsoft Store App</li>
									<li>WIN 1-5t. To Uninstall an App</li>
								</ul>
							</li>
							<li>WIN 1-6. Search Button and Cortana
								<ul>
									<li>To Enable Cortana</li>
									<li>WIN 1-6a. To Search the Web Using the Search Button</li>
									<li>WIN 1-6b. To Ask a Question Using the Search Box</li>
									<li>WIN 1-6c. To Use Cortana to Create a To Do List</li>
									<li>WIN 1-6d. To Set a Reminder Using Cortana</li>
								</ul>
							</li>
							<li>WIN 1-7. Getting Help
								<ul>
									<li>WIN 1-7a. To Get Help Using the Search Box</li>
								</ul>
							</li>
							<li>WIN 1-8. Shutting Down Windows
								<ul>
									<li>WIN 1-8a. To Sign Out of an Account</li>
									<li>WIN 1-8b. To Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 1-9a. Summary</li>
							<li>WIN 1-9b. Student Assignments: Apply Your Knowledge</li>
							<li>WIN 1-9c. Extend Your Knowledge</li>
							<li>WIN 1-9d. Expand Your World</li>
							<li>WIN 1-9e. In the Labs</li>
						</ul>
					</li>
					<li>Windows 11 Module 2. Working with the Windows 11 Desktop
						<ul>
							<li>WIN 2-1. Creating a Document in WordPad</li>
							<li>WIN 2-1a. To Start an App and Create a Document</li>
							<li>WIN 2-2. Saving Documents
								<ul>
									<li>WIN 2-2a. To Save a Document in the Documents Folder</li>
									<li>WIN 2-2b. To Display the Print Dialog Box from an App</li>
									<li>WIN 2-2c. To Print a Document</li>
									<li>WIN 2-2d. To Edit a Document</li>
									<li>WIN 2-2e. To Save and Close a Document</li>
									<li>WIN 2-3. Creating a Document in the Documents Folder</li>
									<li>WIN 2-3a. To Open the Documents Folder</li>
									<li>WIN 2-3b. To Create a Blank Document in the Documents Folder</li>
									<li>WIN 2-3c. To Name a Document in the Documents Folder</li>
									<li>WIN 2-3d. To Open a Document with WordPad</li>
									<li>WIN 2-3e. To Add Text to a Blank Document</li>
									<li>WIN 2-3f. To Save a Text Document in Rich Text Format (.rtf)</li>
									<li>WIN 2-3g. To Close the Document</li>
								</ul>
							</li>
							<li>WIN 2-4. Working with the Documents Folder
								<ul>
									<li>WIN 2-4a. To Change the View to Small Icons</li>
									<li>WIN 2-4b. To Arrange Items in Groups by File Type</li>
									<li>WIN 2-4c. To Change to Medium Icons View</li>
									<li>WIN 2-4d. To Create and Name a Folder in the Documents Folder</li>
									<li>WIN 2-4e. To Move a Document into a Folder</li>
									<li>WIN 2-4f. To Change Location Using the Address Bar</li>
									<li>WIN 2-4g. To Display and Use the Preview Pane</li>
									<li>WIN 2-4h. To Close the Preview Pane</li>
									<li>WIN 2-4i. To Change Location Using the Back Button on the Address Bar</li>
								</ul>
							</li>
							<li>WIN 2-5. Creating Folder Shortcuts
								<ul>
									<li>WIN 2-5a. To Pin a Folder to the Start Menu</li>
									<li>WIN 2-5b. To Open a Folder Using a Pinned Icon on the Start Menu</li>
									<li>WIN 2-5c. To Remove a Pinned Folder Icon from the Start Menu</li>
									<li>WIN 2-5d. To Create a Shortcut on the Desktop</li>
								</ul>
							</li>
							<li>WIN 2-6. Opening and Modifying Documents within a Folder
								<ul>
									<li>WIN 2-6a. To Open a Folder Using a Shortcut on the Desktop</li>
									<li>WIN 2-6b. To Open and Modify a Document in a Folder</li>
									<li>WIN 2-6c. To Open and Modify Multiple Documents</li>
									<li>WIN 2-6d. To Display an Inactive Window</li>
									<li>WIN 2-6e. To Close Multiple Open Windows and Save Changes Using the Taskbar</li>
								</ul>
							</li>
							<li>WIN 2-7. The Recycle Bin
								<ul>
									<li>WIN 2-7a. To Move a Text File to the Recycle Bin</li>
									<li>WIN 2-7b. To Delete a Shortcut from the Desktop</li>
									<li>WIN 2-7c. To Restore an Item from the Recycle Bin</li>
									<li>WIN 2-7d. To Delete a Shortcut from the Desktop</li>
									<li>WIN 2-7e. To Delete Multiple Files from a Folder</li>
									<li>WIN 2-7f. To Delete a Folder from the Documents Folder and Empty the Recycle Bin</li>
									<li>WIN 2-7g. To Sign Out of an Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 2-8a. Summary</li>
							<li>WIN 2-8b. Student Assignments: Apply Your Knowledge</li>
							<li>WIN 2-8c. Extend Your Knowledge</li>
							<li>WIN 2-8d. Expand Your World</li>
							<li>WIN 2-8e. In the Labs</li>
						</ul>
					</li>
					<li>Windows 11 Module 3. File and Folder Management
						<ul>
							<li>WIN 3-1. This PC Window
								<ul>
									<li>WIN 3-1a. To Open and Maximize the This PC Window</li>
									<li>WIN 3-1b. To Display Properties for the Hard Drive in the Details Pane</li>
									<li>WIN 3-1c. To Display the Properties Dialog Box for the Hard Drive</li>
									<li>WIN 3-1d. To Switch Folders Using the Address Bar</li>
									<li>WIN 3-1e. To View the Contents of a Drive</li>
									<li>WIN 3-1f. To Preview the Properties of a Folder</li>
									<li>WIN 3-1g. To Display Properties for the Windows Folder in the Details Pane</li>
									<li>WIN 3-1h. To Use the Shortcut Menu to Display the Properties for the Windows Folder</li>
									<li>WIN 3-1i. To View the Contents of a Folder</li>
									<li>WIN 3-1j. Searching for Files and Folders</li>
									<li>WIN 3-1k. To Search for a File and Folder in a Folder Window</li>
									<li>WIN 3-1l. To Refine the Search Results</li>
									<li>WIN 3-1m. To Clear the Search Box</li>
									<li>WIN 3-1n. To Open Windows</li>
									<li>WIN 3-1o. To Use Shake to Minimize All Background Windows</li>
									<li>WIN 3-1p. To Apply a Snap Layout</li>
									<li>WIN 3-1q. To Display a Snap Group</li>
									<li>WIN 3-1r. To Stack Open Windows</li>
									<li>WIN 3-1s. To Change a Snap Layout</li>
									<li>WIN 3-1t. To Show Windows Side by Side</li>
									<li>WIN 3-1u. To Resize Snapped Windows</li>
									<li>WIN 3-1v. To Use Snap to Maximize Windows</li>
									<li>WIN 3-1w. To Use the Show Desktop Button to Minimize All Windows</li>
									<li>WIN 3-1x. To Restore a Window</li>
								</ul>
							</li>
							<li>WIN 3-2. The Pictures Folder
								<ul>
									<li>WIN 3-2a. To Search for Pictures</li>
									<li>WIN 3-2b. Item Check Boxes</li>
									<li>WIN 3-2c. To Copy Files to the Pictures Folder</li>
									<li>WIN 3-2d. To Close the Search Results Window</li>
									<li>WIN 3-2e. To Create a Folder in the Pictures Folder</li>
									<li>WIN 3-2f. To Move Multiple Files into a Folder</li>
									<li>WIN 3-2g. To Optimize the Folder for Pictures</li>
									<li>WIN 3-2h. To View and Change the Properties of a Picture</li>
									<li>WIN 3-2i. To View a Picture in the Photos App</li>
									<li>WIN 3-2j. To View Your Pictures as a Slide Show</li>
									<li>WIN 3-2k. To End a Slide Show</li>
								</ul>
							</li>
							<li>WIN 3-3. Compressing Files and Folders
								<ul>
									<li>WIN 3-3a. To Compress (Zip) a Folder</li>
									<li>WIN 3-3b. To View the Contents of a Compressed Folder</li>
								</ul>
							</li>
							<li>WIN 3-4. Backing Up Files and Folders
								<ul>
									<li>WIN 3-4a. To Copy a File to OneDrive</li>
									<li>WIN 3-4b. To Rename a Folder</li>
									<li>WIN 3-4c. To Restore a Folder from a Backup</li>
									<li>WIN 3-4d. To Delete Folders from the Pictures Folder and from OneDrive</li>
									<li>WIN 3-4e. To Sign Out of Your Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 3-5a. Summary</li>
							<li>WIN 3-5b. Student Assignments: Apply Your Knowledge</li>
							<li>WIN 3-5c. Extend Your Knowledge</li>
							<li>WIN 3-5d. Expand Your World</li>
							<li>WIN 3-5e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 1. Introduction to Windows 10
						<ul>
							<li>WIN 1-1. What Is Windows 10?</li>
							<li>WIN 1-2. Multiple Editions of Windows 10</li>
							<li>WIN 1-3. Navigating Using Touch or a Mouse</li>
							<li>WIN 1-3a. Using a Touch Screen</li>
							<li>WIN 1-3b. Using an On-Screen Keyboard</li>
							<li>WIN 1-3c. Using a Mouse</li>
							<li>WIN 1-3d. Scrolling</li>
							<li>WIN 1-3e. Using Keyboard Shortcuts</li>
							<li>WIN 1-4. Starting Windows 10</li>
							<li>WIN 1-4a. To Sign In to an Account</li>
							<li>WIN 1-4b. The Windows 10 Desktop</li>
							<li>WIN 1-5. Working with Apps
								<ul>
									<li>WIN 1-5a. To Start an App Using the Start Menu</li>
									<li>WIN 1-5b. To Navigate within an App</li>
									<li>WIN 1-5c. To Open and Maximize the File Explorer Window</li>
									<li>WIN 1-5d. To Switch between Apps</li>
									<li>WIN 1-5e. To Exit an App</li>
									<li>WIN 1-5f. To Display the Windows Desktop</li>
									<li>WIN 1-5g. Start Menu Folders</li>
									<li>WIN 1-5h. To Display a Folder on the Start Menu</li>
									<li>WIN 1-5i. To Pin an App to the Start Menu</li>
									<li>WIN 1-5j. Live Tiles</li>
									<li>WIN 1-5k. To Turn Off a Live Tile</li>
									<li>WIN 1-5l. To Move a Tile on the Start Menu</li>
									<li>WIN 1-5m. To Resize a Tile on the Start Menu</li>
									<li>WIN 1-5n. To Remove a Pinned App from the Start Menu</li>
									<li>WIN 1-5o. To Pin an App to the Taskbar</li>
									<li>WIN 1-5p. To Remove a Pinned App from the Taskbar</li>
									<li>WIN 1-5q. To Start an App Using the Search Box</li>
									<li>WIN 1-5r. Free and Paid Apps</li>
									<li>WIN 1-5s. To Install an App Using the Microsoft Store App</li>
									<li>WIN 1-5t. To Uninstall an App</li>
								</ul>
							</li>
							<li>WIN 1-6. Search Box and Cortana</li>
							<li>To Enable Cortana</li>
							<li>WIN 1-6a. To Search the Web Using the Search Box</li>
							<li>WIN 1-6b. To Ask a Question Using the Search Box</li>
							<li>WIN 1-6c. To View the Notebook and Create a To Do List</li>
							<li>WIN 1-6d. To Set a Reminder Using the Search Box</li>
							<li>WIN 1-7. Getting Help</li>
							<li>WIN 1-7a. To Get Help Using the Search Box</li>
							<li>WIN 1-8. Shutting Down Windows</li>
							<li>WIN 1-8a. To Sign Out of an Account</li>
							<li>WIN 1-8b. To Shut Down the Computer</li>
							<li>WIN 1-9a. Summary</li>
							<li>WIN 1-9b. Apply Your Knowledge</li>
							<li>WIN 1-9c. Extend Your Knowledge</li>
							<li>WIN 1-9d. Expand Your World</li>
							<li>WIN 1-9e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 2. Working with the Windows 10 Desktop
						<ul>
							<li>WIN 2-1. Creating a Document in WordPad
								<ul>
									<li>WIN 2-1a. To Start an App and Create a Document</li>
								</ul>
							</li>
							<li>WIN 2-2. Saving Documents
								<ul>
									<li>WIN 2-2a. To Save a Document in the Documents Folder</li>
									<li>WIN 2-2b. To Open the Print Dialog Box from an App</li>
									<li>WIN 2-2c. To Print a Document</li>
									<li>WIN 2-2d. To Edit a Document</li>
									<li>WIN 2-2e. To Save and Close a Document</li>
								</ul>
							</li>
							<li>WIN 2-3. Creating a Document in the Documents Folder
								<ul>
									<li>WIN 2-3a. To Open the Documents Folder</li>
									<li>WIN 2-3b. To Create a Blank Document in the Documents Folder</li>
									<li>WIN 2-3c. To Name a Document in the Documents Folder</li>
									<li>WIN 2-3d. To Open a Document with WordPad</li>
									<li>WIN 2-3e. To Add Text to a Blank Document</li>
									<li>WIN 2-3f. To Save a Text Document in Rich Text Format (.rtf)</li>
									<li>WIN 2-3g. To Close the Document</li>
								</ul>
							</li>
							<li>WIN 2-4. Working with the Documents Folder
								<ul>
									<li>WIN 2-4a. To Change the View to Small Icons</li>
									<li>WIN 2-4b. To Arrange Items in Groups by File Type</li>
									<li>WIN 2-4c. To Change to Medium Icons View</li>
									<li>WIN 2-4d. To Create and Name a Folder in the Documents Folder</li>
									<li>WIN 2-4e. To Move a Document into a Folder</li>
									<li>WIN 2-4f. To Change Location Using the Address Bar</li>
									<li>WIN 2-4g. To Display and Use the Preview Pane</li>
									<li>WIN 2-4h. To Close the Preview Pane</li>
									<li>WIN 2-4i. To Change Location Using the Back Button on the Address Bar</li>
								</ul>
							</li>
							<li>WIN 2-5. Creating Folder Shortcuts
								<ul>
									<li>WIN 2-5a. To Pin a Folder to the Start Menu</li>
									<li>WIN 2-5b. To Open a Folder Using a Pinned Icon on the Start Menu</li>
									<li>WIN 2-5c. To Remove a Pinned Folder Icon from the Start Menu</li>
									<li>WIN 2-5d. To Create a Shortcut on the Desktop</li>
								</ul>
							</li>
							<li>WIN 2-6. Opening and Modifying Documents within a Folder
								<ul>
									<li>WIN 2-6a. To Open a Folder Using a Shortcut on the Desktop</li>
									<li>WIN 2-6b. To Open and Modify a Document in a Folder</li>
									<li>WIN 2-6c. To Open and Modify Multiple Documents</li>
									<li>WIN 2-6d. To Display an Inactive Window</li>
									<li>WIN 2-6e. To Close Multiple Open Windows and Save Changes Using the Taskbar</li>
								</ul>
							</li>
							<li>WIN 2-7. The Recycle Bin
								<ul>
									<li>WIN 2-7a. To Move a Text File to the Recycle Bin</li>
									<li>WIN 2-7b. To Delete a Shortcut from the Desktop</li>
									<li>WIN 2-7c. To Restore an Item from the Recycle Bin</li>
									<li>WIN 2-7d. To Delete a Shortcut from the Desktop</li>
									<li>WIN 2-7e. To Delete Multiple Files from a Folder</li>
									<li>WIN 2-7f. To Delete a Folder from the Documents Folder and Empty the Recycle Bin</li>
									<li>WIN 2-7g. To Sign Out of an Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 2-8a. Summary</li>
							<li>WIN 2-8b. Apply Your Knowledge</li>
							<li>WIN 2-8c. Extend Your Knowledge</li>
							<li>WIN 2-8d. Expand Your World</li>
							<li>WIN 2-8e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 3. File and Folder Management
						<ul>
							<li>WIN 3-1. This PC Window
								<ul>
									<li>WIN 3-1a. To Open and Maximize the This PC Window</li>
									<li>WIN 3-1b. To Display Properties for the Hard Drive in the Details Pane</li>
									<li>WIN 3-1c. To Display the Local Disk (C:) Properties Dialog Box</li>
									<li>WIN 3-1d. To Switch Folders Using the Address Bar</li>
									<li>WIN 3-1e. To View the Contents of a Drive</li>
									<li>WIN 3-1f. To Preview the Properties of a Folder</li>
									<li>WIN 3-1g. To Display Properties for the Windows Folder in the Details Pane</li>
									<li>WIN 3-1h. To Use the Shortcut Menu to Display the Properties for the Windows Folder</li>
									<li>WIN 3-1i. To View the Contents of a Folder</li>
									<li>WIN 3-1j. Searching for Files and Folders</li>
									<li>WIN 3-1k. To Search for a File and Folder in a Folder Window</li>
									<li>WIN 3-1l. To Refine the Search Results</li>
									<li>WIN 3-1m. To Clear the Search Box</li>
									<li>WIN 3-1n. To Open Windows</li>
									<li>WIN 3-1o. To Use Shake to Minimize All Background Windows</li>
									<li>WIN 3-1p. To Cascade Open Windows</li>
									<li>WIN 3-1q. To Undo Cascading</li>
									<li>WIN 3-1r. To Stack Open Windows</li>
									<li>WIN 3-1s. To Undo Show Windows Stacked</li>
									<li>WIN 3-1t. To Show Windows Side by Side</li>
									<li>WIN 3-1u. To Undo Show Windows Side by Side</li>
									<li>WIN 3-1v. To Use Snap to Maximize Windows</li>
									<li>WIN 3-1w. To Use the Show Desktop Button to Minimize All Windows</li>
									<li>WIN 3-1x. To Restore a Window</li>
								</ul>
							</li>
							<li>WIN 3-2. The Pictures Folder
								<ul>
									<li>WIN 3-2a. To Search for Pictures</li>
									<li>WIN 3-2b. Item Check Boxes</li>
									<li>WIN 3-2c. To Copy Files to the Pictures Folder</li>
									<li>WIN 3-2d. To Close the Search Results Window</li>
									<li>WIN 3-2e. To Create a Folder in the Pictures Folder</li>
									<li>WIN 3-2f. To Move Multiple Files into a Folder</li>
									<li>WIN 3-2g. To Refresh the Image on a Folder</li>
									<li>WIN 3-2h. To View and Change the Properties of a Picture</li>
									<li>WIN 3-2i. To View a Picture in the Photos App</li>
									<li>WIN 3-2j. To View Your Pictures as a Slide Show</li>
									<li>WIN 3-2k. To End a Slide Show</li>
								</ul>
							</li>
							<li>WIN 3-3. Compressing Files and Folders
								<ul>
									<li>WIN 3-3a. To Compress (Zip) a Folder</li>
									<li>WIN 3-3b. To View the Contents of a Compressed Folder</li>
								</ul>
							</li>
							<li>WIN 3-4. Backing up Files and Folders
								<ul>
									<li>WIN 3-4a. To Copy a File to OneDrive</li>
									<li>WIN 3-4b. To Rename a Folder</li>
									<li>WIN 3-4c. To Restore a Folder from a Backup</li>
									<li>WIN 3-4d. To Delete Folders from the Pictures Folder and from OneDrive</li>
									<li>WIN 3-4e. To Sign Out of Your Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 3-5a. Summary</li>
							<li>WIN 3-5b. Apply Your Knowledge</li>
							<li>WIN 3-5c. Extend Your Knowledge</li>
							<li>WIN 3-5d. Expand Your World</li>
							<li>WIN 3-5e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 4. Personalizing Your Work Environment
						<ul>
							<li>WIN 4-1. User Accounts</li>
							<li>WIN 4-2. Local Accounts</li>
							<li>WIN 4-3. Microsoft Accounts
								<ul>
									<li>WIN 4-3a. To Create a Microsoft Account</li>
								</ul>
							</li>
							<li>WIN 4-4. Setting up User Accounts
								<ul>
									<li>WIN 4-4a. To Add a Local Account</li>
									<li>WIN 4-4b. To Add a Microsoft Account</li>
								</ul>
							</li>
							<li>WIN 4-5. Picture Passwords
								<ul>
									<li>WIN 4-5a. To Copy a Picture</li>
									<li>WIN 4-5b. To Create a Picture Password</li>
								</ul>
							</li>
							<li>WIN 4-6. Personalization
								<ul>
									<li>WIN 4-6a. To Change the Desktop Background</li>
									<li>WIN 4-6b. To Change the Accent Color</li>
									<li>WIN 4-6c. To Change the Appearance of the Lock Screen</li>
									<li>WIN 4-6d. To Change Theme Settings</li>
									<li>WIN 4-6e. To Display the Personalization Settings for the Start Menu</li>
									<li>WIN 4-6f. To Display the Control Panel</li>
									<li>WIN 4-6g. View Screen Resolution Settings</li>
									<li>WIN 4-6h. To Change the Screen Saver</li>
									<li>WIN 4-6i. To Display Task View and Add a Desktop</li>
								</ul>
							</li>
							<li>WIN 4-7. Customizing the Taskbar
								<ul>
									<li>WIN 4-7a. To Unlock the Taskbar</li>
									<li>WIN 4-7b. To Move the Taskbar</li>
									<li>WIN 4-7c. To Enable Auto-Hide</li>
									<li>WIN 4-7d. To Change Taskbar Buttons</li>
									<li>WIN 4-7e. To Resize the Taskbar</li>
									<li>WIN 4-7f. To Return the Taskbar to Its Original Size and Lock the Taskbar</li>
								</ul>
							</li>
							<li>WIN 4-8. Action Center
								<ul>
									<li>WIN 4-8a. To Open the Action Center</li>
								</ul>
							</li>
							<li>WIN 4-9. Changing Folder Options
								<ul>
									<li>WIN 4-9a. To Display the Folder Options Dialog Box</li>
									<li>WIN 4-9b. To Select the ‘Open Each Folder in Its Own Window’ Option</li>
									<li>WIN 4-9c. To Open a Folder in Its Own Window</li>
									<li>WIN 4-9d. To Restore the Folder Options to the Default Folder Options</li>
									<li>WIN 4-9e. To Restore the Desktop Background</li>
									<li>WIN 4-9f. To Sign Out of an Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 4-10a. Summary</li>
							<li>WIN 4-10b. Apply Your Knowledge</li>
							<li>WIN 4-10c. Extend Your Knowledge</li>
							<li>WIN 4-10d. Expand Your World</li>
							<li>WIN 4-10e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 5. Advanced Personalization and Customization
						<ul>
							<li>WIN 5-1. System and Security Settings
								<ul>
									<li>WIN 5-1a. To Open the Control Panel Window</li>
									<li>WIN 5-1b. To Switch Control Panel Views</li>
									<li>WIN 5-1c. To Open the System and Security Window</li>
									<li>WIN 5-1d. To View Security and Maintenance Settings</li>
									<li>WIN 5-1e. To View Windows Defender Firewall Settings</li>
									<li>WIN 5-1f. To Turn off Windows Defender Firewall</li>
									<li>WIN 5-1g. To Turn on Windows Defender Firewall</li>
									<li>WIN 5-1h. To View Allowed Apps and Features through Windows Defender Firewall</li>
									<li>WIN 5-1i. To View System Information</li>
									<li>WIN 5-1j. To Open Device Manager</li>
									<li>WIN 5-1k. To View the Properties of a Device</li>
									<li>WIN 5-1l. To Defragment and Optimize Your Hard Drive</li>
								</ul>
							</li>
							<li>WIN 5-2. The Hardware and Sound Window
								<ul>
									<li>WIN 5-2a. To View Devices and Printers</li>
									<li>WIN 5-2b. To Adjust AutoPlay Settings</li>
									<li>WIN 5-2c. To Revert an AutoPlay Setting</li>
									<li>WIN 5-2d. To View Sound Settings</li>
									<li>WIN 5-2e. To View Power Plan Information</li>
								</ul>
							</li>
							<li>WIN 5-3. Programs and Apps</li>
							<li>To Uninstall a Program or App
								<ul>
									<li>WIN 5-3a. To View Programs Associated with File Types</li>
								</ul>
							</li>
							<li>WIN 5-4. Time and Language Settings
								<ul>
									<li>WIN 5-4a. To Change the Date and Time</li>
									<li>WIN 5-4b. To Add a Second Clock</li>
									<li>WIN 5-4c. To View the Date Formats</li>
								</ul>
							</li>
							<li>WIN 5-5. Ease of Access Settings
								<ul>
									<li>WIN 5-5a. To Display the Ease of Access Center</li>
									<li>WIN 5-5b. To Enable and Configure Narrator</li>
									<li>WIN 5-5c. To Enable and Configure Magnifier</li>
									<li>WIN 5-5d. To Select and Apply a High Contrast Theme</li>
									<li>WIN 5-5e. To View Text or Visual Alternatives for Sound</li>
									<li>WIN 5-5f. To Display Mouse Accessibility Settings</li>
									<li>WIN 5-5g. To Display Keyboard Accessibility Settings</li>
								</ul>
							</li>
							<li>WIN 5-6. Privacy Settings
								<ul>
									<li>WIN 5-6a. To Display Privacy Settings</li>
								</ul>
							</li>
							<li>WIN 5-7. Update and Security Settings
								<ul>
									<li>WIN 5-7a. To Display Windows Update Settings and Check for Updates</li>
									<li>WIN 5-7b. To Display Windows Security Settings</li>
									<li>WIN 5-7c. To Display Other Update and Security Settings</li>
									<li>WIN 5-7d. To Sign Out of Your Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 5-8a. Summary</li>
							<li>WIN 5-8b. Apply Your Knowledge</li>
							<li>WIN 5-8c. Extend Your Knowledge</li>
							<li>WIN 5-8d. Expand Your World</li>
							<li>WIN 5-8e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 6. Advanced Searching Techniques
						<ul>
							<li>WIN 6-1. Advanced File Searching</li>
							<li>WIN 6-1a. To Search Using Boolean Operators</li>
							<li>WIN 6-1b. To Search for an Exact Phrase</li>
							<li>WIN 6-1c. To Structure a Complex Search Combining a File Property and a Range</li>
							<li>WIN 6-1d. To Filter Files Using File List Headings</li>
							<li>WIN 6-2. Understanding Indexing</li>
							<li>WIN 6-2a. To Create a Folder and Files for Indexing</li>
							<li>WIN 6-2b. To Add a Folder to the Index</li>
							<li>WIN 6-2c. To Search for a File Using a Word or Phrase in the File</li>
							<li>WIN 6-3. Using File Properties to Refine a Search</li>
							<li>WIN 6-3a. To Add a Tag to a File</li>
							<li>WIN 6-3b. To Search Using the Comments Property</li>
							<li>WIN 6-3c. To Search Using the Date Property</li>
							<li>WIN 6-3d. To Search for a File by Kind</li>
							<li>WIN 6-3e. To Search Additional Nonindexed Locations</li>
							<li>WIN 6-3f. To Reset the Nonindexed Location Search Settings</li>
							<li>WIN 6-4. Working with Saved Searches</li>
							<li>WIN 6-4a. To Perform a Recent Search</li>
							<li>WIN 6-4b. To Save a Search</li>
							<li>WIN 6-4c. To Open the Searches Folder</li>
							<li>WIN 6-4d. To Create a Search from a Saved Search</li>
							<li>WIN 6-4e. To Delete a Saved Search</li>
							<li>WIN 6-5. Searching from the Search Box
								<ul>
									<li>WIN 6-5a. To Search Using the Search Box</li>
									<li>WIN 6-5b. To Configure Bing SafeSearch Settings</li>
									<li>WIN 6-5c. To Search the Web Using the Search Box</li>
									<li>WIN 6-5d. To Use the Search Box to Search for Other Information</li>
									<li>WIN 6-5e. To Show the Cortana Icon on the Taskbar</li>
									<li>WIN 6-5f. To Show the Search Box on the Taskbar</li>
									<li>WIN 6-5g. To Restore SafeSearch Settings</li>
									<li>WIN 6-5h. To Remove a Folder from the Index</li>
									<li>WIN 6-5i. To Delete SCFiles Folder</li>
									<li>WIN 6-5j. To Sign Out of Your Account and Shut Down the Computer</li>
								</ul>
							</li>
							<li>WIN 6-6a. Summary</li>
							<li>WIN 6-6b. Apply Your Knowledge</li>
							<li>WIN 6-6c. Extend Your Knowledge</li>
							<li>WIN 6-6d. Expand Your World</li>
							<li>WIN 6-6e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 7. Microsoft Edge
						<ul>
							<li>WIN 7-1. What Is Microsoft Edge?</li>
							<li>WIN 7-2. Starting Microsoft Edge</li>
							<li>WIN 7-2a. To Start Microsoft Edge</li>
							<li>WIN 7-2b. To Personalize the Homepage</li>
							<li>WIN 7-3. Browsing the Web
								<ul>
									<li>WIN 7-3a. To Switch between Tabs</li>
									<li>WIN 7-3b. To Change New Tab Settings</li>
									<li>WIN 7-3c. To Add a Tab in the Browser Window</li>
									<li>WIN 7-3d. To Display a Webpage by Address</li>
									<li>WIN 7-3e. To Open a Link in a New Tab</li>
									<li>WIN 7-3f. To Close a Tab</li>
									<li>WIN 7-3g. Using an InPrivate Window</li>
									<li>WIN 7-3h. To Open an InPrivate Window</li>
								</ul>
							</li>
							<li>WIN 7-4. Searching the Web
								<ul>
									<li>WIN 7-4a. To Search Using the Search Box</li>
									<li>WIN 7-4b. To Change Search Providers</li>
									<li>WIN 7-4c. To Find Information on a Webpage</li>
									<li>WIN 7-4d. Using Cortana to Search the Web</li>
									<li>WIN 7-4e. To Search the Web Using Cortana</li>
									<li>WIN 7-4f. To Get Instant Answers from Cortana in Edge</li>
									<li>WIN 7-4g. To Ask Cortana about Webpage Content</li>
									<li>WIN 7-4h. To Obtain Additional Information from Google</li>
								</ul>
							</li>
							<li>WIN 7-5. Reading Now or Later
								<ul>
									<li>WIN 7-5a. Using Reading View</li>
									<li>WIN 7-5b. To Switch to Reading View</li>
									<li>WIN 7-5c. To Customize Reading View</li>
									<li>WIN 7-5d. To Exit Reading View</li>
									<li>WIN 7-5e. Saving an Article to the Reading List</li>
									<li>WIN 7-5f. To Add an Article to the Reading List</li>
									<li>WIN 7-5g. Saving a Website to Favorites</li>
									<li>WIN 7-5h. To Add a Website to Favorites</li>
									<li>WIN 7-5i. To Open an Article from the Reading List</li>
									<li>WIN 7-5j. To Display a Website from Favorites</li>
									<li>WIN 7-5k. To Display the Favorites Bar</li>
								</ul>
							</li>
							<li>WIN 7-6. Creating and Saving Web Notes
								<ul>
									<li>WIN 7-6a. Using Web Notes</li>
									<li>WIN 7-6b. To Make a Web Note</li>
									<li>WIN 7-6c. To Erase Annotations</li>
									<li>WIN 7-6d. To Add a Note to a Webpage</li>
									<li>WIN 7-6e. To Collapse Notes</li>
									<li>WIN 7-6f. To Delete Notes</li>
									<li>WIN 7-6g. Saving Web Notes</li>
									<li>WIN 7-6h. To Save a Web Note</li>
									<li>WIN 7-6i. To Return to Browsing</li>
									<li>WIN 7-6j. To Review Saved Web Notes</li>
									<li>WIN 7-6k. To View the Current Version of the Saved Webpage</li>
								</ul>
							</li>
							<li>WIN 7-7. Sharing Web Content</li>
							<li>WIN 7-7a. To Share a Webpage</li>
							<li>WIN 7-7b. To Share a Web Note</li>
							<li>WIN 7-8a. Summary</li>
							<li>WIN 7-8b. Apply Your Knowledge</li>
							<li>WIN 7-8c. Extend Your Knowledge</li>
							<li>WIN 7-8d. Expand Your World</li>
							<li>WIN 7-8e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 8. Mastering Digital Media
						<ul>
							<li>WIN 8-1. Managing Photos
								<ul>
									<li>WIN 8-1a. The Collection</li>
									<li>WIN 8-1b. To Start the Photos App</li>
									<li>WIN 8-1c. Working with Folders</li>
									<li>WIN 8-1d. To Add a Folder to the Collection</li>
									<li>WIN 8-1e. To View the Collection</li>
									<li>WIN 8-1f. Working with Albums</li>
									<li>WIN 8-1g. To Create an Album</li>
									<li>WIN 8-1h. To Edit an Album Title and Cover</li>
									<li>WIN 8-1i. To Edit Album Contents</li>
									<li>WIN 8-1j. Photo Editing</li>
									<li>WIN 8-1k. To Enhance a Picture</li>
									<li>WIN 8-1l. To Save a Copy</li>
									<li>WIN 8-1m. To Delete Photos</li>
								</ul>
							</li>
							<li>WIN 8-2. Listening to Music with Groove Music
								<ul>
									<li>WIN 8-2a. To Start the Groove Music App</li>
									<li>WIN 8-2b. To Choose a Custom Music Folder</li>
									<li>WIN 8-2c. To Browse Music by Album, Artist, or Song</li>
									<li>WIN 8-2d. To Add Information to Music File Properties</li>
									<li>WIN 8-2e. To Find Album Information</li>
									<li>WIN 8-2f. To Play an Album</li>
									<li>WIN 8-2g. To Search for Music</li>
									<li>WIN 8-2h. Working with Playlists</li>
									<li>WIN 8-2i. To Create a Playlist</li>
									<li>WIN 8-2j. To Add Songs to a Playlist</li>
									<li>WIN 8-2k. To Rename a Playlist</li>
									<li>WIN 8-2l. To Pin a Playlist to the Start Menu</li>
									<li>WIN 8-2m. To Delete a Playlist</li>
								</ul>
							</li>
							<li>WIN 8-3. Enjoying Video Content in Windows 10
								<ul>
									<li>WIN 8-3a. To Start the Movies & TV App</li>
									<li>WIN 8-3b. To Choose a Custom Video Folder</li>
									<li>WIN 8-3c. To Play a Video from a Computer or Mobile Device</li>
									<li>WIN 8-3d. Playback Controls</li>
									<li>WIN 8-3e. To Adjust Volume</li>
									<li>WIN 8-3f. To Play in Mini View</li>
									<li>WIN 8-3g. To Change Repeat Option</li>
									<li>WIN 8-3h. To Quit Video Playback</li>
									<li>WIN 8-3i. Movies and Television Content from the Store</li>
									<li>WIN 8-3j. To Set Download Quality</li>
									<li>WIN 8-3k. To Adjust Closed Captioning Settings</li>
								</ul>
							</li>
							<li>WIN 8-4a. Summary</li>
							<li>WIN 8-4b. Apply Your Knowledge</li>
							<li>WIN 8-4c. Extend Your Knowledge</li>
							<li>WIN 8-4d. Expand Your World</li>
							<li>WIN 8-4e. In the Labs</li>
						</ul>
					</li>
					<li>Windows Module 9. Understanding Security, Networking, and Utilities
						<ul>
							<li>WIN 9-1. Understanding Security
								<ul>
									<li>WIN 9-1a. Sign-In Options</li>
									<li>WIN 9-1b. To Create a Pin</li>
									<li>WIN 9-1c. Family and Other Users</li>
									<li>WIN 9-1d. To Create a Child User Account</li>
									<li>WIN 9-1e. Managing Windows Defender Firewall</li>
									<li>WIN 9-1f. To Open the Windows Defender Firewall Window</li>
									<li>WIN 9-1g. To Allow a Feature through Windows Defender Firewall</li>
									<li>WIN 9-1h. To Disallow a Feature through Windows Defender Firewall</li>
									<li>WIN 9-1i. Configuring User Account Control (UAC) Settings</li>
									<li>WIN 9-1j. To Change UAC Settings</li>
									<li>WIN 9-1k. Protecting against Computer Viruses and Malware</li>
									<li>WIN 9-1l. To Scan Using Windows Security</li>
									<li>WIN 9-1m. Security and Maintenance</li>
									<li>WIN 9-1n. To Review a Computer’s Reliability and Problem History</li>
									<li>WIN 9-1o. To Configure Windows Defender SmartScreen Settings</li>
									<li>WIN 9-1p. To Change UAC Settings</li>
									<li>WIN 9-1q. BitLocker Drive Encryption</li>
									<li>WIN 9-1r. To Encrypt a File</li>
								</ul>
							</li>
							<li>WIN 9-2. Getting Connected
								<ul>
									<li>WIN 9-2a. Understanding Wireless Networks</li>
									<li>WIN 9-2b. Understanding Wired Networks</li>
									<li>WIN 9-2c. Putting It All Together</li>
									<li>WIN 9-2d. Using the Network and Sharing Center</li>
									<li>WIN 9-2e. To Open the Network and Sharing Center</li>
									<li>WIN 9-2f. Wireless Security Issues</li>
									<li>WIN 9-2g. To View the Status of a Connection</li>
									<li>WIN 9-2h. To Troubleshoot a Networking Problem</li>
									<li>WIN 9-2i. To Disable a Network Connection</li>
									<li>WIN 9-2j. Remote Desktop and Remote Assistance</li>
									<li>WIN 9-2k. To Allow Remote Connections to a Computer</li>
									<li>WIN 9-2l. To Allow Remote Assistance Invitations to Be Sent from a Computer</li>
									<li>WIN 9-2m. To Invite Someone to Help You through Remote Assistance</li>
									<li>WIN 9-2n. To Offer Remote Assistance to Someone Else</li>
									<li>WIN 9-2o. Connecting on the Go</li>
									<li>WIN 9-2p. To Use Airplane Mode</li>
									<li>WIN 9-2q. To Sync Your Settings</li>
								</ul>
							</li>
							<li>WIN 9-3. Maintaining Your Computer
								<ul>
									<li>WIN 9-3a. Action Center</li>
									<li>WIN 9-3b. To Display Notification Settings in the Action Center</li>
									<li>WIN 9-3c. Performance Tools</li>
									<li>WIN 9-3d. To Start Disk Cleanup</li>
									<li>WIN 9-3e. To Change the Optimization Schedule and Settings</li>
									<li>WIN 9-3f. Automatic Maintenance</li>
									<li>WIN 9-3g. To Change Automatic Maintenance Settings</li>
									<li>WIN 9-3h. To Start Maintenance Manually</li>
									<li>WIN 9-3i. Backing up and Restoring Files</li>
									<li>WIN 9-3j. Windows Update</li>
									<li>WIN 9-3k. To Check for Windows Updates</li>
									<li>WIN 9-3l. Using System Restore</li>
									<li>WIN 9-3m. To Set a Restore Point Manually</li>
									<li>WIN 9-3n. To Perform a System Restore</li>
									<li>WIN 9-3o. Recovery Options</li>
								</ul>
							</li>
							<li>WIN 9-4a. Summary</li>
							<li>WIN 9-4b. Apply Your Knowledge</li>
							<li>WIN 9-4c. Extend Your Knowledge</li>
							<li>WIN 9-4d. Expand Your World</li>
							<li>WIN 9-4e. In the Labs</li>
						</ul>
					</li>
					<li>MAC OS X. Mac OS X: Mojave
						<ul>
							<li>MAC 10-1. Introduction to Mac OS X: Mojave</li>
							<li>Running an App Using the Dock</li>
							<li>Running an App Using Launchpad</li>
							<li>Running an App Using Spotlight</li>
							<li>Quitting an App</li>
							<li>Viewing a Window Full Screen</li>
							<li>Maximizing a Window</li>
							<li>Restoring a Window</li>
							<li>Minimizing a Window</li>
							<li>Moving a Window</li>
							<li>Resizing a Window</li>
							<li>Closing a Window</li>
						</ul>
					</li>
					<li>MAC 10-2. Accessing the Web
						<ul>
							<li>Running Safari and Displaying a Webpage</li>
							<li>Searching the Web Using the Smart Search Field</li>
							<li>Opening a New Tab in Safari and Displaying a Webpage</li>
							<li>Switching Between Tabs</li>
							<li>Closing a Tab in Safari</li>
						</ul>
					</li>
					<li>MAC 10-3. Managing Files and Folders
						<ul>
							<li>Opening Finder</li>
							<li>Displaying the Contents of a Favorite Location</li>
							<li>Customizing Favorites in Finder</li>
							<li>Running an App Using Finder</li>
							<li>Changing the View in Finder</li>
							<li>Searching in Finder</li>
							<li>Creating a New Folder</li>
							<li>Copying a File to a Folder</li>
							<li>Moving a File to a Folder</li>
						</ul>
					</li>
					<li>MAC 10-4. Managing Mac OS X
						<ul>
							<li>Displaying Mac Information</li>
							<li>Displaying a System Report</li>
							<li>Performing a Software Update</li>
							<li>Opening the System Preferences Window</li>
							<li>Opening Notification Center</li>
							<li>Customizing Notification Settings</li>
							<li>Using Mac Help</li>
						</ul>
					</li>
					<li>MAC 10-5. Installing Apps
						<ul>
							<li>Displaying the App Store</li>
							<li>Downloading and Installing a Free App</li>
							<li>Adding an App Icon to the Dock</li>
						</ul>
					</li>
					<li>MAC 10-6. Ending a Mac OS X Session
						<ul>
							<li>Logging Out of a User Account</li>
							<li>Shutting Down the Computer</li>
						</ul>
					</li>
				</ul>
		</li>
		<li>Teams
			<ul>
				<li>Teams Module 1. Introduction to Microsoft Teams
					<ul>
						<li>TE 1-1. Introduction to Microsoft Teams</li>
						<li>TE 1-2. Project: Collaboration with Your Colleagues</li>
						<li>TE 1-2a. Identify the Purpose of Teams</li>
						<li>TE 1-2b. Teams App Elements</li>
						<li>TE 1-2c. Access Microsoft Teams on Any Device</li>
						<li>TE 1-2d. To Access the Teams Desktop App through Your School Subscription</li>
						<li>TE 1-2e. To Access the Teams Desktop App without a School Subscription</li>
						<li>TE 1-2f. Navigate throughout Teams</li>
						<li>TE 1-2g. The App Bar</li>
						<li>TE 1-3. Working as a Team</li>
						<li>TE 1-3a. To Create a Team</li>
						<li>TE 1-3b. The General Channel</li>
						<li>TE 1-3c. Teams Owners, Members, and Guests</li>
						<li>TE 1-3d. To Add Members and Guests to a Team</li>
						<li>TE 1-4. Starting the Conversation in Teams</li>
						<li>TE 1-4a. Using @mentions in Chat</li>
						<li>TE 1-4b. To Post Messages to Your Team</li>
						<li>TE 1-4c. To Add Emojis, GIFs, and Stickers to Messages</li>
						<li>TE 1-4d. To Add YouTube Videos to Messages</li>
						<li>TE 1-5. Uploading Files into a Team</li>
						<li>TE 1-5a. To Upload a File within a Team</li>
						<li>TE 1-5b. To Collaborate on a File</li>
						<li>TE 1-5c. To Search a Teams Conversation</li>
						<li>TE 1-6. Making a Voice Call from Teams</li>
						<li>TE 1-6a. To Make a Voice Call in Teams</li>
						<li>TE 1-7a. Summary</li>
						<li>TE 1-7b. Student Assignments: Apply Your Knowledge</li>
						<li>TE 1-7c. Extend Your Knowledge</li>
						<li>TE 1-7d. Expand Your World</li>
						<li>TE 1-7e. In the Labs</li>
					</ul>
					</li>
				<li>Teams Module 2. Making Meetings More Productive
					<ul>
						<li>TE 2-1. Introduction to Meetings</li>
						<li>TE 2-2. Project: Meet with Your Team</li>
						<li>TE 2-3. Scheduling a Teams Meeting</li>
						<li>TE 2-3a. Types of Teams Meetings</li>
						<li>TE 2-3b. Scheduling Assistant</li>
						<li>TE 2-3c. To Set Up a Scheduled Meeting in the Teams Calendar</li>
						<li>TE 2-4. Conducting Your First Teams Meeting</li>
						<li>TE 2-4a. Noise Suppression in Teams</li>
						<li>TE 2-4b. To Launch Your First Meeting</li>
						<li>TE 2-4c. Customize Your Background</li>
						<li>TE 2-4d. To Change Your Background Filter before the Meeting</li>
						<li>TE 2-4e. The Teams Meeting Window</li>
						<li>TE 2-4f. To Express Yourself with Live Reactions</li>
						<li>TE 2-5. Viewing Call Health, Live Captions, and Recordings</li>
						<li>TE 2-5a. Checking Your Call’s Health</li>
						<li>TE 2-5b. To Check Your Call Health</li>
						<li>TE 2-5c. Display Live Captions</li>
						<li>TE 2-5d. To Display Live Captions</li>
						<li>TE 2-5e. Record the Meeting</li>
						<li>TE 2-5f. To Record a Meeting</li>
						<li>TE 2-6. Sharing Your Screen During a Meeting</li>
						<li>TE 2-6a. Presenter Mode</li>
						<li>TE 2-6b. To Share Your Desktop Screen</li>
						<li>TE 2-7. Starting a Meeting Now</li>
						<li>TE 2-7a. To Meet Now</li>
						<li>TE 2-8a. Summary</li>
						<li>TE 2-8b. Student Assignments: Apply Your Knowledge</li>
						<li>TE 2-8c. Extend Your Knowledge</li>
						<li>TE 2-8d. Expand Your World</li>
						<li>TE 2-8e. In the Labs</li>
					</ul>
				</li>
				<li>Teams Module 3. Building an Effective Teams Environment
					<ul>
						<li>TE 3-1. Building an Effective Teams Environment</li>
						<li>TE 3-2. Project: Fostering Teamwork within Microsoft Teams</li>
						<li>TE 3-2a. Update Meeting Options</li>
						<li>TE 3-2b. To Customize the Meeting Options</li>
						<li>TE 3-3. Taking Notes and Sharing Files in a Meeting</li>
						<li>TE 3-3a. Taking Notes</li>
						<li>TE 3-3b. To Take Notes during a Meeting</li>
						<li>TE 3-3c. Sharing Files during a Meeting</li>
						<li>TE 3-3d. To Share a File in Chat during a Meeting</li>
						<li>TE 3-4. Collaborating on Microsoft Whiteboard</li>
						<li>TE 3-4a. Microsoft Whiteboard Templates</li>
						<li>TE 3-4b. Microsoft Whiteboard Tools</li>
						<li>TE 3-4c. To Collaborate Using the Microsoft Whiteboard</li>
						<li>TE 3-5. Managing Breakout Rooms</li>
						<li>TE 3-5a. Breakout Room Setup</li>
						<li>TE 3-5b. To Create and Name Breakout Rooms</li>
						<li>TE 3-5c. Launch Breakout Rooms</li>
						<li>TE 3-5d. To Launch Breakout Rooms with an Audience (The Organizer)</li>
						<li>TE 3-6. Setting Your Status and Customizing Your Settings</li>
						<li>TE 3-6a. To Set Your Status</li>
						<li>TE 3-6b. Customize Settings in Teams</li>
						<li>TE 3-6c. To Customize Your Settings</li>
						<li>TE 3-7. Adding Channels</li>
						<li>TE 3-7a. To Create a Standard Channel</li>
						<li>TE 3-8. Extending Team Channels with Apps</li>
						<li>TE 3-8a. To Add an App Tab to a Channel</li>
						<li>TE 3-9a. Summary</li>
						<li>TE 3-9b. Student Assignments: Apply Your Knowledge</li>
						<li>TE 3-9c. Extend Your Knowledge</li>
						<li>TE 3-9d. Expand Your World</li>
						<li>TE 3-9e. In the Labs</li>
					</ul>
				</li>
				</ul>
		</li>
		<li>Word
			<ul>
				<li>Word Module 1. Creating and Editing a Document
					<ul>
						<li>WD 1-1. Session 1.1 Visual Overview: The Word Window</li>
						<li>WD 1-2. Starting Word</li>
						<li>WD 1-2a. Working in Touch Mode</li>
						<li>WD 1-3. Setting up the Word Window</li>
						<li>WD 1-4. Saving a Document</li>
						<li>WD 1-5. Entering Text</li>
						<li>WD 1-5a. Inserting a Date with AutoComplete</li>
						<li>WD 1-5b. Continuing to Type the Block-Style Letter</li>
						<li>WD 1-5c. Typing a Hyperlink</li>
						<li>WD 1-6. Using the Undo and Redo Buttons</li>
						<li>WD 1-7. Correcting Errors as You Type</li>
						<li>WD 1-8. Proofreading a Document</li>
						<li>WD 1-9. Adjusting Paragraph and Line Spacing</li>
						<li>WD 1-10. Adjusting the Margins</li>
						<li>WD 1-11. Previewing and Printing a Document</li>
						<li>WD 1-12. Creating an Envelope</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>WD 1-13. Session 1.2 Visual Overview: Formatting a Document</li>
						<li>WD 1-14. Opening an Existing Document</li>
						<li>WD 1-15. Using the Editor Pane</li>
						<li>WD 1-16. Changing Page Orientation</li>
						<li>WD 1-17. Changing the Font and Font Size</li>
						<li>WD 1-18. Applying Text Effects, Font Colors, and Font Styles</li>
						<li>WD 1-19. Aligning Text</li>
						<li>WD 1-20. Adding a Paragraph Border and Shading</li>
						<li>WD 1-21. Copying Formatting with the Format Painter</li>
						<li>WD 1-22. Inserting a Picture and Adding Alt Text</li>
						<li>WD 1-23. Adding a Page Border</li>
						<li>WD 1-24. Creating Bulleted and Numbered Lists</li>
						<li>WD 1-25. Tip Sidenote To display a menu of recent and suggested Help topics, click the Search box and wait for the menu to appear. Getting Help</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>WD 1-26a. Practice: Review Assignments</li>
						<li>WD 1-26b. Apply: Case Problem 1</li>
						<li>WD 1-26c. Create: Case Problem 2</li>
					</ul>
					</li>
				<li>Word Module 2. Navigating and Formatting a Document
					<ul>
						<li>WD 2-1. Session 2.1 Visual Overview: The Navigation Pane and Styles</li>
						<li>WD 2-2. Reviewing the Document</li>
						<li>WD 2-3. Working with Comments</li>
						<li>WD 2-4. Moving Text in a Document</li>
						<li>WD 2-4a. Dragging and Dropping Text</li>
						<li>WD 2-4b. Cutting or Copying and Pasting Text Using the Clipboard</li>
						<li>WD 2-5. Using the Navigation Pane</li>
						<li>WD 2-6. Finding and Replacing Text</li>
						<li>WD 2-7. Working with Styles</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>WD 2-8. Session 2.2 Visual Overview: MLA Formatting Guidelines</li>
						<li>WD 2-9. Reviewing the MLA Style</li>
						<li>WD 2-10. Indenting a Paragraph</li>
						<li>WD 2-11. Inserting and Modifying Page Numbers</li>
						<li>WD 2-12. Creating a Footnote</li>
						<li>WD 2-13. Creating Citations and a Bibliography</li>
						<li>WD 2-13a. Creating Citations</li>
						<li>WD 2-13b. Inserting a Page Break</li>
						<li>WD 2-13c. Generating a Bibliography</li>
						<li>WD 2-13d. Modifying an Existing Source</li>
						<li>WD 2-13e. Updating and Finalizing a Bibliography</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>WD 2-14a. Practice: Review Assignments</li>
						<li>WD 2-14b. Apply: Case Problem 1</li>
						<li>WD 2-14c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 3. Creating Tables and a Multipage Report
					<ul>
						<li>WD 3-1. Session 3.1 Visual Overview: Organizing Information in Tables</li>
						<li>WD 3-2. Working with Headings in the Navigation Pane</li>
						<li>WD 3-3. Collapsing and Expanding Body Text in the Document</li>
						<li>WD 3-4. Inserting a Blank Table</li>
						<li>WD 3-5. Entering Data in a Table</li>
						<li>WD 3-6. Selecting Part of a Table</li>
						<li>WD 3-7. Sorting Rows in a Table</li>
						<li>WD 3-8. Inserting Rows and Columns in a Table</li>
						<li>WD 3-9. Deleting Rows and Columns</li>
						<li>WD 3-10. Changing Column Widths and Row Heights</li>
						<li>WD 3-11. Formatting Tables with Styles</li>
						<li>WD 3-12. Adding Formulas</li>
						<li>WD 3-13. Merging Cells</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>WD 3-14. Session 3.2 Visual Overview: Working with Headers and Footers</li>
						<li>WD 3-15. Setting Tab Stops</li>
						<li>WD 3-16. Hyphenating a Document</li>
						<li>WD 3-17. Formatting a Document into Sections</li>
						<li>WD 3-18. Creating SmartArt</li>
						<li>WD 3-19. Adding Headers and Footers</li>
						<li>WD 3-20. Inserting a Cover Page</li>
						<li>WD 3-21. Working with Themes</li>
						<li>WD 3-22. Reviewing a Document in Read Mode</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>WD 3-23a. Practice: Review Assignments</li>
						<li>WD 3-23b. Apply: Case Problem 1</li>
						<li>WD 3-23c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 4. Enhancing Page Layout and Design
					<ul>
						<li>WD 4-1. Session 4.1 Visual Overview: Elements of Desktop Publishing</li>
						<li>WD 4-2. Using Continuous Section Breaks to Enhance Page Layout</li>
						<li>WD 4-3. Formatting Text in Columns</li>
						<li>WD 4-4. Inserting Symbols and Special Characters</li>
						<li>WD 4-5. Introduction to Working with Objects</li>
						<li>WD 4-5a. Inserting Graphic Objects</li>
						<li>WD 4-5b. Distinguishing Between Inline and Floating Objects</li>
						<li>WD 4-5c. Wrapping Text Around an Object</li>
						<li>WD 4-6. Inserting Text Boxes</li>
						<li>WD 4-6a. Inserting a Preformatted Text Box</li>
						<li>WD 4-6b. Changing the Text Wrapping Setting for the Text Box</li>
						<li>WD 4-6c. Adding Text to a Text Box</li>
						<li>WD 4-6d. Drawing and Formatting a Text Box Using the Shapes Menu</li>
						<li>WD 4-7. Inserting Drop Caps</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>WD 4-8. Session 4.2 Visual Overview: Editing Pictures</li>
						<li>WD 4-9. Formatting Text with WordArt</li>
						<li>WD 4-9a. Modifying WordArt</li>
						<li>WD 4-10. Working with Pictures</li>
						<li>WD 4-10a. Cropping a Picture</li>
						<li>WD 4-10b. Searching for and Inserting Online Pictures and 3D Models</li>
						<li>WD 4-10c. Rotating a Picture</li>
						<li>WD 4-10d. Adjusting a Picture</li>
						<li>WD 4-10e. Removing a Picture’s Background</li>
						<li>WD 4-10f. Adding an Icon</li>
						<li>WD 4-11. Balancing Columns</li>
						<li>WD 4-12. Enhancing the Newsletter’s Formatting</li>
						<li>WD 4-13. Saving a Document as a PDF</li>
						<li>WD 4-14. Converting a PDF to a Word Document</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>WD 4-15a. Practice: Review Assignments</li>
						<li>WD 4-15b. Apply: Case Problem 1</li>
						<li>WD 4-15c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 5. Working with Templates, Themes, and Styles
					<ul>
						<li>WD 5-1. Session 5.1 Visual Overview: Custom Themes and Style Sets</li>
						<li>WD 5-2. Creating a New Document from a Template</li>
						<li>WD 5-3. Using Go To</li>
						<li>WD 5-4. Using the Thesaurus to Find Synonyms</li>
						<li>WD 5-5. Customizing the Document Theme</li>
						<li>WD 5-5a. Changing the Theme Colors</li>
						<li>WD 5-5b. Changing the Theme Fonts</li>
						<li>WD 5-5c. Saving a Custom Theme</li>
						<li>WD 5-6. Selecting a Style Set</li>
						<li>WD 5-7. Customizing Styles</li>
						<li>WD 5-7a. Changing Character Spacing</li>
						<li>WD 5-7b. Displaying the Styles Pane</li>
						<li>WD 5-7c. Updating a Style</li>
						<li>Review. Session 5.1 Quick Check</li>
						<li>WD 5-8. Session 5.2 Visual Overview: Creating a New Style</li>
						<li>WD 5-9. Creating a New Style</li>
						<li>WD 5-10. Displaying Information About Styles and Formatting</li>
						<li>WD 5-10a. Inspecting Styles</li>
						<li>WD 5-10b. Examining and Comparing Formatting in the Reveal Formatting Pane</li>
						<li>WD 5-10c. Reviewing Line and Page Break Settings</li>
						<li>WD 5-11. Generating a Table of Contents</li>
						<li>WD 5-12. Updating a Table of Contents</li>
						<li>WD 5-13. Saving a Document as a Template</li>
						<li>WD 5-14. Opening a New Document Based on Your Template</li>
						<li>WD 5-15. Creating a New Quick Part</li>
						<li>Review. Session 5.2 Quick Check</li>
						<li>WD 5-16a. Practice: Review Assignments</li>
						<li>WD 5-16b. Apply: Case Problem 1</li>
						<li>WD 5-16c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 6. Using Mail Merge
					<ul>
						<li>WD 6-1. Session 6.1 Visual Overview: Mail Merge</li>
						<li>WD 6-2. Inserting a Date Field</li>
						<li>WD 6-3. Performing a Mail Merge</li>
						<li>WD 6-4. Starting the Mail Merge and Selecting a Main Document</li>
						<li>WD 6-5. Creating a Data Source</li>
						<li>WD 6-5a. Entering Data into a Data Source</li>
						<li>WD 6-5b. Saving a Data Source</li>
						<li>WD 6-6. Inserting Merge Fields</li>
						<li>WD 6-7. Creating a Mail Merge Rule</li>
						<li>WD 6-8. Previewing the Merged Document</li>
						<li>WD 6-9. Merging the Main Document and the Data Source</li>
						<li>Review. Session 6.1 Quick Check</li>
						<li>WD 6-10. Session 6.2 Visual Overview: Editing a Data Source</li>
						<li>WD 6-11. Reopening a Main Document</li>
						<li>WD 6-12. Editing a Data Source</li>
						<li>WD 6-13. Sorting Records</li>
						<li>WD 6-14. Filtering Records</li>
						<li>WD 6-15. Creating Mailing Labels</li>
						<li>WD 6-16. Creating a Phone Directory</li>
						<li>WD 6-17. Converting Text to a Table</li>
						<li>Review. Session 6.2 Quick Check</li>
						<li>WD 6-18a. Practice: Review Assignments</li>
						<li>WD 6-18b. Apply: Case Problem 1</li>
						<li>WD 6-18c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 7. Collaborating with Others and Integrating Data
					<ul>
						<li>WD 7-1. Session 7.1 Visual Overview: Tracking Changes</li>
						<li>WD 7-2. Editing a Document with Tracked Changes</li>
						<li>WD 7-3. Adjusting Track Changes Options</li>
						<li>WD 7-4. Comparing and Combining Documents</li>
						<li>WD 7-5. Accepting and Rejecting Changes</li>
						<li>WD 7-6. Embedding and Linking Objects from Other Programs</li>
						<li>WD 7-6a. Embedding an Excel Worksheet Object</li>
						<li>WD 7-6b. Modifying an Embedded Worksheet Object</li>
						<li>Review. Session 7.1 Quick Check</li>
						<li>WD 7-7. Session 7.2 Visual Overview: Linking an Excel Chart Object</li>
						<li>WD 7-8. Linking an Excel Chart Object</li>
						<li>WD 7-8a. Modifying the Linked Chart Object</li>
						<li>WD 7-8b. Breaking Links</li>
						<li>WD 7-9. Using Hyperlinks in Word</li>
						<li>WD 7-9a. Inserting a Hyperlink to a Bookmark in the Same Document</li>
						<li>WD 7-9b. Creating Hyperlinks to Other Documents</li>
						<li>WD 7-10. Optimizing a Document for Online Viewing</li>
						<li>WD 7-10a. Applying a Background Fill Effect</li>
						<li>WD 7-10b. Inserting Horizontal Lines</li>
						<li>WD 7-11. Editing Hyperlinks</li>
						<li>WD 7-12. Creating and Publishing a Blog Post</li>
						<li>Review. Session 7.2 Quick Check</li>
						<li>WD 7-13a. Practice: Review Assignments</li>
						<li>WD 7-13b. Apply: Case Problem 1</li>
						<li>WD 7-13c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 8. Customizing Word and Automating Your Work
					<ul>
						<li>WD 8-1. Session 8.1 Visual Overview: Translating Text</li>
						<li>WD 8-2. Inserting a Shape</li>
						<li>WD 8-3. Applying Advanced Text Formatting</li>
						<li>WD 8-4. Compressing Pictures in a Document</li>
						<li>WD 8-5. Translating Text</li>
						<li>WD 8-5a. Selecting an Option for Translating Text</li>
						<li>WD 8-5b. Changing the Proofing Language of Specific Words</li>
						<li>WD 8-6. Adding a Custom Paragraph Border</li>
						<li>WD 8-7. Creating a Watermark</li>
						<li>Review. Session 8.1 Quick Check</li>
						<li>WD 8-8. Session 8.2 Visual Overview: File Properties</li>
						<li>WD 8-9. Editing Building Block Properties</li>
						<li>WD 8-10. Copying a Building Block to Another Document or Template</li>
						<li>WD 8-11. Copying a Style to Another Document or Template</li>
						<li>WD 8-12. Working with File Properties</li>
						<li>WD 8-12a. Adding Document Properties</li>
						<li>WD 8-12b. Inserting Document Properties into the Template</li>
						<li>WD 8-13. Automating Documents Using Fields</li>
						<li>WD 8-13a. Inserting a Custom Property Using the Field Dialog Box</li>
						<li>WD 8-13b. Customizing the Date Field</li>
						<li>WD 8-14. Inserting a Fill-In Field</li>
						<li>Review. Session 8.2 Quick Check</li>
						<li>WD 8-15. Session 8.3 Visual Overview: Working with Macros</li>
						<li>WD 8-16. Planning a Macro</li>
						<li>WD 8-17. Examining Trust Center Settings</li>
						<li>WD 8-18. Recording a Macro</li>
						<li>WD 8-19. Running Macros</li>
						<li>WD 8-20. Editing a Macro Using the Visual Basic Window</li>
						<li>WD 8-21. Saving a Document with Macros</li>
						<li>WD 8-22. Copying Macros to Another Document or Template</li>
						<li>WD 8-23. Recording an AutoMacro</li>
						<li>Review. Session 8.3 Quick Check</li>
						<li>WD 8-24a. Practice: Review Assignments</li>
						<li>WD 8-24b. Apply: Case Problem 1</li>
						<li>WD 8-24c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 9. Creating Online Forms Using Advanced Table Techniques
					<ul>
						<li>WD 9-1. Session 9.1 Visual Overview: Custom Table</li>
						<li>WD 9-2. Creating and Using Online Forms</li>
						<li>WD 9-3. Planning and Designing the Form</li>
						<li>WD 9-4. Creating a Custom Table for a Form
							<ul>
								<li>WD 9-4a. Merging and Splitting Cells</li>
								<li>WD 9-4b. Rotating Text in a Cell</li>
								<li>WD 9-4c. Moving Gridlines to Change Column Widths and Row Heights</li>
								<li>WD 9-4d. Aligning Cell Content</li>
								<li>WD 9-4e. Removing Borders</li>
								<li>WD 9-4f. Changing the Width of Borders</li>
								<li>WD 9-4g. Changing Cell Margins</li>
								<li>WD 9-4h. Applying Custom Formatting to Text and Cells</li>
							</ul>
						</li>
						<li>Review. Session 9.1 Quick Check</li>
						<li>WD 9-5. Session 9.2 Visual Overview: Content Controls</li>
						<li>WD 9-6. Understanding Content Controls</li>
						<li>WD 9-7. Inserting Text Content Controls</li>
						<li>WD 9-8. Inserting Date Picker Content Controls</li>
						<li>WD 9-9. Inserting List Content Controls</li>
						<li>WD 9-10. Inserting Check Box Content Controls</li>
						<li>Review. Session 9.2 Quick Check</li>
						<li>WD 9-11. Session 9.3 Visual Overview: Protecting a Document</li>
						<li>WD 9-12. Using Formulas in a Table</li>
						<li>WD 9-12a. Referencing Table Cells</li>
						<li>WD 9-12b. Understanding Formulas</li>
						<li>WD 9-12c. Inserting a Formula in a Table Cell</li>
						<li>WD 9-13. Grouping Content Controls</li>
						<li>WD 9-14. Restricting Document Editing</li>
						<li>WD 9-15. Filling in the Online Form</li>
						<li>Review. Session 9.3 Quick Check</li>
						<li>WD 9-16a. Practice: Review Assignments</li>
						<li>WD 9-16b. Apply: Case Problem 1</li>
						<li>WD 9-16c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Word Module 10. Managing Long Documents
					<ul>
						<li>WD 10-1. Session 10.1 Visual Overview: Master Documents</li>
						<li>WD 10-2. Working with Master Documents</li>
						<li>WD 10-3. Working in Outline View</li>
						<li>WD 10-3a. Creating an Outline in Outline View</li>
						<li>WD 10-3b. Changing the Outline Level of a Heading</li>
						<li>WD 10-3c. Reorganizing a Document in Outline View</li>
						<li>WD 10-4. Creating a Master Document</li>
						<li>WD 10-4a. Creating a Subdocument</li>
						<li>WD 10-4b. Inserting Subdocuments</li>
						<li>WD 10-4c. Examining Subdocument Links</li>
						<li>WD 10-5. Unlinking a Subdocument</li>
						<li>WD 10-6. Reopening a Master Document</li>
						<li>Review. Session 10.1 Quick Check</li>
						<li>WD 10-7. Session 10.2 Visual Overview: Creating a Chart</li>
						<li>WD 10-8. Adding Numbers to Headings</li>
						<li>WD 10-9. Inserting Numbered Captions</li>
						<li>WD 10-10. Creating Cross-References</li>
						<li>WD 10-11. Inserting an Endnote</li>
						<li>WD 10-12. Inserting a Chart</li>
						<li>WD 10-13. Restricting Editing to Allow Only Tracked Changes or Comments</li>
						<li>WD 10-14. Checking a Document with the Document Inspector</li>
						<li>WD 10-15. Checking Documents for Accessibility</li>
						<li>Review. Session 10.2 Quick Check</li>
						<li>WD 10-16. Session 10.3 Visual Overview: Indexing a Document</li>
						<li>WD 10-17. Evaluating Section and Page Breaks in a Document</li>
						<li>WD 10-18. Applying Different Page Number Formats in Sections</li>
						<li>WD 10-18a. Creating Sections for Different Page-Numbering Schemes</li>
						<li>WD 10-18b. Centering Text Vertically on a Page</li>
						<li>WD 10-18c. Setting up Page Numbers in Different Sections</li>
						<li>WD 10-19. Changing the Footer and Page Layout for Odd and Even Pages</li>
						<li>WD 10-20. Inserting a Style Reference into a Footer</li>
						<li>WD 10-21. Inserting Nonbreaking Hyphens and Spaces</li>
						<li>WD 10-22. Creating an Index
							<ul>
								<li>WD 10-22a. Marking Index Entries</li>
								<li>WD 10-22b. Marking Subentries</li>
								<li>WD 10-22c. Creating Cross-Reference Index Entries</li>
								<li>WD 10-22d. Creating an Index Entry for a Page Range</li>
								<li>WD 10-22e. Using the AutoMark Feature</li>
								<li>WD 10-22f. Compiling an Index</li>
								<li>WD 10-22g. Updating an Index</li>
							</ul>
						</li>
						<li>WD 10-23. Creating a Table of Figures</li>
						<li>WD 10-24. Updating Fields before Printing</li>
						<li>WD 10-25. Checking Compatibility</li>
						<li>WD 10-26. Encrypting a Document</li>
						<li>WD 10-27. Making a Document Read-Only</li>
						<li>Review. Session 10.3 Quick Check</li>
						<li>WD 10-28a. Practice: Review Assignments</li>
						<li>WD 10-28b. Apply: Case Problem 1</li>
						<li>WD 10-28c. Create: Case Problem 2</li>
					</ul>
				</li>
				</ul>
		</li>
		<li>Excel
			<ul>
				<li>Excel Module 1. Getting Started with Excel
					<ul>
						<li>EX 1-1. Session 1.1 Visual Overview: The Excel Workbook</li>
						<li>EX 1-2. Introducing Excel and Spreadsheets</li>
						<li>EX 1-2a. Getting Help</li>
						<li>EX 1-2b. Using Keyboard Shortcuts to Work Faster</li>
						<li>EX 1-2c. Using Excel in Touch Mode</li>
						<li>EX 1-3. Exploring a Workbook</li>
						<li>EX 1-3a. Changing the Active Sheet</li>
						<li>EX 1-3b. Navigating Within a Worksheet</li>
						<li>EX 1-3c. Selecting a Cell Range</li>
						<li>EX 1-4. Closing a Workbook</li>
						<li>EX 1-5. Planning a Workbook</li>
						<li>EX 1-6. Starting a New Workbook</li>
						<li>EX 1-6a. Renaming and Inserting Worksheets</li>
						<li>EX 1-6b. Moving Worksheets</li>
						<li>EX 1-6c. Deleting Worksheets</li>
						<li>EX 1-6d. Saving a Workbook</li>
						<li>EX 1-7. Entering Text, Dates, and Numbers
							<ul>
								<li>EX 1-7a. Entering Text</li>
								<li>EX 1-7b. Undoing and Redoing an Action</li>
								<li>EX 1-7c. Editing Cell Content</li>
								<li>EX 1-7d. Understanding AutoComplete</li>
								<li>EX 1-7e. Displaying Numbers as Text</li>
								<li>EX 1-7f. Entering Dates</li>
								<li>EX 1-7g. Entering Numbers</li>
							</ul>
						</li>
						<li>EX 1-8. Resizing Columns and Rows</li>
						<li>EX 1-8a. Setting a Column Width</li>
						<li>EX 1-8b. Wrapping Text within a Cell</li>
						<li>EX 1-8c. Changing Row Heights</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>EX 1-9. Session 1.2 Visual Overview: Excel Formulas and Functions</li>
						<li>EX 1-10. Calculating with Formulas</li>
						<li>EX 1-10a. Entering a Formula</li>
						<li>EX 1-10b. Copying and Pasting Formulas</li>
						<li>EX 1-11. Calculating with Functions</li>
						<li>EX 1-11a. Understanding Function Syntax</li>
						<li>EX 1-11b. Inserting Functions with AutoSum</li>
						<li>EX 1-12. Modifying a Worksheet</li>
						<li>EX 1-12a. Moving and Copying a Cell or Range</li>
						<li>EX 1-13. Using the COUNT Function</li>
						<li>EX 1-14. Modifying Rows and Columns</li>
						<li>EX 1-14a. Inserting Rows and Columns</li>
						<li>EX 1-14b. Deleting Rows and Columns</li>
						<li>EX 1-14c. Inserting and Deleting a Range</li>
						<li>EX 1-15. Using Flash Fill</li>
						<li>EX 1-16. Formatting a Worksheet</li>
						<li>EX 1-16a. Adding Cell Borders</li>
						<li>EX 1-16b. Changing the Font Size</li>
						<li>EX 1-17. Printing a Workbook</li>
						<li>EX 1-17a. Changing Worksheet Views</li>
						<li>EX 1-17b. Changing the Page Orientation</li>
						<li>EX 1-17c. Setting the Scaling Options</li>
						<li>EX 1-17d. Setting the Print Options</li>
						<li>EX 1-18. Viewing Worksheet Formulas</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>EX 1-19a. Practice: Review Assignments</li>
						<li>EX 1-19b. Apply: Case Problem 1</li>
						<li>EX 1-19c. Create: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 2. Formatting Workbook Text and Data
					<ul>
						<li>EX 2-1. Session 2.1 Visual Overview: Formatting a Worksheet</li>
						<li>EX 2-2. Formatting Cell Text</li>
						<li>EX 2-2a. Applying Fonts and Font Styles</li>
						<li>EX 2-2b. Applying a Font Color</li>
						<li>EX 2-2c. Formatting Text Selections Within a Cell</li>
						<li>EX 2-3. Working with Fill Colors and Backgrounds</li>
						<li>EX 2-3a. Changing a Fill Color</li>
						<li>EX 2-3b. Setting the Worksheet Tab Color</li>
						<li>EX 2-3c. Adding a Background Image</li>
						<li>EX 2-4. Using Functions and Formulas with Sales Data</li>
						<li>EX 2-5. Formatting Numbers</li>
						<li>EX 2-5a. Applying Number Formats</li>
						<li>EX 2-5b. Displaying Percentages</li>
						<li>EX 2-5c. Formatting Dates and Times</li>
						<li>EX 2-6. Formatting Worksheet Cells</li>
						<li>EX 2-6a. Aligning Cell Content</li>
						<li>EX 2-6b. Indenting Cell Content</li>
						<li>EX 2-6c. Adding Borders to Cells</li>
						<li>EX 2-6d. Merging Cells</li>
						<li>EX 2-6e. Rotating Cell Contents</li>
						<li>EX 2-7. Exploring the Format Cells Dialog Box</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>EX 2-8. Session 2.2 Visual Overview: Designing a Printout</li>
						<li>EX 2-9. Calculating Averages</li>
						<li>EX 2-10. Applying Cell Styles</li>
						<li>EX 2-10a. Creating a Custom Cell Style</li>
						<li>EX 2-10b. Merging Custom Cell Styles</li>
						<li>EX 2-11. Copying and Pasting Formats</li>
						<li>EX 2-11a. Copying Formats with the Format Painter</li>
						<li>EX 2-11b. Copying Formats with the Paste Options Button</li>
						<li>EX 2-11c. Copying Formats with Paste Special</li>
						<li>EX 2-11d. Transposing Data</li>
						<li>EX 2-12. Finding and Replacing Text and Formats</li>
						<li>EX 2-13. Working with Themes</li>
						<li>EX 2-13a. Applying a Theme</li>
						<li>EX 2-13b. Setting Theme Colors and Fonts</li>
						<li>EX 2-13c. Saving a Theme</li>
						<li>EX 2-14. Highlighting Data with Conditional Formats</li>
						<li>EX 2-14a. Highlighting Cells Based on Their Values</li>
						<li>EX 2-14b. Highlighting Cells with a Top/Bottom Rule</li>
						<li>EX 2-14c. Editing a Conditional Formatting Rule</li>
						<li>EX 2-14d. Clearing Conditional Formatting Rules</li>
						<li>EX 2-14e. Documenting Conditional Formats</li>
						<li>EX 2-15. Formatting a Worksheet for Printing</li>
						<li>EX 2-15a. Using Page Break Preview</li>
						<li>EX 2-15b. Defining the Print Area</li>
						<li>EX 2-15c. Inserting Page Breaks</li>
						<li>EX 2-15d. Adding Print Titles</li>
						<li>EX 2-15e. Designing Headers and Footers</li>
						<li>EX 2-15f. Setting the Page Margins</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>EX 2-16a. Practice: Review Assignments</li>
						<li>EX 2-16b. Apply: Case Problem 1</li>
						<li>EX 2-16c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 3. Performing Calculations with Formulas and Functions
					<ul>
						<li>EX 3-1. Session 3.1 Visual Overview: Formulas and Functions</li>
						<li>EX 3-2. Designing a Workbook for Calculations</li>
						<li>EX 3-2a. Documenting Calculations</li>
						<li>EX 3-2b. Constants and Units</li>
						<li>EX 3-3. Calculating with Dates and Times</li>
						<li>EX 3-4. AutoFilling Formulas and Data Patterns</li>
						<li>EX 3-4a. AutoFilling a Formula</li>
						<li>EX 3-4b. Exploring Auto Fill Options</li>
						<li>EX 3-4c. Filling a Series</li>
						<li>EX 3-5. Applying Excel Functions</li>
						<li>EX 3-5a. Rounding Data Values</li>
						<li>EX 3-5b. Calculating Minimums and Maximums</li>
						<li>EX 3-5c. Measures of Central Tendency</li>
						<li>EX 3-5d. Nesting Functions</li>
						<li>EX 3-5e. The Role of Blanks and Zeroes</li>
						<li>EX 3-5f. Date and Time Functions</li>
						<li>EX 3-6. Interpreting Error Values</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>EX 3-7. Session 3.2 Visual Overview: Lookup Tables and Logical Functions</li>
						<li>EX 3-8. Calculating Running Totals with the Quick Analysis Tool</li>
						<li>EX 3-9. Exploring Cell References</li>
						<li>EX 3-9a. Relative Cell References</li>
						<li>EX 3-9b. Absolute Cell References</li>
						<li>EX 3-9c. Mixed Cell References</li>
						<li>EX 3-9d. Entering an Absolute Cell Reference</li>
						<li>EX 3-10. Working with the IF Logical Function</li>
						<li>EX 3-11. Formatting Input, Calculated, and Output Values</li>
						<li>EX 3-12. Looking Up Data</li>
						<li>EX 3-12a. Finding an Exact Match with the VLOOKUP Function</li>
						<li>EX 3-13. Performing What-If Analyses with Formulas and Functions</li>
						<li>EX 3-13a. Using Trial and Error</li>
						<li>EX 3-13b. Using Goal Seek</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>EX 3-14a. Practice: Review Assignments</li>
						<li>EX 3-14b. Apply: Case Problem 1</li>
						<li>EX 3-14c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 4. Analyzing and Charting Financial Data
					<ul>
						<li>EX 4-1. Session 4.1 Visual Overview: Chart Elements</li>
						<li>EX 4-2. Getting Started with Excel Charts</li>
						<li>EX 4-3. Creating a Pie Chart</li>
						<li>EX 4-3a. Selecting the Data Source</li>
						<li>EX 4-3b. Charting with the Quick Analysis Tool</li>
						<li>EX 4-3c. Moving and Resizing a Chart</li>
						<li>EX 4-4. Working with Chart Elements</li>
						<li>EX 4-4a. Formatting a Chart Element</li>
						<li>EX 4-4b. Choosing a Chart Style</li>
						<li>EX 4-4c. Changing the Color Scheme</li>
						<li>EX 4-5. Performing What-If Analyses with Charts</li>
						<li>EX 4-6. Creating a Column Chart</li>
						<li>EX 4-6a. Comparing Column Chart Subtypes</li>
						<li>EX 4-6b. Creating a Clustered Column Chart</li>
						<li>EX 4-6c. Editing a Chart Title</li>
						<li>EX 4-6d. Setting the Gap Width</li>
						<li>EX 4-6e. Adding Gridlines to a Chart</li>
						<li>EX 4-7. Creating a Line Chart</li>
						<li>EX 4-7a. Editing the Category Axis</li>
						<li>EX 4-7b. Formatting Data Markers</li>
						<li>EX 4-8. Creating a Combination Chart</li>
						<li>EX 4-8a. Adding an Axis Title</li>
						<li>EX 4-8b. Editing a Value Axis Scale</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>EX 4-9. Session 4.2 Visual Overview: Scatter Charts, Data Bars, and Sparklines</li>
						<li>EX 4-10. Creating a Scatter Chart</li>
						<li>EX 4-11. Editing the Chart Data Source</li>
						<li>EX 4-12. Adding Graphic Objects to a Workbook</li>
						<li>EX 4-12a. Adding a Data Callout to a Chart</li>
						<li>EX 4-12b. Inserting a Graphic Shape</li>
						<li>EX 4-12c. Inserting Graphic Icons</li>
						<li>EX 4-12d. Tools for Managing Graphic Objects</li>
						<li>EX 4-13. Exploring Other Chart Types</li>
						<li>EX 4-13a. Hierarchy Charts</li>
						<li>EX 4-13b. Pareto Charts</li>
						<li>EX 4-13c. Histogram Charts</li>
						<li>EX 4-13d. Waterfall Charts</li>
						<li>EX 4-14. Creating Data Bars</li>
						<li>EX 4-14a. Modifying a Data Bar Rule</li>
						<li>EX 4-15. Creating Sparklines</li>
						<li>EX 4-15a. Formatting a Sparkline</li>
						<li>EX 4-15b. Sparkline Groups and Sparkline Axes</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>EX 4-16a. Practice: Review Assignments</li>
						<li>EX 4-16b. Apply: Case Problem 1</li>
						<li>EX 4-16c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 5. Generating Reports from Multiple Worksheets and Workbooks
					<ul>
						<li>EX 5-1. Session 5.1 Visual Overview: Worksheet Groups and 3-D References</li>
						<li>EX 5-2. Working with Multiple Worksheets</li>
						<li>EX 5-2a. Copying a Worksheet</li>
						<li>EX 5-3. Viewing a Workbook in Multiple Windows</li>
						<li>EX 5-3a. Arranging Multiple Workbook Windows</li>
						<li>EX 5-3b. Using Synchronized Scrolling Between Windows</li>
						<li>EX 5-4. Working with Worksheet Groups</li>
						<li>EX 5-4a. Editing a Worksheet Group</li>
						<li>EX 5-4b. Ungrouping a Worksheet Group</li>
						<li>EX 5-5. Writing 3-D References</li>
						<li>EX 5-5a. Referencing Cells in Other Worksheets</li>
						<li>EX 5-5b. Applying 3-D References to Formulas and Functions</li>
						<li>Review. Session 5.1 Quick Check</li>
						<li>EX 5-6. Session 5.2 Visual Overview: External References and Links</li>
						<li>EX 5-7. Linking to External Workbooks</li>
						<li>EX 5-7a. Creating an External Reference</li>
						<li>EX 5-7b. Updating Workbook Links</li>
						<li>EX 5-7c. External References and Security Concerns</li>
						<li>EX 5-7d. Reviewing Links Within a Workbook</li>
						<li>EX 5-7e. Managing Workbook Links</li>
						<li>EX 5-8. Creating Hyperlinks</li>
						<li>EX 5-8a. Linking to a Location Within a Workbook</li>
						<li>EX 5-8b. Linking to an Email Address</li>
						<li>Review. Session 5.2 Quick Check</li>
						<li>EX 5-9. Session 5.3 Visual Overview: Named Ranges and Templates</li>
						<li>EX 5-10. Simplifying Formulas with Named Ranges</li>
						<li>EX 5-10a. Defining a Named Range</li>
						<li>EX 5-10b. Using Named Ranges in Formulas</li>
						<li>EX 5-10c. Determining the Scope of Named Ranges</li>
						<li>EX 5-10d. Using Defined Names in Existing Formulas</li>
						<li>EX 5-11. Exploring Workbook Templates</li>
						<li>EX 5-11a. Setting Up a Workbook Template</li>
						<li>EX 5-11b. Creating a Workbook Based on a Template</li>
						<li>Review. Session 5.3 Quick Check</li>
						<li>EX 5-12a. Practice: Review Assignments</li>
						<li>EX 5-12b. Apply: Case Problem 1</li>
						<li>EX 5-12c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 6. Managing Data with Data Tools
					<ul>
						<li>EX 6-1. Session 6.1 Visual Overview: Data Ranges, Workbook Panes, and Subtotals</li>
						<li>EX 6-2. Handling Data in Excel</li>
						<li>EX 6-3. Using Panes to View Data</li>
						<li>EX 6-3a. Dividing the Workbook Window into Panes</li>
						<li>EX 6-3b. Freezing Panes</li>
						<li>EX 6-4. Locating Duplicate Records</li>
						<li>EX 6-4a. Highlighting Duplicate Values</li>
						<li>EX 6-4b. Removing Duplicate Records</li>
						<li>EX 6-5. Sorting Records in a Data Range</li>
						<li>EX 6-5a. Sorting by a Single Field</li>
						<li>EX 6-5b. Sorting by Multiple Fields</li>
						<li>EX 6-5c. Sorting with a Custom List</li>
						<li>EX 6-6. Calculating Subtotals</li>
						<li>EX 6-6a. Creating a Subtotal Row</li>
						<li>EX 6-6b. Using the Subtotal Outline View</li>
						<li>Review. Session 6.1 Quick Check</li>
						<li>EX 6-7. Session 6.2 Visual Overview: Filters and Excel Tables</li>
						<li>EX 6-8. Locating Cells Within a Worksheet</li>
						<li>EX 6-8a. Finding and Selecting Multiple Cells</li>
						<li>EX 6-8b. Finding Cells by Type</li>
						<li>EX 6-9. Filtering Data</li>
						<li>EX 6-9a. Filtering Based on One Field</li>
						<li>EX 6-9b. Filtering Based on Multiple Fields</li>
						<li>EX 6-9c. Using Criteria Filters</li>
						<li>EX 6-9d. Clearing Filters</li>
						<li>EX 6-9e. Applying an Advanced Filter</li>
						<li>EX 6-10. Creating an Excel Table</li>
						<li>EX 6-10a. Converting a Range to a Table</li>
						<li>EX 6-10b. Using Table Styles</li>
						<li>EX 6-10c. Adding a Total Row</li>
						<li>EX 6-10d. Adding and Deleting Records</li>
						<li>EX 6-10e. Creating a Calculated Field</li>
						<li>EX 6-10f. Structural References and Excel Tables</li>
						<li>Review. Session 6.2 Quick Check</li>
						<li>EX 6-11. Session 6.3 Visual Overview: Slicers and Dashboards</li>
						<li>EX 6-12. Filtering Data with Slicers</li>
						<li>EX 6-13. Creating a Dashboard</li>
						<li>EX 6-13a. Formatting a Slicer</li>
						<li>EX 6-13b. Using the SUBTOTAL Function</li>
						<li>EX 6-13c. Creating Dynamic Charts</li>
						<li>EX 6-13d. Looking Up Data with Tables</li>
						<li>Review. Session 6.3 Quick Check</li>
						<li>EX 6-14a. Practice: Review Assignments</li>
						<li>EX 6-14b. Apply: Case Problem 1</li>
						<li>EX 6-14c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 7. Summarizing Data with PivotTables
					<ul>
						<li>EX 7-1. Session 7.1 Visual Overview: Summary IF Functions and VLOOKUP</li>
						<li>EX 7-2. Using Lookup Functions</li>
						<li>EX 7-2a. Creating Approximate Match Lookups</li>
						<li>EX 7-3. Performing Two-Way Lookups with the XLOOKUP Function</li>
						<li>EX 7-4. Retrieving Data with Index Match Lookups</li>
						<li>EX 7-5. Exploring Logical Functions</li>
						<li>EX 7-5a. Using the IFS Function</li>
						<li>EX 7-5b. Combining Conditions with the OR and AND Functions</li>
						<li>EX 7-6. Applying Summary IF Functions</li>
						<li>EX 7-6a. Conditional Counting with COUNTIF</li>
						<li>EX 7-6b. Calculating Conditional Sums with SUMIF</li>
						<li>EX 7-6c. Calculating Conditional Averages with AVERAGEIF</li>
						<li>EX 7-6d. Using Summary IFS Functions</li>
						<li>Review. Session 7.1 Quick Check</li>
						<li>EX 7-7. Session 7.2 Visual Overview: PivotTables</li>
						<li>EX 7-8. Creating PivotTables</li>
						<li>EX 7-8a. Inserting a PivotTable</li>
						<li>EX 7-8b. Creating a PivotTable Layout</li>
						<li>EX 7-8c. Modifying the PivotTable Layout</li>
						<li>EX 7-8d. Adding Multiple Fields to a Row or Column</li>
						<li>EX 7-8e. Filtering a PivotTable</li>
						<li>EX 7-9. Formatting a PivotTable</li>
						<li>EX 7-9a. Changing Labels and Number Formats</li>
						<li>EX 7-9b. Choosing a PivotTable Summary Function</li>
						<li>EX 7-9c. Reordering PivotTable Categories</li>
						<li>EX 7-10. Setting PivotTable Options</li>
						<li>EX 7-11. Setting the PivotTable Design</li>
						<li>Review. Session 7.2 Quick Check</li>
						<li>EX 7-12. Session 7.3 Visual Overview: PivotCharts and Slicers</li>
						<li>EX 7-13. Introducing PivotCharts</li>
						<li>EX 7-13a. Creating a PivotChart</li>
						<li>EX 7-13b. Moving a PivotChart to Another Worksheet</li>
						<li>EX 7-13c. Creating a Pie PivotChart</li>
						<li>EX 7-14. Using Slicers and PivotTables</li>
						<li>EX 7-14a. Applying a Slicer to Multiple PivotTables</li>
						<li>EX 7-14b. Tip Sidenote Timeline slicers can be applied only to PivotTables and not to Excel tables. Creating a Timeline Slicer</li>
						<li>EX 7-15. Drilling Down a PivotTable</li>
						<li>Review. Session 7.3 Quick Check</li>
						<li>EX 7-16a. Practice: Review Assignments</li>
						<li>EX 7-16b. Apply: Case Problem 1</li>
						<li>EX 7-16c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 8. Performing What-If Analyses
					<ul>
						<li>EX 8-1. Session 8.1 Visual Overview: Data Tables and What-If Analysis</li>
						<li>EX 8-2. Understanding Cost-Volume Relationships</li>
						<li>EX 8-2a. Comparing Expenses and Revenue</li>
						<li>EX 8-2b. Exploring the Break-Even Point</li>
						<li>EX 8-2c. Finding the Break-Even Point with What-If Analysis</li>
						<li>EX 8-3. Working with Data Tables</li>
						<li>EX 8-3a. Creating a One-Variable Data Table</li>
						<li>EX 8-3b. Charting a One-Variable Data Table</li>
						<li>EX 8-3c. Modifying a Data Table</li>
						<li>EX 8-4. Creating a Two-Variable Data Table</li>
						<li>EX 8-4a. Formatting the Result Cell</li>
						<li>EX 8-4b. Charting a Two-Variable Data Table</li>
						<li>Review. Session 8.1 Quick Check</li>
						<li>EX 8-5. Session 8.2 Visual Overview: What-If Scenarios</li>
						<li>EX 8-6. Exploring Financial Scenarios with Scenario Manager</li>
						<li>EX 8-6a. Defining a Scenario</li>
						<li>EX 8-6b. Viewing Scenarios</li>
						<li>EX 8-6c. Editing a Scenario</li>
						<li>EX 8-7. Creating Scenario Summary Reports</li>
						<li>Review. Session 8.2 Quick Check</li>
						<li>EX 8-8. Session 8.3 Visual Overview: Optimal Solutions with Solver</li>
						<li>EX 8-9. Optimizing a Product Mix</li>
						<li>EX 8-10. Finding the Optimal Solution with Solver</li>
						<li>EX 8-10a. Activating Solver</li>
						<li>EX 8-10b. Setting the Objective Cell and Variable Cells</li>
						<li>EX 8-10c. Adding Constraints to Solver</li>
						<li>EX 8-11. Exploring the Iterative Process</li>
						<li>EX 8-12. Creating a Solver Answer Report</li>
						<li>EX 8-13. Saving and Loading Solver Models</li>
						<li>Review. Session 8.3 Quick Check</li>
						<li>EX 8-14a. Practice: Review Assignments</li>
						<li>EX 8-14b. Apply: Case Problem 1</li>
						<li>EX 8-14c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 9. Exploring Financial Tools and Functions
					<ul>
						<li>EX 9-1. Session 9.1 Visual Overview: Loan and Investment Functions</li>
						<li>EX 9-2. Introducing Financial Functions</li>
						<li>EX 9-3. Calculating Borrowing Costs</li>
						<li>EX 9-3a. Calculating Payments with the PMT Function</li>
						<li>EX 9-3b. Calculating a Future Value with the FV Function</li>
						<li>EX 9-3c. Calculating the Payment Period with the NPER Function</li>
						<li>EX 9-3d. Calculating the Present Value with the PV Function</li>
						<li>EX 9-4. Creating an Amortization Schedule</li>
						<li>EX 9-4a. Calculating Interest and Principal Payments</li>
						<li>EX 9-4b. Calculating Cumulative Interest and Principal Payments</li>
						<li>Review. Session 9.1 Quick Check</li>
						<li>EX 9-5. Session 9.2 Visual Overview: Income Statements and Depreciation</li>
						<li>EX 9-6. Projecting Future Income and Expenses</li>
						<li>EX 9-6a. Exploring Linear and Growth Trends</li>
						<li>EX 9-6b. Interpolating from a Starting Value to an Ending Value</li>
						<li>EX 9-6c. Calculating the Cost of Goods Sold</li>
						<li>EX 9-6d. Extrapolating from a Series of Values</li>
						<li>EX 9-7. Calculating Depreciation of Assets</li>
						<li>EX 9-7a. Straight-Line Depreciation</li>
						<li>EX 9-7b. Declining Balance Depreciation</li>
						<li>EX 9-7c. Adding Depreciation to an Income Statement</li>
						<li>EX 9-8. Adding Taxes and Interest Expenses to an Income Statement</li>
						<li>Review. Session 9.2 Quick Check</li>
						<li>EX 9-9. Session 9.3 Visual Overview: NPV and IRR Functions and Auditing</li>
						<li>EX 9-10. Calculating Interest Rates with the RATE Function</li>
						<li>EX 9-11. Viewing the Payback Period of an Investment</li>
						<li>EX 9-12. Calculating Net Present Value</li>
						<li>EX 9-12a. The Time Value of Money</li>
						<li>EX 9-12b. Using the NPV Function</li>
						<li>EX 9-12c. Choosing a Rate of Return</li>
						<li>EX 9-13. Calculating the Internal Rate of Return</li>
						<li>EX 9-13a. Using the IRR Function</li>
						<li>EX 9-13b. Exploring the XNPV and XIRR Functions</li>
						<li>EX 9-14. Auditing a Workbook</li>
						<li>EX 9-14a. Tracing an Error</li>
						<li>EX 9-14b. Evaluating a Formula</li>
						<li>EX 9-14c. Using the Watch Window</li>
						<li>Review. Session 9.3 Quick Check</li>
						<li>EX 9-15a. Practice: Review Assignments</li>
						<li>EX 9-15b. Apply: Case Problem 1</li>
						<li>EX 9-15c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 10. Analyzing Data with Business Intelligence Tools
					<ul>
						<li>EX 10-1. Session 10.1 Visual Overview: Queries and Trendlines</li>
						<li>EX 10-2. Introducing Business Intelligence</li>
						<li>EX 10-3. Writing a Data Query</li>
						<li>EX 10-3a. Using Power Query</li>
						<li>EX 10-3b. Retrieving Data into an Excel Table</li>
						<li>EX 10-3c. Editing a Query</li>
						<li>EX 10-3d. Refreshing Query Data</li>
						<li>EX 10-4. Transforming Data with Queries</li>
						<li>EX 10-4a. Adding a New Column</li>
						<li>EX 10-4b. Grouping Values in a Query</li>
						<li>EX 10-5. Charting Trends</li>
						<li>EX 10-6. Creating a Forecast Sheet</li>
						<li>Review. Session 10.1 Quick Check</li>
						<li>EX 10-7. Session 10.2 Visual Overview: Power Pivot and the Data Model</li>
						<li>EX 10-8. Introducing Databases</li>
						<li>EX 10-8a. Relational Databases</li>
						<li>EX 10-8b. Querying an Access Database</li>
						<li>EX 10-9. Exploring the Data Model</li>
						<li>EX 10-10. Transforming Data with Power Pivot</li>
						<li>EX 10-10a. Exploring the Data Model in Diagram View</li>
						<li>EX 10-10b. Managing Table Relationships</li>
						<li>EX 10-11. Creating a PivotTable from the Data Model</li>
						<li>EX 10-11a. Tabulating across Fields from Multiple Tables</li>
						<li>EX 10-11b. Applying Slicers and Timelines from the Data Model</li>
						<li>Review. Session 10.2 Quick Check</li>
						<li>EX 10-12. Session 10.3 Visual Overview: Hierarchies and Maps</li>
						<li>EX 10-13. Working with Outlines and Hierarchies
							<ul>
								<li>EX 10-13a. Outlining a PivotTable by Nested Fields</li>
								<li>EX 10-13b. Drilling Down a Field Hierarchy</li>
								<li>EX 10-13c. Viewing Data with the Quick Explore Tool</li>
								<li>EX 10-14. Viewing Data with Map Charts</li>
								<li>EX 10-14a. Creating a Value Map Chart</li>
								<li>EX 10-14b. Formatting a Map Chart</li>
								<li>EX 10-14c. Visualizing Data with 3D Maps</li>
								<li>EX 10-14d. Choosing a Map Style</li>
								<li>EX 10-14e. Creating New Scenes</li>
								<li>EX 10-14f. Setting Scene Options</li>
								<li>EX 10-14g. Playing a Tour</li>
							</ul>
						</li>
						<li>Review. Session 10.3 Quick Check
							<ul>
								<li>EX 10-15a. Practice: Review Assignments</li>
								<li>EX 10-15b. Apply: Case Problem 1</li>
								<li>EX 10-15c. Challenge: Case Problem 2</li>
								</ul>
						</li>
						</ul>
					</li>
				<li>Excel Module 11. Exploring PivotTable Design
					<ul>
						<li>EX 11-1. Session 11.1 Visual Overview: Layouts, Sorting, Filtering, and Grouping</li>
						<li>EX 11-2. Laying Out a PivotTable
							<ul>
								<li>EX 11-2a. Working with Grand Totals and Subtotals</li>
								<li>EX 11-2b. Changing the PivotTable Layout</li>
							</ul>
						</li>
						<li>EX 11-3. Sorting a PivotTable
							<ul>
								<li>EX 11-3a. Manually Sorting a Field</li>
								<li>EX 11-3b. Sorting by Value</li>
								</ul>
						</li>
						<li>EX 11-4. Filtering a PivotTable</li>
						<li>EX 11-5. Grouping PivotTable Fields
							<ul>
								<li>EX 11-5a. Manual Grouping</li>
								<li>EX 11-5b. Grouping by Dates</li>
								<li>EX 11-5c. Grouping by Numeric Fields</li>
							</ul>
						</li>
						<li>Review. Session 11.1 Quick Check</li>
						<li>EX 11-6. Session 11.2 Visual Overview: Conditional Formats and Calculations</li>
						<li>EX 11-7. Calculations with PivotTables
							<ul>
								<li>EX 11-7a. Calculating Ranks</li>
								<li>EX 11-7b. Calculating Percent Differences</li>
							</ul>
						</li>
						<li>EX 11-8. Displaying PivotTables with Conditional Formats
							<ul>
								<li>EX 11-8a. Creating an Icon Set</li>
								<li>EX 11-8b. Working with Color Scales</li>
							</ul>
						</li>
						<li>EX 11-9. Exploring the PivotTable Cache
							<ul>
								<li>EX 11-9a. Sharing a Cache Between PivotTables</li>
								<li>EX 11-9b. Creating a New Cache</li>
								</ul>
						</li>
						<li>EX 11-10. Working with Calculated Items and Calculated Fields
							<ul>
								<li>EX 11-10a. Creating a Calculated Item</li>
								<li>EX 11-10b. Creating a Calculated Field</li>
								<li>EX 11-10c. Behind the Math of Calculated Items and Fields</li>
								</ul>
						</li>
						<li>Review. Session 11.2 Quick Check</li>
						<li>EX 11-11. Session 11.3 Visual Overview: PivotTable Measures</li>
						<li>EX 11-12. Introducing PivotTable Design under the Data Model</li>
						<li>EX 11-13. Calculating Distinct Counts</li>
						<li>EX 11-14. Creating a Measure
							<ul>
								<li>EX 11-14a. Introducing DAX</li>
								<li>EX 11-14b. Adding a Measure to a Table</li>
							</ul>
						</li>
						<li>EX 11-15. Calculating Measures across Tables and Rows
							<ul>
								<li>EX 11-15a. The RELATED Function</li>
								<li>EX 11-15b. The SUMX Function</li>
								</ul>
						</li>
						<li>EX 11-16. Retrieving PivotTable Data with GETPIVOTDATA</li>
						<li>EX 11-17. Exploring Database Functions</li>
						<li>Review. Session 11.3 Quick Check</li>
						<li>EX 11-18a. Practice: Review Assignments</li>
						<li>EX 11-18b. Apply: Case Problem 1</li>
						<li>EX 11-18c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Module 12. Developing an Excel Application
					<ul>
						<li>EX 12-1. Session 12.1 Visual Overview: WordArt and Funnel Charts</li>
						<li>EX 12-2. Planning an Excel Application</li>
						<li>EX 12-3. Creating a WordArt Graphic</li>
						<li>EX 12-4. Displaying Data with a Funnel Chart</li>
						<li>EX 12-5. Hiding Error Values with the IFERROR Function</li>
						<li>Review. Session 12.1 Quick Check</li>
						<li>EX 12-6. Session 12.2 Visual Overview: Data Validation and Workbook Protection</li>
						<li>EX 12-7. Validating Data Entry
							<ul>
								<li>EX 12-7a. Validating Dates</li>
								<li>EX 12-7b. Creating a Validation Error Message</li>
								<li>EX 12-7c. Creating an Input Message</li>
								<li>EX 12-7d. Validating against a List</li>
								<li>EX 12-7e. Creating a Custom Validation Rule</li>
								<li>EX 12-7f. Validating Data Already in the Workbook</li>
							</ul>
						</li>
						<li>EX 12-8. Hiding Workbook Content</li>
						<li>EX 12-9. Protecting Workbook Contents
							<ul>
								<li>EX 12-9a. Protecting a Worksheet</li>
								<li>EX 12-9b. Protecting a Workbook</li>
								<li>EX 12-9c. Unprotecting a Worksheet and a Workbook</li>
								<li>EX 12-9d. Locking and Unlocking Cells</li>
							</ul>
						</li>
						<li>Review. Session 12.2 Quick Check</li>
						<li>EX 12-10. Session 12.3 Visual Overview: Macros and Visual Basic for Applications</li>
						<li>EX 12-11. Loading the Excel Developer Tab</li>
						<li>EX 12-12. Automating Tasks with Macros
							<ul>
								<li>EX 12-12a. Recording a Macro</li>
								<li>EX 12-12b. Running a Macro</li>
								<li>EX 12-12c. Saving and Opening a Macro-Enabled Workbook</li>
							</ul>
						</li>
						<li>EX 12-13. Assigning Macros to Shapes and Buttons
							<ul>
								<li>EX 12-13a. Assigning a Macro to a Shape</li>
								<li>EX 12-13b. Assigning a Macro to a Button</li>
							</ul>
						</li>
						<li>EX 12-14. Working with the VBA Editor
							<ul>
								<li>EX 12-14a. Opening the VBA Editor</li>
								<li>EX 12-14b. Understanding Sub Procedures</li>
								<li>EX 12-14c. Editing a Macro with the VBA Editor</li>
							</ul>
						</li>
						<li>EX 12-15. Protecting against Macro Viruses
							<ul>
								<li>EX 12-15a. Macro Security Settings</li>
								<li>EX 12-15b. Adding a Digital Signature to a Workbook</li>
							</ul>
						</li>
						<li>Review. Session 12.3 Quick Check</li>
						<li>EX 12-16a. Practice: Review Assignments</li>
						<li>EX 12-16b. Apply: Case Problem 1</li>
						<li>EX 12-16c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Appendix A. Customizing Your Excel Workspace
					<ul>
						<li>EX A-1. Opening and Saving Workbooks Created in Earlier Versions of Excel</li>
						<li>EX A-2. Using Text Functions
							<ul>
								<li>EX A-2a. Using the LEN and LEFT Functions</li>
								<li>EX A-2b. Using the Paste Values Command</li>
								<li>EX A-2c. Using the PROPER Function and the CONCAT Function</li>
								<li>EX A-2d. Applying the Text to Columns Command</li>
								<li>EX A-2e. Using the UPPER Function to Convert Case</li>
								<li>EX A-2f. Using the SUBSTITUTE Function</li>
								<li>EX A-2g. Using Special Formats</li>
							</ul>
						</li>
						<li>EX A-3. Creating Custom Formats
							<ul>
								<li>EX A-3a. Creating a Custom Number Format</li>
								<li>EX A-3b. Creating a Custom Date Format</li>
							</ul>
						</li>
						<li>EX A-4. Creating a Custom Table Style</li>
						<li>EX A-5. Customizing Excel for Your Working Style</li>
						<li>EX A-6. Developing a Workbook for International Clients</li>
						<li>EX A-7. Using the Compatibility Checker
							<ul>
								<li>EX A-8a. Practice: Review Assignments</li>
								<li>EX A-8b. Apply: Case Problem 1</li>
								<li>EX A-8c. Challenge: Case Problem 2</li>
							</ul>
						</li>
						</ul>
					</li>
				<li>Excel Appendix B. Introducing Power BI
					<ul>
						<li>EX B-1. Working with Big Data</li>
						<li>EX B-2. Getting Started with Power BI
							<ul>
								<li>EX B-2a. Setting up the Power BI Service</li>
								<li>EX B-2b. Installing Power BI Desktop</li>
							</ul>
						</li>
						<li>EX B-3. Connecting to a CSV File</li>
						<li>EX B-4. Connecting to an Excel Workbook</li>
						<li>EX B-5. Connecting to an Access Database</li>
						<li>EX B-6. Defining Table Relationships in Power BI</li>
						<li>EX B-7. Analyzing Data with Power BI
							<ul>
								<li>EX B-7a. Creating a Visualization</li>
								<li>EX B-7b. Formatting a Visualization</li>
								<li>EX B-7c. Creating a Line Chart</li>
								<li>EX B-7d. Linking Power BI Visuals</li>
								<li>EX B-7e. Creating a Column Chart</li>
								<li>EX B-7f. Changing a Measure</li>
								<li>EX B-7g. Adding a Slicer</li>
								<li>EX B-7h. Drilling Into Data</li>
							</ul>
						</li>
						<li>EX B-8. Working with Report Pages</li>
						<li>EX B-9. Publishing a Power BI Report</li>
						<li>EX B-10a. Practice: Review Assignments</li>
						<li>EX B-10b. Apply: Case Problem 1</li>
						<li>EX B-10c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				<li>Excel Appendix C. Collaborating with Your Team
					<ul>
						<li>EX C-1. Adding Notes and Comments to a Workbook
							<ul>
								<li>EX C-1a. Viewing Notes in a Workbook</li>
								<li>EX C-1b. Deleting Workbook Notes</li>
								<li>EX C-1c. Adding New Notes to a Workbook</li>
							</ul>
						</li>
						<li>EX C-2. Sharing a Workbook with Multiple Users
							<ul>
								<li>EX C-2a. Sharing Workbooks on OneDrive</li>
								<li>EX C-2b. Viewing a Workbook on the Web</li>
								<li>EX C-2c. Exploring the Sharing and Tracking Tools</li>
							</ul>
						</li>
						<li>EX C-3. Working with Pictures and SmartArt Graphics
							<ul>
								<li>EX C-3a. Adding Text to a SmartArt Graphic</li>
								<li>EX C-3b. Applying SmartArt Styles</li>
								<li>EX C-3c. Inserting and Editing Pictures</li>
								<li>EX C-3d. Using the Imaging Tools</li>
							</ul>
						</li>
						<li>EX C-4. Preparing the Final Workbook
							<ul>
								<li>EX C-4a. Setting Document Properties</li>
								<li>EX C-4b. Inspecting a Workbook</li>
								<li>EX C-4c. Protecting a Workbook</li>
								<li>EX C-4d. Marking a Workbook as Final</li>
							</ul>
						</li>
						<li>EX C-5. Signing Off on a Workbook</li>
						<li>EX C-6. Integrating Excel with Other Office Applications
							<ul>
								<li>EX C-6a. Object Linking and Embedding</li>
							</ul>
						</li>
						<li>EX C-7a. Practice: Review Assignments</li>
						<li>EX C-7b. Apply: Case Problem 1</li>
						<li>EX C-7c. Challenge: Case Problem 2</li>
						</ul>
					</li>
				</ul>
		</li>
		<li>PowerPoint
			<ul>
				<li>PowerPoint Concepts. Planning, Developing, and Giving a Presentation
				<ul>
					<li>PPT CON-1. Session 1 Visual Overview: Planning a Presentation</li>
					<li>PPT CON-2. Understanding Presentations and Presentation Media</li>
					<li>PPT CON-3. Planning a Presentation</li>
					<li>PPT CON-4. Determining the Form of the Presentation</li>
					<li>PPT CON-5. Determining the Presentation’s Purposes and Desired Outcomes</li>
					<li>PPT CON-5a. Determining the Purposes</li>
					<li>PPT CON-5b. Identifying Desired Outcomes</li>
					<li>PPT CON-6. Analyzing Your Audience’s Needs and Expectations</li>
					<li>Review. Session 1 Quick Check</li>
					<li>PPT CON-7. Session 2 Visual Overview: Creating a Presentation</li>
					<li>PPT CON-8. Creating the Presentation</li>
					<li>PPT CON-9. Focusing Your Presentation</li>
					<li>PPT CON-10. Identifying Your Key Points</li>
					<li>PPT CON-11. Developing an Introduction</li>
					<li>PPT CON-11a. Gaining Your Audience’s Attention</li>
					<li>PPT CON-11b. Providing an Overview of Your Presentation</li>
					<li>PPT CON-12. Developing the Body of Your Presentation</li>
					<li>PPT CON-12a. Gathering Information</li>
					<li>PPT CON-12b. Evaluating Information</li>
					<li>PPT CON-12c. Organizing Your Information</li>
					<li>PPT CON-12d. Developing Your Conclusion</li>
					<li>PPT CON-13. Creating Visuals</li>
					<li>PPT CON-13a. Using Text as Visuals</li>
					<li>PPT CON-13b. Using Graphics as Visuals</li>
					<li>PPT CON-14. Creating Handouts</li>
					<li>Review. Session 2 Quick Check</li>
					<li>PPT CON-15. Session 3 Visual Overview: Delivering a Presentation</li>
					<li>PPT CON-16. Preparing for the Delivery of an Oral Presentation</li>
					<li>PPT CON-17. Choosing a Delivery Method</li>
					<li>PPT CON-18. Preparing for Audience Interaction</li>
					<li>PPT CON-18a. Anticipating Audience Questions</li>
					<li>PPT CON-18b. Preparing for Audience Participation</li>
					<li>PPT CON-19. Rehearsing the Presentation</li>
					<li>PPT CON-19a. Connecting to Your Audience</li>
					<li>PPT CON-19b. Referring to Visuals during Your Presentation</li>
					<li>PPT CON-20. Evaluating Your Appearance</li>
					<li>PPT CON-21. Setting up for Your Presentation</li>
					<li>PPT CON-21a. Preparing Copies of Your Content</li>
					<li>PPT CON-21b. Assessing the Technology and Staff Available</li>
					<li>PPT CON-21c. Becoming Familiar with the Setup</li>
					<li>PPT CON-21d. Identifying Other Needed Supplies</li>
					<li>PPT CON-22. Evaluating Your Performance</li>
					<li>Review. Session 3 Quick Check</li>
					<li>PPT CON-23a. Practice: Review Assignments</li>
					</ul>
				<li>PowerPoint Module 1. Creating a Presentation
					<ul>
						<li>PPT 1-1. Session 1.1 Visual Overview: The PowerPoint Window</li>
						<li>PPT 1-2. Planning a Presentation</li>
						<li>PPT 1-3. Starting PowerPoint and Creating a New Presentation</li>
						<li>PPT 1-3a. Working in Touch Mode</li>
						<li>PPT 1-4. Creating a Title Slide</li>
						<li>PPT 1-5. Saving and Editing a Presentation</li>
						<li>PPT 1-6. Adding New Slides</li>
						<li>PPT 1-7. Creating Lists</li>
						<li>PPT 1-7a. Creating a Bulleted List</li>
						<li>PPT 1-7b. Creating a Numbered List</li>
						<li>PPT 1-7c. Creating an Unnumbered List</li>
						<li>PPT 1-8. Formatting Text</li>
						<li>PPT 1-9. Moving and Copying</li>
						<li>PPT 1-10. Manipulating Slides</li>
						<li>PPT 1-11. Changing the Theme</li>
						<li>PPT 1-12. Closing a Presentation</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>PPT 1-13. Session 1.2 Visual Overview: Slide Show and Presenter Views</li>
						<li>PPT 1-14. Opening a Presentation and Saving It with a New Name</li>
						<li>PPT 1-15. Inserting Pictures and Adding Alt Text</li>
						<li>PPT 1-16. Cropping Pictures</li>
						<li>PPT 1-17. Resizing and Moving Objects</li>
						<li>PPT 1-18. Compressing Pictures</li>
						<li>PPT 1-19. Converting a List to a SmartArt Graphic</li>
						<li>PPT 1-20. Adding Speaker Notes</li>
						<li>PPT 1-21. Editing Common File Properties</li>
						<li>PPT 1-22. Checking Spelling</li>
						<li>PPT 1-23. Running a Slide Show</li>
						<li>PPT 1-24. Printing a Presentation</li>
						<li>PPT 1-25. Closing PowerPoint</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>PPT 1-26a. Practice: Review Assignments</li>
						<li>PPT 1-26b. Apply: Case Problem 1</li>
						<li>PPT 1-26c. Create: Case Problem 2</li>
					</ul>
					</li>
				<li>PowerPoint Module 2. Adding Media and Special Effects
					<ul>
						<li>PPT 2-1. Session 2.1 Visual Overview: Formatting Graphics</li>
						<li>PPT 2-2. Applying a Theme Used in Another Presentation</li>
						<li>PPT 2-3. Inserting Shapes</li>
						<li>PPT 2-4. Formatting Objects</li>
						<li>PPT 2-4a. Formatting Shapes</li>
						<li>PPT 2-4b. Formatting Pictures</li>
						<li>PPT 2-5. Duplicating Objects</li>
						<li>PPT 2-6. Rotating and Flipping Objects</li>
						<li>PPT 2-7. Creating and Formatting a Table</li>
						<li>PPT 2-7a. Creating a Table and Adding Data to It</li>
						<li>PPT 2-7b. Inserting and Deleting Rows and Columns</li>
						<li>PPT 2-7c. Formatting a Table</li>
						<li>PPT 2-7d. Filling Cells with Pictures</li>
						<li>PPT 2-8. Inserting Symbols</li>
						<li>PPT 2-9. Adding Footers and Headers</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>PPT 2-10. Session 2.2 Visual Overview: Using Animations and Transitions</li>
						<li>PPT 2-11. Applying Transitions</li>
						<li>PPT 2-12. Applying Animations</li>
						<li>PPT 2-12a. Animating Objects</li>
						<li>PPT 2-12b. Changing How an Animation Starts</li>
						<li>PPT 2-12c. Animating Lists</li>
						<li>PPT 2-13. Using the Morph Transition</li>
						<li>PPT 2-14. Adding and Modifying Video</li>
						<li>PPT 2-14a. Adding Video to Slides</li>
						<li>PPT 2-14b. Trimming Videos</li>
						<li>PPT 2-14c. Setting a Poster Frame</li>
						<li>PPT 2-14d. Modifying Video Playback Options</li>
						<li>PPT 2-14e. Understanding Animation Effects Applied to Videos</li>
						<li>PPT 2-15. Compressing Media</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>PPT 2-16a. Practice: Review Assignments</li>
						<li>PPT 2-16b. Apply: Case Problem 1</li>
						<li>PPT 2-16c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>PowerPoint Module 3. Applying Advanced Formatting to Objects
					<ul>
						<li>PPT 3-1. Session 3.1 Visual Overview: Creating a Chart on a Slide</li>
						<li>PPT 3-2. Working with SmartArt Graphics</li>
						<li>PPT 3-2a. Creating a SmartArt Graphic</li>
						<li>PPT 3-2b. Changing the Appearance of a SmartArt Graphic</li>
						<li>PPT 3-2c. Animating a SmartArt Graphic</li>
						<li>PPT 3-3. Adding Audio to Slides</li>
						<li>PPT 3-4. Adding a Chart to a Slide</li>
						<li>PPT 3-4a. Creating a Chart</li>
						<li>PPT 3-4b. Modifying a Chart</li>
						<li>PPT 3-5. Inserting and Formatting Text Boxes</li>
						<li>PPT 3-6. Applying WordArt Styles to Text</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>PPT 3-7. Session 3.2 Visual Overview: Formatting Shapes and Pictures</li>
						<li>PPT 3-8. Removing the Background from Pictures</li>
						<li>PPT 3-9. Editing Pictures</li>
						<li>PPT 3-10. Creating a Custom Shape</li>
						<li>PPT 3-11. Rotating Shapes with Text</li>
						<li>PPT 3-12. Applying Advanced Formatting to Shapes</li>
						<li>PPT 3-13. Making Presentations Accessible</li>
						<li>PPT 3-13a. Checking for Accessibility Issues</li>
						<li>PPT 3-13b. Checking the Order Objects Will Be Read by a Screen Reader</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>PPT 3-14a. Practice: Review Assignments</li>
						<li>PPT 3-14b. Apply: Case Problem 1</li>
						<li>PPT 3-14c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>PowerPoint Module 4. Advanced Animations and Distributing Presentations
					<ul>
						<li>PPT 4-1. Session 4.1 Visual Overview: Understanding Advanced Animations</li>
						<li>PPT 4-2. Using Guides</li>
						<li>PPT 4-3. Adding More than One Animation to an Object</li>
						<li>PPT 4-4. Using the Animation Pane</li>
						<li>PPT 4-5. Setting Animation Triggers</li>
						<li>PPT 4-6. Changing the Slide Background</li>
						<li>PPT 4-7. Creating and Editing Links</li>
						<li>PPT 4-7a. Creating and Editing Text Links</li>
						<li>PPT 4-7b. Changing the Color of Text Links</li>
						<li>PPT 4-7c. Creating Object Links</li>
						<li>PPT 4-7d. Inserting Action Buttons</li>
						<li>PPT 4-8. Creating Slide Zooms</li>
						<li>PPT 4-8a. Creating Slide Zooms</li>
						<li>PPT 4-8b. Modifying Slide Zooms</li>
						<li>PPT 4-9. Hiding a Slide</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>PPT 4-10. Session 4.2 Visual Overview: Automatic Slide Timings</li>
						<li>PPT 4-11. Creating Self-Running Presentations</li>
						<li>PPT 4-11a. Setting Slide Timings Manually</li>
						<li>PPT 4-11b. Rehearsing Timings</li>
						<li>PPT 4-11c. Recording a Slide Show</li>
						<li>PPT 4-11d. Applying Kiosk Browsing</li>
						<li>PPT 4-12. Using the Document Inspector</li>
						<li>PPT 4-13. Saving a Presentation in Other Formats</li>
						<li>PPT 4-13a. Saving a Presentation as a Video</li>
						<li>PPT 4-13b. Saving Slides as Pictures and a Presentation as a Picture Presentation</li>
						<li>PPT 4-13c. Save a Presentation as a PDF</li>
						<li>PPT 4-13d. Save a Presentation as a PowerPoint Show</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>PPT 4-14a. Practice: Review Assignments</li>
						<li>PPT 4-14b. Apply: Case Problem 1</li>
						<li>PPT 4-14c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>PowerPoint Module 5. Integrating PowerPoint with Other Programs
					<ul>
						<li>PPT 5-1. Session 5.1 Visual Overview: Understanding Layers</li>
						<li>PPT 5-2. Creating a Presentation by Importing Content</li>
						<li>PPT 5-2a. Creating a Presentation by Inserting a Word Outline</li>
						<li>PPT 5-2b. Inserting Slides from Another Presentation</li>
						<li>PPT 5-3. Working in Outline View</li>
						<li>PPT 5-4. Organizing a Presentation Using Sections and Zooms</li>
						<li>PPT 5-4a. Creating Sections in a Presentation</li>
						<li>PPT 5-4b. Creating Section Zooms and a Summary Zoom</li>
						<li>PPT 5-4c. Manipulating Sections</li>
						<li>PPT 5-5. Inserting Icons</li>
						<li>PPT 5-6. Using the Effect Options Dialog Box to Modify Animations</li>
						<li>PPT 5-7. Working with Layers</li>
						<li>Review. Session 5.1 Quick Check</li>
						<li>PPT 5-8. Session 5.2 Visual Overview: Importing, Embedding, and Linking</li>
						<li>PPT 5-9. Inserting a Word Table</li>
						<li>PPT 5-10. Formatting Cells in Tables</li>
						<li>PPT 5-11. Inserting Excel Data and Objects</li>
						<li>PPT 5-11a. Embedding an Excel Worksheet</li>
						<li>PPT 5-11b. Linking an Excel Chart</li>
						<li>PPT 5-12. Breaking Links</li>
						<li>PPT 5-13. Annotating Slides during a Slide Show</li>
						<li>PPT 5-14. Creating Handouts by Exporting a Presentation to Word</li>
						<li>Review. Session 5.2 Quick Check</li>
						<li>PPT 5-15a. Practice: Review Assignments</li>
						<li>PPT 5-15b. Apply: Case Problem 1</li>
						<li>PPT 5-15c. Troubleshoot: Case Problem 2</li>
					</ul>
				</li>
				<li>PowerPoint Module 6. Customizing Presentations and the PowerPoint Environment
					<ul>
						<li>PPT 6-1. Session 6.1 Visual Overview: Slide Master View</li>
						<li>PPT 6-2. Sharing and Collaborating with Others</li>
						<li>PPT 6-2a. Comparing Presentations</li>
						<li>PPT 6-2b. Working with Comments</li>
						<li>PPT 6-3. Working in Slide Master View</li>
						<li>PPT 6-3a. Modifying the Slide Master</li>
						<li>PPT 6-3b. Modifying the Style of Lists</li>
						<li>PPT 6-3c. Creating Slide Layouts</li>
						<li>PPT 6-3d. Modifying a Slide Layout</li>
						<li>PPT 6-4. Changing Theme Fonts and Colors</li>
						<li>PPT 6-5. Filling Text and Shapes with a Color Used on the Slide</li>
						<li>PPT 6-6. Saving a Presentation as a Custom Theme</li>
						<li>Review. Session 6.1 Quick Check</li>
						<li>PPT 6-7. Session 6.2 Visual Overview: Advanced File Properties</li>
						<li>PPT 6-8. Creating a Custom Show</li>
						<li>PPT 6-9. Working with File Properties</li>
						<li>PPT 6-10. Encrypting a Presentation</li>
						<li>PPT 6-11. Making a Presentation Read-Only</li>
						<li>PPT 6-12. Presenting Online</li>
						<li>Review. Session 6.2 Quick Check</li>
						<li>PPT 6-13a. Practice: Review Assignments</li>
						<li>PPT 6-13b. Apply: Case Problem 1</li>
						<li>PPT 6-13c. Create: Case Problem 2</li>
					</ul>
				</li>
				</ul>
		</li>
		<li>Access
			<ul>
				<li>Access Module 1. Creating a Database
					<ul>
						<li>AC 1-1. Session 1.1 Visual Overview: The Access Window</li>
						<li>AC 1-2. Introduction to Database Concepts</li>
						<li>AC 1-2a. Organizing Data</li>
						<li>AC 1-2b. Databases and Relationships</li>
						<li>AC 1-2c. Relational Database Management Systems</li>
						<li>AC 1-3. Starting Access and Creating a Database</li>
						<li>AC 1-3a. Working in Touch Mode</li>
						<li>AC 1-4. Creating a Table in Datasheet View</li>
						<li>AC 1-4a. Renaming the Default Primary Key Field</li>
						<li>AC 1-4b. Changing the Data Type of the Default Primary Key Field</li>
						<li>AC 1-4c. Adding New Fields</li>
						<li>AC 1-4d. Saving the Visit Table Structure</li>
						<li>AC 1-5. Creating a Table in Design View</li>
						<li>AC 1-5a. Defining Fields</li>
						<li>AC 1-5b. Specifying the Primary Key</li>
						<li>AC 1-5c. Renaming Fields in Design View</li>
						<li>AC 1-5d. Saving the Billing Table Structure</li>
						<li>AC 1-6. Closing a Table and Exiting Access</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>AC 1-7. Session 1.2 Visual Overview: The Create Tab Options</li>
						<li>AC 1-8. Entering Data into Tables</li>
						<li>AC 1-9. Copying Records from Another Access Database</li>
						<li>AC 1-10. Navigating a Datasheet</li>
						<li>AC 1-11. Creating a Simple Query</li>
						<li>AC 1-12. Creating a Simple Form</li>
						<li>AC 1-13. Creating a Simple Report</li>
						<li>AC 1-13a. Printing a Report</li>
						<li>AC 1-14. Viewing Objects in the Navigation Pane</li>
						<li>AC 1-15. Using Microsoft Access Help</li>
						<li>AC 1-16. Managing a Database</li>
						<li>AC 1-16a. Compacting and Repairing a Database</li>
						<li>AC 1-16b. Backing Up and Restoring a Database</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>AC 1-17a. Practice: Review Assignments</li>
						<li>AC 1-17b. Apply: Case Problem 1</li>
						<li>AC 1-17c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 2. Building a Database and Defining Table Relationships
					<ul>
						<li>AC 2-1. Session 2.1 Visual Overview: Table Window in Design View</li>
						<li>AC 2-2. Guidelines for Designing Databases</li>
						<li>AC 2-3. Guidelines for Setting Field Properties</li>
						<li>AC 2-3a. Naming Fields and Objects</li>
						<li>AC 2-3b. Assigning Field Data Types</li>
						<li>AC 2-3c. Setting Field Sizes</li>
						<li>AC 2-3d. Setting the Caption Property for Fields</li>
						<li>AC 2-4. Modifying a Table in Design View</li>
						<li>AC 2-4a. Saving the Table Structure</li>
						<li>AC 2-5. Modifying the Structure of an Access Table</li>
						<li>AC 2-5a. Moving a Field in Design View</li>
						<li>AC 2-5b. Adding a Field in Design View</li>
						<li>AC 2-6. Modifying Field Properties</li>
						<li>AC 2-6a. Changing the Format Property in Datasheet View</li>
						<li>AC 2-6b. Changing Properties in Design View</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>AC 2-7. Session 2.2 Visual Overview: Understanding Table Relationships</li>
						<li>AC 2-8. Adding Records to a New Table</li>
						<li>AC 2-9. Importing Data from an Excel Worksheet</li>
						<li>AC 2-10. Creating a Table by Importing an Existing Table or Table Structure</li>
						<li>AC 2-11. Adding Fields to a Table Using the Data Type Gallery</li>
						<li>AC 2-12. Modifying the Structure of an Imported Table</li>
						<li>AC 2-12a. Deleting Fields from a Table Structure</li>
						<li>AC 2-12b. Renaming Fields in Design View</li>
						<li>AC 2-12c. Changing the Data Type for a Field in Design View</li>
						<li>AC 2-13. Setting the Default Value Property for a Field</li>
						<li>AC 2-14. Adding Data to a Table by Importing a Text File</li>
						<li>AC 2-15. Defining Table Relationships</li>
						<li>AC 2-15a. One-to-Many Relationships</li>
						<li>AC 2-15b. Referential Integrity</li>
						<li>AC 2-15c. Defining a Relationship between Two Tables</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>AC 2-16a. Practice: Review Assignments</li>
						<li>AC 2-16b. Apply: Case Problem 1</li>
						<li>AC 2-16c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 3. Maintaining and Querying a Database
					<ul>
						<li>AC 3-1. Session 3.1 Visual Overview: Query Window in Design View</li>
						<li>AC 3-2. Updating a Database</li>
						<li>AC 3-2a. Modifying Records</li>
						<li>AC 3-2b. Hiding and Unhiding Fields</li>
						<li>AC 3-2c. Finding Data in a Table</li>
						<li>AC 3-2d. Deleting Records</li>
						<li>AC 3-3. Introduction to Queries</li>
						<li>AC 3-4. Creating and Running a Query</li>
						<li>AC 3-5. Updating Data Using a Query</li>
						<li>AC 3-6. Creating a Multitable Query</li>
						<li>AC 3-7. Sorting Data in a Query</li>
						<li>AC 3-7a. Using an AutoFilter to Sort Data</li>
						<li>AC 3-7b. Sorting on Multiple Fields in Design View</li>
						<li>AC 3-8. Filtering Data</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>AC 3-9. Session 3.2 Visual Overview: Selection Criteria in Queries</li>
						<li>AC 3-10. Defining Record Selection Criteria for Queries</li>
						<li>AC 3-10a. Specifying an Exact Match</li>
						<li>AC 3-10b. Modifying a Query</li>
						<li>AC 3-10c. Using a Comparison Operator to Match a Range of Values</li>
						<li>AC 3-11. Defining Multiple Selection Criteria for Queries</li>
						<li>AC 3-11a. The and Logical Operator</li>
						<li>AC 3-11b. The or Logical Operator</li>
						<li>AC 3-12. Changing a Datasheet’s Appearance</li>
						<li>AC 3-12a. Modifying the Font Size</li>
						<li>AC 3-12b. Changing the Alternate Row Color in a Datasheet</li>
						<li>AC 3-13. Creating a Calculated Field</li>
						<li>AC 3-13a. Formatting a Calculated Field</li>
						<li>AC 3-14. Using Aggregate Functions</li>
						<li>AC 3-14a. Working with Aggregate Functions Using the Total Row</li>
						<li>AC 3-14b. Creating Queries with Aggregate Functions</li>
						<li>AC 3-14c. Using Record Group Calculations</li>
						<li>AC 3-15. Working with the Navigation Pane</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>AC 3-16a. Practice: Review Assignments</li>
						<li>AC 3-16b. Apply: Case Problem 1</li>
						<li>AC 3-16c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 4. Creating Forms and Reports
					<ul>
						<li>AC 4-1. Session 4.1 Visual Overview: Form Displayed in Form View</li>
						<li>AC 4-2. Creating a Form Using the Form Wizard</li>
						<li>AC 4-3. Modifying a Form’s Design in Layout View</li>
						<li>AC 4-3a. Applying a Theme to a Database Object</li>
						<li>AC 4-3b. Adding a Picture to a Form</li>
						<li>AC 4-3c. Changing the Color of Text on a Form</li>
						<li>AC 4-4. Navigating a Form</li>
						<li>AC 4-5. Finding Data Using a Form</li>
						<li>AC 4-6. Maintaining Table Data Using a Form</li>
						<li>AC 4-7. Previewing and Printing Selected Form Records</li>
						<li>AC 4-8. Creating a Form with a Main Form and a Subform</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>AC 4-9. Session 4.2 Visual Overview: Report Displayed in Print Preview</li>
						<li>AC 4-10. Creating a Report Using the Report Wizard</li>
						<li>AC 4-11. Modifying a Report’s Design in Layout View</li>
						<li>AC 4-11a. Applying a Theme to a Report</li>
						<li>AC 4-11b. Changing the Alignment of Field Values</li>
						<li>AC 4-11c. Moving and Resizing Fields on a Report</li>
						<li>AC 4-11d. Changing the Font Color and Inserting a Picture in a Report</li>
						<li>AC 4-12. Using Conditional Formatting in a Report</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>AC 4-13a. Practice: Review Assignments</li>
						<li>AC 4-13b. Apply: Case Problem 1</li>
						<li>AC 4-13c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 5. Creating Advanced Queries and Enhancing Table Design
					<ul>
						<li>AC 5-1. Session 5.1 Visual Overview: Calculated Field</li>
						<li>AC 5-2. Reviewing the Clinic Database</li>
						<li>AC 5-3. Using a Pattern Match in a Query</li>
						<li>AC 5-4. Using a List-of-Values Match in a Query</li>
						<li>AC 5-5. Using the Not Logical Operator in a Query</li>
						<li>AC 5-5a. Using an AutoFilter to Filter Data</li>
						<li>AC 5-6. Assigning a Conditional Value to a Calculated Field</li>
						<li>AC 5-7. Creating a Parameter Query</li>
						<li>AC 5-7a. Creating a More Flexible Parameter Query</li>
						<li>Review. Session 5.1 Quick Check</li>
						<li>AC 5-8. Session 5.2 Visual Overview: Advanced Query Wizards</li>
						<li>AC 5-9. Creating a Crosstab Query</li>
						<li>AC 5-10. Creating a Find Duplicates Query</li>
						<li>AC 5-11. Creating a Find Unmatched Query</li>
						<li>AC 5-12. Creating a Top Values Query</li>
						<li>Review. Session 5.2 Quick Check</li>
						<li>AC 5-13. Session 5.3 Visual Overview: Lookup Fields and Input Masks</li>
						<li>AC 5-14. Creating a Lookup Field</li>
						<li>AC 5-15. Using the Input Mask Wizard</li>
						<li>AC 5-16. Identifying Object Dependencies</li>
						<li>AC 5-17. Defining Data Validation Rules</li>
						<li>AC 5-17a. Defining Field Validation Rules</li>
						<li>AC 5-17b. Defining Table Validation Rules</li>
						<li>AC 5-18. Working with Long Text Fields</li>
						<li>AC 5-19. Designating a Trusted Folder</li>
						<li>Review. Session 5.3 Quick Check</li>
						<li>AC 5-20a. Practice: Review Assignments</li>
						<li>AC 5-20b. Apply: Case Problem 1</li>
						<li>AC 5-20c. Troubleshoot: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 6. Using Form Tools and Creating Custom Forms
					<ul>
						<li>AC 6-1. Session 6.1 Visual Overview: Anchoring Controls</li>
						<li>AC 6-2. Designing Forms</li>
						<li>AC 6-2a. Changing a Lookup Field to a Short Text field</li>
						<li>AC 6-3. Creating a Relationship Report and Using the Documenter</li>
						<li>AC 6-4. Creating Forms Using Form Tools</li>
						<li>AC 6-4a. Creating a Form Using the Datasheet Tool</li>
						<li>AC 6-4b. Creating a Form Using the Multiple Items Tool</li>
						<li>AC 6-4c. Creating a Form Using the Split Form Tool</li>
						<li>AC 6-4d. Modifying a Split Form in Layout View</li>
						<li>AC 6-4e. Anchoring Controls in a Form</li>
						<li>Review. Session 6.1 Quick Check</li>
						<li>AC 6-5. Session 6.2 Visual Overview: Custom Form in Design View</li>
						<li>AC 6-6. Planning and Designing a Custom Form</li>
						<li>AC 6-7. Creating a Custom Form in Design View</li>
						<li>AC 6-7a. Working in the Form Window in Design View</li>
						<li>AC 6-7b. Adding Fields to a Form</li>
						<li>AC 6-8. Selecting, Moving, and Aligning Form Controls</li>
						<li>AC 6-9. Resizing and Deleting Controls</li>
						<li>AC 6-10. Adding a Combo Box Control to a Form</li>
						<li>AC 6-11. Using Form Headers and Form Footers</li>
						<li>AC 6-11a. Adding a Title to a Form</li>
						<li>Review. Session 6.2 Quick Check</li>
						<li>AC 6-12. Session 6.3 Visual Overview: Custom Form in Form View</li>
						<li>AC 6-13. Adding a Combo Box to Find Records</li>
						<li>AC 6-14. Adding a Subform to a Form</li>
						<li>AC 6-15. Displaying a Subform’s Calculated Controls in the Main Form</li>
						<li>AC 6-15a. Adding Calculated Controls to a Subform’s Form Footer Section</li>
						<li>AC 6-15b. Adding Calculated Controls to a Main Form</li>
						<li>AC 6-15c. Resizing, Moving, and Formatting Calculated Controls</li>
						<li>AC 6-16. Changing the Tab Order in a Form</li>
						<li>AC 6-17. Improving a Form’s Appearance</li>
						<li>AC 6-17a. Adding a Line to a Form</li>
						<li>AC 6-17b. Adding a Rectangle to a Form</li>
						<li>AC 6-17c. Modifying the Visual Effects of the Controls in a Form</li>
						<li>Review. Session 6.3 Quick Check</li>
						<li>AC 6-18a. Practice: Review Assignments</li>
						<li>AC 6-18b. Apply: Case Problem 1</li>
						<li>AC 6-18c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 7. Creating Custom Reports
					<ul>
						<li>AC 7-1. Session 7.1 Visual Overview: Report Sections</li>
						<li>AC 7-2. Customizing Existing Reports</li>
						<li>AC 7-3. Viewing a Report in Report View</li>
						<li>AC 7-3a. Copying and Pasting a Report into Word</li>
						<li>AC 7-4. Modifying a Report in Layout View</li>
						<li>AC 7-5. Modifying a Report in Design View</li>
						<li>AC 7-6. Review: Session 7.1 Quick Check</li>
						<li>AC 7-7. Session 7.2 Visual Overview: Form in Design View and Print Preview</li>
						<li>AC 7-8. Planning and Designing a Custom Report</li>
						<li>AC 7-9. Creating a Query for a Custom Report</li>
						<li>AC 7-10. Creating a Custom Report</li>
						<li>AC 7-10a. Sorting and Grouping Data in a Report</li>
						<li>AC 7-11. Working with Controls in Design View</li>
						<li>AC 7-12. Hiding Duplicate Values in a Report</li>
						<li>AC 7-13. Review: Session 7.2 Quick Check</li>
						<li>AC 7-14. Session 7.3 Visual Overview: Custom Form in Design View</li>
						<li>AC 7-15. Understanding Page Header and Page Footer Sections</li>
						<li>AC 7-15a. Adding the Date to a Report</li>
						<li>AC 7-15b. Adding Page Numbers to a Report</li>
						<li>AC 7-15c. Adding a Report Title to a Page Header Section</li>
						<li>AC 7-16. Creating Mailing Labels</li>
						<li>AC 7-17. Review: Session 7.3 Quick Check</li>
						<li>AC 7-18a. Practice: Review Assignments</li>
						<li>AC 7-18b. Apply: Case Problem 1</li>
						<li>AC 7-18c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 8. Sharing, Integrating, and Analyzing Data
					<ul>
						<li>AC 8-1. Session 8.1 Visual Overview: Exporting Data to XML and HTML</li>
						<li>AC 8-2. Exporting an Access Query to an HTML Document</li>
						<li>AC 8-2a. Viewing an HTML Document in a Web Browser</li>
						<li>AC 8-3. Importing a CSV File as an Access Table</li>
						<li>AC 8-3a. Analyzing a Table with the Table Analyzer</li>
						<li>AC 8-4. Working with XML Files</li>
						<li>AC 8-4a. Importing Data from an XML File</li>
						<li>AC 8-4b. Saving and Running Import Specifications</li>
						<li>AC 8-4c. Exporting an Access Table as an XML File</li>
						<li>AC 8-4d. Saving and Running Export Specifications</li>
						<li>Review. Session 8.1 Quick Check</li>
						<li>AC 8-5. Session 8.2 Visual Overview: Tabbed Control with a Chart</li>
						<li>AC 8-6. Using a Tab Control in a Form</li>
						<li>AC 8-7. Creating a Chart Using the Chart Wizard</li>
						<li>AC 8-8. Using Templates and Application Parts</li>
						<li>AC 8-9. Exporting a Report to a PDF File</li>
						<li>AC 8-10. Integrating Access with Other Applications</li>
						<li>AC 8-10a. Linking Data from an Excel Worksheet</li>
						<li>Review. Session 8.2 Quick Check</li>
						<li>AC 8-11a. Practice: Review Assignments</li>
						<li>AC 8-11b. Apply: Case Problem 1</li>
						<li>AC 8-11c. Create: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 9. Using Action Queries and Advanced Table Relationships
					<ul>
						<li>AC 9-1. Session 9.1 Visual Overview: Action Queries</li>
						<li>AC 9-2. Action Queries</li>
						<li>AC 9-2a. Creating a Make-Table Query</li>
						<li>AC 9-2b. Creating an Append Query</li>
						<li>AC 9-2c. Creating a Delete Query</li>
						<li>AC 9-2d. Creating an Update Query</li>
						<li>Review. Session 9.1 Quick Check</li>
						<li>AC 9-3. Session 9.2 Visual Overview: Many-to-Many Relationship</li>
						<li>AC 9-4. Understanding Types of Table Relationships</li>
						<li>AC 9-4a. Many-to-Many Relationships</li>
						<li>AC 9-4b. One-to-One Relationships</li>
						<li>AC 9-5. Defining M:N and 1:1 Relationships between Tables</li>
						<li>AC 9-6. Understanding Join Types</li>
						<li>AC 9-6a. Inner and Outer Joins</li>
						<li>AC 9-6b. Self-Joins</li>
						<li>AC 9-7. Using Indexes for Table Fields</li>
						<li>AC 9-7a. Creating an Index</li>
						<li>Review. Session 9.2 Quick Check</li>
						<li>AC 9-8a. Practice: Review Assignments</li>
						<li>AC 9-8b. Apply: Case Problem 1</li>
						<li>AC 9-8c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 10. Automating Tasks with Macros
					<ul>
						<li>AC 10-1. Session 10.1 Visual Overview: The Macro Designer Window</li>
						<li>AC 10-2. Introduction to Macros</li>
						<li>AC 10-3. Running a Macro</li>
						<li>AC 10-4. Viewing a Macro in the Macro Designer</li>
						<li>AC 10-4a. Using Arguments in a Macro</li>
						<li>AC 10-5. Adding Actions to a Macro</li>
						<li>AC 10-6. Single Stepping a Macro</li>
						<li>AC 10-7. Using a Command Button with an Attached Macro</li>
						<li>AC 10-7a. Understanding Events</li>
						<li>AC 10-7b. Understanding Submacros</li>
						<li>AC 10-8. Adding a Submacro</li>
						<li>AC 10-9. Adding a Command Button to a Form</li>
						<li>AC 10-10. Attaching a Submacro to a Command Button</li>
						<li>Review. Session 10.1 Quick Check</li>
						<li>AC 10-11. Session 10.2 Visual Overview: A Navigation Form</li>
						<li>AC 10-12. Designing a User Interface</li>
						<li>AC 10-13. Creating an Unbound Form</li>
						<li>AC 10-14. Adding a List Box Control to a Form</li>
						<li>AC 10-15. Introduction to SQL</li>
						<li>AC 10-15a. Viewing a SQL Statement for a Query</li>
						<li>AC 10-15b. Using a SQL Statement for a List Box Control</li>
						<li>AC 10-16. Creating Multiple Macros for a Form</li>
						<li>AC 10-17. Creating a Navigation Form</li>
						<li>AC 10-18. Review Session 10.2 Quick Check</li>
						<li>AC 10-19a. Practice: Review Assignments</li>
						<li>AC 10-19b. Apply: Case Problem 1</li>
						<li>AC 10-19c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 11. Using and Writing Visual Basic for Applications Code
					<ul>
						<li>AC 11-1. Session 11.1 Visual Overview: VBA Code Window</li>
						<li>AC 11-2. Introduction to Visual Basic for Applications</li>
						<li>AC 11-2a. Understanding Procedures</li>
						<li>AC 11-2b. Understanding Modules</li>
						<li>AC 11-3. Using an Existing VBA Procedure</li>
						<li>AC 11-3a. Examining a VBA Event Procedure</li>
						<li>AC 11-3b. Modifying an Event Procedure</li>
						<li>AC 11-4. Creating Functions in a Standard Module</li>
						<li>AC 11-4a. Creating a Function</li>
						<li>AC 11-5. Testing a Procedure in the Immediate Window</li>
						<li>Review. Session 11.1 Quick Check</li>
						<li>AC 11-6. Session 11.2 Visual Overview: Example of an Event Procedure</li>
						<li>AC 11-7. Understanding How an Event Procedure Processes Commands</li>
						<li>AC 11-8. Adding an Event Procedure</li>
						<li>AC 11-8a. Compiling Modules</li>
						<li>AC 11-8b. Testing an Event Procedure</li>
						<li>AC 11-9. Adding a Second Procedure to a Class Module</li>
						<li>AC 11-9a. Designing the Field Validation Procedure</li>
						<li>AC 11-9b. Adding a Field Value Event Procedure</li>
						<li>AC 11-10. Adding an Event Procedure to Change the Case of a Field Value</li>
						<li>AC 11-11. Hiding a Control and Changing a Control’s Color</li>
						<li>Review. Session 11.2 Quick Check</li>
						<li>AC 11-12a. Practice: Review Assignments</li>
						<li>AC 11-12b. Apply: Case Problem 1</li>
						<li>AC 11-12c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Module 12. Managing and Securing a Database
					<ul>
						<li>AC 12-1. Session 12.1 Visual Overview: Multivalued Fields and Subqueries</li>
						<li>AC 12-2. Additional Filtering Options</li>
						<li>AC 12-2a. Filter by Form</li>
						<li>AC 12-2b. Saving a Filter as a Query</li>
						<li>AC 12-3. Creating a Subquery</li>
						<li>AC 12-4. Using Multivalued Fields</li>
						<li>Review. Session 12.1 Quick Check</li>
						<li>AC 12-5. Session 12.2 Visual Overview: Database Options</li>
						<li>AC 12-6. Creating an Attachment Field</li>
						<li>AC 12-7. Using an AutoNumber Field</li>
						<li>AC 12-8. Saving an Access Database as a Previous Version</li>
						<li>AC 12-9. Analyzing Database Performance with the Performance Analyzer</li>
						<li>AC 12-10. Linking Tables between Databases</li>
						<li>AC 12-11. Using the Database Splitter</li>
						<li>AC 12-12. Securing an Access Database</li>
						<li>AC 12-13. Setting the Database Startup Options</li>
						<li>Review. Session 12.2 Quick Check</li>
						<li>AC 12-14a. Practice: Review Assignments</li>
						<li>AC 12-14b. Apply: Case Problem 1</li>
						<li>AC 12-14c. Challenge: Case Problem 2</li>
					</ul>
				</li>
				<li>Access Appendix A. Relational Databases and Database Design
					<ul>
						<li>APP A-1. Tables</li>
						<li>APP A-2. Keys</li>
						<li>APP A-3. Relationships</li>
						<li>APP A-3a. One-To-Many Relationship</li>
						<li>APP A-3b. Many-To-Many Relationship</li>
						<li>APP A-3c. One-To-One Relationship</li>
						<li>APP A-3d. Entity Subtype</li>
						<li>APP A-4. Entity-Relationship Diagrams</li>
						<li>APP A-5. Integrity Constraints</li>
						<li>APP A-6. Dependencies and Determinants</li>
						<li>APP A-7. Anomalies</li>
						<li>APP A-8. Normalization</li>
						<li>APP A-8a. First Normal Form</li>
						<li>APP A-8b. Second Normal Form</li>
						<li>APP A-8c. Third Normal Form</li>
						<li>APP A-9. Natural, Artificial, and Surrogate Keys</li>
						<li>APP A-10. Microsoft Access Naming Conventions</li>
						<li>APP A-11a. Practice: Review Assignments</li>
					</ul>
				</li>
			</ul>
		</li>
		<li>Outlook
			<ul>
				<li>Outlook Module 1. Managing Email Messages with Outlook
					<ul>
						<li>OUT 1-1. What Is Outlook?</li>
						<li>OUT 1-2. Project: Composing and Sending Email Messages</li>
						<li>OUT 1-2a. To Start Outlook</li>
						<li>OUT 1-3. Setting Up Outlook</li>
						<li>OUT 1-3a. Parts of an Email Address</li>
						<li>OUT 1-3b. The Navigation Pane and Navigation Bar</li>
						<li>OUT 1-3c. To Open an Outlook Data File</li>
						<li>OUT 1-3d. To Set the Sensitivity Level for All New Messages</li>
						<li>OUT 1-4. Composing and Sending Email Messages</li>
						<li>OUT 1-4a. To Compose an Email Message</li>
						<li>OUT 1-4b. To Apply a Theme</li>
						<li>OUT 1-4c. To Send an Email Message</li>
						<li>OUT 1-4d. How Email Messages Travel from Sender to Receiver</li>
						<li>OUT 1-5. Working with Incoming Messages</li>
						<li>OUT 1-5a. To View an Email Message in the Reading Pane</li>
						<li>OUT 1-5b. To Open, Listen to, and Translate an Email Message in a Window</li>
						<li>OUT 1-5c. Opening Attachments</li>
						<li>OUT 1-5d. To Preview and Save an Attachment</li>
						<li>OUT 1-5e. To Open an Attachment</li>
						<li>OUT 1-5f. To Print an Email Message</li>
						<li>OUT 1-6. Responding to Messages
							<ul>
								<li>OUT 1-6a. To Reply to an Email Message</li>
								<li>OUT 1-6b. Message Formats</li>
								<li>OUT 1-6c. To Change the Message Format</li>
								<li>OUT 1-6d. Checking Spelling and Grammar</li>
								<li>OUT 1-6e. To Check the Spelling of a Correctly Typed Word</li>
								<li>OUT 1-6f. To Check the Spelling of Misspelled Text</li>
								<li>OUT 1-6g. Saving and Closing an Email Message</li>
								<li>OUT 1-6h. To Save and Close an Email Message without Sending It</li>
								<li>OUT 1-6i. To Open a Saved Email Message</li>
								<li>OUT 1-6j. To Attach a File to an Email Message</li>
								<li>OUT 1-6k. To Set Message Importance and Send the Message</li>
								<li>OUT 1-6l. To Forward an Email Message and Add a Dictated Message</li>
							</ul>
						</li>
						<li>OUT 1-7. Organizing Messages with Outlook Folders
							<ul>
								<li>OUT 1-7a. To Create a New Folder in the Inbox Folder</li>
								<li>OUT 1-7b. To Move an Email Message to a Folder</li>
								<li>OUT 1-7c. Outlook Quick Steps</li>
								<li>OUT 1-7d. To Move an Email Message Using Quick Steps</li>
								<li>OUT 1-7e. To Delete an Email Message</li>
								<li>OUT 1-7f. Working with the Mailbox</li>
								<li>OUT 1-7g. To View Mailbox Size</li>
								<li>OUT 1-7h. To Save a Mailbox and Exit Outlook</li>
							</ul>
						</li>
						<li>OUT 1-8a. Summary</li>
						<li>OUT 1-8b. Apply Your Knowledge</li>
						<li>OUT 1-8c. Extend Your Knowledge</li>
						<li>OUT 1-8d. Expand Your World</li>
						<li>OUT 1-8e. In the Lab</li>
						</ul>
					</li>
				<li>Outlook Module 2. Managing Calendars with Outlook
					<ul>
						<li>OUT 2-1. Introduction to the Outlook Calendar</li>
						<li>OUT 2-2. Project: Appointments, Events, and Meetings in Calendar</li>
						<li>OUT 2-2a. Configuring the Outlook Calendar</li>
						<li>OUT 2-2b. Using the Calendar Window</li>
						<li>OUT 2-2c. Identifying Calendar Items</li>
						<li>OUT 2-2d. Navigating the Calendar</li>
						<li>OUT 2-3. Creating and Editing Appointments</li>
						<li>OUT 2-3a. Creating Appointments in the Appointment Area</li>
						<li>OUT 2-3b. Organizing the Calendar with Color Categories</li>
						<li>OUT 2-3c. Creating Appointments Using the Appointment Window</li>
						<li>OUT 2-3d. Setting Appointment Options</li>
						<li>OUT 2-3e. Creating Recurring Appointments</li>
						<li>OUT 2-3f. Creating a Teams Meeting</li>
						<li>OUT 2-3g. Using Natural Language Phrasing</li>
						<li>OUT 2-3h. Editing Appointments</li>
						<li>OUT 2-4. Scheduling Events</li>
						<li>OUT 2-4a. To Create a One-Time Event in the Appointment Window</li>
						<li>OUT 2-4b. To Delete a One-Time Event</li>
						<li>OUT 2-4c. To Create a Recurring Event Using the Appointment Window</li>
						<li>OUT 2-4d. To Move a Recurring Event to a Different Day</li>
						<li>OUT 2-5. Scheduling Meetings</li>
						<li>OUT 2-5a. To Import an iCalendar File</li>
						<li>OUT 2-5b. To View Calendars in the Overlay Mode</li>
						<li>OUT 2-5c. To View and Dock the Peek Calendar</li>
						<li>OUT 2-5d. To Create and Send a Meeting Request</li>
						<li>OUT 2-5e. To Change the Time of a Meeting and Send an Update</li>
						<li>OUT 2-5f. To Reply to a Meeting Request</li>
						<li>OUT 2-6. Printing Calendars in Different Views</li>
						<li>OUT 2-6a. To Print the Calendar in Weekly Calendar Style</li>
						<li>OUT 2-6b. To Change the Calendar View to List View</li>
						<li>OUT 2-6c. To Print the Calendar in List View</li>
						<li>OUT 2-7. Saving and Sharing the Calendar</li>
						<li>OUT 2-7a. To Save a Calendar as an iCalendar File</li>
						<li>OUT 2-7b. To Share a Calendar</li>
						<li>OUT 2-8a. Summary</li>
						<li>OUT 2-8b. Apply Your Knowledge</li>
						<li>OUT 2-8c. Extend Your Knowledge</li>
						<li>OUT 2-8d. Expand Your World</li>
						<li>OUT 2-8e. In the Lab</li>
						</ul>
					</li>
				<li>Outlook Module 3. Managing Contacts and Personal Contact Information with Outlook
					<ul>
						<li>OUT 3-1. Introduction to Outlook Contacts</li>
						<li>OUT 3-2. Project: Contact List with Groups</li>
						<li>OUT 3-2a. Creating a Contact List</li>
						<li>OUT 3-2b. Contacts Window</li>
						<li>OUT 3-2c. To Create a New Contact</li>
						<li>OUT 3-2d. To Create Contacts from Email Messages</li>
						<li>OUT 3-3. Editing a Contact</li>
						<li>OUT 3-3a. To Edit a Contact</li>
						<li>OUT 3-3b. To Delete a Contact</li>
						<li>OUT 3-3c. To Add an Attachment to a Contact</li>
						<li>OUT 3-3d. To Remove an Attachment from a Contact</li>
						<li>OUT 3-4. Viewing and Sorting a Contact List</li>
						<li>OUT 3-4a. To Change the Current View</li>
						<li>OUT 3-4b. To Sort Contacts</li>
						<li>OUT 3-5. Using Search to Find a Contact</li>
						<li>OUT 3-5a. To Find a Contact by Searching for Text</li>
						<li>OUT 3-5b. To Refine an Advanced Search</li>
						<li>OUT 3-5c. To Find a Contact from Any Outlook Window</li>
						<li>OUT 3-6. Creating and Editing a Contact Group</li>
						<li>OUT 3-6a. To Create a Contact Group from Existing Contacts</li>
						<li>OUT 3-6b. To Create a Contact Group from an Existing Email Message</li>
						<li>OUT 3-6c. To Add a Name to a Contact Group</li>
						<li>OUT 3-6d. To Add Notes to a Contact Group</li>
						<li>OUT 3-6d. To Remove a Name from a Contact Group</li>
						<li>OUT 3-7. Printing Your Contacts</li>
						<li>OUT 3-7a. To Preview a Contact List</li>
						<li>OUT 3-7b. To Print a Contact List and Export an Outlook Data File</li>
						<li>OUT 3-8a. Summary</li>
						<li>OUT 3-8b. Apply Your Knowledge</li>
						<li>OUT 3-8c. Extend Your Knowledge</li>
						<li>OUT 3-8d. Expand Your World</li>
						<li>OUT 3-8e. In the Lab</li>
						</ul>
					</li>
				<li>Outlook Module 4. Creating and Managing Tasks with Outlook
					<ul>
						<li>OUT 4-1. Project: Managing Tasks</li>
						<li>OUT 4-1a. Creating a Task</li>
						<li>OUT 4-1b. To-Do List Window</li>
						<li>OUT 4-1c. Creating a To-Do List</li>
						<li>OUT 4-2. Categorizing Tasks</li>
						<li>OUT 4-2a. To Create a New Category</li>
						<li>OUT 4-2b. To Categorize a Task</li>
						<li>OUT 4-2c. To Categorize Multiple Tasks</li>
						<li>OUT 4-2d. To Categorize Remaining Tasks</li>
						<li>OUT 4-2e. To Rename a Category</li>
						<li>OUT 4-2f. To Set a Quick Click</li>
						<li>OUT 4-3. Categorizing Email Messages</li>
						<li>OUT 4-3a. To Categorize an Email Message</li>
						<li>OUT 4-4. Managing Tasks
							<ul>
								<li>OUT 4-4a. To Update a Task</li>
								<li>OUT 4-4b. To Attach a File to a Task</li>
								<li>OUT 4-4c. To Assign a Task</li>
								<li>OUT 4-4d. To Forward a Task</li>
								<li>OUT 4-4e. To Send a Status Report</li>
								<li>OUT 4-4f. To Mark a Task Complete</li>
								<li>OUT 4-4g. To Remove a Task</li>
							</ul>
						</li>
						<li>OUT 4-5. Choosing Display and Print Views</li>
						<li>OUT 4-5a. To Change the Task View</li>
						<li>OUT 4-5b. To Print Tasks</li>
						<li>OUT 4-6. Using Notes</li>
						<li>OUT 4-6a. To Create a Note</li>
						<li>OUT 4-6b. To Change the Notes View</li>
						<li>OUT 4-6c. To Delete a Note</li>
						<li>OUT 4-7a. Summary</li>
						<li>OUT 4-7b. Apply Your Knowledge</li>
						<li>OUT 4-7c. Extend Your Knowledge</li>
						<li>OUT 4-7d. Expand Your World</li>
						<li>OUT 4-7e. In the Lab</li>
						</ul>
					</li>
				<li>Outlook Module 5. Customizing Outlook
					<ul>
						<li>OUT 5-1. Introduction to Customizing Outlook</li>
						<li>OUT 5-2. Project: Adding a New Email Account and Customizing Options</li>
						<li>OUT 5-3. Adding New Email Accounts</li>
						<li>To Add an Email Account</li>
						<li>OUT 5-4. Customizing Email Messages
							<ul>
								<li>OUT 5-4a. To Add a Link to an Email Message</li>
								<li>OUT 5-4b. To Create and Insert Quick Parts</li>
								<li>OUT 5-4c. To Insert an Image into an Email Message</li>
								<li>OUT 5-4d. To Search Using Advanced Search</li>
								<li>OUT 5-4e. To Create a New Search Folder</li>
								<li>OUT 5-4f. To Display Outlook Options</li>
								<li>OUT 5-4g. To Set the Message Format</li>
							</ul>
						</li>
						<li>OUT 5-5. Creating Signatures and Stationery
							<ul>
								<li>OUT 5-5a. To Create an Email Signature</li>
								<li>OUT 5-5b. To Format an Email Signature</li>
								<li>OUT 5-5c. To Add an Image to an Email Signature</li>
								<li>OUT 5-5d. To Configure Signature Options</li>
								<li>OUT 5-5e. To Customize Stationery</li>
								<li>OUT 5-5f. To Preview Message Changes</li>
								<li>OUT 5-5g. To Assign Signatures to a Single Email Message</li>
								<li>OUT 5-5h. To Add a Domain to the Safe Senders List</li>
								<li>OUT 5-5i. To Block a Specific Email Address</li>
								<li>OUT 5-5j. To Create a New Rule</li>
								<li>OUT 5-5k. To Run Rules</li>
								<li>OUT 5-5l. To Delete a Rule</li>
								<li>OUT 5-5m. To Set AutoArchive Settings</li>
							</ul>
						</li>
						<li>OUT 5-6. Customizing the Calendar</li>
						<li>OUT 5-6a. To Change the Work Time on the Calendar</li>
						<li>OUT 5-6b. To Change the Time for Calendar Reminders</li>
						<li>OUT 5-6c. To Change the Time Zone Setting</li>
						<li>OUT 5-6d. To Subscribe to an RSS Feed</li>
						<li>OUT 5-6e. To Delete an RSS Feed</li>
						<li>OUT 5-6f. To Reset the Time Zone Setting</li>
						<li>OUT 5-7a. Summary</li>
						<li>OUT 5-7b. Apply Your Knowledge</li>
						<li>OUT 5-7c. Extend Your Knowledge</li>
						<li>OUT 5-7d. Expand Your World: Cloud and Web Technologies</li>
						<li>OUT 5-7e. In the Labs</li>
						</ul>
					</li>
				</ul>
		</li>
		<li>Embracing Change
			<ul>
				<li>Module 1. Getting Started with Technology
					<ul>
						<li>Introduction</li>
						<li>Using a Computer</li>
						<li>Device Types</li>
						<li>Operating Systems</li>
						<li>Keyboards</li>
						<li>Mice</li>
						<li>Touchpads</li>
						<li>Touchscreens</li>
						<li>Accessing Applications</li>
						<li>Browsers and the Internet</li>
						<li>Installed Applications</li>
						<li>Installing Office Applications</li>
						<li>Office License Options</li>
						<li>Exploring Popular Office Applications</li>
						<li>Word</li>
						<li>Excel</li>
						<li>PowerPoint</li>
						<li>Access</li>
						<li>Teams</li>
						<li>OneDrive</li>
						<li>Working with Changes in Applications</li>
						<li>Updates to Applications</li>
						<li>Use a Search Engine</li>
						<li>Teach Yourself New Skills</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Reflection Question</li>
						<li>Rubric for Reflection Assignment</li>
						</ul>
					</li>
				<li>Module 2. Embracing Change in Word
					<ul>
						<li>Launching Word</li>
						<li>To Open Word in Windows</li>
						<li>To Open Word in macOS</li>
						<li>To Discover Your Version of Word</li>
						<li>Touring the Word Window</li>
						<li>Work Area and Status Bar</li>
						<li>Ribbons and Toolbars</li>
						<li>To Save a File</li>
						<li>Installed Word vs. Word Online</li>
						<li>Updating Your Word Skills</li>
						<li>To Update Word</li>
						<li>Recent Changes</li>
						<li>Handling Changes to Word</li>
						<li>Using Word Accessibility Features</li>
						<li>To Use the Dictation Tool in Word</li>
						<li>To Use the Read Aloud Tool in Word</li>
						<li>To Check a Document’s Accessibility</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Reflection Question</li>
						<li>Rubric for Reflection Assignment</li>
						</ul>
					</li>
				<li>Module 3. Embracing Change in Excel
					<ul>
						<li>Launching Excel</li>
						<li>To Open Excel in Windows</li>
						<li>To Open Excel in macOS</li>
						<li>To Discover Your Version of Excel</li>
						<li>Touring the Excel Window</li>
						<li>Work Area and Status Bar</li>
						<li>Ribbons and Toolbars</li>
						<li>To Save a File</li>
						<li>Installed Excel vs. Excel Online</li>
						<li>Updating Your Excel Skills</li>
						<li>To Update Excel</li>
						<li>Recent Changes</li>
						<li>Handling Changes to Excel</li>
						<li>Using Excel Accessibility Features</li>
						<li>To Check a Workbook’s Accessibility</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Reflection Question</li>
						<li>Rubric for Reflection Assignment</li>
						</ul>
					</li>
				<li>Module 4. Embracing Change in Access
					<ul>
						<li>Launching Access</li>
						<li>To Open Access in Windows</li>
						<li>To Use Access on a Remote Computer in macOS</li>
						<li>To Discover Your Version of Access</li>
						<li>Touring the Access Window</li>
						<li>Object Display Area and Status Bar</li>
						<li>Ribbons and Toolbars</li>
						<li>To Save an Object</li>
						<li>Updating Your Access Skills</li>
						<li>To Update Access</li>
						<li>Recent Changes</li>
						<li>Handling Changes to Access</li>
						<li>Using Access Accessibility Features</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Reflection Question</li>
						<li>Rubric for Reflection Assignment</li>
						</ul>
					</li>
				<li>Module 5. Embracing Change in PowerPoint
					<ul>
						<li>Launching PowerPoint</li>
						<li>To Open PowerPoint in Windows</li>
						<li>To Open PowerPoint in macOS</li>
						<li>To Discover Your Version of PowerPoint</li>
						<li>Touring the PowerPoint Window</li>
						<li>Work Area and Status Bar</li>
						<li>Ribbons and Toolbars</li>
						<li>To Save a File</li>
						<li>Installed PowerPoint vs. PowerPoint Online</li>
						<li>Updating Your PowerPoint Skills</li>
						<li>To Update PowerPoint</li>
						<li>Recent Changes</li>
						<li>Handling Changes to PowerPoint</li>
						<li>Using PowerPoint Accessibility Features</li>
						<li>To Use the Dictation Tool in PowerPoint</li>
						<li>To Use Subtitles in PowerPoint</li>
						<li>To Check a Presentation’s Accessibility</li>
						<li>Summary</li>
						<li>Review Questions</li>
						<li>Reflection Question</li>
						<li>Rubric for Reflection Assignment</li>
						</ul>
					</li>
				</ul>
		</li>
		<li>Career Readiness
			<ul>
				<li>Career Readiness. Creating Your Resume, Launching Your Career
					<ul>
						<li>CR 1. Phase 1—Collecting Information</li>
						<li>CR 1a. Research Job Postings of Interest</li>
						<li>CR 1b. Identify Relevant Skills</li>
						<li>CR 1c. Collect Your Experience Details</li>
						<li>CR 1d. Choose a Resume Template</li>
						<li>CR 2. Phase 2—Creating Your Resume Document</li>
						<li>CR 2a. Enter Details</li>
						<li>CR 2b. Fine-Tune Your Design</li>
						<li>CR 2c. Finish Your Resume Package</li>
						<li>CR 3. Phase 3—Creating a Professional Presence Online</li>
						<li>CR 3a. Create a Professional Online Profile</li>
						<li>CR 4. Phase 4—Distributing Your Information</li>
						<li>CR 4a. Share Your Resume</li>
						<li>CR 5. Phase 5—Preparing for Interviews</li>
						<li>CR 5a. Plan for the Interview</li>
						<li>CR 6a. Summary</li>
						</ul>
					</li>
				</ul>
		</li>
		<li>MacOS Instructions and Projects
			<ul>
				<li>MacOS Monterey
				<ul>
					<li>1-1. Introduction to macOS Monterey</li>
					<li>1-2. Accessing the Web</li>
					<li>1-3. Managing Files and Folders</li>
					<li>1-4. Managing macOS Monterey</li>
					<li>1-5. Installing Apps</li>
					<li>1-6. Ending a macOS Monterey Session</li>
				</ul>
				<li>Mac EX Intro Module 1. Introduction to Excel for Mac
					<ul>
						<li>Mac EX 1-1. What Is Excel?</li>
						<li>Mac EX 1-2. Starting and Using Excel</li>
						<li>Mac EX 1-3. Working with a Workbook</li>
						<li>Mac EX 1-4. Saving and Printing Files</li>
						<li>Summary</li>
						<li>Mac Excel Module 1. Getting Started with Excel for Mac</li>
						<li>Mac EX 1-1. Session 1.1 Visual Overview: The Word Window</li>
						<li>Mac EX 1-2. Introducing Excel and Spreadsheets</li>
						<li>Mac EX 1-3. Exploring a Workbook</li>
						<li>Mac EX 1-4. Closing a Workbook</li>
						<li>Mac EX 1-5. Planning a Workbook</li>
						<li>Mac EX 1-6. Starting a New Workbook</li>
						<li>Mac EX 1-7. Entering Text, Dates, and Numbers</li>
						<li>Mac EX 1-8. Resizing Columns and Rows</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>Mac EX 1-9. Session 1.2 Visual Overview: Excel Formulas and Functions</li>
						<li>Mac EX 1-10. Calculating with Formulas</li>
						<li>Mac EX 1-11. Calculating with Functions</li>
						<li>Mac EX 1-12. Modifying a Worksheet</li>
						<li>Mac EX 1-13. Using the COUNT Function</li>
						<li>Mac EX 1-14. Modifying Rows and Columns</li>
						<li>Mac EX 1-15. Using Flash Fill</li>
						<li>Mac EX 1-16. Formatting a Worksheet</li>
						<li>Mac EX 1-17. Printing a Workbook</li>
						<li>Mac EX 1-18. Viewing Worksheet Formulas</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>Mac EX 1-19a. Practice: Review Assignments</li>
						<li>Mac EX 1-19b. Apply: Case Problem 1</li>
						<li>Mac EX 1-19c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Excel Module 2. Formatting Workbook Text and Data for Mac
					<ul>
						<li>Mac EX 2-1. Session 2.1 Visual Overview: Formatting a Worksheet</li>
						<li>Mac EX 2-2. Formatting Cell Text</li>
						<li>Mac EX 2-3. Working with Fill Colors and Backgrounds</li>
						<li>Mac EX 2-4. Using Functions and Formulas with Sales Data</li>
						<li>Mac EX 2-5. Formatting Numbers</li>
						<li>Mac EX 2-6. Formatting Worksheet Cells</li>
						<li>Mac EX 2-7. Exploring the Format Cells Dialog Box</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>Mac EX 2-8. Session 2.2 Visual Overview: Designing a Printout</li>
						<li>Mac EX 2-9. Calculating Averages</li>
						<li>Mac EX 2-10. Applying Cell Styles</li>
						<li>Mac EX 2-11. Copying and Pasting Formats</li>
						<li>Mac EX 2-12. Finding and Replacing Text and Formats</li>
						<li>Mac EX 2-13. Working with Themes</li>
						<li>Mac EX 2-14. Highlighting Data with Conditional Formats</li>
						<li>Mac EX 2-15. Formatting a Worksheet for Printing</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>Mac EX 2-16a. Practice: Review Assignments</li>
						<li>Mac EX 2-16b. Apply: Case Problem 1</li>
						<li>Mac EX 2-16c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Excel Module 3. Performing Calculations with Formulas and Functions for Mac
					<ul>
						<li>Mac EX 3-1. Session 3.1 Visual Overview: Formulas and Functions</li>
						<li>Mac EX 3-2. Designing a Workbook for Calculations</li>
						<li>Mac EX 3-3. Calculating with Dates and Times</li>
						<li>Mac EX 3-4. AutoFilling Formulas and Data Patterns</li>
						<li>Mac EX 3-5. Applying Excel Functions</li>
						<li>Mac EX 3-6. Interpreting Error Values</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>Mac EX 3-7. Session 3.2 Visual Overview: Lookup Tables and Logical Functions</li>
						<li>Mac EX 3-8. Calculating Running Totals</li>
						<li>Mac EX 3-9. Exploring Cell References</li>
						<li>Mac EX 3-10. Working with the IF Logical Function</li>
						<li>Mac EX 3-11. Formatting Input, Calculated, and Output Values</li>
						<li>Mac EX 3-12. Looking Up Data</li>
						<li>Mac EX 3-13. Performing What-If Analyses with Formulas and Functions</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>Mac EX 3-14a. Practice: Review Assignments</li>
						<li>Mac EX 3-14b. Apply: Case Problem 1</li>
						<li>Mac EX 3-14c. Challenge: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Excel Module 4. Analyzing and Charting Financial Data for Mac
					<ul>
						<li>Mac EX 4-1. Session 4.1 Visual Overview: Chart Elements</li>
						<li>Mac EX 4-2. Getting Started with Excel Charts</li>
						<li>Mac EX 4-3. Creating a Pie Chart</li>
						<li>Mac EX 4-4. Working with Chart Elements</li>
						<li>Mac EX 4-5. Performing What-If Analyses with Charts</li>
						<li>Mac EX 4-6. Creating a Column Chart</li>
						<li>Mac EX 4-7. Creating a Line Chart</li>
						<li>Mac EX 4-8. Creating a Combination Chart</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>Mac EX 4-9. Session 4.2 Visual Overview: Scatter Charts, Data Bars, and Sparklines</li>
						<li>Mac EX 4-10. Creating a Scatter Chart</li>
						<li>Mac EX 4-11. Editing the Chart Data Source</li>
						<li>Mac EX 4-12. Adding Graphic Objects to a Workbook</li>
						<li>Mac EX 4-13. Exploring Other Chart Types</li>
						<li>Mac EX 4-14. Creating Data Bars</li>
						<li>Mac EX 4-15. Creating Sparklines</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>Mac EX 4-16a. Practice: Review Assignments</li>
						<li>Mac EX 4-16b. Apply: Case Problem 1</li>
						<li>Mac EX 4-16c. Challenge: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac PPT Intro Module 1. Introduction to PowerPoint for Mac
					<ul>
						<li>Mac PT 1-1. What Is PowerPoint?</li>
						<li>Mac PT 1-2. Starting and Using PowerPoint</li>
						<li>Mac PT 1-3. Working with a Presentation</li>
						<li>Mac PT 1-4. Saving and Printing Files</li>
						<li>Summary</li>
						</ul>
				</li>
				<li>Mac PowerPoint Module 1. Creating a Presentation for Mac
					<ul>
						<li>Mac PPT 1-1. Session 1.1 Visual Overview: The PowerPoint Window</li>
						<li>Mac PPT 1-2. Planning a Presentation</li>
						<li>Mac PPT 1-3. Starting PowerPoint and Creating a New Presentation</li>
						<li>Mac PPT 1-4. Creating a Title Slide</li>
						<li>Mac PPT 1-5. Saving and Editing a Presentation</li>
						<li>Mac PPT 1-6. Adding New Slides</li>
						<li>Mac PPT 1-7. Creating Lists</li>
						<li>Mac PPT 1-8. Formatting Text</li>
						<li>Mac PPT 1-9. Moving and Copying</li>
						<li>Mac PPT 1-10. Manipulating Slides</li>
						<li>Mac PPT 1-11. Changing the Theme</li>
						<li>Mac PPT 1-12. Closing a Presentation</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>Mac PPT 1-13. Session 1.2 Visual Overview: Slide Show and Presenter Views</li>
						<li>Mac PPT 1-14. Opening a Presentation and Saving It with a New Name</li>
						<li>Mac PPT 1-15. Inserting Pictures and Adding Alt Text</li>
						<li>Mac PPT 1-16. Cropping Pictures</li>
						<li>Mac PPT 1-17. Resizing and Moving Objects</li>
						<li>Mac PPT 1-18. Compressing Pictures</li>
						<li>Mac PPT 1-19. Converting a List to a SmartArt Graphic</li>
						<li>Mac PPT 1-20. Adding Speaker Notes</li>
						<li>Mac PPT 1-21. Editing Common File Properties</li>
						<li>Mac PPT 1-22. Checking Spelling</li>
						<li>Mac PPT 1-23. Running a Slide Show</li>
						<li>Mac PPT 1-24. Printing a Presentation</li>
						<li>Mac PPT 1-25. Closing PowerPoint</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>Mac PPT 1-26a. Practice: Review Assignments</li>
						<li>Mac PPT 1-26b. Apply: Case Problem 1</li>
						<li>Mac PPT 1-26c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac PowerPoint Module 2. Adding Media and Special Effects for Mac
					<ul>
						<li>Mac PPT 2-1. Session 2.1 Visual Overview: Formatting Graphics</li>
						<li>Mac PPT 2-2. Applying a Theme Used in Another Presentation</li>
						<li>Mac PPT 2-3. Inserting Shapes</li>
						<li>Mac PPT 2-4. Formatting Objects</li>
						<li>Mac PPT 2-5. Duplicating Objects</li>
						<li>Mac PPT 2-6. Rotating and Flipping Objects</li>
						<li>Mac PPT 2-7. Creating and Formatting a Table</li>
						<li>Mac PPT 2-8. Inserting Symbols</li>
						<li>Mac PPT 2-9. Adding Footers and Headers</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>Mac PPT 2-10. Session 2.2 Visual Overview: Using Animations and Transitions</li>
						<li>Mac PPT 2-11. Applying Transitions</li>
						<li>Mac PPT 2-12. Applying Animations</li>
						<li>Mac PPT 2-13. Using the Morph Transition</li>
						<li>Mac PPT 2-14. Adding and Modifying Video</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>Mac PPT 2-15a. Practice: Review Assignments</li>
						<li>Mac PPT 2-15b. Apply: Case Problem 1</li>
						<li>Mac PPT 2-15c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac WD Intro Module 1. Introduction to Word for Mac
					<ul>
						<li>Mac WD 1-1. What Is Word?</li>
						<li>Mac WD 1-2. Starting and Using Word</li>
						<li>Mac WD 1-3. Working with a Document</li>
						<li>Mac WD 1-4. Using the Menu Bar</li>
						<li>Mac WD 1-5. Saving and Printing Files</li>
						<li>Summary</li>
						</ul>
				</li>
				<li>Mac Word Module 1. Creating and Editing a Document for Mac
					<ul>
						<li>Mac WD 1-1. Session 1.1 Visual Overview: The Word Window</li>
						<li>Mac WD 1-2. Starting Word</li>
						<li>Mac WD 1-3. Setting Up the Word Window</li>
						<li>Mac WD 1-4. Saving a Document</li>
						<li>Mac WD 1-5. Entering Text</li>
						<li>Mac WD 1-6. Using the Undo and Redo Buttons</li>
						<li>Mac WD 1-7. Correcting Errors as You Type</li>
						<li>Mac WD 1-8. Proofreading a Document</li>
						<li>Mac WD 1-9. Adjusting Paragraph and Line Spacing</li>
						<li>Mac WD 1-10. Adjusting the Margins</li>
						<li>Mac WD 1-11. Previewing and Printing a Document</li>
						<li>Mac WD 1-12. Creating an Envelope</li>
						<li>Review. Session 1.1 Quick Check</li>
						<li>Mac WD 1-13. Session 1.2 Visual Overview: Formatting a Document</li>
						<li>Mac WD 1-14. Opening an Existing Document</li>
						<li>Mac WD 1-15. Using the Editor Pane</li>
						<li>Mac WD 1-16. Changing Page Orientation</li>
						<li>Mac WD 1-17. Changing the Font and Font Size</li>
						<li>Mac WD 1-18. Applying Text Effects, Font Colors, and Font Styles</li>
						<li>Mac WD 1-19. Aligning Text</li>
						<li>Mac WD 1-20. Adding a Paragraph Border and Shading</li>
						<li>Mac WD 1-21. Copying Formatting with the Format Painter</li>
						<li>Mac WD 1-22. Inserting a Picture and Adding Alt Text</li>
						<li>Mac WD 1-23. Adding a Page Border</li>
						<li>Mac WD 1-24. Creating Bulleted and Numbered Lists</li>
						<li>Mac WD 1-25. Getting Help</li>
						<li>Review. Session 1.2 Quick Check</li>
						<li>Mac WD 1-26a. Practice: Review Assignments</li>
						<li>Mac WD 1-26b. Apply: Case Problem 1</li>
						<li>Mac WD 1-26c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Word Module 2. Navigating and Formatting a Document for Mac
					<ul>
						<li>Mac WD 2-1. Session 2.1 Visual Overview: The Navigation Pane and Styles</li>
						<li>Mac WD 2-2. Reviewing the Document</li>
						<li>Mac WD 2-3. Working with Comments</li>
						<li>Mac WD 2-4. Moving Text in a Document</li>
						<li>Mac WD 2-5. Using the Navigation Pane</li>
						<li>Mac WD 2-6. Finding and Replacing Text</li>
						<li>Mac WD 2-7. Working with Styles</li>
						<li>Review. Session 2.1 Quick Check</li>
						<li>Mac WD 2-8. Session 2.2 Visual Overview: MLA Formatting Guidelines</li>
						<li>Mac WD 2-9. Reviewing the MLA Style</li>
						<li>Mac WD 2-10. Indenting a Paragraph</li>
						<li>Mac WD 2-11. Inserting and Modifying Page Numbers</li>
						<li>Mac WD 2-12. Creating a Footnote</li>
						<li>Mac WD 2-13. Creating Citations and a Bibliography</li>
						<li>Review. Session 2.2 Quick Check</li>
						<li>Mac WD 2-14a. Practice: Review Assignments</li>
						<li>Mac WD 2-14b. Apply: Case Problem 1</li>
						<li>Mac WD 2-14c. Challenge: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Word Module 3. Creating Tables and a Multipage Report for Mac
					<ul>
						<li>Mac WD 3-1. Session 3.1 Visual Overview: Organizing Information in Tables</li>
						<li>Mac WD 3-2. Working with Headings in the Navigation Pane and Outline View</li>
						<li>Mac WD 3-3. Collapsing and Expanding Body Text in Outline View</li>
						<li>Mac WD 3-4. Inserting a Blank Table</li>
						<li>Mac WD 3-5. Entering Data in a Table</li>
						<li>Mac WD 3-6. Selecting Part of a Table</li>
						<li>Mac WD 3-7. Sorting Rows in a Table</li>
						<li>Mac WD 3-8. Inserting Rows and Columns in a Table</li>
						<li>Mac WD 3-9. Deleting Rows and Columns</li>
						<li>Mac WD 3-10. Changing Column Widths and Row Heights</li>
						<li>Mac WD 3-11. Formatting Tables with Styles</li>
						<li>Mac WD 3-12. Adding Formulas</li>
						<li>Mac WD 3-13. Merging Cells</li>
						<li>Review. Session 3.1 Quick Check</li>
						<li>Mac WD 3-14. Session 3.2 Visual Overview: Working with Headers and Footers</li>
						<li>Mac WD 3-15. Setting Tab Stops</li>
						<li>Mac WD 3-16. Hyphenating a Document</li>
						<li>Mac WD 3-17. Formatting a Document into Sections</li>
						<li>Mac WD 3-18. Creating SmartArt</li>
						<li>Mac WD 3-19. Adding Headers and Footers</li>
						<li>Mac WD 3-20. Inserting a Cover Page</li>
						<li>Mac WD 3-21. Working with Themes</li>
						<li>Mac WD 3-22. Reviewing a Document in Focus Mode</li>
						<li>Review. Session 3.2 Quick Check</li>
						<li>Mac WD 3-23a. Practice: Review Assignments</li>
						<li>Mac WD 3-23b. Apply: Case Problem 1</li>
						<li>Mac WD 3-23c. Create: Case Problem 2</li>
						</ul>
				</li>
				<li>Mac Word Module 4. Enhancing Page Layout and Design for Mac
					<ul>
						<li>Mac WD 4-1. Session 4.1 Visual Overview: Elements of Desktop Publishing</li>
						<li>Mac WD 4-2. Using Continuous Section Breaks to Enhance Page Layout</li>
						<li>Mac WD 4-3. Formatting Text in Columns</li>
						<li>Mac WD 4-4. Inserting Symbols and Special Characters</li>
						<li>Mac WD 4-5. Introduction to Working with Objects</li>
						<li>Mac WD 4-6. Inserting Text Boxes</li>
						<li>Mac WD 4-7. Inserting Drop Caps</li>
						<li>Review. Session 4.1 Quick Check</li>
						<li>Mac WD 4-7. Session 4.2 Visual Overview: Editing Pictures</li>
						<li>Mac WD 4-9. Formatting Text with WordArt</li>
						<li>Mac WD 4-10. Working with Pictures</li>
						<li>Mac WD 4-11. Balancing Columns</li>
						<li>Mac WD 4-12. Enhancing the Newsletter’s Formatting</li>
						<li>Mac WD 4-13. Saving a Document as a PDF</li>
						<li>Mac WD 4-14. Converting a PDF to a Word Document</li>
						<li>Review. Session 4.2 Quick Check</li>
						<li>Mac WD 4-15a. Practice: Review Assignments</li>
						<li>Mac WD 4-15b. Apply: Case Problem 1</li>
						<li>Mac WD 4-15c. Create: Case Problem 2</li>
						</ul>
				</li>
			</ul>
		</li>
	</ul>
	</div>
	<input hidden name="id" value="#request.usr.id#">
</form>
<button class="nav-link">Table Of Contents</button>
<cfinclude template="/Inc/footer.cfm"></li>
</cfoutput>
