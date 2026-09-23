-- Module 1: Impact of Digital Technology — Wikipedia embedded images
-- ansname = figure caption (for #:~:text=); ansdesc = path under https://upload.wikimedia.org/wikipedia/commons/
-- Filtered out .svg, .djvu, .tif (keep jpg/jpeg/png/gif/webp)
-- Only images actually embedded in the English Wikipedia article named in qhref.

-- alternative text (alt text)
-- Wikipedia: Alt attribute
-- https://upload.wikimedia.org/wikipedia/commons/0/03/Alt_attribute_example.png
-- https://upload.wikimedia.org/wikipedia/en/c/c9/ChipAndPin.svg

declare @actid int
declare @qid int
declare @catid int=(select catid from cat where catname='Key Terms setup')
print @catid
declare @actname varchar(max)='Module 1. Impact of Digital Technology'
select @actid = actid
from act where actname=@actname and act_cat=@catid
print @actid
--insert into act(act_grp,act_cat,actname,actlink) values(4,@catid,@actname,'KeyTerms/setup.cfm')
--select @actid=scope_identity()
delete from q where q_act=@actid

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'alternative text (alt text)',
	N'Descriptive text added to an object. Also called alt text.',
	'https://en.wikipedia.org/wiki/Alt_attribute'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An example of alt attribute text being displayed in place of an unavailable image, with the underlying HTML displayed below it',
	'0/03/Alt_attribute_example.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The Wikipedia article for wolf on the Lynx web browser, displaying the text of the alt attribute in orange in place of the images',
	'c/c2/Wikipedia_Wolf_article_displayed_on_Lynx.png'
)

-- Americans with Disabilities Act (ADA)
-- Wikipedia: Americans with Disabilities Act of 1990
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Americans with Disabilities Act (ADA)',
	N'Law that requires any company with 15 or more employees to make reasonable attempts to accommodate the needs of physically challenged workers.',
	'https://en.wikipedia.org/wiki/Americans_with_Disabilities_Act_of_1990'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Americans with Disabilities Act of 1988, S. 2346, Page 1[5]',
	'c/c1/Americans_with_Disabilities_Act_1988.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Americans with Disabilities Act of 1990, Page 52[6]',
	'd/d5/Americans_with_Disabilities_Act_of_1990%2C_page_two.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Americans with Disabilities Act of 1990, Page 1[6]',
	'6/6f/Americans_with_Disabilities_Act_of_1990%2C_page_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Speech cards used by President George H. W. Bush at the signing ceremony of the Americans with Disabilities Act (ADA) on July 26, 1990[14]',
	'd/d5/President_George_H_W_Bush_Signing_of_the_ADA_%28Americans_with_Disabilities_Act%29_Bill_1990.gif'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The ADA sets standards for construction of accessible public facilities. Shown is a sign indicating an accessible fishing platform at Drano Lake, Washington.',
	'7/7d/Drano_Lake_accessible_fishing_platform_signage.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Development of George H. W. Bush Administration Disability Policy. White House Memo. April 21, 1989.[38]',
	'a/a7/ADA_Development_of_Administration_Disability_Policy_042189_Page_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'President Bush signs the Americans with Disabilities Act into law.',
	'f/f6/Bush_signs_in_ADA_of_1990.jpg'
)

-- artificial Intelligence (AI)
-- Wikipedia: Artificial intelligence
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'artificial Intelligence (AI)',
	N'The technological use of logic and prior experience to simulate human intelligence.',
	'https://en.wikipedia.org/wiki/Artificial_intelligence'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'In supervised learning, the training data is labelled with the expected answers, while in unsupervised learning, the model identifies patterns or structures in unlabelled data.',
	'4/4d/Supervised_and_unsupervised_learning.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Kismet, a robot head made in the 1990s, is a machine that can recognise and simulate emotions.[68]',
	'2/27/Kismet-IMG_6007-gradient.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Illustration of gradient descent for three different starting points; two parameters (represented by the plan coordinates) are adjusted in order to minimise the loss function (the height).',
	'a/a3/Gradient_descent.gif'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Expectation–maximisation clustering of Old Faithful eruption data starts from a random guess but then successfully converges on an accurate clustering of the two physically distinct modes of eruption.',
	'6/69/EM_Clustering_of_Old_Faithful_data.gif'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Raspberry Pi AI Kit',
	'1/1f/Raspberry_Pi_AI_Kit_for_Raspberry_Pi_5_complete_Kit_07.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'AI Overviews, an example of AI use on search engines',
	'e/e3/AI_Overviews_result_for_What_is_Wikipedia%2C_2_March_2026.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Street art in Tel Aviv[199][200]',
	'8/8e/ChatGPT_street_art_in_Tel_Aviv.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The first global AI Safety Summit was held in the United Kingdom in November 2023 with a declaration calling for international cooperation.',
	'3/36/Vice_President_Harris_at_the_group_photo_of_the_2023_AI_Safety_Summit.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The word "robot" itself was coined by Karel Čapek in his 1921 play R.U.R., the title standing for "Rossum''s Universal Robots".',
	'8/87/Capek_play.jpg'
)

-- audio books
-- Wikipedia: Audiobook
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'audio books',
	N'Reads aloud to the user instead of the user reading on a printed page or on the screen.',
	'https://en.wikipedia.org/wiki/Audiobook'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Caption reads: "The phonograph at home reading out a novel." From Daily Graphic (New York), 2 April 1878. Less than a year after the invention of the phonograph, this drawing offered a future vision. Novels however would remain impractical for phonographs until the 1930s.',
	'4/49/The_Papa_of_the_Phonograph%2C_Daily_Graphic.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An audiobook collection in a library, containing a mix of cassette tape and CD-ROM formats',
	'c/cf/AudiobookLibrary2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Audiobook used to disseminate information among farmers in Kenya',
	'e/eb/Farm_Extension_Worker.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Example of an audio studio for professional readings. The studio is surrounded in sound baffle panels to mitigate reverberation from the speaker, allowing the microphone to pick up clearer audio.',
	'1/14/Bolkonskij-frontal.jpg'
)

-- augmented reality (AR)
-- Wikipedia: Augmented reality
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'augmented reality (AR)',
	N'A type of virtual reality that uses an image of an actual place or thing and adds digital information to it.',
	'https://en.wikipedia.org/wiki/Augmented_reality'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Augmented reality for viewing furniture in the real world',
	'2/2f/Augmented_Reality_for_eCommerce.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An example of augmented reality: a man viewing a life-size virtual model of a building',
	'a/ad/Suteki_Hololens_applikation_.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An augmented reality mapping application',
	'5/59/Navit_Reality_View_next_to_reality.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A man wearing an augmented reality headset',
	'd/d1/MicrosoftHoloLensBloomGesture.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Magic Leap One AR headset',
	'6/67/Magic_Leap_No_-_2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Virtual Fixtures – early AR system, U.S. Air Force, Wright-Patterson Air Force Base (1992)',
	'd/d4/Virtual-Fixtures-USAF-AR.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Meta 2 augmented reality headset from Meta',
	'4/4c/Wearing_AR_Glasses.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Augmented reality system for soldier ARC4 (U.S. Army, 2017)',
	'2/20/ARC4_AR_System.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'LandForm video map overlay marking runways, road, and buildings during 1999 helicopter flight test',
	'7/74/LandForm_displays_landmarks_and_other_indicators_during_helicopter_flight_at_Yuma_Proving_Ground..JPG'
)

-- BYOD (bring your own device)
-- Wikipedia: Bring your own device
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'BYOD (bring your own device)',
	N'Policy that enables employees to use their personal devices to conduct business.',
	'https://en.wikipedia.org/wiki/Bring_your_own_device'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- chip-and-pin technology
-- Wikipedia: EMV
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'chip-and-pin technology',
	N'An improvement in card technology that stores data on an embedded chip instead of a magnetic stripe.',
	'https://en.wikipedia.org/wiki/EMV'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An EMV credit card',
	'6/60/JGC_VISA01s.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Example of payment terminal processing Chip and PIN, with the ENTER PIN dialog shown',
	'a/a1/Castles_Technology_payment_terminal_with_BCA_Debit_Mastercard_%282026-04-19%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Contact pad for the electrical interface on the front side of a credit card',
	'c/c5/Kontaktfeld.Kreditkarte.EMV-Standard.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An EMV chip semiconductor package on the side opposite to its contact pads',
	'4/40/Debit_Card_Chip_Package_%28Back%29_%2849924994081%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'View of the chip, a die shot',
	'3/3c/Debit_Card_Chip_%28Whitebalanced%29.png'
)

-- computer
-- Wikipedia: Computer
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'computer',
	N'An electronic device, operating under the control of instructions stored in its own memory, that can accept data, process the data to produce information, and store the information for future use.',
	'https://en.wikipedia.org/wiki/Computer'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A human computer, with microscope and calculator, 1952',
	'b/be/X-4_with_Female_Computer_-_GPN-2000-001932.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The Ishango bone, a bone tool dating back to prehistoric Africa',
	'4/42/Os_d%27Ishango_IRSNB.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The Chinese suanpan (算盘). The number represented on this abacus is 6,302,715,408.',
	'a/af/Abacus_6.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The Antikythera mechanism, dating back to ancient Greece circa 200–80 BCE, is an early analog computing device.',
	'c/c8/Antikythera_Fragment_A_%28Front%29.webp'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A slide rule',
	'1/17/Sliderule_2005.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Charles Babbage',
	'6/6b/Charles_Babbage_-_1860.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Electro-mechanical calculator (1920) by Leonardo Torres Quevedo.',
	'7/7d/Aritm%C3%B3metro_Electromec%C3%A1nico.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Sir William Thomson''s third tide-predicting machine design, 1879–81',
	'a/aa/099-tpm3-sk.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Replica of Konrad Zuse''s Z3, the first fully automatic, digital (electromechanical) computer',
	'4/4c/Z3_Deutsches_Museum.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Konrad Zuse, inventor of the modern computer[41][42]',
	'd/da/Konrad_Zuse_%281992%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Colossus, the first electronic digital programmable computing device, was used to break German ciphers during World War II. It is seen here in use at Bletchley Park in 1943.',
	'4/4b/Colossus.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'ENIAC was the first electronic, Turing-complete device, and performed ballistics trajectory calculations for the United States Army.',
	'd/d3/Glen_Beck_and_Betty_Snyder_program_the_ENIAC_in_building_328_at_the_Ballistic_Research_Laboratory.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A section of the reconstructed Manchester Baby, the first electronic stored-program computer',
	'2/21/SSEM_Manchester_museum_close_up.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Bipolar junction transistor (BJT)',
	'e/e2/Transistor-die-KSY34.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Integrated circuits are typically packaged in plastic, metal, or ceramic cases to protect the IC from damage and for ease of assembly.',
	'0/0c/MOS_6502A.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Die photograph of a MOS 6502, an early 1970s microprocessor integrating 3500 transistors on a single chip',
	'8/8b/MOS_6502_die.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Magnetic-core memory (using magnetic cores) was the computer memory of choice in the 1960s, until it was replaced by semiconductor memory (using MOS memory cells).',
	'5/51/Magnetic_core.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Hard disk drives are common storage devices used with computers.',
	'0/00/HDDspin.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Cray designed many supercomputers that used multiprocessing heavily.',
	'a/a2/Cray_2_Arts_et_Metiers_dsc03940.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Replica of the Manchester Baby, the world''s first electronic stored-program computer, at the Museum of Science and Industry in Manchester, England',
	'b/bb/SSEM_Manchester_museum.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A 1970s punched card containing one line from a Fortran program. The card reads: "Z(1) = Y + W(1)" and is labeled "PROJ039" for identification purposes.',
	'5/58/FortranCardPROJ039.agr.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The actual first computer bug, a moth found trapped on a relay of the Harvard Mark II computer',
	'e/e7/First_Computer_Bug%2C_1947.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Visualization of a portion of the routes on the Internet',
	'd/d2/Internet_map_1024.jpg'
)

-- computer literacy
-- Wikipedia: Computer literacy
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'computer literacy',
	N'Having a current knowledge and understanding of computers, mobile devices, the web, and related technologies.',
	'https://en.wikipedia.org/wiki/Computer_literacy'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Children using a laptop computer at school (2008)',
	'4/40/Children_at_school_%288720604364%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Computer class in India (2015)',
	'f/f1/When_technology_meets_Community.jpg'
)

-- computer-aided manufacturing (CAM)
-- Wikipedia: Computer-aided manufacturing
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'computer-aided manufacturing (CAM)',
	N'Used by manufacturers to streamline production and ship products more quickly. With CAM, robots perform work that is too dangerous, detailed, or monotonous for people.',
	'https://en.wikipedia.org/wiki/Computer-aided_manufacturing'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'CAD model and CNC machined part',
	'3/31/CAD_model_and_CNC_machined_part.PNG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Chrome-cobalt disc with crowns for dental implants, manufactured using WorkNC CAM',
	'1/14/Disc_with_dental_implants_made_with_WorkNC.jpg'
)

-- data
-- Wikipedia: Data
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'data',
	N'Raw facts, such as text or numbers',
	'https://en.wikipedia.org/wiki/Data'
)
select @qid=scope_identity()

-- Digital assistants
-- Wikipedia: Virtual assistant

-- no browser-friendly raster images remaining after filtering

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Digital assistants',
	N'Apps like Amazon’s Alexa or Apple’s Siri that use natural language processing to respond to your verbal commands or questions, using search technology to provide answers or perform a task, such as adding an item to a grocery list.',
	'https://en.wikipedia.org/wiki/Virtual_assistant'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Google Assistant running on a Pixel XL smartphone',
	'0/01/Android_Assistant_on_the_Google_Pixel_XL_smartphone_%2829526761674%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Amazon Echo Dot smart speaker running the Alexa virtual assistant',
	'3/3c/Amazon_Echo_Dot_%2827716286638%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Apple TV remote control, with which users can ask the virtual assistant Siri to find content to watch',
	'6/64/Apple_tv_gen_4_remote.jpeg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Graphical sum up of the study capturing reasons of interest of virtual assistants for consumers',
	'e/e2/Study_results.jpg'
)

-- digital citizen
-- Wikipedia: Digital citizen
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'digital citizen',
	N'Person familiar with how to use technology to become an educated and productive member of the digital world.',
	'https://en.wikipedia.org/wiki/Digital_citizen'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Every year the Federal Partners in Bullying Prevention hosts a summit to highlight its work to prevent cyberbullying, especially in schools and amongst students, in efforts to become responsible digital citizens.',
	'a/a6/Annual_Federal_Bullying_Prevention_Summit_-_Adam.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Hosted by the Government of France at the OECD Conference Centre in Paris, representatives discussed trust in data and how we can use data to spread openness in addressing environmental challenges.',
	'1/10/2019_EITI_Global_Conference_2019_EITI_Global_Conference_%2848093042323%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'At the 2018 Institutional Convention, Shola Mos-Shogbamimu, founder of the convention, discusses the role of digital media in preventing the spread of sexual harassment and what measures can be taken to stop the spread of negativity in youth.',
	'6/6d/Inclusion_Convention.jpg'
)

-- digital divide
-- Wikipedia: Digital divide
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'digital divide',
	N'The gap between those who have access to technology and its resources and information, especially on the Internet, and those who do not.',
	'https://en.wikipedia.org/wiki/Digital_divide'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A diagram showing four ways in which to analyze the digital divide',
	'7/7e/DigitalDivide_Hilbert2011.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The digital divide measured in terms of bandwidth is not closing, but fluctuating up and down. Gini coefficients for telecommunication capacity (in kbit/s) among individuals worldwide[38]',
	'1/19/BandwidthInequality1986-2014.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A laptop lending kiosk at Texas A&M University–Commerce''s Gee Library',
	'2/2c/13394-Laptops_Anytime_Launch-6629_%2810844113484%29.jpg'
)

-- digital literacy
-- Wikipedia: Digital literacy
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'digital literacy',
	N'Having a current knowledge and understanding of computers, mobile devices, the web, and related technologies',
	'https://en.wikipedia.org/wiki/Digital_literacy'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A teacher and his students in a computer lab',
	'b/b2/A._Stuart_and_Students.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Photo-visual literacy skills can be put into practice by analyzing the visual elements of the images and billboards, understanding the context in which they are presented, evaluating their credibility and reliability, and making decisions based on that information.',
	'3/3a/Times_Square_April_2022_by_Don_Ramey_Logan.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Digital literacy class in NSS camp 2024 at St Aloysious HSS Kollam',
	'c/cf/Digital_literacy_class_in_NSS_camp_2024.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Digital natives using a smart car',
	'6/60/Digital_Natives_in_Car.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Student working on assignment using computer[71]',
	'6/68/Student_on_computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A librarian at the National Library Medicine of the United States accessing the Physician Data Query using an IBM PC (1987)',
	'6/67/Librarian_accessing_pdq.jpg'
)

-- embedded computer
-- Wikipedia: Embedded system
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'embedded computer',
	N'A computer that functions as one component in a larger product, and which has a specific purpose.',
	'https://en.wikipedia.org/wiki/Embedded_system'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An embedded system on a plug-in card with processor, memory, power supply, and external interfaces',
	'6/6b/DHCOM_Computer_On_Module_-_AM35x.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Embedded Computer Sub-Assembly for Accupoll Electronic Voting Machine[8]',
	'a/af/Accupoll-embedded-computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'e-con Systems eSOM270 & eSOM300 Computer on Modules',
	'6/6f/ESOM270_eSOM300_Computer_on_Modules.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Embedded system text user interface using MicroVGA[nb 1]',
	'a/a1/MicroVGA_TUI_demoapp.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A close-up of the SMSC LAN91C110 (SMSC 91x) chip, an embedded Ethernet chip',
	'8/82/SMSC_LAN91C110_ethernet_chip.jpg'
)

-- enterprise computing
-- Wikipedia: Enterprise resource planning
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'enterprise computing',
	N'Refers to the use of technology by a company’s employees to meet the needs of a large business.',
	'https://en.wikipedia.org/wiki/Enterprise_resource_planning'
)
select @qid=scope_identity()

-- graphic organizers
-- Wikipedia: Graphic organizer

-- no browser-friendly raster images remaining after filtering

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'graphic organizers',
	N'Software that enables a user to create an outline or structure of information.',
	'https://en.wikipedia.org/wiki/Graphic_organizer'
)
select @qid=scope_identity()

-- green computing
-- Wikipedia: Green computing

-- no browser-friendly raster images remaining after filtering

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'green computing',
	N'A practice that involves reducing electricity consumed and environmental waste generated when using computers, mobile devices, and related technologies.',
	'https://en.wikipedia.org/wiki/Green_computing'
)
select @qid=scope_identity()

-- hardware
-- Wikipedia: Computer hardware

-- no browser-friendly raster images remaining after filtering

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'hardware',
	N'The device itself and its components, such as wires, cases, switches, and electronic circuits.',
	'https://en.wikipedia.org/wiki/Computer_hardware'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'PDP-11 CPU board',
	'8/88/PDP-11-M7270.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Growth in processor performance (as measured by benchmarks),[13] 1978–2010',
	'9/9a/Growth_in_processor_performance%2C_1978%E2%80%932010.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Inside a custom-built computer: power supply at the bottom has its own cooling fan',
	'a/ac/Computer_from_inside_018.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An IBM System z9 mainframe',
	'6/62/IBM_System_Z9_%28type_2094_front%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Computer motherboard',
	'b/b7/Computer-motherboard.jpg'
)

-- Individuals with Disabilities Education Act (IDEA)
-- Wikipedia: Individuals with Disabilities Education Act
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Individuals with Disabilities Education Act (IDEA)',
	N'U.S. law that requires that public schools purchase or acquire funding for adaptive technologies.',
	'https://en.wikipedia.org/wiki/Individuals_with_Disabilities_Education_Act'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- information
-- Wikipedia: Information
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'information',
	N'Data that has been processed to become meaningful.',
	'https://en.wikipedia.org/wiki/Information'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- Information Technology (IT) department
-- Wikipedia: Information technology
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Information Technology (IT) department',
	N'Department in medium and large businesses responsible for ensuring that all the computer operations, mobile devices, and networks run smoothly.',
	'https://en.wikipedia.org/wiki/Information_technology'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A computer lab contains a wide range of information technology elements, including hardware, software and storage systems.',
	'f/f3/CSIRO_ScienceImage_8130_The_computer_lab_on_RV_Southern_Surveyor.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Antikythera mechanism, considered the first mechanical analog computer, dating back to the first century BC.',
	'7/79/NAMA_Machine_d%27Anticyth%C3%A8re_2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Zuse Z3 replica on display at Deutsches Museum in Munich. The Zuse Z3 is the first programmable computer.',
	'4/4c/Z3_Deutsches_Museum.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Ferranti Mark I computer logic board',
	'a/af/Large_1984_0535_0001.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Punched tapes were used in early computers to store and represent data.',
	'0/00/PaperTapes-5and8Hole.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'IBM card storage warehouse located in Alexandria, Virginia in 1959. This is where the United States government kept storage of punched cards.',
	'8/87/IBM_card_storage.NARA.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Radio towers at Pine Hill lookout',
	'7/7b/Pine_Hill_Lookout_and_Towers_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A woman sending an email at an internet cafe''s public computer.',
	'c/c4/Woman_sending_an_email_at_an_internet_cafe_public_computer.jpg'
)

-- integrated circuits
-- Wikipedia: Integrated circuit
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'integrated circuits',
	N'Developed in the 1960s, packed the equivalent of thousands of vacuum tubes or transistors into a silicon chip about the size of your thumb.',
	'https://en.wikipedia.org/wiki/Integrated_circuit'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A microscope image of an integrated circuit die used to control LCDs. The pinouts are the dark circles surrounding the integrated circuit.',
	'8/89/NXP_PCF8577C_LCD_driver_with_I%C2%B2C_%28Colour_Corrected%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Jack Kilby''s original integrated circuit – the first in the world – made from germanium with gold-wire interconnects',
	'en/4/42/Kilby_solid_circuit.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Robert Noyce invented the first monolithic integrated circuit in 1959. The chip was made from silicon.',
	'8/82/Robert_Noyce_with_Motherboard_1959.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Dov Frohman, an Israeli electrical engineer who developed the EPROM in 1969–1971',
	'6/65/Dov_Frohman.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Virtual detail of an integrated circuit through four layers of planarized copper interconnect, down to the polysilicon (pink), wells (greyish), and substrate (green)',
	'c/c6/Siliconchip_by_shapeshifter.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A/D converter IC in a DIP',
	'4/4f/AD570JD.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The die from an Intel 8742, an 8-bit NMOS microcontroller that includes a CPU running at 12 MHz, 128 bytes of RAM, 2048 bytes of EPROM, and I/O in the same chip',
	'6/64/Intel_8742_153056995.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Rendering of a small standard cell with three metal layers (dielectric has been removed). The sand-colored structures are metal interconnect, with the vertical pillars being contacts, typically plugs of tungsten. The reddish structures are polysilicon gates, and the solid at the bottom is the crystalline silicon bulk.',
	'a/aa/Silicon_chip_3d.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Soviet MSI nMOS chip made in 1977, part of a four-chip calculator set designed in 1970[78]',
	'7/7e/RUS-IC.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Upper interconnect layers on an Intel 80486DX2 microprocessor die',
	'2/2b/80486DX2_200x.png'
)

-- intelligent classroom
-- Wikipedia: Educational technology
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'intelligent classroom',
	N'Classroom in which technology is used to facilitate learning and communication.',
	'https://en.wikipedia.org/wiki/Educational_technology'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A student using an interactive whiteboard',
	'a/a2/Interactive_whiteboard_at_CeBIT_2007.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Early 20th-century abacus used in a Danish elementary school',
	'a/a0/Kugleramme.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'19th-century classroom, Auckland',
	'5/52/19th_century_classroom%2C_Auckland_-_0795.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Cuisenaire rods',
	'9/9d/Cuisenaire_zotzak.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A 2.5 m teaching slide rule compared to a normal sized model',
	'9/9f/Teaching_sliderule_comparison.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Teaching and learning online',
	'c/c8/Students_working_on_class_assignment_in_computer_lab.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Combination whiteboard and bulletin board',
	'2/20/Combo_whiteboard_and_bulletin_board.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Learning management system',
	'1/1c/Learning_Management_System.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Preschool activity',
	'c/c2/Preschool_activity_130523-Z-WA217-031.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Teacher showing primary school students how to work a program at a primary school in Santa Fe, Mexico City',
	'd/db/03212012Matitec_entrega_dispositivos_santafe083.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Students at the World Vision Higher Secondary College',
	'5/53/World_Vision_Higher_Secondary_College.-_Wikipedia_Education_Program_06.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A student attending online class in Kerala, India, during the COVID-19 pandemic',
	'0/08/Student_attending_online_class_in_Kerala.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Students using laptops in higher education',
	'8/86/Wikimedia_Taiwan_10_Anniversary_Conference_Combining_the_Education_and_Wikimedia_in_Taiwan_Taking_the_Higher_Education_as_an_Example_03.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The OLPC laptop being introduced to children in Haiti',
	'0/0d/OLPC_Haiti.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Teacher training in Naura',
	'5/5a/Teacher_training_in_Naura.jpg'
)

-- intelligent workplace
-- Wikipedia: Office
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'intelligent workplace',
	N'Uses technology to enable workers to connect to the company’s network, communicate with each other, use productivity software and apps, meet via web conferencing, and more.',
	'https://en.wikipedia.org/wiki/Office'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Midtown Manhattan in New York City is the largest central business district in the world, comprising over 350 million square feet of office space.',
	'a/a5/West_side_of_Manhattan_from_Hudson_Commons_%2895103p%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A typical modern office, in Israel',
	'0/09/Channel_1_Israel_DSC0021.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Jack London in his office, 1916',
	'c/c2/JackLondon-office-1916.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An early European office, 1719',
	'8/8c/Office_1719.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The sprawling complex of the extended East India House c. 1800. The company employed a plethora of bureaucrats to administer its territories in India.',
	'4/40/East_India_House_by_Thomas_Malton_the_Younger.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An office in 1903, equipped with speaking tubes',
	'f/f7/Office_speaking_tubes_1903.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Open plan TradeMe offices, above NZX, Wellington, New Zealand',
	'a/a4/TradeMe_offices.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A small office building in Salinas, California, United States',
	'4/44/Salinas_Office.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Alandia Trade Center, a real estate office building in Mariehamn, Åland',
	'8/8f/Alandia_Trade_Center%2C_2019_%2801%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Apple Inc. headquarters of neo-futuristic architecture at Apple Park in Cupertino, California, United States',
	'5/5a/Aerial_view_of_Apple_Park_dllu.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The One World Trade Center in Manhattan is a high-rise office building, the tallest of its kind in the U.S.',
	'9/93/View_to_One_World_Trade_Center.jpg'
)

-- Internet of Things (IoT)
-- Wikipedia: Internet of things
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Internet of Things (IoT)',
	N'An environment where processors are embedded in every product imaginable (things), and these things communicate with one another via the Internet or wireless networks.',
	'https://en.wikipedia.org/wiki/Internet_of_things'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An example of how the Internet of things is being utilized to connect a home thermostat.',
	'c/cb/Internet_of_Things_using_NEST.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Digital variable speed-limit sign in the Czech Republic.',
	'7/73/Nov%C3%A1_Povltavsk%C3%A1%2C_Ho%C5%99%C3%AD_v_tunelu_%2801%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'GE Digital CEO William Ruh speaking about GE''s attempts to gain a foothold in the market for IoT services at the first IEEE Computer Society TechIgnite conference',
	'4/48/WilliamRuhAtIEEETechIgnite2017.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Town of Internet of Things in Hangzhou, China',
	'2/20/TownOfInternetOfThingsHangzhou.jpg'
)

-- kiosk
-- Wikipedia: Interactive kiosk
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'kiosk',
	N'A freestanding booth usually placed in a public area that can contain a display device used to show information to the public or event attendees.',
	'https://en.wikipedia.org/wiki/Interactive_kiosk'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An Internet kiosk in Hemer, Germany',
	'0/07/Sauerlandstammtisch-Infoterminal1-Asio.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Cyosce Interactive Kiosk - Pemerintah Kabupaten Sula, Indonesia',
	'3/32/Cyosce_Interactive_Kiosk_-_Pemerintah_Kabupaten_Sula_Indonesia.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A McDonald''s self-service kiosk in Nassau County, New York',
	'0/03/Denton_House_LI_03_-_Order_kiosk.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Payment kiosk',
	'7/79/Kiosk_self_service_payment.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Self-service photo kiosks in London',
	'4/4e/Boots_self-service_photo_kiosks%2C_Enfield%2C_London.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Information kiosk in Event, Jof Fair Skodam Brawijaya Malang, Indonesia',
	'9/98/Information_kiosk_in_Event%2C_Jof_Fair_Skodam_Brawijaya_Malang%2C_Indonesia.jpg'
)

-- learning management system (LMS)
-- Wikipedia: Moodle
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'learning management system (LMS)',
	N'Web-based sites where students can check their progress in a course, take practice tests, and exchange messages with the instructor or other students.',
	'https://en.wikipedia.org/wiki/Moodle'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Moodle developer, Martin Dougiamas in 2007',
	'2/28/Martin_Dougiamas.jpg'
)

-- machine-to-machine (M2M)
-- Wikipedia: Machine to machine
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'machine-to-machine (M2M)',
	N'Using computers to monitor computer assembly lines and equipment.',
	'https://en.wikipedia.org/wiki/Machine_to_machine'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The first caller identification receiver',
	'5/5a/Caller_ID_receiver.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Processing Chips',
	'a/ad/Processing_Chips.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Commonplace consumer application',
	'c/c0/HTC_Wildfire_S_%28Mobile_Wikipedia%29_ubt.jpeg'
)

-- microprocessor
-- Wikipedia: Microprocessor
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'microprocessor',
	N'The “brains” of a computer; a chip that contains a central processing unit.',
	'https://en.wikipedia.org/wiki/Microprocessor'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The PICO1/GI250 chip introduced in 1971: It was designed by Pico Electronics (Glenrothes, Scotland) and manufactured by General Instrument of Hicksville NY.',
	'f/f9/GI250_PICO1_die_photo.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Intel''s first microprocessor, the 4004, with cover removed (left) and as actually used (right)',
	'0/09/C4004_%28Intel%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Intel advertisement in Electronic News magazine from 1971 emphasizing the 4004''s affordability, compactness, ease of programming, and flexibility.',
	'1/1b/Intel_4004_ad.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Upper interconnect layers on an Intel 80486DX2 die',
	'2/2b/80486DX2_200x.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'ABIT BP6 motherboard supported two Intel Celeron 366MHz processors picture shows Zalman heatsinks.',
	'4/47/Abit_BP6_motherboard_2_celerons.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Abit BP6 dual-socket motherboard shown with Zalman Flower heatsinks',
	'7/7b/Abit_dual_celeron_pc_motherboard.jpg'
)

-- mobile health (mHealth)
-- Wikipedia: MHealth
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'mobile health (mHealth)',
	N'Refers to healthcare professionals using smartphones or tablets to access health records stored in the cloud, and patients using digital devices to monitor their conditions and treatments.',
	'https://en.wikipedia.org/wiki/MHealth'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Nurse using a mobile phone in Accra, Ghana',
	'en/4/48/Nurse_in_Ghana_using_mobile_phone.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Malaria Clinic in Tanzania helped by SMS for Life program that uses cell phones to efficiently deliver malaria vaccine',
	'4/46/Saving_Lives_with_SMS_for_Life.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Mobile phone subscribers per 100 inhabitants 1997–2007',
	'1/19/Mobile_phone_subscribers_per_100_inhabitants_1997-2007_ITU.png'
)

-- natural language processing
-- Wikipedia: Natural language processing
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'natural language processing',
	N'A form of data input in which computers interpret and digitize spoken words or commands.',
	'https://en.wikipedia.org/wiki/Natural_language_processing'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Word cloud of stop words in Hebrew',
	'8/8c/Hebrew_stop_words_word_cloud.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Lemmatization of Basque words',
	'2/27/Eustagger_euskal_lematizatzailearen_adibidea.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An entity linking pipeline',
	'3/34/Entity_Linking_-_Example_of_pipeline.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Machine translation in Firefox',
	'4/43/Use_of_Firefox%27_%27Translate_selection_to_English%27_machine_translation_on_Commons_talk_meta_pages_02.png'
)

-- personal computer (PC)
-- Wikipedia: Personal computer
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'personal computer (PC)',
	N'Computers designed for personal use, as opposed to commercial or industrial use.',
	'https://en.wikipedia.org/wiki/Personal_computer'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A person using a desktop personal computer',
	'b/b4/Golden_ratio_logo_design_technique.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Commodore PET in 1983 (at the American Museum of Science and Energy), an early example of a personal computer',
	'1/15/Commodore_PET_Exhibit_at_American_Museum_of_Science_and_Energy_Oak_Ridge_Tennessee.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The 8-bit architecture Pravetz 82 computer produced in Bulgaria from 1982, in a classroom in the Soviet Union',
	'2/23/Pn-pravez-class-4.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Altair 8800, one of the first personal computers',
	'0/01/Altair_8800_Computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'IBM 5150, released in 1981',
	'a/a6/IBM_PC-IMG_7271_%28transparent%29.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The 8-bit PMD 85 personal computer produced in 1985–1990 by the Tesla company in the former Socialist Czechoslovakia',
	'6/69/PMD_85-1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Sun SPARCstation 1+ from the early 1990s, with a 25 MHz RISC processor',
	'6/69/SPARCstation_1_edit.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Dell OptiPlex desktop computer (2006)',
	'b/b6/Desktop_personal_computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The IBM 5100 from 1975, one of the first portable computers',
	'2/2d/IBM_5100_-_MfK_Bern.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An MSI laptop computer',
	'b/ba/MSI_laptop_with_English_Wikipedia_screenshot_20100614.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An HP netbook',
	'7/7b/HP_2133_Mini-Note_PC.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'HP Compaq tablet PC with rotating/removable keyboard',
	'8/82/HP_Tablet_PC_running_Windows_XP_%28Tablet_PC_edition%29_%282006%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An LG G4 smartphone',
	'4/49/LG_G4-2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A screenshot of the LibreOffice Writer software',
	'f/f4/LibreOffice_7.2.4.1_Writer_screenshot.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A screenshot of Krita, which is a raster graphics editor',
	'1/15/Krita_5.0.0_screenshot.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Children being taught how to use a laptop computer in 2005. An older (1990s-era) desktop personal computer''s CRT monitor is visible in the background.',
	'2/2a/US_Navy_050210-N-2802K-001_Chief_Aviation_Warfare_Systems_Operator_Richard_McCurdy_demonstrates_how_to_create_a_PowerPoint_presentation_to_Shirley_Lanham_Elementary_School_fourth-graders.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'ROG Xbox Ally, a handheld gaming computer co-developed by Microsoft and Asus.',
	'6/69/Xbox_Handheld.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Personal computers worldwide in million distinguished by developed and developing world',
	'5/53/Personal_computers_%28million%29_ITU.png'
)

-- robotics
-- Wikipedia: Robotics
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'robotics',
	N'The science that combines engineering and technology to create and program robots. Robots are useful in situations where it is impractical, dangerous, or inconvenient to use a human.',
	'https://en.wikipedia.org/wiki/Robotics'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Programmable Universal Machine for Assembly, one of the first industrial robots (1990)',
	'7/7f/Puma_Robotic_Arm_-_GPN-2000-001817.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The InSight lander with solar panels',
	'3/3d/PIA19664-MarsInSightLander-Assembly-20150430.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A robotic leg powered by air muscles',
	'0/07/2005-11-14_ShadowLeg_Finished_medium.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Mantis the spider robot in 2012',
	'e/ef/Mantis_Walking_Machine.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Visualization of entomopter flying on Mars (NASA)',
	'9/97/Mars_entomopter.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Capuchin, a climbing robot',
	'2/29/Capuchin_Free_Climbing_Robot.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Baxter, a robot with versatile arms',
	'f/fc/Baxter_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A robotic hand',
	'b/be/Futur_en_Seine_2012_51.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An electrical circuit',
	'f/f3/Computer_Circuit_Board_MOD_45153624.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A color sensor on a robot',
	'e/e9/Colour_Sensor.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'TOPIO, a ping pong–playing robot',
	'9/92/TOPIO_3.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Kismet can produce a range of facial expressions.',
	'2/27/Kismet-IMG_6007-gradient.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'GPS, radar, and lidar are combined in a vehicle developed for 2007''s DARPA Urban Challenge.',
	'7/7c/ElementBlack2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A robot technician builds small all-terrain robots (courtesy: MobileRobots, Inc.).',
	'en/1/10/MobileRobotsPioneerAT.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Yamaha Motor''s industrial cobot (collaborative robot)',
	'b/ba/Japan-Mobility-Show-2023-RuinDig_586.jpg'
)

-- screen reader
-- Wikipedia: Screen reader
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'screen reader',
	N'Technology that uses audio output to describe the contents of the screen.',
	'https://en.wikipedia.org/wiki/Screen_reader'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- smart devices
-- Wikipedia: Smart device
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'smart devices',
	N'A device that can communicate, locate, and predict; part of the Internet of Things (IoT).',
	'https://en.wikipedia.org/wiki/Smart_device'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- software
-- Wikipedia: Software
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'software',
	N'The programs and apps that instruct the computer to perform tasks. Software processes data into meaningful information.',
	'https://en.wikipedia.org/wiki/Software'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Software written in the JavaScript language',
	'a/a4/JavaScript_code.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Comparison of on-premise hardware and software, infrastructure as a service (IaaS), platform as a service (PaaS), and software as a service (SaaS)',
	'f/ff/Comparison_of_on-premise%2C_IaaS%2C_PaaS%2C_and_SaaS.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Diagram for a traditional software development life cycle from 1988. The numbers represent the typical cost of each phase.',
	'5/5f/Traditional_software_development_life_cycle_diagram.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The source code for a computer program in C. The gray lines are comments that explain the program to humans. When compiled and run, it will output "Hello, world!".',
	'3/39/C_Hello_World_Program.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Blender, a free software program',
	'8/82/Cube_in_Blender_Editor.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Computer-generated simulations are one of the advances enabled by software.[73]',
	'a/aa/A_computer_graphic_of_the_Queen_Elizabeth_carrier_and_carrier_group.jpg'
)

-- speech recognition programs
-- Wikipedia: Speech recognition
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'speech recognition programs',
	N'Software that helps a user to input data or information verbally.',
	'https://en.wikipedia.org/wiki/Speech_recognition'
)
select @qid=scope_identity()

-- no embedded figures with captions found on this article

-- telecommuting
-- Wikipedia: Remote work
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'telecommuting',
	N'Working from home.',
	'https://en.wikipedia.org/wiki/Remote_work'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Most respondents to the same climate survey in 2021–2022 believe that most of us will be working from home in 20 years to help save the planet.',
	'7/7a/There_is_a_strong_feeling_that_most_of_us_will_be_working_from_home_in_20_years_to_help_save_the_planet.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The United States Marine Corps began allowing remote work in 2010.',
	'9/97/USMC-100324-M-6847A-001.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Caregiving obligations may be a distraction for individuals who work from home.',
	'd/d4/Child_playing_while_parent_works_on_laptop_at_home_during_daytime.jpg'
)

-- transistors
-- Wikipedia: Transistor
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'transistors',
	N'Smaller, cheaper, and more reliable replacement for vacuum tubes in the second generation of computers.',
	'https://en.wikipedia.org/wiki/Transistor'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Metal–oxide–semiconductor field-effect transistor (MOSFET), showing gate (G), body (B), source (S) and drain (D) terminals. The gate is separated from the body by an insulating layer (white).',
	'a/a5/MOSFET_Structure.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Julius Edgar Lilienfeld proposed the concept of a field-effect transistor in 1925.',
	'5/59/Julius_Edgar_Lilienfeld_%281881-1963%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'John Bardeen, William Shockley, and Walter Brattain at Bell Labs in 1948; Bardeen and Brattain invented the point-contact transistor in 1947 and Shockley invented the bipolar junction transistor in 1948.',
	'c/c2/Bardeen_Shockley_Brattain_1948.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A replica of the first working transistor, a point-contact transistor invented in 1947',
	'b/bf/Replica-of-first-transistor.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Philco surface-barrier transistor developed and produced in 1953',
	'e/e8/Philco_Surface_Barrier_transistor%3D1953.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Diagram of one of the SiO2 transistor devices made by Frosch and Derrick[7]',
	'7/75/1957%28Figure_9%29-Gate_oxide_transistor_by_Frosch_and_Derrick.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Operation of an FET and its d</sub>"}},"i":0}}]}''>Id-g</sub>"}},"i":0}}]}''>Vg curve. At first, when no gate voltage is applied, there are no inversion electrons in the channel, so the device is turned off. As gate voltage increases, the inversion electron density in the channel increases, the current increases, and the device turns on.',
	'4/43/Threshold_formation_nowatermark.gif'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'2N2222A NPN transistor',
	'a/ae/2N2222A_NPN_Transsitor.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A transistor symbol created on Portuguese pavement at the University of Aveiro',
	'3/38/Transistor_on_portuguese_pavement.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Darlington transistor with the upper case removed so the transistor chip (the small square) can be seen. It is effectively two transistors on the same chip. One is much larger than the other, but both are large in comparison to transistors in large-scale integration because this particular example is intended for power applications.',
	'd/d9/Darlington_transistor_MJ1000.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Assorted discrete transistors',
	'e/e1/Transbauformen.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Soviet-manufactured KT315b transistors',
	'a/aa/Kt315b.jpg'
)

-- vacuum tubes
-- Wikipedia: Vacuum tube
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'vacuum tubes',
	N'Cylindrical glass tubes that controlled the flow of electrons, used in the first generation of computers.',
	'https://en.wikipedia.org/wiki/Vacuum_tube'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Later thermionic vacuum tubes, mostly miniature style, some with top cap connections for higher voltages',
	'e/e9/Elektronenroehren-auswahl.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Operating tubes in an audio power amplifier, the hot cathodes emitting their distinctive red-orange glow',
	'c/c0/Solton_BV60_Bassamp.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Illustration representing a primitive triode vacuum tube and the polarities of the typical DC operating potentials. Not shown are the impedances (resistors or inductors) that would be included in series with the C and B voltage sources.',
	'b/b0/TRIODE_TM11_662_FIG_4.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'US WWV radio station signal generator using vacuum tubes, 1943',
	'd/d9/WWVNBSRadioStation_015.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Australian Wireless Association (AWA) valve display, 1930',
	'9/93/AWA_valve_display_SLNSW_FL1130124.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Soviet-made television set viewed from the rear while powered on. The vacuum tubes are hot enough to pass the Draper point and glow in the visible spectrum.',
	'2/24/Old_TV3.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'One of Edison''s experimental bulbs',
	'4/48/Edison_effect_bulb_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Fleming''s first diodes',
	'4/4d/Fleming_valves.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The first triode, the de Forest Audion, invented in 1906',
	'1/14/Triode_tube_1906.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Triodes as they evolved over some 45 years of tube manufacture, from the RE16 in 1918 to a 1960s era miniature tube',
	'7/7e/Triody_var.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Triode symbol. From top to bottom: plate (anode), control grid, cathode, heater (filament)',
	'f/f2/Triode.PNG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'General Electric Company Pliotron, at the Science History Institute',
	'7/74/General_electric_pliotron_pp_schenectady_3.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The useful region of operation of the screen grid tube (tetrode) as an amplifier is limited to anode potentials in the straight portions of the characteristic curves greater than the screen grid potential.',
	'b/b1/TM11-662_figure_72_tetrode_anode_characteristic.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Beam tetrode designed for radio frequency use. The tube plugs in to a socket that creates an air-tight seal around the outer periphery. A blower and duct work in the chassis force air through the tube''s fins to carry away heat. This type of tube is sometimes referred to as a "doorknob" tube, owing to its shape and size.',
	'5/5c/Eimac.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Miniature tube (right) compared to the older octal style. Not including pins, the larger tube, a 5U4GB, is 93 mm high with a 35 mm-diameter base, while the smaller, a 9-pin 12AX7, is 45 mm high and 20.4 mm in diameter.',
	'6/6a/Vacuum_tubes_octal%2C_miniature.agr.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Subminiature CV4501 tube (SQ version of EF72), 35 mm long × 10 mm diameter (excluding leads)',
	'2/2e/CV4501.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'RCA 6DS4 "nuvistor" triode, c. 20 mm high by 11 mm diameter',
	'c/cf/6DS4NuvistorVacuumTube.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Commercial packaging for vacuum tubes used in the latter half of the 20th century including boxes for individual tubes (bottom right), sleeves for rows of the boxes (left), and bags that smaller tubes would be put in by a store upon purchase (top right)',
	'd/d5/Vacuum_Tube_Commercial_Packages.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The 1946 ENIAC computer used 17,468 vacuum tubes and consumed 150 kW of power.',
	'c/c9/ENIAC_Penn2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Vacuum tubes seen on end in a recreation of the World War II-era Colossus computer at Bletchley Park, England',
	'c/cb/GB-ENG_-_Bletchley_-_Computers_-_Buckinghamshire_-_Milton_Keynes_-_Bletchly_-_Bletchley_Park_%284890148011%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Circuitry from core memory unit of Whirlwind',
	'8/8f/8863-Project-Whirlwind-CRMI.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The anode (plate) of this transmitting triode has been designed to dissipate up to 500 W of heat.',
	'f/fb/HiPowerTube3-500_C.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Metal-cased tubes with octal bases',
	'0/06/6Z4_var.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Triode tube type GS-9B; designed for use at radio frequencies up to 2000 MHz and rated for 300 watts anode power dissipation.[65] The finned heat sink provides conduction of heat from anode to air stream.',
	'a/a8/GS-9B.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Voltage-regulator tube in operation. Low-pressure gas within tube glows due to current flow.',
	'f/fc/5651RegulatorTubeInOperation.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Zellweger glow tube that contains Radium-226 or Tritium. There are no indicators to alert to the presence of radioactive materials',
	'4/4b/Zellweger_Glow_Tube.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Three-battery array powering a vacuum-tube circuit (highlighting the "C" battery)',
	'1/17/C_Battery_circuit_of_a_Triode_vacuum_tube.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Tube tester manufactured in 1930',
	'c/ce/Acremeter_tube_tester.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Special Quality E88CC by Philips',
	'a/a6/Vacuum_tube_Philips_E88CC_double_triode_Special_Quality_IMG_7907.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Getter in opened tube; silvery deposit from getter',
	'4/4a/Getter_diagram.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Dead vacuum fluorescent display (Air has leaked in and the getter spot has become white.)',
	'1/19/Opachki_dead_vacuum_luminescent_display_bednyaga_da.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Universal vacuum tube tester',
	'3/3b/VacuumTubeTester_TV-7D_4.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Paraset Mk. VII/2 clandestine radio',
	'8/8b/Paraset.png'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'70-watt tube-hybrid audio amplifier',
	'4/43/SE-300B-70W.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Typical triode plate characteristics',
	'4/44/TriodeCurves.png'
)

-- virtual reality (VR)
-- Wikipedia: Virtual reality
insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'virtual reality (VR)',
	N'The use of computers to simulate a real or imagined environment that appears as a three-dimensional (3-D) space.',
	'https://en.wikipedia.org/wiki/Virtual_reality'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Researchers with the European Space Agency in Darmstadt, Germany, equipped with a VR headset and motion controllers, demonstrating how astronauts might use virtual reality in the future to train to extinguish a fire inside a lunar habitat',
	'e/ee/Reality_check_ESA384313.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An operator controlling The Virtual Interface Environment Workstation (VIEW)[9] at NASA Ames around 1990',
	'a/ab/THE_VIEW_%28Virtual_Reality%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An Omni treadmill being used at a VR convention',
	'a/a0/Treadmill_Omni.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A Missouri National Guardsman looks into a VR training head-mounted display at Fort Leonard Wood in 2015.',
	'1/1f/Engineers_train_in_virtual_environment_to_prepare_for_real_missions_150616-Z-YF431-084.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'View-Master, a stereoscopic visual simulator, was introduced in 1939.',
	'f/f5/View-Master_with_Reel.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'NASA Ames''s 1985 VIEW headset',
	'3/38/Virtual_Reality_Headset_Prototype.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A VPL Research DataSuit, a full-body outfit with sensors for measuring the movement of arms, legs, and trunk. Developed c. 1989. Displayed at the Nissho Iwai showroom in Tokyo',
	'a/a8/VPL_DataSuit_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A CAVE system at IDL''s Center for Advanced Energy Studies in 2010',
	'a/ad/CAVE_at_INL%27s_CAES_001.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Virtual Fixtures immersive AR system developed in 1992. Picture features Dr. Louis Rosenberg interacting freely in 3D with overlaid virtual objects called ''fixtures''.',
	'd/d4/Virtual-Fixtures-USAF-AR.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An inside view of the Oculus Rift Crescent Bay prototype headset',
	'c/cf/Oculus_Rift_Crescent_Bay_Prototype_%2816383004719%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'HTC Vive headsets worn at Mobile World Congress 2018',
	'c/cf/Mobile_World_Congress_2018_%2829129096677%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'The Project Morpheus (PlayStation VR) headset worn at Gamescom 2015',
	'd/d5/Sony_Morpheus_Virtual_Reality_Gamescom_2015_Cologne_%2819705605174%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Smartphone-based budget headset Samsung Gear VR in dismantled state',
	'4/40/Samsung_Gear_VR_%2815060788240%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Robinson R22 Virtual Reality Training Device developed by Loft Dynamics[66]',
	'c/c0/R22_VRM_Helicopter_Training_Solution.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'In theory, VR represents a participant''s field of view (yellow area).',
	'a/a6/Immersive_Index_In_Theory_larger.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'U.S. Navy Hospital Corpsman demonstrating a VR parachute simulator at the Naval Survival Training Institute in 2006',
	'e/ef/VR-Helm.jpg'
)

declare @actid2 int
select @catid=catid from cat where catname='Key Terms'
print @catid
select @actid2 = actid
from act where actname=@actname and act_cat=@catid
print @actid2
delete from q where q_act=@actid2
insert into q(q_act,qname,qdesc) 
select @actid2,qname,qdesc
from q
where q_act=@actid
order by qid

select * from q where q_act=@actid
select * from ans where ans_q=25503
