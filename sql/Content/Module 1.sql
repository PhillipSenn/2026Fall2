select * from grp
select * from cat

insert into act(act_grp,act_cat,actname,actlink) values(4,106,'Module 1. Impact of Digital Technology','Fill/')
declare @actid int=scope_identity()
declare @qid int
insert into q(q_act,qname,qdesc) values(@actid,'Introduction','Module1/Introduction.jpg')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Fatima Aktar is finishing her degree in social media marketing. During her time at school she has learned about how to use technology for productivity, and specifically how to use technology in social media marketing. Fatima recently visited her school’s career counseling center and received a list of tips to use technology to find an entry-level job in her field. She will use the technology with which she is familiar to search for openings, research the companies, schedule and keep track of interviews, and create a professional online presence.')

insert into q(q_act,qname,qdesc) values(@actid,'1.1. Explain Society’s Reliance on Technology','')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Over the last quarter century, technology has revolutionized our lives. Because of advances in technology you can more quickly and effectively than ever before access, search for, and share information. You can manage your finances, calendars, and tasks. You can play games and watch videos on your phone or computer for entertainment and relaxation. 
<a>Digital literacy</a> (also called 
<a>computer literacy</a>) involves having a current knowledge and understanding of computers, mobile devices, the web, and related technologies. Being digitally literate is essential for acquiring a job, using and contributing to global communications, and participating effectively in the international community.')
insert into ans(ans_q,ansname) values(@qid,'A 
<a>computer</a> is an electronic device, operating under the control of instructions stored in its own memory, that can accept data, process the data to produce information, and store the information for future use. 
<a>Data</a> is raw facts, such as text or numbers. A computer includes hardware and software. 
<a>Hardware</a> is the device itself and its components, such as wires, cases, switches, and electronic circuits. 
<a>Software</a> consists of the programs and apps that instruct the computer to perform tasks. Software processes data into meaningful 
<a>information</a>.')

insert into q(q_act,qname,qdesc) values(@actid,'Outline the History of Computers','')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'People have relied on tools and machines to count and manipulate numbers for thousands of years. These tools and technologies have evolved from the abacus in ancient times, to the first computing machines in the nineteenth century, to today’s powerful handheld devices such as smartphones and tablets.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'The first generation of computers used 
<a>vacuum tubes<a> (Figure 1-1), cylindrical glass tubes that controlled the flow of electrons. The ENIAC and UNIVAC are examples of these expensive machines. Their use and availability were limited due to their large size, the amount of power they consumed, the heat they generated, and how quickly they wore out.'
,'Module1/Figure1-1.jpg')
insert into ans(ans_q,ansname) values(@qid,'The next generation of computers replaced vacuum tubes with 
<a>transistors</a>, which were smaller, cheaper, and more reliable. These computers contained many components still in use today, including tape and disk storage, memory, operating systems, and stored programs.')
insert into ans(ans_q,ansname) values(@qid,'In the 1960s, computer engineers developed 
<a>integrated circuits</a>, which packed the equivalent of thousands of vacuum tubes or transistors into a silicon chip about the size of your thumb. In 1971, Ted Hoff and a team of engineers at Intel and IBM introduced the microprocessor. A 
<a>microprocessor</a> is the “brains” of a computer, a chip that contains a central processing unit. Microprocessors were even faster, smaller, and less expensive than integrated circuits. Today, microprocessors are often called processors for short.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'In the 1970s and 1980s, computers meant for personal use started to gain popularity. In 1978, Steve Jobs and Steve Wozniak of Apple Computer Corporation introduced the Apple II (Figure 1-2), a preassembled computer with color graphics and popular spreadsheet software called VisiCalc.','Module1/Figure1-2.jpg')
insert into ans(ans_q,ansname) values(@qid,'IBM followed Apple’s lead in 1981, introducing its 
<a>personal computer</a> (PC). Other manufacturers also started making similar machines, and the market grew. Since 1981, the number of PCs in use has grown to the billions. However, many people today use tablets and smartphones in addition to or instead of PCs.')
insert into ans(ans_q,ansname) values(@qid,'Today’s computers have evolved into connected devices that can share data using the Internet or wireless networks. They are smaller, faster, and have far greater capabilities than previous computers. In fact, your smartphone probably has more computing power than the computer that guided the Apollo mission to the moon in 1969!')

insert into q(q_act,qname,qdesc) values(@actid,'Explain the Impact of the Internet of Things and Embedded Computers','')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'The Internet of Things (IoT) is an environment where processors are embedded in every product imaginable (things), and these things communicate with one another via the Internet or wireless networks. Alarm clocks, coffeemakers, thermostats, streetlights, navigation systems, and much more are enhanced by the growth of IoT. IoT-enabled devices often are referred to as smart devices (Figure 1-3) because of their ability to communicate, locate, and predict. Smart devices often have associated apps to control and interact with them.')
insert into ans(ans_q,ansname) values(@qid,'The basic premise of IoT is that objects can be tagged, tracked, and monitored through a local network or across the Internet. Communication technologies such as Bluetooth, RFID tags, near-field communications (NFC), and sensors have become readily available, more powerful, and less expensive. Sensors and tags can transmit data to a server on the Internet over a wireless network at frequent intervals for analysis and storage.')
insert into ans(ans_q,ansname) values(@qid,'Developments in Big Data have made it possible to efficiently access, store, and process the mountain of data reported by sensors. Mobile service providers offer connectivity to a variety of devices so that transmitting and receiving data can take place quickly.')
insert into ans(ans_q,ansname) values(@qid,'An embedded computer is a computer that functions as one component in a larger product, and which has a specific purpose. Embedded computers usually are small and have limited hardware on their own but enhance the capabilities of everyday devices. Embedded computers perform a specific function based on the requirements of the product in which they reside. For example, an embedded computer in a printer monitors the ink levels, detects paper jams, and determines if the printer is out of paper.')
insert into ans(ans_q,ansname) values(@qid,'Embedded computers are everywhere. This technology enables computers and devices to connect with one another over the Internet using IoT. You encounter examples of embedded computers multiple times a day, perhaps without being aware of it.')
insert into ans(ans_q,ansname) values(@qid,'Today’s vehicles have many embedded computers. These enable you to use a camera to guide you when backing up, warn you if a vehicle or object is in your blind spot, or alert you to unsafe road conditions. Recently, all new cars were required to include backup cameras and electronic stability control, which can assist with steering the car in case of skidding. All of this technology is intended to make driving safer (Figure 1-4).')
insert into ans(ans_q,ansname) values(@qid,'Critics of in-vehicle technology claim that it can provide drivers with a false sense of security. If you rely on a sensor while backing up, parking, or changing lanes, you may miss other obstructions that can cause a crash. Reliance on electronic stability control may cause you to drive faster than conditions allow, or to pay less attention to the distance between your vehicle and others.')

insert into q(q_act,qname,qdesc) values(@actid,'ATMs and Kiosks')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Automated teller machines (ATMs) are one of the more familiar uses of IoT. You can use your ATM card to withdraw cash, deposit checks, and interact with your bank accounts. Recent innovations are improving card security, such as chip-and-pin technology that stores data on an embedded chip instead of a magnetic stripe.')
insert into ans(ans_q,ansname) values(@qid,'ATMs are a type of kiosk. A kiosk is a freestanding booth usually placed in a public area that can contain a display device used to show information to the public or event attendees. Kiosks enable self-service transactions in hotels and airports, for example, to enable users to check in for a flight or room. Healthcare providers also use kiosks for patients to check in and enter information, such as their insurance card number.')

insert into q(q_act,qname,qdesc) values(@actid,'IoT at Home')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'IoT enables you to manage devices remotely in your home, such as to start the washing machine at a certain time, view potential intruders via a webcam, or adjust the room temperature. Personal IoT uses include wearable fitness trackers that record and send data to your smartphone or computer about your exercise activity, the number of steps you take in a day, and your heart rate.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Figure 1-5 shows an example of how IoT can help manage your daily tasks.','Figure1-5.jpg')
insert into ans(ans_q,ansname) values(@qid,'IoT continues to advance its capabilities, and can help you maintain a secure, energy-efficient, connected, voice-activated, remotely accessible home.')

insert into q(q_act,qname,qdesc) values(@actid,'IoT in Business')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'All businesses and areas of business can take advantage of IoT. Manufacturing can use sensors to monitor processes and increase quality of finished goods (Figure 1-6). Retail can use sensors to track inventory or send coupons to customers’ phones while they shop. Shipping companies can track mileage and location of their trucks and monitor driving times to ensure the safety of their drivers.','Figure1-6.jpg')
insert into ans(ans_q,ansname) values(@qid,'A healthcare provider can use IoT to:
<ul>
<li>Connect to a patient’s wearable blood pressure or glucose monitor
<li>Send prescription updates and changes to a pharmacy, and alert the patient of the prescription
<li>Track and store data provided by wearable monitors to determine necessary follow-up care
<li>Send the patient reminders about upcoming appointments or tests
</ul>
The uses of IoT are expanding rapidly, and connected devices continue to impact and enhance business practices at all levels.')

insert into q(q_act,qname,qdesc) values(@actid,'Discover Uses for Artificial Intelligence')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Artificial intelligence (AI) is the technological use of logic and prior experience to simulate human intelligence. AI has a variety of capabilities, such as speech recognition, virtual reality, logical reasoning, and creative responses. Computers with AI can collect information to make decisions, reach conclusions, and combine information in new ways, which is a form of learning.')
insert into ans(ans_q,ansname) values(@qid,'Computers with AI use machine intelligence rather than human intelligence to make decisions. The goal in creating AI devices is to minimize the gap between what a machine can do and what a human can do. Programmers train the computer to act when presented with certain scenarios by instructing the computer that “if X happens, then do Y.”')


insert into q(q_act,qname,qdesc) values(@actid,'Explore the Impact of Virtual Reality')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Virtual reality (VR) is the use of computers to simulate a real or imagined environment that appears as a three-dimensional (3-D) space. These simulations use 3-D images that enable users to explore and have a sensory experience through visual and sound effects. You use VR in gaming to interact with a virtual environment and digital beings. Augmented reality (AR) is a type of VR that uses an image of an actual place or thing and adds digital information to it. A photo of a location overlaid with information about places of interest (Figure 1-7) or a football broadcast that shows a first-down marker are examples of AR.','Figre1-7.jpg')
insert into ans(ans_q,ansname) values(@qid,'Although VR developers work mostly with digital graphics and animation, they also use AI when creating virtual creatures that make decisions and change their behavior based on interactions with others. A VR developer can create an entire 3-D environment that contains infinite space and depth.')

insert into q(q_act,qname,qdesc) values(@actid,'The Digital Divide')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'All of this technology has many uses for both personal and business needs. However, it is not available to everyone. The digital divide is the gap between those who have access to technology and its resources and information, especially on the Internet, and those who do not. Socioeconomic and demographic factors contribute to the digital divide, which can impact individuals, households, businesses, or geographic areas.')
insert into ans(ans_q,ansname) values(@qid,'Imagine the educational opportunities when you have access to high-speed, unfiltered Internet content; your own laptop, tablet, or smart device; and software to create, track, and process data and information. Then compare these opportunities with the opportunities available to students who live in countries where the government restricts access to Internet content, and economics prevent them from owning their own devices and the software or apps used on them. These inequalities affect learning, knowledge, and opportunities and can have a lasting impact on the future of those affected.')
insert into ans(ans_q,ansname) values(@qid,'Corporations, non-profits, educational institutions, and governments are working on solutions to narrow the digital divide so that all learners can become digitally literate.')

insert into q(q_act,qname,qdesc) values(@actid,'1.2. Develop Personal Uses for Technology')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You can use technology to help with productivity, learning, and future career growth. In your daily life you interact with embedded computers in stores, public transportation, your car or truck, and more. Assistive technologies help people with disabilities to use technology. Green computing practices reduce the impact of electronic waste on the planet.')
insert into ans(ans_q,ansname) values(@qid,'Just as any society has rules and regulations to guide its citizens, so does the digital world. As a digital citizen, you should be familiar with how to use technology to become an educated and productive member of the digital world. This section covers several areas with which you should be familiar in order to be a digital citizen.')

insert into q(q_act,qname,qdesc) values(@actid,'Explore Personal Uses for Technology')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Technology can enable you to more efficiently and effectively access and search for information; share personal ideas, photos, and videos with friends, family, and others; communicate with and meet other people; manage finances; shop for goods and services; play games or access other sorts of entertainment; network with other business professionals to recruit for or apply for jobs; keep your life and activities organized; and complete business activities. Artificial intelligence and robotics increase your productivity.')
insert into ans(ans_q,ansname) values(@qid,'<h2>Artificial Intelligence</h2>')
insert into ans(ans_q,ansname) values(@qid,'Some of the practical uses of AI include strategic gaming, military simulations, statistical predictions, and self-driving cars. For example, meteorologists use AI to analyze weather data patterns to create a list of possible outcomes for an upcoming weather event. The predictions made by the AI software then need to be interpreted, reviewed, and prioritized by people.')
insert into ans(ans_q,ansname) values(@qid,'Some of the ways you might interact with AI on a daily basis include:

Virtual assistants, which use voice recognition and search engines to answer, react, or reply to user requests
<ul>
<li>Social media and online ads, which track your data, such as websites visited, and provide ads targeted to your personal interests
<li>Video games that provide information to your virtual opponents based on your skill level and past actions
<li>Music and media streaming services, which recommend options based on your past listening and viewing choices
<li>Smart cars, which automate many driving tasks such as managing speed and avoiding collisions
<li>Navigation apps, which provide you with information about traffic and the best routes, along with preferred stops along your way
<li>Security, such as using your fingerprint to access your phone, or facial recognition and motion-detection cameras that alert you to unusual or unauthorized visitors
</ul>')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Another use of AI is natural language processing. Natural language processing is a form of data input in which computers interpret and digitize spoken words or commands. In some cases, users must train the software to recognize the user’s speech patterns, accent, and voice inflections. Digital assistants like Amazon’s Alexa or Apple’s Siri use natural language processing to respond to your verbal commands or questions, using search technology to provide answers or perform a task, such as adding an item to a grocery list (Figure 1-8).','Figure1-8.jpg')

insert into q(q_act,qname,qdesc) values(@actid,'Use Robotics and Virtual Reality')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Robotics is the science that combines engineering and technology to create and program robots. Robots are useful in situations where it is impractical, dangerous, or inconvenient to use a human, such as cleanup of hazardous waste and materials, domestic uses such as vacuuming, and agricultural and manufacturing uses (Figure 1-9).','Figure1-9.jpg')
insert into ans(ans_q,ansname) values(@qid,'Robots can also assist surgeons. A robotic arm or instrument can be more precise, flexible, and controlled than a human hand. 3-D cameras enable the surgeon to see inside the body. Robotic surgeries often take less time to heal and can prevent risk of infection because they require a smaller incision site. However, robots require a surgeon to control and direct the operation. Surgeons must not only be trained medically, but also to use the robot.')
insert into ans(ans_q,ansname) values(@qid,'Self-driving cars use cameras to change speed due to traffic. They rely on GPS to navigate the best and fastest route. The proponents say that they reduce dangers related to human error. One of the biggest concerns about self-driving cars is that they may contribute to accidents caused by distracted driving.')
insert into ans(ans_q,ansname) values(@qid,'Outside of gaming, science and medicine use VR for training and research. For example, medical students can use VR to practice their emergency medicine skills. NASA uses VR to simulate space flight and the environments of other planets. Other commercial uses include enabling potential home buyers to move through a home’s various rooms, or construction companies to show a preview of the completed building.')
insert into ans(ans_q,ansname) values(@qid,'When you make a decision based on observation, or answer a question, your brain and senses prompt you to use your past experiences, knowledge base, and visual and other sensory clues to come up with a response. AI and other technologies that mimic human action use some of the same processes. Computers learn from past interactions to predict likely outcomes or responses. They use databases and Internet searches to come up with answers to questions. Cameras can read faces and analyze voices to recognize users.')

insert into q(q_act,qname,qdesc) values(@actid,'Utilize Technology in Daily Life')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Imagine your life without technology and the Internet. You probably use the Internet daily to find information, connect with social media, make purchases, and more. Your devices can help you connect to the Internet to perform these tasks. The following are examples of how you might interact with technology, including embedded computers and the Internet, in your daily life.')
insert into ans(ans_q,ansname) values(@qid,'The sound of the alarm you asked your smart speaker to set last night wakes you up. You can smell the coffee brewing from the coffee maker you programmed to go off five minutes before your alarm. Once you leave for work, your thermostat will adjust by five degrees, and then readjust to a more comfortable temperature by the time you arrive home.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'On your way to and from work, you check the public transportation app on your phone (Figure 1-10) to locate and get directions to the nearest subway station. Once there, you scan your phone to pay your fare and access the terminal. A screen in the station displays an alert when the train is incoming. As the subway speeds towards the next station, it relies on sensors to determine any oncoming traffic and report delays, changes in routes, and the next available stop.','Figure1-10.jpg')
insert into ans(ans_q,ansname) values(@qid,'After work, you decide to take your car and go shopping. You program your vehicle’s GPS to take you to the nearest mall. As you drive, your car senses the space between you and the car ahead and slows your speed to keep a safe distance. Outside the mall, you use a parking app to locate a parking spot near the front door and use your car’s cameras to safely navigate into the spot.')
insert into ans(ans_q,ansname) values(@qid,'Before heading into the store, you decide to check your balance on your debit card. Your banking app tells you how much money is in your checking account. You tap to transfer $40 to your smartphone’s payment app, then you head to the store.')
insert into ans(ans_q,ansname) values(@qid,'You walk into a clothing store, searching for a new sweater. You talk to a sales associate, who uses her tablet to look up your personal profile, including past purchases, based on your phone number. The sales associate tells you what size you wear, and what colors you have bought in the past few years. Together, you find a sweater that fits and that you don’t currently have anything like in your wardrobe. Before using the store’s self-checkout, you check your store loyalty app on your smartphone to see what coupons are available.')

insert into q(q_act,qname,qdesc) values(@actid,'Use Technology to Assist Users with Disabilities')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The ever-increasing presence of computers in everyone’s lives has generated an awareness of the need to address computing requirements for those with limitations, such as learning disabilities, mobility issues, and hearing and visual disabilities.')
insert into ans(ans_q,ansname) values(@qid,'The Americans with Disabilities Act (ADA) requires any company with 15 or more employees to make reasonable attempts to accommodate the needs of physically challenged workers. The Individuals with Disabilities Education Act (IDEA) requires that public schools purchase or acquire funding for adaptive technologies. These laws were put in place to ensure that people with disabilities can access resources, information, and services using the appropriate technology.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Users with visual disabilities can change screen settings, such as increasing the size or changing the color of the text to make the words easier to read. Changing the color of text also can address the needs of users with certain types of color blindness. Instead of using a monitor, blind users can work with voice output. That is, the computer speaks out loud the information that appears on a screen. A Braille printer prints information on paper in Braille (Figure 1-11).','Figure1-11.jpg')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Screen reader technology uses audio output to describe the contents of the screen. Screen readers can read aloud webpages and documents or provide narration of the computer or device’s actions. Alternative text (alt text) is descriptive text added to an object, such as a picture or drawing (Figure 1-12). A screen reader will read the alt text aloud so that the user understands the image and its purpose. Webpages and documents should include alt text for all images. Alt text can be as simple as the name of a famous individual shown in a photograph, or more complex, such as interpreting the results of a chart or graph. Productivity applications such as Microsoft Office and webpage creation apps prompt users to add alt text, and sometimes provide suggested alt text content.','Figure1-12.jpg')
insert into ans(ans_q,ansname) values(@qid,'Hearing-impaired users can instruct programs or apps to display words or other visual clues instead of sounds, such as for a notification from an app. Captioning software displays scrolling text for dialogue in a video. Cameras can interpret sign language gestures into text.')
insert into ans(ans_q,ansname) values(@qid,'Mobility issues can impact a user’s ability to interact with hardware, such as a keyboard or a mouse. Users with limited hand mobility can use an on-screen keyboard, a keyboard with larger keys, or a hand-mounted pointer to control the pointer or insertion point. Alternatives to mouse buttons include a hand pad, a foot pedal, a receptor that detects facial motions, or a pneumatic instrument controlled by puffs of air. Users with conditions that cause hands to move involuntarily can purchase input devices such as a keyboard or mouse that are less sensitive to accidental interaction due to trembling or spasms.')
insert into ans(ans_q,ansname) values(@qid,'Users with learning disabilities might struggle with reading words on a screen, handwriting, or retaining information. Technologies that help these users learn or perform tasks include:
<ul>
<li>Speech recognition programs so the user can input data or information verbally
<li>Graphic organizers to enable a user to create an outline or structure of information
<li>Audio books to read information aloud to the user instead of reading on a printed page or on the screen
</ul>')
insert into ans(ans_q,ansname) values(@qid,'The basic premise of assisted technology is to improve accessibility for all users and provide the same opportunities to learn, work, and play, no matter what limitations a user has.')

insert into q(q_act,qname,qdesc) values(@actid,'Apply Green Computing Concepts to Daily Life')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'People use, and often waste, resources such as electricity and paper while using technology. The practice of green computing involves reducing electricity consumed and environmental waste generated when using computers, mobile devices, and related technologies.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Personal computers, displays, printers, and other devices should comply with guidelines of the ENERGY STAR program (Figure 1-13). The United States Department of Energy (DOE) and the United States Environmental Protection Agency (EPA) developed the ENERGY STAR program to help reduce the amount of electricity used by computers and related devices. This program encourages manufacturers to create energy-efficient devices. For example, many devices switch to sleep or power save mode after a specified amount of inactive time.','Figure1-13.jpg')
insert into ans(ans_q,ansname) values(@qid,'Electronic waste and trash has a negative effect on the environment where it is discarded. You can avoid electronic waste by not replacing devices every time a new version comes out, and recycling devices and products such as ink and toner when they no longer provide value.')
insert into ans(ans_q,ansname) values(@qid,'Your personal green computing efforts should include:
<ul>
<li>Purchasing and using products with an ENERGY STAR label
<li>Shutting down your computers and devices overnight or when not in use
<li>Donating computer equipment
<li>Using paperless communication
<li>Recycling paper, toner and ink cartridges, computers, mobile devices, and printers
<li>Telecommuting and using video conferencing for meetings
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Organizations can implement a variety of measures to reduce electrical waste, such as:
<ul>
<li>Consolidating servers
<li>Purchasing high-efficiency equipment
<li>Using sleep modes and other power management features for computers and devices
<li>Buying computers and devices with lower power consumption processors and power supplies
<li>Using outside air, when possible, to cool the data center or computer facility
<li>Allowing employees to telecommute to save gas and reduce emissions from vehicles
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Green computing practices are usually easy to implement and can make a huge impact on the environment.')


insert into q(q_act,qname,qdesc) values(@actid,'Enterprise Computing')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A large business with many employees is known as an enterprise. Enterprise computing refers to the use of technology by a company’s employees to meet the needs of a large business. Each department of a company uses technology specific to its function. Table 1-1 shows some of the uses of technology for different functional units.')
insert into ans(ans_q,ansname) values(@qid,'<table class="table frameall" data-cgi="KXFRWFW0FDZQDSLWH464" epub:type="table" id="KXFRWFW0FDZQDSLWH464" style="padding-bottom: 0px;">
               
               
               
               
               
               
               <thead>
                  
                  <tr data-cgi="FSBD0WFZHAW6RMR2J113" epub:type="table-row" id="FSBD0WFZHAW6RMR2J113">
                     <th class="valigntop alignleft underscore sidescore" data-cgi="VSZNYPKX4LMCWN7Q7314" id="VSZNYPKX4LMCWN7Q7314" scope="col" style="width:23%">Functional unit</th>
                     <th class="valigntop alignleft underscore sidescore" data-cgi="XSYQ9XCF6XR2QAXB3265" id="XSYQ9XCF6XR2QAXB3265" scope="col" style="width:76%">Technology uses</th>
                  </tr>
                  
               </thead>
               
               <tbody data-cgi="YUMG63KY5JF2HY0U8839" id="YUMG63KY5JF2HY0U8839">
                  
                  <tr data-cgi="DWEJZHKF9HLM72NX0365" epub:type="table-row" id="DWEJZHKF9HLM72NX0365">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="MLMKT4EBB3DJBY68F815" data-title="Functional unit: " epub:type="table-cell" id="MLMKT4EBB3DJBY68F815" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Human resources</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="HUDVTVLCSKH5KJ5PM530" data-title="Technology uses: " epub:type="table-cell" id="HUDVTVLCSKH5KJ5PM530" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Track employees’ personal data, including pay rates, benefits, and vacation time</td>
                  </tr>
                  
                  <tr data-cgi="GUJLN4SG0X6NMXAJ4702" epub:type="table-row" id="GUJLN4SG0X6NMXAJ4702">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="BSMGKB32J6HMCAURA714" data-title="Functional unit: " epub:type="table-cell" id="BSMGKB32J6HMCAURA714" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Accounting</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="HKUU0ZMVHJP04MG30988" data-title="Technology uses: " epub:type="table-cell" id="HKUU0ZMVHJP04MG30988" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Keep track of income and spending</td>
                  </tr>
                  
                  <tr data-cgi="WGHPGM8GY8VCW915F257" epub:type="table-row" id="WGHPGM8GY8VCW915F257">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="LBYN5DHK5WN1T0D66892" data-title="Functional unit: " epub:type="table-cell" id="LBYN5DHK5WN1T0D66892" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Sales</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="AYZSLR42PHNRY8WQU315" data-title="Technology uses: " epub:type="table-cell" id="AYZSLR42PHNRY8WQU315" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Manage contacts, schedule meetings, log customer interactions, and process orders</td>
                  </tr>
                  
                  <tr data-cgi="RLET98XLK50SDA08R053" epub:type="table-row" id="RLET98XLK50SDA08R053">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="PHNXZ6XVLAP4GTEPS168" data-title="Functional unit: " epub:type="table-cell" id="PHNXZ6XVLAP4GTEPS168" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Information technology</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="UXNPX7MNW2HXNEASK950" data-title="Technology uses: " epub:type="table-cell" id="UXNPX7MNW2HXNEASK950" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Maintain and secure hardware and software</td>
                  </tr>
                  
                  <tr data-cgi="GANX5W9JPYYDVBWPQ624" epub:type="table-row" id="GANX5W9JPYYDVBWPQ624">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="BEVA35WQ7YLGMY6EN420" data-title="Functional unit: " epub:type="table-cell" id="BEVA35WQ7YLGMY6EN420" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Engineering and product development</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="VFTCNFKS6VS08Y8QN709" data-title="Technology uses: " epub:type="table-cell" id="VFTCNFKS6VS08Y8QN709" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Develop plans for and test new products</td>
                  </tr>
                  
                  <tr data-cgi="KAXKVB8YMGE1468GB408" epub:type="table-row" id="KAXKVB8YMGE1468GB408">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="HNEKX0Z0F0ZNHXEAB193" data-title="Functional unit: " epub:type="table-cell" id="HNEKX0Z0F0ZNHXEAB193" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Manufacturing</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="TRHFZPJHHYW8MBGPM592" data-title="Technology uses: " epub:type="table-cell" id="TRHFZPJHHYW8MBGPM592" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Monitor assembly of products and manage inventory of parts and products</td>
                  </tr>
                  
                  <tr data-cgi="ZXRGXNBGF1VNFNZ50144" epub:type="table-row" id="ZXRGXNBGF1VNFNZ50144">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="PZWFH7VSGCFRZC4FB652" data-title="Functional unit: " epub:type="table-cell" id="PZWFH7VSGCFRZC4FB652" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Marketing</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="CTHNY2E2W1Y42BVE5327" data-title="Technology uses: " epub:type="table-cell" id="CTHNY2E2W1Y42BVE5327" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Create and track success of marketing campaigns that target specific demographics</td>
                  </tr>
                  
                  <tr data-cgi="XZJX6UMTH8SA3SL7F414" epub:type="table-row" id="XZJX6UMTH8SA3SL7F414">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="EGDEXEKTQ4L3TN44Y536" data-title="Functional unit: " epub:type="table-cell" id="EGDEXEKTQ4L3TN44Y536" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Distribution</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="DWWPL7N5CN13G3KR5570" data-title="Technology uses: " epub:type="table-cell" id="DWWPL7N5CN13G3KR5570" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Analyze and track inventory and manage shipping</td>
                  </tr>
                  
                  <tr data-cgi="VTVCKRVAC98JNQN0T356" epub:type="table-row" id="VTVCKRVAC98JNQN0T356">
                     <td class="valigntop alignleft underscore sidescore" data-cgi="SHJY8DQUQT9PACP3T390" data-title="Functional unit: " epub:type="table-cell" id="SHJY8DQUQT9PACP3T390" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
                        <b>Customer service</b>
                        
                     </td>
                     <td class="valigntop alignleft underscore sidescore" data-cgi="CLDUE56DNLF1RLS2F245" data-title="Technology uses: " epub:type="table-cell" id="CLDUE56DNLF1RLS2F245" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Manage customer interactions</td>
                  </tr>
                  
               </tbody>
               
               
            </table>')

insert into q(q_act,qname,qdesc) values(@actid,'1.3. Explain the Role of Technology in the Professional World')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Nearly every job requires you to interact with technology to complete projects, exchange information with coworkers, and meet customers’ needs. Whether you are looking for a job in a technology field or other area, you can use technology to prepare for and search for a job.')

insert into q(q_act,qname,qdesc) values(@actid,'List the Ways That Professionals Might Use Technology in the Workplace')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Technological advances, such as the PC, enabled workers to do their jobs more efficiently while at their desks. Today’s workers can use smartphones, the Internet, the cloud, and more to work remotely, whether they are telecommuting (working from home), or traveling halfway around the world.')
insert into ans(ans_q,ansname) values(@qid,'An intelligent workplace uses technology to enable workers to connect to the company’s network, communicate with each other, use productivity software and apps, meet via web conferencing, and more. Some companies provide employees with computers and devices that come with the necessary software and apps, network connectivity, and security. Other workplaces have a BYOD (bring your own device) policy, enabling employees to use their personal devices to conduct business. Companies use online collaborative productivity software to allow employees to share documents such as reports or spreadsheets and to make edits or comments.')

insert into q(q_act,qname,qdesc) values(@actid,'Technology in K-12 Education')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Schools use social networking tools to promote school events, work cooperatively on group projects, and teach concepts such as anti-bullying. Online productivity software enables students to work collaboratively on projects and send the finished assignment to the teacher using email, reducing the need for paper printouts. These factors and more create an intelligent classroom, in which technology is used to facilitate learning and communication.')

insert into q(q_act,qname,qdesc) values(@actid,'Technology in Higher Education')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A college or university might use a learning management system (LMS) to set up web-based training sites where students can check their progress in a course, take practice tests, and exchange messages with the instructor or other students. Students also can view instructor lectures online and take classes or earn a degree online. Ebooks let students read and access content from their tablet or device, and access digital assets like videos associated with the content.')

insert into q(q_act,qname,qdesc) values(@actid,'Technology in Healthcare')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Physicians use computers to monitor patients’ vital signs and research symptoms and diagnoses. The mobile health (mHealth) trend refers to healthcare professionals using smartphones or tablets to access health records stored in the cloud, and patients using digital devices to monitor their conditions and treatments, reducing the need for visits to the doctor’s office. For example, mHealth apps can track prescription information, text reminders to take medication, or refill the prescription. Medical monitoring devices, such as electronic bracelets, collect vital signs and send the data to a specialist. Patients can ingest smart pills that contain sensors to monitor medication or contain tiny cameras to enable a physician to view the patient’s internal organs without invasive procedures. Healthcare also uses 3-D printers to manufacture skin for burn patients, and prosthetic devices and casts.')

insert into q(q_act,qname,qdesc) values(@actid,'Technology in the Transportation Industry')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Transportation workers use handheld computers to scan codes on packages or containers of products before loading them on a vehicle, train, ship, or plane. You then can track the progress of your package as it makes its way to you. Computers find an efficient route for the packages and track their progress (Figure 1-14). Drivers use GPS to navigate quickly and safely, avoiding traffic and hazardous conditions. Soon, self-driving trucks will use robotics for mechanical control. Automated vehicles increase independent transportation options for people with disabilities.','Figure1-14.jpg')

insert into q(q_act,qname,qdesc) values(@actid,'Technology in Manufacturing')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Manufacturers use computer-aided manufacturing (CAM) to streamline production and ship products more quickly. With CAM, robots perform work that is too dangerous, detailed, or monotonous for people. In particular, they play a major role in automotive manufacturing. For example, robots typically paint the bodies of cars because painting is complex, difficult, and hazardous. Pairing robotic systems with human workers also improves quality, cost efficiency, and competitiveness. Computers and mobile devices make it possible to order parts and materials from the warehouse to assemble custom products. A company’s computers monitor assembly lines and equipment using machine-to-machine (M2M) communications.')

insert into q(q_act,qname,qdesc) values(@actid,'Explore Technology Careers')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'The technology field provides opportunities for people of all skill levels and interests, and demand for computer professionals continues to grow. The following sections describe general technology career areas.')
insert into ans(ans_q,ansname) values(@qid,'Software and Apps')
insert into ans(ans_q,ansname) values(@qid,'The software and apps field consists of companies that develop, manufacture, and support programs for computers, the web, and mobile devices. Some companies specialize in a certain area, such as productivity software or gaming. Other companies sell many types of software that work with both computers and mobile devices and may use the Internet to sync data and use collaborative features.')
insert into ans(ans_q,ansname) values(@qid,'Technology Equipment')
insert into ans(ans_q,ansname) values(@qid,'The technology equipment field consists of manufacturers and distributors of computers, mobile devices, and other hardware. In addition to the companies that make the finished products, this field includes companies that manufacture the internal components such as chips, cables, and power supplies.')
insert into ans(ans_q,ansname) values(@qid,'IT Departments')
insert into ans(ans_q,ansname) values(@qid,'Most medium and large businesses and organizations have an Information Technology (IT) department. IT staff are responsible for ensuring that all the computer operations, mobile devices, and networks run smoothly. They also determine when and if the organization requires new hardware, mobile devices, or software. IT jobs typically are divided into the areas shown in Table 1-2.')
insert into ans(ans_q,ansname) values(@qid,'<table>
<thead>
                     
<tr data-cgi="MUBBVYE1XYGCMNHB8847" epub:type="table-row" id="MUBBVYE1XYGCMNHB8847">
<th class="valigntop alignleft underscore sidescore" data-cgi="TGCEQP6UDY4MDX1DA653" id="TGCEQP6UDY4MDX1DA653" scope="col" style="width:23%">IT area</th>
<th class="valigntop alignleft underscore sidescore" data-cgi="XFHL0S9C0SQZK7A24067" id="XFHL0S9C0SQZK7A24067" scope="col" style="width:76%">Responsibilities</th>
</tr>
                     
</thead>
                  
<tbody data-cgi="DCHP3Y0QUDAKN4W8R982" id="DCHP3Y0QUDAKN4W8R982">
                     
<tr data-cgi="SVXCJ8JXQWRLXMHZH607" epub:type="table-row" id="SVXCJ8JXQWRLXMHZH607">
<td class="valigntop alignleft underscore sidescore" data-cgi="SQWU9W1ZC9F03ZH8F702" data-title="IT area: " epub:type="table-cell" id="SQWU9W1ZC9F03ZH8F702" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Management</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="BLETU0SVGZ0RKSNQ4534" data-title="Responsibilities: " epub:type="table-cell" id="BLETU0SVGZ0RKSNQ4534" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Directs the planning, research, development, evaluation, and integration of technology</td>
</tr>
                     
<tr data-cgi="TFMKPJJNFPK8VGRU3007" epub:type="table-row" id="TFMKPJJNFPK8VGRU3007">
<td class="valigntop alignleft underscore sidescore" data-cgi="VPNY2XD2P85Z7EKTR687" data-title="IT area: " epub:type="table-cell" id="VPNY2XD2P85Z7EKTR687" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Research and software development</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="BEAR054PA78SS3RSX464" data-title="Responsibilities: " epub:type="table-cell" id="BEAR054PA78SS3RSX464" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Analyzes, designs, develops, and implements new information technology and maintains existing systems</td>
</tr>
                     
<tr data-cgi="ZVHJ88UBQCH6XB2FM650" epub:type="table-row" id="ZVHJ88UBQCH6XB2FM650">
<td class="valigntop alignleft underscore sidescore" data-cgi="BKYE5T2GZ9KFKJTD8762" data-title="IT area: " epub:type="table-cell" id="BKYE5T2GZ9KFKJTD8762" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Technical support</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="DHEXK2CCEH6MEE5Y5686" data-title="Responsibilities: " epub:type="table-cell" id="DHEXK2CCEH6MEE5Y5686" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Evaluates and integrates new technologies, administers the organization’s data resources, and supports the centralized computer
operating system and servers
</td>
</tr>
                     
<tr data-cgi="CGWMXF7GX7NM44KGA299" epub:type="table-row" id="CGWMXF7GX7NM44KGA299">
<td class="valigntop alignleft underscore sidescore" data-cgi="VAYWHRWJ5G23V23GP804" data-title="IT area: " epub:type="table-cell" id="VAYWHRWJ5G23V23GP804" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Operations</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="FLDTC7SB98ACG0D9D526" data-title="Responsibilities: " epub:type="table-cell" id="FLDTC7SB98ACG0D9D526" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Oversees the centralized computer equipment and administers the network</td>
</tr>
                     
<tr data-cgi="CAUBSY7FEDQXTZP3A863" epub:type="table-row" id="CAUBSY7FEDQXTZP3A863">
<td class="valigntop alignleft underscore sidescore" data-cgi="TZUXE93D5MU4RUQY7301" data-title="IT area: " epub:type="table-cell" id="TZUXE93D5MU4RUQY7301" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Training and support</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="SRFWUM6FFTKYDMBGT959" data-title="Responsibilities: " epub:type="table-cell" id="SRFWUM6FFTKYDMBGT959" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Teaches employees how to use the information system and answers user questions</td>
</tr>
                     
<tr data-cgi="BKPU79V29U58PM7TT379" epub:type="table-row" id="BKPU79V29U58PM7TT379">
<td class="valigntop alignleft underscore sidescore" data-cgi="KDBSKZ58W275JNMNU832" data-title="IT area: " epub:type="table-cell" id="KDBSKZ58W275JNMNU832" style="width: 23%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">
<b>Information security</b>
                           
</td>
<td class="valigntop alignleft underscore sidescore" data-cgi="DGXQ2QWWLY2Y19SJ8873" data-title="Responsibilities: " epub:type="table-cell" id="DGXQ2QWWLY2Y19SJ8873" style="width: 76%; border-right-width: medium; border-right-style: none; border-right-color: currentcolor;">Develops and enforces policies that are designed to safeguard an organization’s data and information from unauthorized users</td>
</tr>
                     
</tbody>
                  
                  
</table>')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'<h2>Technology Service and Repair</h2>
The technology service and repair field provides preventative maintenance, component installations, and repair services to customers. Some technicians receive training and certifications from manufacturers to become specialists in devices from that manufacturer. Many technology equipment manufacturers include diagnostic software with their computers and devices that assist technicians in identifying problems. Technicians can use the Internet to diagnose and repair software remotely, by accessing the user’s computer or device from a different location.

<h2>Technology Sales</h2>
Technology salespeople must possess a general understanding of technology, as well as specific knowledge of the product they are selling. Strong people skills, including listening and communicating, are important. Some salespeople work directly for a technology equipment or software manufacturer, while others work for resellers of technology, including retail stores.

<h2>Technology Education, Training, and Support</h2>
Schools, colleges, universities, and companies all need qualified educators to provide technology-related education and training. Instructors at an educational institution typically have a background and degree related to the technology they are teaching. Corporate trainers teach employees how to use the technology specific to the business or industry. Help desk specialists provide support by answering questions from employees to help them troubleshoot problems.

<h2>IT Consulting</h2>
An IT consultant typically has gained experience in one or more areas, such as software development, social media, or network configuration. IT consultants provide technology services to clients based on their specific areas of expertise. Sometimes a company will hire a large group of IT consultants to work together on a specific task, such as building a new network infrastructure or database.

<h2>System Development</h2>
System developers analyze and create software, apps, databases, websites and web-based development platforms, cloud services, and networks. Developers identify the business requirements and desired outcomes for the system, specify the structure and security needed, and design and program the system.

<h2>Web Marketing and Social Media</h2>
Careers in web marketing require you to be familiar not only with marketing strategies, but also with web-based platforms and social media apps. Web marketers create social media plans, including the content and timing of marketing campaigns, posts, and emails. Search engine optimization (SEO) knowledge helps to create web content and layout that enhances the content’s results when users search for content.

<h2>Data Storage, Retrieval, and Analysis</h2>
Employees in this field must be knowledgeable about collecting, analyzing, storing, and reporting data from databases or the web. Data scientists use analytics to compile statistics on data to create strategies or analyze business practices. Web analytics experts measure Internet data, such as website traffic patterns and ads (Figure 1-15). Digital forensics examiners use evidence found on computers, networks, and devices to help solve crimes.','Figure1-15.jpg')
insert into ans(ans_q,ansname) values(@qid,'<h2>Information and Systems Security</h2>
Careers in information and systems security require you to be knowledgeable about potential threats to a device or network, including viruses and hacking. Security specialists need to know tools and techniques to prevent against and recover from digital attacks.')


insert into q(q_act,qname,qdesc) values(@actid,'')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'<h2>Explore How You Might Prepare for a Career in Technology</h2>
You can use both social media and job search websites to learn about technology careers and to promote yourself to potential employers. By creating a profile on a career networking site or creating a personal website or blog that showcases your talents, hiring managers can learn more about you beyond what you can convey in a traditional, one-page paper resume.
<h2>Professional Online Presence</h2>
Recommended strategies for creating a professional online presence include:
<ul>
<li>Do not use humorous or informal names for your account profiles, blog, or domain name.
<li>Include a photo that shows your best self.
<li>Upload a PDF of your resume.
<li>Include links to videos, publications, or digital content you have created.
<li>Proofread your resume, blog, website, or profile carefully to avoid spelling and grammar mistakes.
<li>Enable privacy settings on your personal social media accounts, and never post anything online that you would not want a potential employer to see.
</ul>
Online social networks for professionals can help you keep up with past coworkers, instructors, potential employers, and others with whom you have a professional connection. You can use these networks to search for jobs, learn about a company before interviewing, join groups of people with similar interests or experiences, share information about your career, and communicate with contacts. LinkedIn (Figure 1-16) and other professional networking websites also offer online training courses to keep your skills up-to-date.

')
insert into ans(ans_q,ansname) values(@qid,'<h2>Certifications</h2>
Some technology careers require you to have certain certifications. A certification demonstrates your knowledge in a specific area to employers and potential employers. Online materials and print books exist to help you prepare for a certification exam. Most certifications do not require coursework assignments, but instead require you to pass an exam that demonstrates your proficiency in the area. Tests typically are taken at an authorized testing center. Some tests are multiple choice, while others are skills-based. You likely will have to pay a fee to take the exam. Some areas that offer certifications include:
<ul>
<li>Application software
<li>Data analytics, database, and web design
<li>Hardware
<li>Networking
<li>Operating systems
<li>Programming
<li>Cybersecurity
</ul>
Obtaining a certification requires you to spend time and money. Certifications demonstrate your commitment to your chosen area and can help you land a job.')

insert into q(q_act,qname,qdesc) values(@actid,'Review')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'<h2>Summary</h2>
<p>Computers impact your daily life in many ways, including the use of embedded computers in vehicles, ATMs, and stores, and the “Internet of Things” that allows smart home appliances and other devices to communicate over the Internet or a wireless network.
<p>Computers have evolved from large, inefficient, and expensive devices that used technology such as vacuum tubes to smaller, more powerful connected devices such as PCs, smartphones, and more.
<p>Artificial intelligence, virtual reality, and augmented reality use logic and simulations to make predictions, educate, and entertain. Users with limitations or disabilities can use many different devices and software that enable them to access and use technology. There are many ways you can employ green computing practices to help reduce your impact on the environment.
<p>Technology has had a large impact on the professional world, including intelligent workplaces. Education, transportation, healthcare, and manufacturing all use technology to reduce costs and increase safety and efficiency.
<p>There are many careers available to you in the technology field, including IT, security, software development, and more. To prepare for a career in technology, you should create a professional online presence and take advantage of certification options.')
/*
insert into q(q_act,qname,qdesc) values(@actid,'')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
*/
/*
declare @catid int=(select catid from cat where catname='Discussion Questions')
insert into act(actsort,actname,act_grp,act_cat,actlink) values(5120,'Module 1. Impact of Digital Technology',4,@catid,'Discussion/')
declare @actid int=scope_identity()
insert into q(q_act,qname) values(@actid,'How have embedded computers and the IoT impacted your daily life? What additional uses can you see yourself using? What security or other risks might you encounter with IoT?')
insert into q(q_act,qname) values(@actid,'How do the following technologies help you in your quest to become a digital citizen: kiosks, enterprise computing, natural language processing, robotics, and virtual reality?')
insert into q(q_act,qname) values(@actid,'What additional uses of technology can you see in the workplace? List ways technology impacts other careers not discussed in this module, such as finance, government, non-profits, and agriculture.')
go
declare @catid int=(select catid from cat where catname='Critical Thinking Activities')
insert into act(actsort,actname,act_grp,act_cat,actlink) values(5130,'Module 1. Impact of Digital Technology',4,@catid,'Critical/')
declare @actid int=scope_identity()
insert into q(q_act,qname) values(@actid,'You work in the educational software industry. Your boss asks you to give a brief lecture to other employees about the digital divide. Create a one-page document in which you define and give examples of the impact of the digital divide, and list ways your company can work to narrow the gap between students without reliable access to educational software, the Internet, and the hardware on which to run both. Discuss the ethical ramifications of not addressing the digital divide—what is your role as a company?')
insert into q(q_act,qname) values(@actid,'You and your roommate decide to reduce your environmental impact by recycling more, going paperless, and using environmentally safe cleaning products. You know you also can use green computing tactics to reduce electronic waste, minimize power use, and more. Create a list of five reasons why you should add green computing to your efforts. List 10 ways you can apply green computing to your daily life.')
insert into q(q_act,qname) values(@actid,'Research the trend of BYOD in workplaces. Compare the advantages to any potential disadvantages. Do you think more companies should adopt this policy? Why or why not?')
*/
select * from grp
