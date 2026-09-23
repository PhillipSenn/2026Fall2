-- Key Terms setup
-- English Wikipedia article, every <figure> on that article, actual figure id, visible caption, and parameter-free original image URL.
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

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwSQ',
	N'An example of alt attribute text being displayed in place of an unavailable image, with the underlying HTML displayed below it',
	'https://upload.wikimedia.org/wikipedia/commons/0/03/Alt_attribute_example.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwTQ',
	N'The Wikipedia article for wolf on the Lynx web browser, displaying the text of the alt attribute in orange in place of the images',
	'https://upload.wikimedia.org/wikipedia/commons/c/c2/Wikipedia_Wolf_article_displayed_on_Lynx.png'
)

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'Americans with Disabilities Act (ADA)',
	N'Law that requires any company with 15 or more employees to make reasonable attempts to accommodate the needs of physically challenged workers.',
	'https://en.wikipedia.org/wiki/Americans_with_Disabilities_Act_of_1990'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwOA',
	N'Americans with Disabilities Act of 1988, S. 2346, Page 1',
	'https://upload.wikimedia.org/wikipedia/commons/c/c1/Americans_with_Disabilities_Act_1988.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwQA',
	N'Americans with Disabilities Act of 1990, Page 52',
	'https://upload.wikimedia.org/wikipedia/commons/d/d5/Americans_with_Disabilities_Act_of_1990%2C_page_two.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwSA',
	N'Americans with Disabilities Act of 1990, Page 1',
	'https://upload.wikimedia.org/wikipedia/commons/6/6f/Americans_with_Disabilities_Act_of_1990%2C_page_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwmw',
	N'Speech cards used by President George H. W. Bush at the signing ceremony of the Americans with Disabilities Act (ADA) on July 26, 1990',
	'https://upload.wikimedia.org/wikipedia/commons/d/d5/President_George_H_W_Bush_Signing_of_the_ADA_%28Americans_with_Disabilities_Act%29_Bill_1990.gif'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mw6g',
	N'The ADA sets standards for construction of accessible public facilities. Shown is a sign indicating an accessible fishing platform at Drano Lake, Washington.',
	'https://upload.wikimedia.org/wikipedia/commons/7/7d/Drano_Lake_accessible_fishing_platform_signage.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAX8',
	N'Development of George H. W. Bush Administration Disability Policy. White House Memo. April 21, 1989.',
	'https://upload.wikimedia.org/wikipedia/commons/a/a7/ADA_Development_of_Administration_Disability_Policy_042189_Page_1.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAgY',
	N'President Bush signs the Americans with Disabilities Act into law.',
	'https://upload.wikimedia.org/wikipedia/commons/f/f6/Bush_signs_in_ADA_of_1990.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAgo',
	N'',
	'https://upload.wikimedia.org/wikipedia/commons/7/72/United_States_House_1990_ADA.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAg4',
	N'House vote and Senate vote',
	'https://upload.wikimedia.org/wikipedia/commons/b/be/US_House_1990_ADA.svg'
)


insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'artificial Intelligence (AI)',
	N'The technological use of logic and prior experience to simulate human intelligence.',
	'https://en.wikipedia.org/wiki/Artificial_intelligence'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwrw',
	N'An ontology represents knowledge as a set of concepts within a domain and the relationships between those concepts.',
	'https://upload.wikimedia.org/wikipedia/commons/e/e8/General_Formal_Ontology.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwASw',
	N'In supervised learning, the training data is labelled with the expected answers, while in unsupervised learning, the model identifies patterns or structures in unlabelled data.',
	'https://upload.wikimedia.org/wikipedia/commons/4/4d/Supervised_and_unsupervised_learning.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAdM',
	N'Kismet, a robot head made in the 1990s, is a machine that can recognise and simulate emotions.',
	'https://upload.wikimedia.org/wikipedia/commons/2/27/Kismet-IMG_6007-gradient.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAio',
	N'Illustration of gradient descent for three different starting points; two parameters (represented by the plan coordinates) are adjusted in order to minimise the loss function (the height).',
	'https://upload.wikimedia.org/wikipedia/commons/a/a3/Gradient_descent.gif'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAqE',
	N'A simple Bayesian network, with the associated conditional probability tables',
	'https://upload.wikimedia.org/wikipedia/commons/0/0e/SimpleBayesNet.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAvU',
	N'Expectation–maximisation clustering of Old Faithful eruption data starts from a random guess but then successfully converges on an accurate clustering of the two physically distinct modes of eruption.',
	'https://upload.wikimedia.org/wikipedia/commons/6/69/EM_Clustering_of_Old_Faithful_data.gif'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwAys',
	N'A neural network is an interconnected group of nodes, akin to the vast network of neurons in the human brain.',
	'https://upload.wikimedia.org/wikipedia/commons/e/e4/Artificial_neural_network.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwA2M',
	N'Deep learning is a subset of machine learning, which is itself a subset of artificial intelligence.',
	'https://upload.wikimedia.org/wikipedia/commons/b/bb/AI-ML-DL.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwA7g',
	N'Raspberry Pi AI Kit',
	'https://upload.wikimedia.org/wikipedia/commons/1/1f/Raspberry_Pi_AI_Kit_for_Raspberry_Pi_5_complete_Kit_07.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwBas',
	N'Street art in Tel Aviv',
	'https://upload.wikimedia.org/wikipedia/commons/8/8e/ChatGPT_street_art_in_Tel_Aviv.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwBkg',
	N'Fuelled by a growth in AI, data centres'' demand for power increased in the 2020s.',
	'https://upload.wikimedia.org/wikipedia/commons/1/16/2015-_Data_center_power_demand_-_US.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwCeE',
	N'In 2024, AI patents in China and the US numbered more than three-fourths of AI patents worldwide. Though China had more AI patents, the US had 35% more patents per AI patent-applicant company than China.',
	'https://upload.wikimedia.org/wikipedia/commons/0/0c/2024_AI_patents_by_country_-_artificial_intelligence.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwCug',
	N'The number of Google searches for the term "AI" accelerated in 2022.',
	'https://upload.wikimedia.org/wikipedia/commons/c/cb/20250202_%22AI%22_%28search_term%29_on_Google_Trends.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwCz8',
	N'The Turing test can provide some evidence of intelligence, but it penalises non-human intelligent behaviour.',
	'https://upload.wikimedia.org/wikipedia/commons/5/57/Weakness_of_Turing_test_1.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
	@qid,
	'mwDJE',
	N'The word "robot" itself was coined by Karel Čapek in his 1921 play R.U.R., the title standing for "Rossum''s Universal Robots".',
	'https://upload.wikimedia.org/wikipedia/commons/8/87/Capek_play.jpg'
)

-- ,(@actid,N'audio books',N'Reads aloud to the user instead of the user reading on a printed page or on the screen.')

insert into q(q_act,qname,qdesc,qhref) values(
	@actid,
	N'augmented reality (AR)',
	N'A type of virtual reality that uses an image of an actual place or thing and adds digital information to it.',
	'https://en.wikipedia.org/wiki/Augmented_reality'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Augmented reality for viewing furniture in the real world',
	'https://upload.wikimedia.org/wikipedia/commons/2/2f/Augmented_Reality_for_eCommerce.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An example of augmented reality: a man viewing a life-size virtual model of a building',
	'https://upload.wikimedia.org/wikipedia/commons/a/ad/Suteki_Hololens_applikation_.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'An augmented reality mapping application',
	'https://upload.wikimedia.org/wikipedia/commons/5/59/Navit_Reality_View_next_to_reality.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'A man wearing an augmented reality headset',
	'https://upload.wikimedia.org/wikipedia/commons/d/d1/MicrosoftHoloLensBloomGesture.JPG'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Magic Leap One AR headset',
	'https://upload.wikimedia.org/wikipedia/commons/6/67/Magic_Leap_No_-_2.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Types of extended reality',
	'https://upload.wikimedia.org/wikipedia/commons/8/8f/Extended_reality_types.svg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Virtual Fixtures – early AR system, U.S. Air Force, Wright-Patterson Air Force Base (1992)',
	'https://upload.wikimedia.org/wikipedia/commons/d/d4/Virtual-Fixtures-USAF-AR.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Meta 2 augmented reality headset from Meta',
	'https://upload.wikimedia.org/wikipedia/commons/4/4c/Wearing_AR_Glasses.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'Augmented reality system for soldier ARC4 (U.S. Army, 2017)',
	'https://upload.wikimedia.org/wikipedia/commons/2/20/ARC4_AR_System.jpg'
)

insert into ans(ans_q,ansname,ansdesc) values(@qid
	,N'LandForm video map overlay marking runways, road, and buildings during 1999 helicopter flight test',
	'https://upload.wikimedia.org/wikipedia/commons/7/74/LandForm_displays_landmarks_and_other_indicators_during_helicopter_flight_at_Yuma_Proving_Ground..JPG'
)





--insert into q(q_act,qname,qdesc,qhref) values(
--	@actid,
--	N'augmented reality (AR)',
--	N'A type of virtual reality that uses an image of an actual place or thing and adds digital information to it.',
--	'https://en.wikipedia.org/wiki/Augmented_reality'
--)
--select @qid=scope_identity()


--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwBg',
--	N'Augmented reality for viewing furniture in the real world',
--	'https://upload.wikimedia.org/wikipedia/commons/2/2f/Augmented_Reality_for_eCommerce.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwCg',
--	N'An example of augmented reality: a man viewing a life-size virtual model of a building',
--	'https://upload.wikimedia.org/wikipedia/commons/a/ad/Suteki_Hololens_applikation_.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwDg',
--	N'An augmented reality mapping application',
--	'https://upload.wikimedia.org/wikipedia/commons/5/59/Navit_Reality_View_next_to_reality.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwcA',
--	N'A man wearing an augmented reality headset',
--	'https://upload.wikimedia.org/wikipedia/commons/d/d1/MicrosoftHoloLensBloomGesture.JPG'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwdA',
--	N'Magic Leap One AR headset',
--	'https://upload.wikimedia.org/wikipedia/commons/6/67/Magic_Leap_No_-_2.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mw6w',
--	N'Types of extended reality',
--	'https://upload.wikimedia.org/wikipedia/commons/8/8f/Extended_reality_types.svg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwASk',
--	N'Virtual Fixtures – early AR system, U.S. Air Force, Wright-Patterson Air Force Base (1992)',
--	'https://upload.wikimedia.org/wikipedia/commons/d/d4/Virtual-Fixtures-USAF-AR.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwAdI',
--	N'Meta 2 augmented reality headset from Meta',
--	'https://upload.wikimedia.org/wikipedia/commons/4/4c/Wearing_AR_Glasses.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwAxY',
--	N'Augmented reality system for soldier ARC4 (U.S. Army, 2017)',
--	'https://upload.wikimedia.org/wikipedia/commons/2/20/ARC4_AR_System.jpg'
--)

--insert into ans(ans_q,ansname,ansdesc,ansimg) values(
--	@qid,
--	'mwA4E',
--	N'LandForm video map overlay marking runways, road, and buildings during 1999 helicopter flight test',
--	'https://upload.wikimedia.org/wikipedia/commons/7/74/LandForm_displays_landmarks_and_other_indicators_during_helicopter_flight_at_Yuma_Proving_Ground..JPG'
--)

-- 1. audio books

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'audio books',
N'Reads aloud to the user instead of the user reading on a printed page or on the screen.',
'https://en.wikipedia.org/wiki/Audiobook'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwIQ',
N'Caption reads: "The phonograph at home reading out a novel." From Daily Graphic (New York), 2 April 1878. Less than a year after the invention of the phonograph, this drawing offered a future vision. Novels however would remain impractical for phonographs until the 1930s.',
'https://upload.wikimedia.org/wikipedia/commons/4/49/The_Papa_of_the_Phonograph%2C_Daily_Graphic.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAf0',
N'Audiobook used to disseminate information among farmers in Kenya',
'https://upload.wikimedia.org/wikipedia/commons/e/eb/Farm_Extension_Worker.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAiw',
N'Example of an audio studio for professional readings. The studio is surrounded in sound baffle panels to mitigate reverberation from the speaker, allowing the microphone to pick up clearer audio.',
'https://upload.wikimedia.org/wikipedia/commons/1/14/Bolkonskij-frontal.jpg'
)

-- 2. BYOD (bring your own device)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'BYOD (bring your own device)',
N'Policy that enables employees to use their personal devices to conduct business.',
'https://en.wikipedia.org/wiki/Bring_your_own_device'
)
select @qid=scope_identity()


-- 3. chip-and-pin technology

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'chip-and-pin technology',
N'An improvement in card technology that stores data on an embedded chip instead of a magnetic stripe.',
'https://en.wikipedia.org/wiki/EMV'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwA_w',
N'An EMV chip semiconductor package on the side opposite to its contact pads',
'https://upload.wikimedia.org/wikipedia/commons/4/40/Debit_Card_Chip_Package_%28Back%29_%2849924994081%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBAE',
N'View of the chip, a die shot',
'https://upload.wikimedia.org/wikipedia/commons/3/3c/Debit_Card_Chip_%28Whitebalanced%29.png'
)

-- 4. computer

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'computer',
N'An electronic device, operating under the control of instructions stored in its own memory, that can accept data, process the data to produce information, and store the information for future use.',
'https://en.wikipedia.org/wiki/Computer'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwUA',
N'A human computer, with microscope and calculator, 1952',
'https://upload.wikimedia.org/wikipedia/commons/b/be/X-4_with_Female_Computer_-_GPN-2000-001932.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mweg',
N'The Ishango bone, a bone tool dating back to prehistoric Africa',
'https://upload.wikimedia.org/wikipedia/commons/4/42/Os_d%27Ishango_IRSNB.JPG'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwjw',
N'The Chinese suanpan (算盘). The number represented on this abacus is 6,302,715,408.',
'https://upload.wikimedia.org/wikipedia/commons/a/af/Abacus_6.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwoA',
N'The Antikythera mechanism, dating back to ancient Greece circa 200–80 BCE, is an early analog computing device.',
'https://upload.wikimedia.org/wikipedia/commons/c/c8/Antikythera_Fragment_A_%28Front%29.webp'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw7Q',
N'A slide rule',
'https://upload.wikimedia.org/wikipedia/commons/1/17/Sliderule_2005.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAWI',
N'Electro-mechanical calculator (1920) by Leonardo Torres Quevedo.',
'https://upload.wikimedia.org/wikipedia/commons/7/7d/Aritm%C3%B3metro_Electromec%C3%A1nico.jpg'
)

-- 5. computer literacy

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'computer literacy',
N'Having a current knowledge and understanding of computers, mobile devices, the web, and related technologies.',
'https://en.wikipedia.org/wiki/Computer_literacy'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCA',
N'Children using a laptop computer at school (2008)',
'https://upload.wikimedia.org/wikipedia/commons/4/40/Children_at_school_%288720604364%29.jpg'
)

-- 6. computer-aided manufacturing (CAM)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'computer-aided manufacturing (CAM)',
N'Used by manufacturers to streamline production and ship products more quickly. With CAM, robots perform work that is too dangerous, detailed, or monotonous for people.',
'https://en.wikipedia.org/wiki/Computer-aided_manufacturing'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwTA',
N'Chrome-cobalt disc with crowns for dental implants, manufactured using WorkNC CAM',
'https://upload.wikimedia.org/wikipedia/commons/1/14/Disc_with_dental_implants_made_with_WorkNC.jpg'
)

-- 7. data

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'data',
N'Raw facts, such as text or numbers',
'https://en.wikipedia.org/wiki/Raw_data'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCw',
N'The two columns to the right of the left-most column in this computerized table are raw data.',
'https://upload.wikimedia.org/wikipedia/commons/9/93/Origin_histograma_raw_data.png'
)

-- 8. Digital assistants

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Digital assistants',
N'Apps like Amazon’s Alexa or Apple’s Siri that use natural language processing to respond to your verbal commands or questions, using search technology to provide answers or perform a task, such as adding an item to a grocery list.',
'https://en.wikipedia.org/wiki/Virtual_assistant'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCg',
N'Google Assistant running on a Pixel XL smartphone',
'https://upload.wikimedia.org/wikipedia/commons/0/01/Android_Assistant_on_the_Google_Pixel_XL_smartphone_%2829526761674%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw8g',
N'Apple TV remote control, with which users can ask the virtual assistant Siri to find content to watch',
'https://upload.wikimedia.org/wikipedia/commons/6/64/Apple_tv_gen_4_remote.jpeg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAbs',
N'Graphical sum up of the study capturing reasons of interest of virtual assistants for consumers',
'https://upload.wikimedia.org/wikipedia/commons/e/e2/Study_results.jpg'
)

-- 9. digital citizen

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'digital citizen',
N'Person familiar with how to use technology to become an educated and productive member of the digital world.',
'https://en.wikipedia.org/wiki/Digital_citizen'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwASg',
N'At the 2018 Institutional Convention, Shola Mos-Shogbamimu, founder of the convention, discusses the role of digital media in preventing the spread of sexual harassment and what measures can be taken to stop the spread of negativity in youth.',
'https://upload.wikimedia.org/wikipedia/commons/6/6d/Inclusion_Convention.jpg'
)

-- 10. digital divide

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'digital divide',
N'The gap between those who have access to technology and its resources and information, especially on the Internet, and those who do not.',
'https://en.wikipedia.org/wiki/Digital_divide'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw4A',
N'A diagram showing four ways in which to analyze the digital divide',
'https://upload.wikimedia.org/wikipedia/commons/7/7e/DigitalDivide_Hilbert2011.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw8Q',
N'The digital divide measured in terms of bandwidth is not closing, but fluctuating up and down. Gini coefficients for telecommunication capacity (in kbit/s) among individuals worldwide',
'https://upload.wikimedia.org/wikipedia/commons/1/19/BandwidthInequality1986-2014.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAqI',
N'Abilities and perceptions of abilities',
'https://upload.wikimedia.org/wikipedia/commons/1/1a/Abilities_and_perceptions_of_abilities.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBAY',
N'A laptop lending kiosk at Texas A&M University–Commerce''s Gee Library',
'https://upload.wikimedia.org/wikipedia/commons/2/2c/13394-Laptops_Anytime_Launch-6629_%2810844113484%29.jpg'
)

-- 11. digital literacy

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'digital literacy',
N'Having a current knowledge and understanding of computers, mobile devices, the web, and related technologies',
'https://en.wikipedia.org/wiki/Digital_literacy'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAw',
N'A teacher and his students in a computer lab',
'https://upload.wikimedia.org/wikipedia/commons/b/b2/A._Stuart_and_Students.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAew',
N'Student working on assignment using computer',
'https://upload.wikimedia.org/wikipedia/commons/6/68/Student_on_computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAnc',
N'A librarian at the National Library Medicine of the United States accessing the Physician Data Query using an IBM PC (1987)',
'https://upload.wikimedia.org/wikipedia/commons/6/67/Librarian_accessing_pdq.jpg'
)

-- 12. embedded computer

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'embedded computer',
N'A computer that functions as one component in a larger product, and which has a specific purpose.',
'https://en.wikipedia.org/wiki/Embedded_system'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwew',
N'Embedded Computer Sub-Assembly for Accupoll Electronic Voting Machine',
'https://upload.wikimedia.org/wikipedia/commons/a/af/Accupoll-embedded-computer.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwyw',
N'e-con Systems eSOM270 & eSOM300 Computer on Modules',
'https://upload.wikimedia.org/wikipedia/commons/6/6f/ESOM270_eSOM300_Computer_on_Modules.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw0w',
N'Embedded system text user interface using MicroVGA',
'https://upload.wikimedia.org/wikipedia/commons/a/a1/MicroVGA_TUI_demoapp.jpg'
)

-- 13. enterprise computing

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'enterprise computing',
N'Refers to the use of technology by a company’s employees to meet the needs of a large business.',
'https://en.wikipedia.org/wiki/Management_information_system'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAUs',
N'The NIST Cybersecurity Framework outlines core functions supporting risk management and data governance in modern MIS.',
'https://upload.wikimedia.org/wikipedia/commons/e/e9/NIST_Version_2.0.png'
)

-- 14. graphic organizers

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'graphic organizers',
N'Software that enables a user to create an outline or structure of information.',
'https://en.wikipedia.org/wiki/Graphic_organizer'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwWQ',
N'Ishikawa''s cause and effect diagram (fishbone chart)',
'https://upload.wikimedia.org/wikipedia/commons/a/a8/Fishbone.svg'
)

-- 15. green computing

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'green computing',
N'A practice that involves reducing electricity consumed and environmental waste generated when using computers, mobile devices, and related technologies.',
'https://en.wikipedia.org/wiki/Green_computing'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwOg',
N'Energy Star logo',
'https://upload.wikimedia.org/wikipedia/commons/7/73/Energy_Star_logo.svg'
)

-- 16. hardware

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'hardware',
N'The device itself and its components, such as wires, cases, switches, and electronic circuits.',
'https://en.wikipedia.org/wiki/Computer_hardware'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwkg',
N'Growth in processor performance (as measured by benchmarks), 1978–2010',
'https://upload.wikimedia.org/wikipedia/commons/9/9a/Growth_in_processor_performance%2C_1978%E2%80%932010.png'
)

-- 17. Individuals with Disabilities Education Act (IDEA)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Individuals with Disabilities Education Act (IDEA)',
N'U.S. law that requires that public schools purchase or acquire funding for adaptive technologies.',
'https://en.wikipedia.org/wiki/Individuals_with_Disabilities_Education_Act'
)
select @qid=scope_identity()

-- 18. information

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'information',
N'Data that has been processed to become meaningful.',
'https://en.wikipedia.org/wiki/Information'
)
select @qid=scope_identity()

-- 19. Information Technology (IT) department

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Information Technology (IT) department',
N'Department in medium and large businesses responsible for ensuring that all the computer operations, mobile devices, and networks run smoothly.',
'https://en.wikipedia.org/wiki/Information_technology'
)
select @qid=scope_identity()

-- 20. integrated circuits

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'integrated circuits',
N'Developed in the 1960s, packed the equivalent of thousands of vacuum tubes or transistors into a silicon chip about the size of your thumb.',
'https://en.wikipedia.org/wiki/Integrated_circuit'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCg',
N'A microscope image of an integrated circuit die used to control LCDs. The pinouts are the dark circles surrounding the integrated circuit.',
'https://upload.wikimedia.org/wikipedia/commons/8/89/NXP_PCF8577C_LCD_driver_with_I%C2%B2C_%28Colour_Corrected%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwXA',
N'Jack Kilby''s original integrated circuit – the first in the world – made from germanium with gold-wire interconnects',
'https://upload.wikimedia.org/wikipedia/en/4/42/Kilby_solid_circuit.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwYg',
N'Robert Noyce invented the first monolithic integrated circuit in 1959. The chip was made from silicon.',
'https://upload.wikimedia.org/wikipedia/commons/8/82/Robert_Noyce_with_Motherboard_1959.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw5w',
N'Dov Frohman, an Israeli electrical engineer who developed the EPROM in 1969–1971',
'https://upload.wikimedia.org/wikipedia/commons/6/65/Dov_Frohman.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAio',
N'Virtual detail of an integrated circuit through four layers of planarized copper interconnect, down to the polysilicon (pink), wells (greyish), and substrate (green)',
'https://upload.wikimedia.org/wikipedia/commons/c/c6/Siliconchip_by_shapeshifter.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAkY',
N'A/D converter IC in a DIP',
'https://upload.wikimedia.org/wikipedia/commons/4/4f/AD570JD.jpg'
)

-- 21. intelligent classroom

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'intelligent classroom',
N'Classroom in which technology is used to facilitate learning and communication.',
'https://en.wikipedia.org/wiki/Intelligent_tutoring_system'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwGA',
N'Skinner teaching machine 08',
'https://upload.wikimedia.org/wikipedia/commons/2/2d/Skinner_teaching_machine_08.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwXw',
N'The PLATO V CAI terminal in 1981',
'https://upload.wikimedia.org/wikipedia/commons/e/ed/Platovterm1981.jpg'
)

-- 22. intelligent workplace

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'intelligent workplace',
N'Uses technology to enable workers to connect to the company’s network, communicate with each other, use productivity software and apps, meet via web conferencing, and more.',
'https://en.wikipedia.org/wiki/Virtual_workplace'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAw',
N'A librarian at the U.S. National Library of Medicine using an IBM personal computer to access the Physician Data Query, a database on cancer (1987)',
'https://upload.wikimedia.org/wikipedia/commons/6/67/Librarian_accessing_pdq.jpg'
)

-- 23. Internet of Things (IoT)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Internet of Things (IoT)',
N'An environment where processors are embedded in every product imaginable (things), and these things communicate with one another via the Internet or wireless networks.',
'https://en.wikipedia.org/wiki/Internet_of_things'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAdQ',
N'Digital variable speed-limit sign in the Czech Republic.',
'https://upload.wikimedia.org/wikipedia/commons/7/73/Nov%C3%A1_Povltavsk%C3%A1%2C_Ho%C5%99%C3%AD_v_tunelu_%2801%29.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCVM',
N'Town of Internet of Things in Hangzhou, China',
'https://upload.wikimedia.org/wikipedia/commons/2/20/TownOfInternetOfThingsHangzhou.jpg'
)

-- 24. kiosk

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'kiosk',
N'A freestanding booth usually placed in a public area that can contain a display device used to show information to the public or event attendees.',
'https://en.wikipedia.org/wiki/Kiosk'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwWg',
N'Newsstand in Rosemont, Montreal, 1943',
'https://upload.wikimedia.org/wikipedia/commons/a/a0/Feature._Rush_Hour_BAnQ_P48S1P09119.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwYA',
N'Modern vending kiosk in a train station in Hyogo, Japan',
'https://upload.wikimedia.org/wikipedia/commons/7/7c/Aioi_Station_in_Hyogo_J09_11.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwZg',
N'A small kebab serving kiosk in Metsäkylä, Ylöjärvi, Finland',
'https://upload.wikimedia.org/wikipedia/commons/a/a9/Beat_up_kebab_kiosk_in_Mets%C3%A4kyl%C3%A4_-_panoramio.jpg'
)

-- 25. learning management system (LMS)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'learning management system (LMS)',
N'Web-based sites where students can check their progress in a course, take practice tests, and exchange messages with the instructor or other students.',
'https://en.wikipedia.org/wiki/Learning_management_system'
)
select @qid=scope_identity()

-- 26. machine-to-machine (M2M)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'machine-to-machine (M2M)',
N'Using computers to monitor computer assembly lines and equipment.',
'https://en.wikipedia.org/wiki/Machine_to_machine'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwPA',
N'The first caller identification receiver',
'https://upload.wikimedia.org/wikipedia/commons/5/5a/Caller_ID_receiver.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwQA',
N'Processing Chips',
'https://upload.wikimedia.org/wikipedia/commons/a/ad/Processing_Chips.JPG'
)

-- 27. microprocessor

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'microprocessor',
N'The “brains” of a computer; a chip that contains a central processing unit.',
'https://en.wikipedia.org/wiki/Microprocessor'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwArc',
N'Upper interconnect layers on an Intel 80486DX2 die',
'https://upload.wikimedia.org/wikipedia/commons/2/2b/80486DX2_200x.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwA08',
N'ABIT BP6 motherboard supported two Intel Celeron 366MHz processors picture shows Zalman heatsinks.',
'https://upload.wikimedia.org/wikipedia/commons/4/47/Abit_BP6_motherboard_2_celerons.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwA1M',
N'Abit BP6 dual-socket motherboard shown with Zalman Flower heatsinks',
'https://upload.wikimedia.org/wikipedia/commons/7/7b/Abit_dual_celeron_pc_motherboard.jpg'
)

-- 28. mobile health (mHealth)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'mobile health (mHealth)',
N'Refers to healthcare professionals using smartphones or tablets to access health records stored in the cloud, and patients using digital devices to monitor their conditions and treatments.',
'https://en.wikipedia.org/wiki/MHealth'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAc4',
N'Mobile phone subscribers per 100 inhabitants 1997–2007',
'https://upload.wikimedia.org/wikipedia/commons/1/19/Mobile_phone_subscribers_per_100_inhabitants_1997-2007_ITU.png'
)

-- 29. natural language processing

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'natural language processing',
N'A form of data input in which computers interpret and digitize spoken words or commands.',
'https://en.wikipedia.org/wiki/Natural_language_processing'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAQA',
N'Word cloud of stop words in Hebrew',
'https://upload.wikimedia.org/wikipedia/commons/8/8c/Hebrew_stop_words_word_cloud.png'
)

-- 30. personal computer (PC)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'personal computer (PC)',
N'Computers designed for personal use, as opposed to commercial or industrial use.',
'https://en.wikipedia.org/wiki/Personal_computer'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAoo',
N'An LG G4 smartphone',
'https://upload.wikimedia.org/wikipedia/commons/4/49/LG_G4-2.jpg'
)

-- 31. robotics

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'robotics',
N'The science that combines engineering and technology to create and program robots. Robots are useful in situations where it is impractical, dangerous, or inconvenient to use a human.',
'https://en.wikipedia.org/wiki/Robotics'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCQ',
N'Programmable Universal Machine for Assembly, one of the first industrial robots (1990)',
'https://upload.wikimedia.org/wikipedia/commons/7/7f/Puma_Robotic_Arm_-_GPN-2000-001817.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwcg',
N'A robotic leg powered by air muscles',
'https://upload.wikimedia.org/wikipedia/commons/0/07/2005-11-14_ShadowLeg_Finished_medium.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAa8',
N'Visualization of entomopter flying on Mars (NASA)',
'https://upload.wikimedia.org/wikipedia/commons/9/97/Mars_entomopter.jpg'
)

-- 32. screen reader

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'screen reader',
N'Technology that uses audio output to describe the contents of the screen.',
'https://en.wikipedia.org/wiki/Screen_reader'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBw',
N'An example of someone using a screen reader showing documents that are inaccessible, readable and accessible',
'https://upload.wikimedia.org/wikipedia/commons/3/3b/Accessible_Books_Consortium_explains_-_a_digital_file_is_not_necessarily_accessible.webm'
)

-- 33. smart devices

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'smart devices',
N'A device that can communicate, locate, and predict; part of the Internet of Things (IoT).',
'https://en.wikipedia.org/wiki/Smart_device'
)
select @qid=scope_identity()

-- 34. software

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'software',
N'The programs and apps that instruct the computer to perform tasks. Software processes data into meaningful information.',
'https://en.wikipedia.org/wiki/Software'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwcg',
N'A diagram showing how the user interacts with application software on a typical desktop computer.',
'https://upload.wikimedia.org/wikipedia/commons/8/87/Operating_system_placement_%28software%29.svg'
)

-- 35. speech recognition programs

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'speech recognition programs',
N'Software that helps a user to input data or information verbally.',
'https://en.wikipedia.org/wiki/Speech_recognition'
)
select @qid=scope_identity()

-- 36. telecommuting

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'telecommuting',
N'Working from home.',
'https://en.wikipedia.org/wiki/Remote_work'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCA',
N'Percentage of workforce that was home-based in 2019',
'https://upload.wikimedia.org/wikipedia/commons/d/df/Home-based_worker_percentage_2019.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwDA',
N'Most respondents to the same climate survey in 2021–2022 believe that most of us will be working from home in 20 years to help save the planet.',
'https://upload.wikimedia.org/wikipedia/commons/7/7a/There_is_a_strong_feeling_that_most_of_us_will_be_working_from_home_in_20_years_to_help_save_the_planet.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwEA',
N'The United States Marine Corps began allowing remote work in 2010.',
'https://upload.wikimedia.org/wikipedia/commons/9/97/USMC-100324-M-6847A-001.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwASA',
N'36% of Europeans interviewed by the European Investment Bank Climate Survey supported remote work to be favoured to fight climate change.',
'https://upload.wikimedia.org/wikipedia/commons/2/2c/36%25_of_Europeans_want_teleworking_to_be_favoured_to_fight_climate_change_More_specifically%2C_concerning_transport%2C_which_three_actions_should_be_prioritised_to_combat_climate_change..svg'
)

-- 37. transistors

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'transistors',
N'Smaller, cheaper, and more reliable replacement for vacuum tubes in the second generation of computers.',
'https://en.wikipedia.org/wiki/Transistor'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCg',
N'Metal–oxide–semiconductor field-effect transistor (MOSFET), showing gate (G), body (B), source (S) and drain (D) terminals. The gate is separated from the body by an insulating layer (white).',
'https://upload.wikimedia.org/wikipedia/commons/a/a5/MOSFET_Structure.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBG8',
N'A Darlington transistor with the upper case removed so the transistor chip (the small square) can be seen. One is much larger than the other, but both are large in comparison to transistors in large-scale integration because this particular example is intended for power applications.',
'https://upload.wikimedia.org/wikipedia/commons/d/d9/Darlington_transistor_MJ1000.jpg'
)

-- 38. vacuum tubes

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'vacuum tubes',
N'Cylindrical glass tubes that controlled the flow of electrons, used in the first generation of computers.',
'https://en.wikipedia.org/wiki/Vacuum_tube'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCg',
N'Later thermionic vacuum tubes, mostly miniature style, some with top cap connections for higher voltages',
'https://upload.wikimedia.org/wikipedia/commons/e/e9/Elektronenroehren-auswahl.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwASg',
N'Fleming''s first diodes',
'https://upload.wikimedia.org/wikipedia/commons/4/4d/Fleming_valves.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBEo',
N'Getter in opened tube; silvery deposit from getter',
'https://upload.wikimedia.org/wikipedia/commons/4/4a/Getter_diagram.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBE8',
N'Dead vacuum fluorescent display (Air has leaked in and the getter spot has become white.)',
'https://upload.wikimedia.org/wikipedia/commons/1/19/Opachki_dead_vacuum_luminescent_display_bednyaga_da.JPG'
)

-- 39. virtual reality (VR)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'virtual reality (VR)',
N'The use of computers to simulate a real or imagined environment that appears as a three-dimensional (3-D) space.',
'https://en.wikipedia.org/wiki/Virtual_reality'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAdQ',
N'HTC Vive headsets worn at Mobile World Congress 2018',
'https://upload.wikimedia.org/wikipedia/commons/c/cf/Mobile_World_Congress_2018_%2829129096677%29.jpg'
)
select ans.* from ans
join q on ans_q=qid
where q_act=@actid

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

select * from act order by actid desc
select * from q 
where q_act=216
order by qid desc


go
declare @actid int
declare @qid int
declare @catid int=(select catid from cat where catname='Key Terms setup')
print @catid
declare @actname varchar(max)='Module 2. The Web'
select @actid = actid
from act where actname=@actname and act_cat=@catid
print @actid
--insert into act(act_grp,act_cat,actname,actlink) values(4,@catid,@actname,'KeyTerms/setup.cfm')
--select @actid=scope_identity()
delete from q where q_act=@actid

-- 1. 3D Secure

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'3D Secure',
N'A standard protocol for securing credit card transactions over the Internet.',
'https://en.wikipedia.org/wiki/3-D_Secure'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwYQ',
N'3-D Secure Flow',
'https://upload.wikimedia.org/wikipedia/commons/d/d9/3D_Secure_Flow.png'
)

-- 2. address bar

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'address bar',
N'In Computer Concepts, the part of a browser window that displays the location of the current webpage.',
'https://en.wikipedia.org/wiki/Address_bar'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwPg',
N'Google Chrome''s address bar when visiting the main page of the English Wikipedia as seen from Chrome OS',
'https://upload.wikimedia.org/wikipedia/commons/6/60/Chrome_Address_Bar_1.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwRQ',
N'Google Chrome''s address bar when visiting the secure Wikimedia main page as seen from Chrome OS',
'https://upload.wikimedia.org/wikipedia/commons/e/ed/Chrome_Address_Bar_2.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwSw',
N'Chrome''s address bar when visiting a site that has an Extended Validation Certificate as seen from Windows 7',
'https://upload.wikimedia.org/wikipedia/commons/b/b7/Chromebar_ssl.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwUg',
N'Firefox version 62''s address bar when visiting example.com',
'https://upload.wikimedia.org/wikipedia/commons/2/2e/Firefox_62_address_bar_-_Example_domain.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwWA',
N'Firefox''s address bar when visiting the English Wikipedia',
'https://upload.wikimedia.org/wikipedia/commons/9/94/Firefox_62_address_bar_-_Wikipedia.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwXQ',
N'Firefox''s address bar when visiting the Wikimedia Foundation''s credit card payment page, which uses an Extended Validation Certificate',
'https://upload.wikimedia.org/wikipedia/commons/7/79/Firefox_62_address_bar_-_Wikimedia_Foundation.png'
)

-- 3. app

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'app',
N'Short for “application,” a computer program that performs specific tasks; also called a program.',
'https://en.wikipedia.org/wiki/Application_software'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAQI',
N'Application software for a desktop or laptop computer',
'https://upload.wikimedia.org/wikipedia/commons/8/82/Moldflow_Plastics_Advisers_%28MPA%29_software_screenshot.jpg'
)

-- 4. application

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'application',
N'Software that lets users perform specific tasks; also called a program or an app.',
'https://en.wikipedia.org/wiki/Application_software'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAQI',
N'Application software for a desktop or laptop computer',
'https://upload.wikimedia.org/wikipedia/commons/8/82/Moldflow_Plastics_Advisers_%28MPA%29_software_screenshot.jpg'
)

-- 5. blogs

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'blogs',
N'Short for web log, an informal website consisting of date- or time-stamped articles, or posts, in a diary or journal format.',
'https://en.wikipedia.org/wiki/Blog'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mw_w',
N'On December 6, 2002, Josh Marshall''s talkingpointsmemo.com blog called attention to U.S. Senator Lott''s comments. Senator Lott was eventually to resign his Senate leadership position over the matter.',
'https://upload.wikimedia.org/wikipedia/en/4/4f/Talkingpointsmemo2.png'
)

-- 6. Boolean operators

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Boolean operators',
N'A character, word, or symbol that focuses a web search. Also called a search operator.',
'https://en.wikipedia.org/wiki/Boolean_search'
)
select @qid=scope_identity()

-- 7. breadcrumbs

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'breadcrumbs',
N'A step in the path you follow to display a webpage',
'https://en.wikipedia.org/wiki/Breadcrumb_navigation'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAw',
N'KDE''s Dolphin (file manager), demonstrating its implementation of location-based breadcrumb navigation in the "usr", "local" and "etc" folder buttons. The arrows can also be clicked to expand selection.',
'https://upload.wikimedia.org/wikipedia/commons/7/79/Kde_breadcrumb_nav.png'
)

-- 8. browser

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'browser',
N'A program, such as Microsoft Edge, that is designed to display webpages.',
'https://en.wikipedia.org/wiki/Web_browser'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAS0',
N'Traditional browser arrangement has user interface features above page content.',
'https://upload.wikimedia.org/wikipedia/commons/1/13/Chromium_%28web_browser%29.png'
)

-- 9. business-to-business (B2B)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'business-to-business (B2B)',
N'E-commerce model in which businesses provide goods, information, and services to other businesses, such as advertising, credit, recruiting, sales and marketing, technical support, and training.',
'https://en.wikipedia.org/wiki/Business-to-business'
)
select @qid=scope_identity()

-- 10. business-to-consumer (B2C)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'business-to-consumer (B2C)',
N'E-commerce model in which businesses provide goods and services to consumers; the most widespread example is online shopping.',
'https://en.wikipedia.org/wiki/Business-to-consumer'
)
select @qid=scope_identity()

-- 11. cache

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'cache',
N'A holding area where your browser keeps a copy of each webpage you view. This temporary storage area helps speed up processing time.',
'https://en.wikipedia.org/wiki/Web_cache'
)
select @qid=scope_identity()

-- 12. citation

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'citation',
N'In a research paper, a reference to a source; usually in parentheses at the end of a sentence.',
'https://en.wikipedia.org/wiki/Citation'
)
select @qid=scope_identity()

-- 13. citation style

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'citation style',
N'In a formal reference to a published work such as a book, journal, magazine, or website, the sequence of elements and the punctuation between them; common citation styles include MLA, APA, or Chicago.',
'https://en.wikipedia.org/wiki/Citation'
)
select @qid=scope_identity()

-- 14. consumer-to-consumer (C2C)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'consumer-to-consumer (C2C)',
N'E-commerce model in which consumers provide goods and services to other consumers; the most widespread example of this is online auctions.',
'https://en.wikipedia.org/wiki/Consumer-to-consumer'
)
select @qid=scope_identity()

-- 15. content aggregator

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'content aggregator',
N'A website that gathers, organizes, and then distributes web content.',
'https://en.wikipedia.org/wiki/News_aggregator'
)
select @qid=scope_identity()

-- 16. cookies

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'cookies',
N'A file created by a website and that stores information on your computer, such as your website preferences; also called a first-party cookie.',
'https://en.wikipedia.org/wiki/HTTP_cookie'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAqg',
N'In this fictional example, an advertising company has placed banners in two websites. By hosting the banner images on its servers and using third-party cookies, the advertising company is able to track the browsing of users across these two sites.',
'https://upload.wikimedia.org/wikipedia/commons/0/0b/Third_party_cookie.png'
)

-- 17. copyright

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'copyright',
N'An originator’s exclusive legal right to reproduce, publish, or sell intellectual property.',
'https://en.wikipedia.org/wiki/Copyright'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAdA',
N'A copyright symbol used in copyright notice',
'https://upload.wikimedia.org/wikipedia/commons/b/b0/Copyright.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAdQ',
N'A copyright symbol embossed on a piece of paper',
'https://upload.wikimedia.org/wikipedia/commons/0/00/Vitpr%C3%A4gel.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAqE',
N'Expansion of US copyright law (currently based on the date of creation or publication)',
'https://upload.wikimedia.org/wikipedia/commons/f/f9/Extended_Tom_Bell%27s_graph_showing_extension_of_U.S._copyright_term_over_time.svg'
)

-- 18. crawlers

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'crawlers',
N'Software that combs the web to find webpages and add new data about them to a database. Also called spider.',
'https://en.wikipedia.org/wiki/Web_crawler'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwATo',
N'Evolution of Freshness and Age in a web crawler',
'https://upload.wikimedia.org/wikipedia/commons/8/86/Web_Crawling_Freshness_Age.png'
)

-- 19. Creative Commons (CC)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Creative Commons (CC)',
N'A nonprofit organization that makes it easy for content creators to license and share their work by supplying easy-to-understand copyright licenses; the creator chooses the conditions under which the work can be used.',
'https://en.wikipedia.org/wiki/Creative_Commons'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAXA',
N'Creative Commons guiding the contributors. This image is a derivative work of Liberty Leading the People by Eugène Delacroix.',
'https://upload.wikimedia.org/wikipedia/commons/b/b6/CC_guidant_les_contributeurs.jpg'
)

-- 20. digital certificate

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'digital certificate',
N'In Computer Concepts, a technology used to verify a user’s identity by using a digital key and that has been “signed” by a trusted third party. This third party verifies the owner and that the key belongs to that owner.',
'https://en.wikipedia.org/wiki/Public_key_certificate'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwfA',
N'An example of a Subject Alternative Name section for domain names owned by the Wikimedia Foundation',
'https://upload.wikimedia.org/wikipedia/commons/7/75/Subject_Alt_Names_on_Firefox_90_screenshot.png'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAbY',
N'The procedure of obtaining a Public-key certificate',
'https://upload.wikimedia.org/wikipedia/commons/6/65/PublicKeyCertificateDiagram_It.svg'
)

-- 21. digital rights management (DRM)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'digital rights management (DRM)',
N'A collection of technologies used by software publishers and trade groups to fight software piracy and prevent unauthorized copying of digital content; includes authentication, certificates of authenticity, encryption, and digital watermarks.',
'https://en.wikipedia.org/wiki/Digital_rights_management'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAr8',
N'Error message on a Nokia 6810 warning that a file is "copyright protected"',
'https://upload.wikimedia.org/wikipedia/commons/0/0b/Copyprotection_6810.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBGc',
N'Label proposed by the Free Software Foundation for DRM-free works',
'https://upload.wikimedia.org/wikipedia/commons/c/cc/DRM-free_label.en.svg'
)

-- 22. domain name

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'domain name',
N'In Computer Concepts, the portion of a URL or email address that identifies one or more IP addresses, such as cengage.com.',
'https://en.wikipedia.org/wiki/Domain_name'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwqQ',
N'The hierarchy of labels in a fully qualified domain name',
'https://upload.wikimedia.org/wikipedia/commons/d/d2/DNS_schema.svg'
)

-- 23. e-commerce

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'e-commerce',
N'Business transactions that occur over an electronic network such as the Internet.',
'https://en.wikipedia.org/wiki/E-commerce'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAZw',
N'Store closing flags outside a Toys R Us in Deptford, New Jersey. Despite investments, the chain struggled to win market share in the age of digital commerce.',
'https://upload.wikimedia.org/wikipedia/commons/d/d9/Store_Closing_Flags.jpg'
)

-- 24. electronic storefront

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'electronic storefront',
N'An e-commerce website selling products or services.',
'https://en.wikipedia.org/wiki/Online_shopping'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwdw',
N'Michael Aldrich, pioneer of online shopping in the 1980s',
'https://upload.wikimedia.org/wikipedia/commons/4/4d/Michael_Aldrich_2010.JPG'
)

-- 25. encryption

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'encryption',
N'A security method of “scrambling” information as it is transmitted over a network. Information is scrambled in such a way that it cannot be read unless the user possesses the “key” to unlock it back to a readable format.',
'https://en.wikipedia.org/wiki/Encryption'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBQ',
N'A simple illustration of public-key cryptography, one of the most widely used forms of encryption',
'https://upload.wikimedia.org/wikipedia/commons/7/70/Public_key_encryption_keys.svg'
)

-- 26. ethics

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'ethics',
N'The moral principles that govern people’s behavior; many schools and other organizations post codes of conduct for computer use, which can help you make ethical decisions while using a computer.',
'https://en.wikipedia.org/wiki/Computer_ethics'
)
select @qid=scope_identity()

-- 27. fair use doctrine

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'fair use doctrine',
N'Allows you to use a sentence or paragraph of text without permission if you include a citation to the original source.',
'https://en.wikipedia.org/wiki/Fair_use'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwZw',
N'Joseph Story wrote the opinion in Folsom v. Marsh.',
'https://upload.wikimedia.org/wikipedia/commons/b/b3/Joseph_Story.jpg'
)

-- 28. general search engine

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'general search engine',
N'A nonspecialized search engine designed to find general results; general search engines include Google, Bing, and Yahoo!',
'https://en.wikipedia.org/wiki/Search_engine'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAwU',
N'High-level architecture of a standard Web crawler',
'https://upload.wikimedia.org/wikipedia/commons/d/df/WebCrawlerArchitecture.svg'
)

-- 29. hits

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'hits',
N'A list of matched results from an Internet search.',
'https://en.wikipedia.org/wiki/Search_engine_results_page'
)
select @qid=scope_identity()

-- 30. home page

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'home page',
N'The main webpage around which a website is built that opens every time you start a browser.',
'https://en.wikipedia.org/wiki/Home_page'
)
select @qid=scope_identity()

-- 31. hyperlinks

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'hyperlinks',
N'In Access, a data type for fields that store a link to a webpage, file, or email address.',
'https://en.wikipedia.org/wiki/Hyperlink'
)
select @qid=scope_identity()

-- 32. Hypertext Transfer Protocol (HTTP)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Hypertext Transfer Protocol (HTTP)',
N'The most common way to transfer information around the web; when the URL for a webpage starts with http://, the web browser uses this protocol for transferring the information.',
'https://en.wikipedia.org/wiki/HTTP'
)
select @qid=scope_identity()

-- 33. Hypertext Transfer Protocol Secure (HTTPS)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Hypertext Transfer Protocol Secure (HTTPS)',
N'A protocol used to make a secure connection to a computer; identified by the “https” prefix in a URL and often used by banks and retail stores.',
'https://en.wikipedia.org/wiki/HTTPS'
)
select @qid=scope_identity()

-- 34. index

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'index',
N'In Access, a database object that is created based on a field or combination of fields. Also, a field property that keeps track of the order of the values in the field, and a list that relates field values to the records that contain those values.',
'https://en.wikipedia.org/wiki/Database_index'
)
select @qid=scope_identity()

-- 35. information literacy

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'information literacy',
N'The ability to find, evaluate, use, and communicate online information.',
'https://en.wikipedia.org/wiki/Information_literacy'
)
select @qid=scope_identity()

-- 36. intellectual property rights

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'intellectual property rights',
N'Legal rights protecting those who create works such as photos, art, writing, inventions, and music.',
'https://en.wikipedia.org/wiki/Intellectual_property'
)
select @qid=scope_identity()

-- 37. Internet

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Internet',
N'A global collection of millions of computers linked together to share information.',
'https://en.wikipedia.org/wiki/Internet'
)
select @qid=scope_identity()

-- 38. Internet Engineering Task Force (IETF)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Internet Engineering Task Force (IETF)',
N'A nonprofit group that sets standards to allow devices, services, and applications to work together across the Internet.',
'https://en.wikipedia.org/wiki/Internet_Engineering_Task_Force'
)
select @qid=scope_identity()

-- 39. IP address

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'IP address',
N'A unique number that identifies every computer on the Internet; consists of four sets of numbers from 0 to 255 separated by periods, or dots, as in 216.35.148.4.',
'https://en.wikipedia.org/wiki/IP_address'
)
select @qid=scope_identity()

-- 40. keywords

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'keywords',
N'In Office, terms added to a file’s Document Properties that help locate the file in a search.',
'https://en.wikipedia.org/wiki/Tag_(metadata)'
)
select @qid=scope_identity()

-- 41. media sharing site

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'media sharing site',
N'A website that enables members to manage media such as photos, videos, and music.',
'https://en.wikipedia.org/wiki/Media_sharing'
)
select @qid=scope_identity()

-- 42. navigate

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'navigate',
N'In Computer Concepts, to move from one webpage to another in a browser.',
'https://en.wikipedia.org/wiki/Web_navigation'
)
select @qid=scope_identity()

-- 43. navigation bar

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'navigation bar',
N'In a browser, a set of buttons or hyperlinks that allows visitors to move to any page within a website.',
'https://en.wikipedia.org/wiki/Navigation_bar'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwEQ',
N'Thunar''s navigation bar',
'https://upload.wikimedia.org/wikipedia/commons/f/f5/Thunar-1.6.2.png'
)

-- 44. online social network

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'online social network',
N'An online community where users can share their interests, ideas, stories, photos, music, and videos with other registered users via a social networking website, such as Facebook, Google Plus, Twitter, Instagram, or Snapchat.',
'https://en.wikipedia.org/wiki/Social_networking_service'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwCA',
N'Illustrations showing various icons of some popular social networking services',
'https://upload.wikimedia.org/wikipedia/commons/0/07/Social_networking_services.jpg'
)

-- 45. paraphrase

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'paraphrase',
N'To restate an idea using different words from the original; paraphrasing someone else’s idea still constitutes plagiarism, which is claiming someone else’s idea as your own.',
'https://en.wikipedia.org/wiki/Paraphrase'
)
select @qid=scope_identity()

-- 46. plagiarism

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'plagiarism',
N'To copy or use someone else’s work and claim it as your own.',
'https://en.wikipedia.org/wiki/Plagiarism'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwsw',
N'Hannah Glasse''s signature at the top of the first chapter of her book, The Art of Cookery Made Plain and Easy, 6th Edition, 1758, an attempted defense against rampant plagiarism',
'https://upload.wikimedia.org/wikipedia/commons/8/83/Glasse_Art_of_Cookery_1758_Signature.jpg'
)

-- 47. portal

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'portal',
N'A website that combines pages from many sources and provides access to those pages. Also called web portal.',
'https://en.wikipedia.org/wiki/Web_portal'
)
select @qid=scope_identity()

-- 48. protocol

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'protocol',
N'A standardized procedure used by computers to exchange information.',
'https://en.wikipedia.org/wiki/Communication_protocol'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAc4',
N'Figure 3. Message flows using a protocol suite. Black loops show the actual messaging loops, red loops are the effective communication between layers enabled by the lower layers.',
'https://upload.wikimedia.org/wikipedia/commons/b/b0/Message_flows.svg'
)

-- 49. public domain

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'public domain',
N'An item, such as a photo, that is available and accessible to the public without requiring permission to use, and therefore not subject to copyright.',
'https://en.wikipedia.org/wiki/Public_domain'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwArg',
N'An English logo of the 2025/2026 Public Domain Day',
'https://upload.wikimedia.org/wikipedia/commons/7/75/Logo_PDD_2026.svg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAsc',
N'Visual created for Public Domain Day.',
'https://upload.wikimedia.org/wikipedia/commons/4/47/Mona_Lisa_Public_Domain.jpg'
)

-- 50. query

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'query',
N'In Access, an object that provides a spreadsheet-like view of data, similar to that in tables; it may provide the user with a subset of fields and/or records from one or more tables. Also, SQL commands that are used to retrieve data.',
'https://en.wikipedia.org/wiki/Database_query'
)
select @qid=scope_identity()

-- 51. search engines

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'search engines',
N'In Computer Concepts, software used by search sites to locate relevant webpages by creating a simple query based on your search criteria and storing the collected data in a search database.',
'https://en.wikipedia.org/wiki/Search_engine'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAwU',
N'High-level architecture of a standard Web crawler',
'https://upload.wikimedia.org/wikipedia/commons/d/df/WebCrawlerArchitecture.svg'
)

-- 52. search operators

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'search operators',
N'A character, word, or symbol that focuses a web search. Also called a Boolean operator.',
'https://en.wikipedia.org/wiki/Boolean_search'
)
select @qid=scope_identity()

-- 53. search tool

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'search tool',
N'An electronic tool that finds online information based on criteria you specify or selections you make.',
'https://en.wikipedia.org/wiki/Search_engine'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAwU',
N'High-level architecture of a standard Web crawler',
'https://upload.wikimedia.org/wikipedia/commons/d/df/WebCrawlerArchitecture.svg'
)

-- 54. specialized search tools

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'specialized search tools',
N'A search tool that concentrates on specific resources, such as scholarly journals or the United States Congress.',
'https://en.wikipedia.org/wiki/Vertical_search'
)
select @qid=scope_identity()

-- 55. specialty search engine

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'specialty search engine',
N'A search engine that lets you search databases, news providers, podcasts, and other online information sources that general search engines do not always access.',
'https://en.wikipedia.org/wiki/Vertical_search'
)
select @qid=scope_identity()

-- 56. spiders

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'spiders',
N'Software that combs the web to find webpages and add new data about them to the database. Also called crawler.',
'https://en.wikipedia.org/wiki/Web_crawler'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwATo',
N'Evolution of Freshness and Age in a web crawler',
'https://upload.wikimedia.org/wikipedia/commons/8/86/Web_Crawling_Freshness_Age.png'
)

-- 57. start page

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'start page',
N'The main webpage around which a website is built or the webpage opens every time you start a browser. Also called a home page.',
'https://en.wikipedia.org/wiki/Home_page'
)
select @qid=scope_identity()

-- 58. subject directory

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'subject directory',
N'An online guide to subjects or websites, usually arranged in alphabetic order. Also called a web directory.',
'https://en.wikipedia.org/wiki/Web_directory'
)
select @qid=scope_identity()

-- 59. top-level domain (TLD)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'top-level domain (TLD)',
N'The three-letter extension after the period in a domain name, the TLD identifies the type of organization associated with the domain.',
'https://en.wikipedia.org/wiki/Top-level_domain'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwAds',
N'.org[.] is a node in the DNS tree, just like wikipedia.[org.] and en.[wikipedia.org.]. As such, it has its own DNS records.',
'https://upload.wikimedia.org/wikipedia/commons/d/d2/DNS_schema.svg'
)

-- 60. Transport Layer Security (TLS)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'Transport Layer Security (TLS)',
N'Technology used to encrypt data that helps protect consumers and businesses from fraud and identity theft when conducting commerce on the Internet.',
'https://en.wikipedia.org/wiki/Transport_Layer_Security'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwClA',
N'Simplified illustration of the full TLS 1.2 handshake with timing information',
'https://upload.wikimedia.org/wikipedia/commons/d/d3/Full_TLS_1.2_Handshake.svg'
)

-- 61. uniform resource locator (URL)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'uniform resource locator (URL)',
N'The webpage address that identifies the location of the file on the Internet.',
'https://en.wikipedia.org/wiki/URL'
)
select @qid=scope_identity()

-- 62. usage rights

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'usage rights',
N'A right that indicates when you can use, share, or modify the images you find online.',
'https://en.wikipedia.org/wiki/Copyright_license'
)
select @qid=scope_identity()

-- 63. web

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'web',
N'In Computer Concepts, a collection webpages located on computers around the world, connected through the Internet.',
'https://en.wikipedia.org/wiki/World_Wide_Web'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwhw',
N'The world’s first web server, exhibited at CERN in Geneva.',
'https://upload.wikimedia.org/wikipedia/commons/9/9a/The_world%E2%80%99s_first_web_server%2C_exhibited_at_CERN_in_Geneva._DSC03299.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwiw',
N'The former World Wide Web logo, designed by Robert Cailliau. Currently, there is no widely accepted logo in use for the [WWW](http://WWW).',
'https://upload.wikimedia.org/wikipedia/commons/d/d1/WWW-LetShare.svg'
)

-- 64. web apps

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'web apps',
N'An app stored on an Internet server that can be run entirely in a web browser.',
'https://en.wikipedia.org/wiki/Web_application'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwBA',
N'Screenshot from 2007 of Horde, a groupware and open-source web application',
'https://upload.wikimedia.org/wikipedia/commons/6/6b/Horde-portal.png'
)

-- 65. web directory

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'web directory',
N'An online guide to subjects or websites, usually arranged in alphabetic order. Also called a subject directory.',
'https://en.wikipedia.org/wiki/Web_directory'
)
select @qid=scope_identity()

-- 66. web portal

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'web portal',
N'A website that combines pages from many sources and provides access to those pages. Also shortened to portal.',
'https://en.wikipedia.org/wiki/Web_portal'
)
select @qid=scope_identity()

-- 67. web server

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'web server',
N'An Internet computer that stores webpages.',
'https://en.wikipedia.org/wiki/Web_server'
)
select @qid=scope_identity()

-- 68. webpage

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'webpage',
N'A specially formatted document that can contain text, graphics, sound, video, and links to other webpages.',
'https://en.wikipedia.org/wiki/Web_page'
)
select @qid=scope_identity()

-- 69. website

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'website',
N'A location on the World Wide Web that contains webpages linked together.',
'https://en.wikipedia.org/wiki/Website'
)
select @qid=scope_identity()

-- 70. wiki

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'wiki',
N'A collaborative website where you and your colleagues can modify and publish content on a webpage.',
'https://en.wikipedia.org/wiki/Wiki'
)
select @qid=scope_identity()

-- 71. wildcard

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'wildcard',
N'A special symbol that substitutes for unknown characters in search text; the most common are the question mark (?), which stands for any single character, and the asterisk (*), which represents any group of characters.',
'https://en.wikipedia.org/wiki/Wildcard_character'
)
select @qid=scope_identity()

-- 72. word stem

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'word stem',
N'The base of a word, used in a web search to broaden a search.',
'https://en.wikipedia.org/wiki/Stemming'
)
select @qid=scope_identity()

-- 73. World Wide Web

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'World Wide Web',
N'A service consisting of websites located on computers around the world, connected through the Internet.',
'https://en.wikipedia.org/wiki/World_Wide_Web'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwhw',
N'The world’s first web server, exhibited at CERN in Geneva.',
'https://upload.wikimedia.org/wikipedia/commons/9/9a/The_world%E2%80%99s_first_web_server%2C_exhibited_at_CERN_in_Geneva._DSC03299.jpg'
)

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwiw',
N'The former World Wide Web logo, designed by Robert Cailliau. Currently, there is no widely accepted logo in use for the [WWW](http://WWW).',
'https://upload.wikimedia.org/wikipedia/commons/d/d1/WWW-LetShare.svg'
)

-- 74. World Wide Web Consortium (W3C)

insert into q(q_act,qname,qdesc,qhref) values(
@actid,
N'World Wide Web Consortium (W3C)',
N'One of the leading organizations that set guidelines for the web and that work together to write web standards.',
'https://en.wikipedia.org/wiki/World_Wide_Web_Consortium'
)
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc,ansimg) values(
@qid,
'mwfw',
N'W3C logo prior to October 2025',
'https://upload.wikimedia.org/wikipedia/commons/e/ed/W3C%C2%AE_Icon.svg'
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
select '"' + qname + '"',qdesc
from q
where q_act=@actid
order by qid
go


declare @actid int
insert into act(actname) values('Module 3. Computer Hardware')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'all-in-one computer',N'Similar to a desktop computer, but the monitor and system unit are housed together.')
,(@actid,N'arithmetic logic unit (ALU)',N'Responsible for performing arithmetic operations in the CPU.')
,(@actid,N'ASCII',N'In Computer Concepts, an 8-bit coding scheme, which means that 8 bits are used to represent uppercase and lowercase letters,
mathematical operators, and logical operations.')
,(@actid,N'benchmark',N'A test run by a laboratory or other organization to determine processor speed and other performance factors.')
,(@actid,N'binary system',N'A number system that has two digits, 0 and 1.')
,(@actid,N'bit',N'(Short for binary digit), the smallest unit of data a computer can process.')
,(@actid,N'bus width',N'Determines the speed at which data in a computer travels, also referred to as word size.')
,(@actid,N'byte',N'A field size for Number fields that allows entries only from 0 to 255.')
,(@actid,N'cameras',N'Input devices that support adding pictures or videos to a computer.')
,(@actid,N'central processing unit (CPU)',N'A complex integrated circuit that consists of millions of electronic parts and is primarily responsible for converting input
(data) into meaningful output (information).')
,(@actid,N'clock speed',N'In Computer Concepts, the speed at which a processor can execute instructions. Clock speed either can be measured in megahertz
(MHz) or gigahertz (GHz).')
,(@actid,N'cloud storage',N'Storing electronic files on the Internet, not on a local computer; often called storing data “in the cloud.”')
,(@actid,N'control unit',N'Manages the flow of instructions within the processor.')
,(@actid,N'cycle',N'The smallest unit of time a process can measure.')
,(@actid,N'dance pad',N'Game controller that is a flat, electronic device divided into panels that users press with their feet in response to instructions
from the video game.')
,(@actid,N'desktop computer',N'Computer that typically consists of the system unit, monitor, keyboard, and mouse.')
,(@actid,N'device driver',N'A program that controls a device attached to your computer, such as a printer, monitor, or video card.')
,(@actid,N'digital pen',N'A small device, shaped like a pen, that you can use to draw, tap icons, or tap keys on an on-screen keyboard, similar to a
stylus, but is more capable because it has programmable buttons.')
,(@actid,N'earbuds',N'Speakers that are small enough to place in your ears.')
,(@actid,N'External hard drives',N'Storage drive housed in a separate case, and typically connected to your computer using a USB cable.')
,(@actid,N'firmware',N'The instructions on the ROM chip.')
,(@actid,N'form factor',N'The shape and size of a computer.')
,(@actid,N'game controller',N'An input device you use when playing a video game.')
,(@actid,N'gamepad',N'Game controller held in both hands that controls the movement and actions of players or objects.')
,(@actid,N'hard drive',N'The most common storage medium on a computer; can be magnetic or solid state.')
,(@actid,N'headphones',N'Output device that consists of a pair of small listening devices that fit into a band placed over your ears.')
,(@actid,N'headsets',N'Includes one or more headphones for output, and a microphone for input.')
,(@actid,N'input device',N'Communicates instructions and commands to a computer. Common input devices are keyboard, mouse, stylus, scanner, microphone,
and game controller.')
,(@actid,N'joystick',N'Game controller with a handheld vertical lever, mounted on a base, that you move in different directions to control the actions
of the simulated vehicle or player.')
,(@actid,N'keyboard',N'Input device that contains not only characters such as letters, numbers, and punctuation, but also keys that can issue commands.')
,(@actid,N'laptop',N'A portable computer that is smaller than the average briefcase and light enough to carry comfortably; often called a notebook.')
,(@actid,N'microphone',N'Used to enter voice or sound data into a computer.')
,(@actid,N'mobile device',N'A portable or handheld computing device, such as a smartphone or a tablet, with a screen size of 10.1 inches or smaller.')
,(@actid,N'motherboard',N'A circuit board inside a computer that contains the microprocessor, the computer memory, and other internal devices.')
,(@actid,N'motion-sensing controller',N'Game controller that allows users to guide on-screen elements with air gestures.')
,(@actid,N'mouse',N'The most common type of pointing device used with computers.')
,(@actid,N'multi-core processors',N'Processor with multiple cores.')
,(@actid,N'multitouch screens',N'A display that can respond to multiple fingers touching the screen simultaneously.')
,(@actid,N'nonvolatile',N'Memory that does not lose its contents when power is removed.')
,(@actid,N'optical media',N'CDs, DVDs, and Blu-ray discs (BDs), use laser technology for storage and playback.')
,(@actid,N'output device',N'Conveys information from the computer to the user. Common output devices include displays, speakers, headphones, projectors,
and printers.')
,(@actid,N'paging file',N'A file on a hard disk that Windows uses to hold parts of programs and data files that do not fit in RAM.')
,(@actid,N'peripheral device',N'A device such as a keyboard, mouse, printer, or speakers that can connected to and extend the capability of a computer.')
,(@actid,N'platform',N'The software, or operating system, a device uses.')
,(@actid,N'plug-and-play',N'In Computer Concepts, devices that begin functioning properly as soon as you connect them to your computer.')
,(@actid,N'pointing device',N'In Computer Concepts, a device used to point to and select specific objects on the computer screen. Examples of point devices
include a mouse, touchpad, and trackball.')
,(@actid,N'port',N'A slot on the computer or device where you can attach a peripheral device.')
,(@actid,N'power-on self test (POST)',N'At startup, a sequence that tests all computer components for proper operation.')
,(@actid,N'printer',N'Creates hard copy output on paper, film, and other media.')
,(@actid,N'processor cache',N'Stores frequently used data next to the processor so that it can easily and quickly be retrieved.')
,(@actid,N'projectors',N'Displays visual output from a computer on a large surface such as a wall or screen.')
,(@actid,N'random access memory (RAM)',N'The storage location that is part of every computer and that temporarily stores open apps and document data while a computer
is on.')
,(@actid,N'read-only memory (ROM)',N'Permanently installed memory on your computer attached to the motherboard. The ROM chip contains the BIOS, which tells your
computer how to start.')
,(@actid,N'restore',N'Returning an operating system or files to their default settings, or migrating back to the operating system’s previous version.')
,(@actid,N'scanner',N'A device that converts a paper image into an electronic file that you can open and work with on your computer.')
,(@actid,N'solid state drive (SSD)',N'A hard drive without moving parts, and is faster and more durable than magnetic drives.')
,(@actid,N'speakers',N'Output devices used to convey audio output, such as music, voice, sound effects, or other sounds.')
,(@actid,N'stylus',N'A pen-shaped digital tool for making selections and entering information on a touchscreen.')
,(@actid,N'surge suppressor',N'A device that prevents power fluctuations from damaging electronic components.')
,(@actid,N'swap file',N'Data that cannot fit in RAM and uses an area of the hard disk called virtual memory. Also called a paging file.')
,(@actid,N'tablet',N'A small, flat computer with a touch-sensitive screen that accepts input from a digital pen, stylus, or your fingertip')
,(@actid,N'touchpad',N'A flat surface that is touch-sensitive, and you move your finger around the touchpad to move the pointer on the screen.')
,(@actid,N'touchscreen',N'A display that lets you touch areas of the screen to interact with software.')
,(@actid,N'trackball',N'A stationary pointing device with a ball anchored inside a casing, as well as two or more buttons.')
,(@actid,N'Unicode',N'A coding systems that represent text and symbols in computers, communications equipment, and other devices that use text.')
,(@actid,N'uninterruptable power supply (UPS)',N'A device that maintains power to computer equipment in case of an interruption in the primary electrical source.')
,(@actid,N'USB hub',N'An external device that contains many USB ports.')
,(@actid,N'video card',N'A circuit board that processes image signals.')
,(@actid,N'virtual memory',N'In Computer Concepts, the capability of an operating system to temporarily store data on a storage medium until it can be
“swapped” into RAM.')
,(@actid,N'voice synthesizer',N'Voice output that converts text to speech.')
,(@actid,N'volatile',N'Memory that loses its contents when power is removed.')
,(@actid,N'webcams',N'In Computer Concepts, a camera built-in to a computer, which is primarily used for videoconferencing, chatting, or online
gaming.')
,(@actid,N'wheel',N'A type of game controller that mirrors the functionality of a steering wheel in a vehicle.')
,(@actid,N'word size',N'Determines the speed at which data in a computer travels, also referred to as bus width.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 4. Operating Systems and File Management')
select @actid=scope_identity()

insert into q(q_act,qname,qdesc) values(@actid,N'active window',N'The window you are currently using, in front of any other open windows.')
,(@actid,N'administrator account',N'Provides full access to the computer; additional responsibilities associated with an administrator account include installing
programs and apps, adjusting security settings, and managing network access')
,(@actid,N'Android',N'Operating system developed by Google based on Linux, and designed to be run on many types of smartphones and tablets')
,(@actid,N'boot process',N'Triggers a series of steps and checks as the computer loads the operating system')
,(@actid,N'bootstrap program',N'A built-in startup program that executes a series of tests to check components, including the RAM, keyboard, and storage,
and identifies connected devices, and checks their settings')
,(@actid,N'buffer',N'An area of memory that stores data and information waiting to be sent to an input or output device')
,(@actid,N'button',N'Icons you click to execute commands you need to work with an office app.')
,(@actid,N'cache',N'A holding area where your browser keeps a copy of each webpage you view. This temporary storage area helps speed up processing
time.')
,(@actid,N'Chrome OS',N'Operating system based on Linux that uses the Google Chrome browser as its user interface, and primarily runs web apps')
,(@actid,N'Clipboard',N'A temporary Windows storage area that holds the selections you copy or cut so you can use them later.')
,(@actid,N'Close button',N'In a Windows title bar, the rightmost button; closes the open window, app, or document.')
,(@actid,N'closed source',N'Programs that keep all or some of the code hidden, enabling them to control and profit from the program they create')
,(@actid,N'cloud',N'A storage area located on a server that you access through the Internet or a network.')
,(@actid,N'Control Panel',N'A collection of utility programs that determines how Windows appears and performs on your computer.')
,(@actid,N'data file',N'In Computer Concepts, a file that contains words, numbers, and pictures that you can manipulate. A spreadsheet, a database,
a presentation, and a word processing document all are data files.')
,(@actid,N'default settings',N'Standard settings that control how the screen is set up and how a document looks when you first start typing')
,(@actid,N'desktop',N'An operating system screen that contains icons for programs and files, as well as toolbars, taskbars, menus, and buttons you
can use to start programs and apps')
,(@actid,N'desktop operating system',N'An operating system installed on a single computer')
,(@actid,N'Dialog boxs',N'A window with controls that lets you tell Windows how you want to complete an application program’s command.')
,(@actid,N'disk cleanup utility',N'Program that finds and removes unnecessary files, such as temporary Internet files or files in the Recycle Bin, and frees
up disk space by reorganizing data')
,(@actid,N'executable file',N'Contains the instructions your computer or device needs to run programs and apps')
,(@actid,N'file',N'A collection of information stored on your computer, such as a text document, spreadsheet, photo, and song.')
,(@actid,N'file extension',N'A three- or four-letter sequence, preceded by a period, at the end of a filename that identifies the file as a particular
type of document, such as .docx or .xlsx.')
,(@actid,N'file format',N'The organization and layout of data in a file')
,(@actid,N'flash memory',N'A type of nonvolatile memory that can be erased electronically and rewritten')
,(@actid,N'folder',N'A named location on a storage medium that usually contains related documents.')
,(@actid,N'folder window',N'A File Explorer window that displays the contents of a folder, drive, or device.')
,(@actid,N'gigabytes (GB)',N'Approximately 1 billion bytes of data.')
,(@actid,N'graphical user interface (GUI)',N'A collective term for all the ways you interact with the device; a GUI controls how you interact with menus, programs and
apps, and visual images such as icons by touching, pointing, tapping, or clicking buttons and other objects to issue commands')
,(@actid,N'icon',N'A small picture that represents a program, file, or hardware device')
,(@actid,N'input',N'Any data and instructions entered into the memory of a device.')
,(@actid,N'iOS',N'Mobile device operating system that runs only on Apple devices, including the iPhone, iPad, and iPod; derived from macOS')
,(@actid,N'kernel',N'The core of an operating system; memory, runs programs, and assigns resources')
,(@actid,N'keyboard',N'Input device that contains not only characters such as letters, numbers, and punctuation, but also keys that can issue commands.')
,(@actid,N'kilobytes (KB)',N'Thousands of bytes of data')
,(@actid,N'library',N'In Windows, a special folder that catalogs specific files and folders in a central location, regardless of where the items
are actually stored on your device.')
,(@actid,N'Linux',N'UNIX-based operating system for desktop computers, laptops, and some tablets; distributed under the terms of a General Public
License (GPL), which allows you to copy the OS for your own use, to give to others, or to sell')
,(@actid,N'macOS',N'The operating system for Apple desktop and laptop computers; includes the Siri virtual assistant, coordination with Apple
mobile devices, and cloud file storage')
,(@actid,N'macOS Server',N'Server operating system that supports all sizes of networks and servers; lets authorized users access servers using their
iPhones or other Apple devices')
,(@actid,N'Maximize button',N'On the right side of a window’s title bar, the center button of three buttons; used to expand a window so that it fills the
entire screen.')
,(@actid,N'megabytes (MB)',N'Millions of bytes of data')
,(@actid,N'memory',N'Consists of electronic components that store instructions waiting to be executed by the processor, data needed by those instructions,
and the results of processing the data into information')
,(@actid,N'menu',N'A list of related items, including folders, applications, and commands.')
,(@actid,N'Minimize button',N'On the right side of a window’s title bar, the leftmost button of three buttons; use to reduce a window so that it only appears
as an icon on the taskbar.')
,(@actid,N'mobile operating system',N'Has features similar to those of a desktop operating system, but is focused on the needs of a mobile user and the capabilities
of the device')
,(@actid,N'nonvolatile memory',N'Permanent memory whose contents remain on the computer or device even when it is turned off')
,(@actid,N'open source',N'Programs and apps (including operating systems) that have no restrictions from the copyright holder regarding modification
and redistribution; users can add functionality and sell or give away their versions to others')
,(@actid,N'operating system (OS)',N'A program that manages the complete operation of your computer or mobile device and lets you interact with it.')
,(@actid,N'output',N'Information processed into a useful form such as text, graphics, audio, video, or any combination of these')
,(@actid,N'personal computer (PC) operating system',N'Computers designed for personal use, as opposed to commercial or industrial use.')
,(@actid,N'platform',N'The software, or operating system, a device uses.')
,(@actid,N'pointing device',N'A hardware device that lets you interact with your computer by controlling the movement of the mouse pointer on your computer
screen; examples include a mouse, trackball, touchpad, pointing stick, onscreen touch pointer, a tablet, or for touch-enabled
devices, your hand or finger.')
,(@actid,N'program window',N'On a desktop or laptop computer, displays a running program')
,(@actid,N'RAM (random access memory)',N'The storage location that is part of every computer and that temporarily stores open apps and document data while a computer
is on.')
,(@actid,N'resources',N'On a computer system, the components required to perform work, such as the processor, RAM, storage space, and connected devices')
,(@actid,N'Restore Down button',N'On the right side of a maximized window’s title bar, the center of three buttons that reduces a window to its last non-maximized
size; in a restored window, this button changes to the Maximize button.')
,(@actid,N'ROM (read-only memory)',N'Permanently installed memory on your computer attached to the motherboard. The ROM chip contains the BIOS, which tells your
computer how to start.')
,(@actid,N'server OS',N'')
,(@actid,N'Settings app',N'A Windows 10 app containing nine touch-friendly categories of the most commonly used Windows settings; more advanced settings
are found in the Control Panel desktop app.')
,(@actid,N'Shortcut',N'Link to a file, folder, or app that appears on the desktop')
,(@actid,N'Shortcut menu',N'A list of frequently used commands that relate to an object, typically displayed by right-clicking; the commands on a shortcut
menu are related to the item you right-clicked.')
,(@actid,N'Software as a Service (SaaS)',N'Software that is distributed online for a monthly subscription or an annual fee.')
,(@actid,N'spooling',N'Placing data into a buffer')
,(@actid,N'system software',N'The software that runs a computer, including the operating system.')
,(@actid,N'tile',N'In PowerPoint, a button on a Power View navigation strip that is used to group data.')
,(@actid,N'UNIX',N'Multitasking operating system with many versions, as the code is licensed to different developers')
,(@actid,N'user accounts',N'Identifies to Windows the resources, such as apps and storage locations, a user can access when working with the computer.')
,(@actid,N'utility',N'Apps or programs that enable you to perform maintenance-type tasks related to managing the computer or device')
,(@actid,N'virtual machine',N'Enables a computer or device to run another operating system in addition to the one installed')
,(@actid,N'virtual memory',N'The amount of information temporarily stored in a paging file.')
,(@actid,N'virtualization',N'The practice of sharing computing resources, such as servers or storage devices, among computers and devices on a network')
,(@actid,N'volatile memory',N'Memory that is temporary, and loses its contents when the power is turned off')
,(@actid,N'web app',N'An app stored on an Internet server that can be run entirely in a web browser.')
,(@actid,N'web server',N'An Internet computer that stores webpages.')
,(@actid,N'window',N'A rectangular-shaped work area that displays an app or a collection of files, folders, and Windows tools.')
,(@actid,N'Windows',N'The operating systems for Microsoft machines; supports the Cortana virtual assistant, touchscreen input, HoloLens headsets,
and built-in apps such as the Microsoft Edge browser')
,(@actid,N'Windows Server',N'Microsoft server operating system that includes advanced security tools and a set of programs called Internet Information
Services that manage web apps and services')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 5. Software and Apps')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'absolute reference',N'A cell reference that does not change when the formula containing that reference is moved to a new location.')
,(@actid,N'animations',N'In PowerPoint, an effect applied to an object that makes the object appear, disappear, change, or move.')
,(@actid,N'Apache OpenOffice',N'An open source suite of productivity apps.')
,(@actid,N'apps',N'Short for “application,” a computer program that performs specific tasks; also called a program.')
,(@actid,N'app store',N'An online store to help you locate and download apps for your mobile device.')
,(@actid,N'Apple iWork',N'A productivity suite for computers running macOS and iPhones and iPads running the iOS operating system.')
,(@actid,N'application software',N'Programs that help you perform specific tasks when using your computer or smartphone. They are also called software applications
or apps.')
,(@actid,N'argument',N'In Excel and Access, and in Word tables, information necessary for a formula or function to calculate an answer.')
,(@actid,N'Big Data',N'Large and complex data sources that defy easy handling with traditional data processing methods.')
,(@actid,N'bitmap',N'A grid of square colored dots, called pixels, that form a picture; also, a file containing a graphic that consists of a bitmap.')
,(@actid,N'built-in functions',N'Features in spreadsheet apps that perform financial, mathematical, logical, date and time, and other calculations.')
,(@actid,N'cell',N'The box formed by the intersection of a column and a row.')
,(@actid,N'cell address',N'A cell’s location, expressed by its column letter and row number, such as A1.')
,(@actid,N'charts',N'A graphic that represents data using bars, columns, dots, lines, or other symbols to make the data easier to understand and
to make it easier to see the relationships among the data.')
,(@actid,N'clip art',N'Premade pictures and symbols you can use in electronic documents.')
,(@actid,N'communications apps',N'Apps that provide tools for sharing or receiving information.')
,(@actid,N'conditional formatting',N'Special formatting that is applied if values meet specified criteria.')
,(@actid,N'controls',N'In Access, any form or report element such as a label, text box, or combo box. In Windows, an object used to manipulate a
window or to use a program.')
,(@actid,N'cross-platform',N'Tools that developers can use to build apps that work on multiple platforms, rather than writing different code for Android
or iPhone devices.')
,(@actid,N'database',N'A collection of data organized in a manner that allows access, retrieval, and use of that data.')
,(@actid,N'device management apps',N'Apps that provide tools for maintaining your computer or mobile device.')
,(@actid,N'documents',N'In Excel, to make notes about basic worksheet assumptions, complex formulas, or questionable data.')
,(@actid,N'document management tools',N'Tools that protect and organize files and let you share documents with others.')
,(@actid,N'Drawing apps',N'Apps that let you create simple, two-dimensional images, which are often vector graphics.')
,(@actid,N'field',N'In an Access or in an Excel table or PivotTable, a column containing a specific property for each record, such as a person,
place, object, event, or idea.')
,(@actid,N'field name',N'In Access, Excel, Publisher, or in a Word table, a column label that describes a data field.')
,(@actid,N'filter',N'To specify a set of restrictions to only display specific database records, online images, or files.')
,(@actid,N'form',N'In Access, an object that provides an easy-to-use data entry screen that generally shows only one record at a time.')
,(@actid,N'format',N'The process of changing the appearance of text and objects.')
,(@actid,N'formulas',N'A mathematical statement in a spreadsheet or table cell that calculates a value using cell references, numbers, and arithmetic
operators such as +, -, *, and /.')
,(@actid,N'function',N'A named operation that replaces the action of an arithmetic expression.')
,(@actid,N'G suite',N'Google’s web-based productivity applications for creating documents, spreadsheets, presentations, email, and calendars.')
,(@actid,N'graphics and media apps',N'Apps that allow you to interact with and edit digital media.')
,(@actid,N'insertion point',N'A blinking vertical line that appears when you click in a paragraph, cell or text box; indicating where new text or an object
will be inserted.')
,(@actid,N'local applications',N'An application that runs from the hard drive of a local computer.')
,(@actid,N'macros',N'A named set of instructions written in the Visual Basic programming language that perform tasks automatically in a specified
order.')
,(@actid,N'm-commerce',N'Also known as mobile commerce. These apps let you use your mobile device to make online purchases of goods and services.')
,(@actid,N'Microsoft Office 365',N'Microsoft’s productivity suite which includes word processing, spreadsheets, and presentation apps, as well as Microsoft Outlook
for email, Microsoft OneNote for note taking, and Microsoft Access for databases.')
,(@actid,N'mobile apps',N'Apps that you access on a smartphone or tablet.')
,(@actid,N'mobile commerce',N'Also known as m-commerce. These apps let you use your mobile device to make online purchases of goods and services.')
,(@actid,N'mobile first design',N'A design principle centered on building apps to work on mobile devices first because these typically have more restrictions,
such as smaller screens.')
,(@actid,N'name',N'A component of a function or formula that indicates what will occur. For example SUM is the name of a function.')
,(@actid,N'native app',N'An app written for a specific operating system and installed on a computer or mobile device.')
,(@actid,N'on-screen keyboard',N'A keyboard displayed on-screen that includes keys for typing text, numbers, and symbols.')
,(@actid,N'operators',N'A mathematical symbol used in a formula to combine different values, resulting in a single value that is displayed within
the cell.')
,(@actid,N'page orientation',N'The direction in which content is printed on the page.')
,(@actid,N'paint apps',N'An app designed for drawing pictures, shapes, and other graphics with various onscreen tools, such as a text, pen, brush,
eyedropper, and paint bucket.')
,(@actid,N'personal interest apps',N'Apps that give you tools to pursue your interests.')
,(@actid,N'photo and image editing apps',N'Apps that provide the capabilities of paint apps and let you enhance and modify existing photos and images.')
,(@actid,N'pivot tables',N'A spreadsheet table designed to create meaningful data summaries that analyze worksheets containing large amounts of data.')
,(@actid,N'pixels',N'Short for picture element, an individual point of color on a display screen or printout.')
,(@actid,N'platform-specific',N'Mobile apps designed for a specific operating system like Android or iPhone.')
,(@actid,N'portable apps',N'Apps that run from a removable storage device such as an external hard drive or flash drive, or from the cloud.')
,(@actid,N'presentation',N'A PowerPoint document that lets you create and deliver a dynamic, professional-looking message to an audience in the form
of a slide show.')
,(@actid,N'presentation apps',N'An app that lets you create visual aids for presentations to communicate ideas, messages, and other information to a group.')
,(@actid,N'presentation software',N'A software program used to organize and present information in the form of an electronic slide show.')
,(@actid,N'productivity apps',N'Apps for personal use that you may use to create documents, develop presentations, track appointments, or to stay organized.')
,(@actid,N'productivity suite',N'A collection of productivity apps such as Microsoft Office 365, Apple iWork, G Suite, or Apache OpenOffice.')
,(@actid,N'query',N'')
,(@actid,N'raster',N'Another name for bitmap images.')
,(@actid,N'read-only access',N'A way to share files so others may read the file, but cannot change it.')
,(@actid,N'records',N'In Access and Excel, a row of data in a table, representing a complete set of field values for a specific person, place, object,
event, or idea; also called a tuple.')
,(@actid,N'relational database',N'A database that consists of a collection of tables that can be joined through a common field; each table contains information
on a specific subject, stored in the same file.')
,(@actid,N'relational database management system (RDBMS)',N'A software program in which data is organized as a collection of tables, and relationships between tables are formed through
a common field.')
,(@actid,N'relative reference',N'A cell reference that changes when the formula containing that reference is moved to a new location')
,(@actid,N'report',N'An Access object that creates a professional printout of data that may contain enhancements such as headers, footers, and
calculations on groups of records.')
,(@actid,N'responsive design',N'A way to provide content so that it adapts appropriately to the size of the display on any device.')
,(@actid,N'scroll bars',N'Bars on the right edge (vertical scroll bar) and bottom edge (horizontal scroll bar) of a document window that let you view
a document that is too large to fit on the screen at once.')
,(@actid,N'server',N'A powerful, high-capacity computer you access using the Internet or other network; it stores files and “serves” them, that
is, makes the files available to, users; usually grouped at a location called a data center.')
,(@actid,N'slide master',N'The template for the slides in a presentation that contains theme elements and styles, text formatting, the slide background,
and other objects that appear on all the slides in the presentation.')
,(@actid,N'slide show',N'A term used to describe a PowerPoint presentation.')
,(@actid,N'sort',N'To organize data, such as table rows, items in a list, or records in a mail merge, in ascending or descending order, based
on criteria such as date, alphabetical order, file size, or filename.')
,(@actid,N'sparklines',N'A quick, simple chart located within a cell that serves as a visual indicator of data trends.')
,(@actid,N'spreadsheet',N'A grid of cells that contain numbers and text; in Microsoft Excel, a spreadsheet is called a worksheet.')
,(@actid,N'SQL (Structured Query Language)',N'A language that provides a standardized way to request information from a relational database system.')
,(@actid,N'style',N'A named collection of formats that are stored together and can be applied to text or objects.')
,(@actid,N'tables',N'In Access, a collection of records for a single subject, such as all of the customer records; the fundamental building block
of a relational database because it stores all of the data.')
,(@actid,N'template',N'In Computer Concepts, a document that has been preformatted for specific purpose (such as an invitation, a brochure, a flyer,
a cover letter, or a resume).')
,(@actid,N'transitions',N'The manner in which a slide appears on the screen in place of the previous slide during a slide show.')
,(@actid,N'trendlines',N'A line that represents the general direction in a series of data.')
,(@actid,N'vector',N'A format for storing digital images that tend to be simple images composed of shapes, lines, and diagrams.')
,(@actid,N'video editing apps',N'Apps that allow you to modify a segment of a video, called a clip.')
,(@actid,N'view-only link',N'A link to a workbook on a OneDrive that can be viewed by users.')
,(@actid,N'web app',N'An app stored on an Internet server that can be run entirely in a web browser.')
,(@actid,N'web-based applications',N'In Computer Concepts, a program that you access over the Internet, in a browser on your computer or on your mobile device,
also known as a web app.')
,(@actid,N'what-if analysis',N'A way to explore the impact that changing input values has on calculated values and output values')
,(@actid,N'word processing software',N'Commonly used software to create documents and reports, mailing labels, flyers, brochures, newsletters, resumes, letters,
and more.')
,(@actid,N'workbook',N'A collection of related worksheets contained within a single file.')
,(@actid,N'worksheets',N'A single sheet in a workbook file that is laid out in in a grid of rows and columns')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 6. Security and Safety')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'address spoofing',N'An attack that changes the device’s address so that data is sent to the attacker’s computer.')
,(@actid,N'attackers',N'An individual who launches attacks against other users and their computers, also known as a threat actor.')
,(@actid,N'authentication',N'The process of ensuring that the person requesting access to a computer or other resources is authentic, and not an imposter.')
,(@actid,N'biometric security',N'A way to verify your identity based on physical characteristics.')
,(@actid,N'cookie',N'A file created by a website and that stores information on your computer, such as your website preferences; also called a
first-party cookie.')
,(@actid,N'cyberbullying',N'Bullying that takes place on technology devices like cell phones, computers, and tablets using online social media platforms,
public online forums, gaming sites, text messaging, or email. Cyberbullying includes sending, posting, or sharing negative,
harmful, mean-spirited, and usually false content about another person.')
,(@actid,N'cyberstalking',N'The use of technology to stalk another person through email, text messages, phone calls, and other forms of communication.')
,(@actid,N'cyberterrorists',N'An individual who attacks a nation’s computer networks, like the electrical power grid, to cause disruption and panic among
citizens.')
,(@actid,N'data backup',N'The process of copying files from a computer’s hard drive to be stored in a remote location.')
,(@actid,N'data mining',N'The process of sifting through big data to find the important questions that will yield fruitful results.')
,(@actid,N'decryption',N'The process of unlocking encrypted information back into a readable format.')
,(@actid,N'digital certificate',N'Code attached to a file that verifies the identity of the creator of the file.')
,(@actid,N'e-waste',N'Electronic waste from discarded digital devices. It often contains toxic metals such as lead and mercury.')
,(@actid,N'encryption',N'A security method of “scrambling” information as it is transmitted over a network. Information is scrambled in such a way
that it cannot be read unless the user possesses the “key” to unlock it back to a readable format.')
,(@actid,N'ergonomics',N'An applied science that specifies the design and arrangement of items that you use so that you and the items interact efficiently
and safely.')
,(@actid,N'hactivists',N'Attackers who are strongly motivated by principles or beliefs.')
,(@actid,N'hoax',N'A false warning, often contained in an email message that pretends to come from a valid source like the company’s IT department.
Attackers use this method to break into computers.')
,(@actid,N'identity theft',N'Using someone’s personal information, such as their name, Social Security number, or credit card number, to commit financial
fraud.')
,(@actid,N'insiders',N'The security threat to a company that comes from its own employees, contractors, and business partners.')
,(@actid,N'malware',N'Malicious software, such as viruses and spyware, that can delete or corrupt files and gather personal information.')
,(@actid,N'nation state actors',N'Government-sponsored attacker that launches computer attacks against their enemies.')
,(@actid,N'password',N'A string of uppercase and lowercase letters, numbers, and symbols that when entered correctly, allow you to open a password-protected
database or to obtain access to a Window user’s account.')
,(@actid,N'password manager',N'A program that helps you create and store multiple strong passwords in single user “vault” file that is protected by one strong
master password.')
,(@actid,N'phishing',N'In Computer Concepts, sending an email or displaying a web announcement that falsely claims to be from a legitimate enterprise
in an attempt to trick the user into giving private information.')
,(@actid,N'privacy',N'The state or condition of being free from public attention to the degree that you determine.')
,(@actid,N'ransomware',N'A type of malware that prevents a user’s device from properly and fully functioning until a fee is paid. The ransomware embeds
itself onto the computer in such a way that it cannot be bypassed, even by rebooting.')
,(@actid,N'repetitive strain injury (RSI)',N'Aches and pains associated with repeated and long-term usage of the devices.')
,(@actid,N'script kiddies',N'An individual who wants to attack computers, but lacks the knowledge of computers and networks needed to do so. Script kiddies
download freely available automated attack software (scripts) from websites and use it to perform malicious acts.')
,(@actid,N'social engineering',N'A category of attacks that attempts to trick the victim into giving valuable information to the attacker. At its core, social
engineering relies on an attacker’s clever manipulation of human nature in order to persuade the victim to provide information
or take actions.')
,(@actid,N'spam',N'Unwanted email messages sent from an unknown sender to many email accounts, usually advertising a product or service such
as low-cost medication, low-interest loans, or free credit reports; also called junk mail or junk email.')
,(@actid,N'strong password',N'In Computer Concepts, a combination of letters, numbers, and/or symbols that unlocks access to protected electronic data that
is a minimum of 15-20 characters in length.')
,(@actid,N'surge protector',N'A device that protects computer equipment by absorbing electrical spikes, surges, or noise before they can reach the equipment.')
,(@actid,N'technology addiction',N'A behavioral hazard that occurs when a user is obsessed with using a technology device and cannot walk away from it without
feeling extreme anxiety.')
,(@actid,N'Trojan',N'Malware that hides inside another program, often one downloaded from the web.')
,(@actid,N'two factor authentication (2FA)',N'A method that combines multiple types of authentication to increase security. This is most often used with passwords (something
you know) and the approved user having a specific item in his possession (something you have) that no one else would have.
This is commonly used by combining passwords and codes sent to a cell phone using a text message.')
,(@actid,N'uninterruptible power supply (UPS)',N'A device that maintains power to computer equipment in case of an interruption in the primary electrical source.')
,(@actid,N'virus',N'In Computer Concepts, malicious computer code that reproduces itself on the same computer. Almost all viruses “infect” by
inserting themselves into a computer file. When the file is opened, the virus is activated.')
,(@actid,N'weak password',N'A password that is short in length (less than 15 characters),uses a common word (princess), a predictable sequence of characters
(abc123), or personal information (Braden).')
,(@actid,N'Wi-Fi',N'A wireless data network technology that provides high-speed data connections that do not require a physical connection. It
is used for mobile devices.')
,(@actid,N'wireless routers',N'This central connection device needed for a home-based Wi-Fi network. The wireless router acts as the “base station” for the
wireless devices, sending and receiving wireless signals between all devices as well as providing the “gateway” to the external
Internet.')
,(@actid,N'worm',N'A collection of harmful computer code that spreads throughout a computer and/or network without requiring user interaction.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 7. Digital Media')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'2-D animation',N'An animation that displays 2-D images in rapid sequence to create the illusion of lifelike motion.')
,(@actid,N'3-D animation',N'An animation that displays 3-D objects or models in rapid sequence to create the illusion of natural motion.')
,(@actid,N'3-D CAD software',N'Applications used by engineers and scientists to create wireframe drawings of objects, which they can rotate to view from
multiple angles.')
,(@actid,N'analog device',N'A machine that reads or produces physical signals in their original form, such as a camera or tape player.')
,(@actid,N'analog sound waves',N'Continuous sound waves created in response to vibrations in the surrounding air, such as a drumstick hitting a drum pad.')
,(@actid,N'animated GIF',N'A series of slightly different GIF images displayed in sequence to achieve animation effects.')
,(@actid,N'animation',N'In PowerPoint, an effect applied to an object that makes the object appear, disappear, change, or move.')
,(@actid,N'animation software',N'Apps that let you create animations to give objects the appearance of motion or activity')
,(@actid,N'artificial intelligence (AI)',N'')
,(@actid,N'audio capture and editing software',N'Software for editing, copying, and sharing digital audio files.')
,(@actid,N'audio input device',N'A device, such as microphone or headset, that lets you enter sound into a computer.')
,(@actid,N'audio software',N'A program included on portable media players such as iPods and smartphones that often offers features such as file-shuffling
and volume control.')
,(@actid,N'augmented reality (AR)',N'A type of virtual reality that uses an image of an actual place or thing and adds digital information to it.')
,(@actid,N'augmented reality gaming',N'A type of gaming that integrates visual and audio game content with your real environment.')
,(@actid,N'binary number system',N'A number system consisting of only two digits: 0 and 1.')
,(@actid,N'bit',N'(Short for binary digit), the smallest unit of data a computer can process.')
,(@actid,N'bit rate',N'The number of bits of data processed every second, usually measured as kilobits per second (kbps).')
,(@actid,N'bitmap graphic',N'A grid of square colored dots, called pixels, that form a picture; also, a file containing a graphic that consists of a bitmap.')
,(@actid,N'byte',N'A field size for Number fields that allows entries only from 0 to 255.')
,(@actid,N'camcorder',N'A digital video camera with the recorder in the same unit.')
,(@actid,N'codec',N'A device or program that encodes and usually compresses digital media data for storage and then decompresses the data for
playback. Short for compressor/decompressor.')
,(@actid,N'compression',N'A space-saving technique used to store data in a format that takes less space.')
,(@actid,N'computer-aided design (CAD) software',N'Applications used by architects, scientists, designers, engineers, and others to create highly detailed and technically accurate
drawings that can be shared, modified, and enhanced with speed and accuracy.')
,(@actid,N'container',N'A wrapper that contains parts of a video file including the video, audio, and codec, in a single package.')
,(@actid,N'digital audio',N'A type of sound that is recorded and stored as a series of 1s and 0s.')
,(@actid,N'digital camera',N'A camera that creates a digital image of an object, person, or scene.')
,(@actid,N'digital device',N'A machine that reads and produces digital, or binary, data.')
,(@actid,N'digital graphic',N'An image you can see, store, and manipulate on a computer, tablet, smartphone, or other digital device.')
,(@actid,N'digital media',N'Content you create, produce, and distribute in digital, or computer-readable, form, such as photos, audio, video, and virtual
reality.')
,(@actid,N'digital video',N'Live action captured in digital format by a video camera.')
,(@actid,N'digital video camera',N'A camera that can capture video files in a digital format, as a series of 0s and 1s.')
,(@actid,N'digitize',N'To convert sound to a format your computer can read.')
,(@actid,N'download',N'The process of transferring (copying) a file from a server, computer, or device to another computer or device.')
,(@actid,N'drawing program',N'A program that lets you create vector images.')
,(@actid,N'file format',N'The organization and layout of data in a file')
,(@actid,N'game console',N'Hardware that allows you to play video games; examples include Xbox, Nintendo Wii, and Sony PlayStation.')
,(@actid,N'geotagging',N'A feature of digital cameras that can identify a picture’s geographical location.')
,(@actid,N'graphic',N'A picture, shape, design, graph or chart, diagram, or video.')
,(@actid,N'graphics software',N'A program that allows you to create, view, manipulate, and print digital images such as photos, drawings, clip art, and diagrams.')
,(@actid,N'graphics tablet',N'A hardware device used to create drawings with a pressure-sensitive pen.')
,(@actid,N'headset',N'Includes one or more headphones for output, and a microphone for input.')
,(@actid,N'hologram',N'A projected image that appears three-dimensional.')
,(@actid,N'HTML 5',N'The latest version of the Hypertext Markup Language, which is built into browsers.')
,(@actid,N'image-editing software',N'A program that lets you open and modify existing images.')
,(@actid,N'in-betweening',N'An animation technique using a sequence of images, in which one or more objects are changed slightly between each image. Often
shortened to tweening.')
,(@actid,N'keyframe',N'A location on a timeline that marks the beginning or end of a movement, effect, or transition.')
,(@actid,N'license filter',N'A search engine tool that lets you search for pictures that you can use, share, or even modify for personal or commercial
use.')
,(@actid,N'live audio feed',N'Audio transmitted live, as it happens; you can play the audio directly from the Internet.')
,(@actid,N'live video streaming',N'Streaming video content transmitted live, as it happens; you can view the media as it arrives.')
,(@actid,N'logos',N'A recognizable symbol that identifies a person, business, or organization.')
,(@actid,N'lossless compression',N'A method of reducing graphics file size in which none of the original file data is discarded; TIF, PNG, and GIF files can
be compressed using lossless compression. See also Lossy compression.')
,(@actid,N'lossy compression',N'A method of reducing graphics file size in which some of the original file data is discarded; the lost data is generally not
noticeable; JPEG files use lossy compression. See also Lossless compression.')
,(@actid,N'machine learning',N'A branch of AI that uses statistics to help machines learn from data, identify patterns, and make decisions to progressively
improve their performance without much human intervention.')
,(@actid,N'media player',N'An application that lets you play audio and video files; most tablets and smartphones include media players.')
,(@actid,N'megapixel',N'One million pixels. On a digital camera, the measurement that describes the camera’s maximum resolution; the higher the number
of megapixels, the higher the resolution of photos, and the larger the picture files.')
,(@actid,N'micro speakers',N'Portable speakers that can be as small as an inch or two in height and width.')
,(@actid,N'MIDI (Musical Instrument Digital Interface)',N'A standard music file protocol used by a variety of electronic musical instruments, computers, and other related devices to
connect and communicate with one another; stands for Musical Instrument Digital Interface.')
,(@actid,N'mix',N'An interactive video created from a PowerPoint presentation using Office Mix and posted to a website.')
,(@actid,N'mixed reality',N'A hybrid of virtual reality and augmented reality, simulations that let you see the real world while interacting with realistic
virtual objects.')
,(@actid,N'motion-sensing gaming console',N'A game console that allows players to interact with the system through body movements. Input is usually accomplished through
a combination of spoken commands, natural real-world actions and gesture recognition.')
,(@actid,N'music production software',N'Software that lets you record, compose, mix (combine), and edit music and sounds.')
,(@actid,N'on-demand content',N'Software that is distributed online for a monthly subscription or an annual fee.')
,(@actid,N'photo-editing software',N'A program, such as Adobe Photoshop, that lets you enhance and correct photographs.')
,(@actid,N'pixel',N'Short for picture element, an individual point of color on a display screen or printout.')
,(@actid,N'plug-in',N'Third-party program that extends the built-in functionality of an application or browser.')
,(@actid,N'real-time animation',N'A security feature that sets Windows Defender to constantly monitor your computer for virus and spyware activity.')
,(@actid,N'render',N'To transform a wireframe drawing into a solid 3D image.')
,(@actid,N'resolution',N'The number of horizontal and vertical pixels in a display device or the sharpness and clarity of an image.')
,(@actid,N'resolution dependent',N'Describes graphics whose image quality deteriorates as their size increases; bitmap graphics are resolution dependent, but
vector graphics keep the same quality as their size increases.')
,(@actid,N'sampling',N'In Publisher, a command that lets you copy an element’s color and apply it elsewhere.')
,(@actid,N'sampling software',N'A program that breaks sound waves into separate segments, or samples, and stores each sample numerically.')
,(@actid,N'scanner',N'A device that converts an existing paper image into an electronic file that you can open and work with on your computer.')
,(@actid,N'set top box',N'A device that allows you to view streaming media on your TV set; examples include Apple TV, Roku, and Google Chromecast.')
,(@actid,N'simulation',N'A sophisticated computer animation that is useful for training and teaching in many fields, particularly in areas in which
learning can be dangerous or difficult.')
,(@actid,N'skin',N'A visual image created by audio software to go along with the sounds being played.')
,(@actid,N'smart TV',N'A television that can connect to the Internet and stream TV shows and movies from subscription streaming services.')
,(@actid,N'sound card',N'A circuit board that gives a computer the ability to process sound.')
,(@actid,N'sound recorder software',N'A program that can capture sound from an audio input device such as a microphone or headset.')
,(@actid,N'speech recognition',N'Software that helps a user to input data or information verbally.')
,(@actid,N'stand-alone player',N'Software that plays certain types of audio files on a desktop or laptop computer.')
,(@actid,N'stock photo gallery',N'A website that maintains an inventory of photographs and other graphics and makes them available for download.')
,(@actid,N'stop motion animation',N'A type of animation where animators move real-life objects through a sequence of poses and capture the movements one frame
at a time. When you play the frames in sequence, the objects seem to move.')
,(@actid,N'stream',N'Music that you can listen to as it is being downloaded from the web.')
,(@actid,N'synthesized music',N'Voice output that converts text to speech.')
,(@actid,N'synthesized speech',N'Sound output that is the result of breaking words into individual sound units, called phonemes, and stringing them together
to create words and phrases.')
,(@actid,N'text-to-speech software',N'A program that accepts text as input and then generates sounds from phoneme sequences to create synthesized speech.')
,(@actid,N'transition',N'The manner in which a slide appears on the screen in place of the previous slide during a slide show.')
,(@actid,N'TV stick',N'A device, usually the size of a USB drive, that connects to a television to provide access to the Internet and to streaming
apps.')
,(@actid,N'vector graphics',N'A graphic consisting of shapes, curves, lines, and text created by mathematical formulas.')
,(@actid,N'video card',N'A circuit board that processes image signals.')
,(@actid,N'video conferencing',N'A technology that allows people at two or more locations to meet electronically using a network such as the Internet to transmit
video and audio data.')
,(@actid,N'video consoles',N'A meeting among several geographically separated people who use a network or the Internet to transmit audio and video data;
also called a web conference.')
,(@actid,N'video editing software',N'A program you use to enhance and customize a video.')
,(@actid,N'viral video',N'A video that has been shared millions of times over social media in a short period of time.')
,(@actid,N'virtual reality (VR)',N'The use of computers to simulate a real or imagined environment that appears as a three-dimensional (3-D) space.')
,(@actid,N'virtual world',N'An environment simulated by virtual reality software to appear as a real or imagined 3-D space.')
,(@actid,N'voice recognition',N'A technology that determines who is speaking rather than what is being said.')
,(@actid,N'voice-over',N'Voice narration that can accompany a slide presentation or other video.')
,(@actid,N'VR gaming system',N'Hardware necessary for playing virtual reality games.')
,(@actid,N'webcam',N'A type of digital video camera that captures video and still images as well as audio input; often built into a desktop, laptop,
or tablet computer.')
,(@actid,N'wireframe drawing',N'A 3D object composed of individual lines.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 8. Program and App Use and Development')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'4GL',N'Fourth-generation programming language; provides a graphical environment in which the programmer uses a combination of English-like
instructions, graphics, icons, and symbols to create code.')
,(@actid,N'access control',N'Security measure that defines who can use a program or app, and what actions they can do within the program or app.')
,(@actid,N'activation',N'A technique that some manufacturers use to ensure that you do not install a program or app on additional devices beyond what
you have paid for. Activation usually is required upfront, or after a certain trial period, after which the program or app
has limited functionality or stops working.')
,(@actid,N'adaptive development',N'The same as agile development.')
,(@actid,N'agile development',N'Software development method that incorporates flexibility in the goals and scope of the project; agile projects may evolve
in phases, releasing components as they are finalized, and adding functionality as it is needed or requested by users.')
,(@actid,N'analysis phase',N'Phase of the software development life cycle that includes conducting a preliminary investigation and performing detailed
analysis.')
,(@actid,N'antispyware',N'A program that detects and removes spyware; also called antimalware.')
,(@actid,N'antivirus',N'A program that locates and destroys viruses and other malware before they infect a device.')
,(@actid,N'apps',N'Short for “application,” a computer program that performs specific tasks; also called a program.')
,(@actid,N'application',N'Software that lets users perform specific tasks; also called a program or an app.')
,(@actid,N'assembly language',N'The second generation of programming languages; uses symbolic instruction codes, such as A for add, M for multiply, and L
for load.')
,(@actid,N'class',N'In object-oriented programming, a type of object that defines the format of the object and the actions an object can perform.')
,(@actid,N'code repository',N'Web-based tool programmers use to archive and host source code; often used by open source projects so that developers can
access the parts of the code they want to modify.')
,(@actid,N'compiler',N'A separate program that converts the entire source program into machine language before executing it.')
,(@actid,N'copyright',N'An originator’s exclusive legal right to reproduce, publish, or sell intellectual property.')
,(@actid,N'crash',N'Occurs when a program or app stops functioning correctly.')
,(@actid,N'debugger',N'In programming, to find and correct an error in VBA code. In Excel, to find and correct errors in a worksheet.')
,(@actid,N'design phase',N'A phase of the software development life cycle when the project team acquires the necessary hardware and programming languages/tools,
as well as develops the details of the finished product.')
,(@actid,N'development',N'The process of creating programs and apps from the idea stage to distribution to users.')
,(@actid,N'DevOps',N'A software development approach that encourages collaboration between the development and operations, produces programs quickly,
and then offers continuous updates to increase the functionality of the program.')
,(@actid,N'digital rights management (DRM)',N'A collection of technologies used by software publishers and trade groups to fight software piracy and prevent unauthorized
copying of digital content; includes authentication, certificates of authenticity, encryption, and digital watermarks.')
,(@actid,N'documentation',N'The unlocked portion of a worksheet where users are able to enter and change data.')
,(@actid,N'end-user license agreement (EULA)',N'A license agreement that grants permission for one installation. Also called a Single User license.')
,(@actid,N'feasibility',N'The measure of the suitability of the development process to the individual project at any given time.')
,(@actid,N'freeware',N'Software that is copyrighted and provided at no cost, but the developer retains all rights to the product.')
,(@actid,N'implementation phase',N'Phase of the software development life cycle in which the new program or app is built and delivered to users.')
,(@actid,N'integrated development environment (IDE)',N'Combines advanced code editing tools, debugging tools, and a graphical user interface to interact with file management tools,
to simplify the process of developing websites and applications.')
,(@actid,N'intellectual property (IP)',N'Legal rights protecting those who create works such as photos, art, writing, inventions, and music.')
,(@actid,N'interpreter',N'Translates and executes one statement in a program at a time. Interpreters do not produce or store object code. Each time
the source program runs, the interpreter translates instructions statement by statement.')
,(@actid,N'license agreement',N'Specifies the number of devices on which you can install the product, any expiration dates, and other restrictions.')
,(@actid,N'machine language',N'The first generation of programming languages; their instructions use a series of binary digits (0s and 1s).')
,(@actid,N'malware',N'Malicious software, such as viruses and spyware, that can delete or corrupt files and gather personal information.')
,(@actid,N'method',N'An action that an object can perform; procedures are often written to invoke methods in response to user actions.')
,(@actid,N'native app',N'An app written for a specific operating system and installed on a computer or mobile device.')
,(@actid,N'object',N'In object linking and embedding (OLE), the data to be exchanged between another document or program.')
,(@actid,N'object-oriented programming (OOP)',N'A common method of programming that focuses on objects that represent real persons, events, or transactions, and the behavior
and data associated with those objects.')
,(@actid,N'open source',N'Programs and apps (including operating systems) that have no restrictions from the copyright holder regarding modification
and redistribution; users can add functionality and sell or give away their versions to others')
,(@actid,N'patch',N'Software update that addresses a single issue.')
,(@actid,N'piracy',N'Illegally copying software, movies, music, and other digital materials.')
,(@actid,N'planning phase',N'The initial phase of the software development life cycle, including reviewing and approving requests for the project, allocating
resources, and forming a project team.')
,(@actid,N'predictive development',N'Software development that uses a linear, structured development cycle.')
,(@actid,N'procedural language',N'Third generation of programming languages that use a series of English-like words to write instructions, such as ADD for addition,
or PRINT for printing.')
,(@actid,N'program',N'A set of coded instructions written for a computer, such as an operating system program or an application program; also called
an application or an app.')
,(@actid,N'programming language',N'A set of words, abbreviations, and symbols. A programmer or developer uses a programming language to create instructions for
a program or app.')
,(@actid,N'prototype',N'A working model that demonstrates the functionality of the program or app.')
,(@actid,N'public domain',N'An item, such as a photo, that is available and accessible to the public without requiring permission to use, and therefore
not subject to copyright.')
,(@actid,N'quality assurance',N'Testing software and reporting any issues to the developers.')
,(@actid,N'ransomware',N'A type of malware that prevents a user’s device from properly and fully functioning until a fee is paid. The ransomware embeds
itself onto the computer in such a way that it cannot be bypassed, even by rebooting.')
,(@actid,N'rapid application development (RAD)',N'Uses a condensed or shortened software development process to produce a quality product.')
,(@actid,N'registration',N'Submitting your name and other personal information to the manufacturer or developer of software.')
,(@actid,N'service pack',N'A collection of software updates combined in one package.')
,(@actid,N'shareware',N'Software that is copyrighted and distributed for free for a trial period, after which you must send payment to continue using
the program.')
,(@actid,N'software',N'The programs and apps that instruct the computer to perform tasks. Software processes data into meaningful information.')
,(@actid,N'software as a service (SaaS)',N'')
,(@actid,N'software development life cycle (SDLC)',N'The set of activities used to build a program.')
,(@actid,N'source code editor',N'A text editor designed for programming.')
,(@actid,N'spyware',N'Software that tries to collect personal information or change computer settings without your consent.')
,(@actid,N'support and security phase',N'Phase of the software development life cycle that involves providing necessary maintenance for a program or app, such as fixing
errors or improving functionality; also includes monitoring performance to ensure efficiency.')
,(@actid,N'syntax',N'A set of rules; used for functions in Excel, procedures in VBA, and queries and properties in Access.')
,(@actid,N'system proposal',N'Using the data gathered during the feasibility study and detailed analysis to present a solution to the need or request.')
,(@actid,N'testing',N'A process in which each app or program function is tested to ensure it works properly.')
,(@actid,N'troubleshooting',N'The steps you take to identify and solve a problem, such as a crash.')
,(@actid,N'updates',N'In Access, to add, change, and delete records in database tables to keep them current and accurate.')
,(@actid,N'upgrade',N'New releases of the program or app, and may require an additional fee to enable the upgrade to install.')
,(@actid,N'user experience (UX)',N'The focus on the user’s reaction to and interaction with a product, including its efficiency, effectiveness, and ease of use.')
,(@actid,N'waterfall method',N'A linear, structured software development cycle that takes each step individually and completes it before continuing to the
next phase.')
,(@actid,N'wireframe',N'A blueprint of different aspects of a program that also indicates how a user gets from one area of the program to another.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 9. Web Development')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'absolute reference',N'A cell reference that does not change when the formula containing that reference is moved to a new location.')
,(@actid,N'attributes',N'In Access, property of an entity or a column in a table.')
,(@actid,N'banner',N'A newsletter portion that contains the title and usually an issue information line; also called a nameplate.')
,(@actid,N'client-side script',N'Script that runs in your browser to control a webpage’s behavior and often make it interactive; usually written in JavaScript.')
,(@actid,N'code editor',N'A type of text editor that has additional features to help write code accurately and efficiently.')
,(@actid,N'content management system (CMS)',N'A tool used to create a blog or website that you usually install or manage on your web server.')
,(@actid,N'Creative Commons',N'A non-profit organization that makes it easy for content creators to license and share their work by supplying easy-to-understand
copyright licenses; the creator chooses the conditions under which the work can be used.')
,(@actid,N'CSS (Cascading Style Sheets)',N'Used to specify the format and appearance of content on webpages.')
,(@actid,N'deprecated',N'A quality of a technology indicating that developers are discouraged from using it because a newer technology has been created
to take its place.')
,(@actid,N'domain registrar',N'An organization that sells and manages web domain names.')
,(@actid,N'dynamic',N'In a multipage workbook, describes pagination represented by horizontal or vertical dashed lines, which indicate where pages
print separately, and which adjust automatically when the workbook content changes.')
,(@actid,N'embedded styles',N'To place a copy of an object created in a source file into a destination file so that a one-way connection to the source program
becomes part of the destination file; you can then edit the embedded object using the source program.')
,(@actid,N'external link',N'Link to to another website.')
,(@actid,N'FTP (File Transfer Protocol) client',N'App used to upload or download files between your local computer and a remote web server.')
,(@actid,N'HTML',N'A special language that software developers use to create and format webpage elements; stands for Hypertext Markup Language.')
,(@actid,N'hyperlink',N'In Access, a data type for fields that store a link to a webpage, file, or email address.')
,(@actid,N'inline style',N'In HTML, a style attribute of most HTML tags.')
,(@actid,N'Integrated Development Environment (IDE)',N'Combines advanced code editing tools, debugging tools, and a graphical user interface to interact with file management tools,
to simplify the process of developing websites and applications.')
,(@actid,N'JavaScript',N'A popular language for writing scripts that run in your browser to control a webpage’s behavior and often make it interactive.')
,(@actid,N'local computer',N'The computer storing files to publish to a server using an FTP client.')
,(@actid,N'one-sided tag',N'HTML 5 tag that does not require a closing tag.')
,(@actid,N'plugin',N'Third-party program that extends the built-in functionality of an application or browser.')
,(@actid,N'project',N'An organized set of tasks required to reach a goal.')
,(@actid,N'publish',N'To share Excel workbook data on a network or on the web so that others can access it using a web browser.')
,(@actid,N'relative reference',N'A cell reference that changes when the formula containing that reference is moved to a new location')
,(@actid,N'remote web server',N'A web server on the Internet.')
,(@actid,N'responsive design',N'A way to provide content so that it adapts appropriately to the size of the display on any device.')
,(@actid,N'script',N'Programming code that performs a series of commands and can be embedded in a webpage.')
,(@actid,N'scripting language',N'Programming language used to code webpage scripts, such as Python, Java, JavaScript, PHP, Ruby, or C#.')
,(@actid,N'search engine optimization (SEO)',N'Tools to allow search engines to better find or index your website.')
,(@actid,N'server-side script',N'Script that runs on server, often to process data from an online form or interact with a database.')
,(@actid,N'static',N'Describes webpage content that does not change very often.')
,(@actid,N'style sheet',N'External file that stores style information for a larger website to create a consistent appearance across all pages in the
website.')
,(@actid,N'tags',N'In HTML, codes used to identify or “mark up” the content in a webpage such as, 
….

 tags to markup a paragraph.')
,(@actid,N'text editor',N'Program like Notepad in Windows or TextEdit in macOS that can be used for entering programming code; like a word processing
program, but lacks most text formatting features, such as fonts, colors, margins, and paragraphs.')
,(@actid,N'uptime',N'A measure of the percent of time a website is “up” or online; indicator of a web host’s reliability.')
,(@actid,N'URL',N'An abbreviation for Uniform Resource Locator, which is a webpage address that identifies the location of the file on the Internet.')
,(@actid,N'web address',N'A unique address on the Internet where a webpage resides; also called a URL.')
,(@actid,N'webpage',N'A specially formatted document that can contain text, graphics, sound, video, and links to other webpages.')
,(@actid,N'website analytics',N'A set of measurements that helps you to understand how people use your website.')
,(@actid,N'website builder',N'A tool used to create professional looking websites, by dragging and dropping predefined elements to their desired locations
on a page without coding')
,(@actid,N'World Wide Web Consortium (W3C)',N'One of the leading organizations that set guidelines for the web and that work together to write web standards.')
,(@actid,N'XML',N'Short for Extensible Markup Language, a language used to mark up structured data so that it can be more easily shared between
different computer programs; contains XML tags that identify field names and data.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 10. Networking')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'adware',N'A type of spyware that changes your browser settings to display advertisements.')
,(@actid,N'authentication',N'The process of ensuring that the person requesting access to a computer or other resources is authentic, and not an imposter.')
,(@actid,N'bandwidth',N'A term commonly used to describe the capacity of a communication channel.')
,(@actid,N'Bluetooth',N'A wireless short-range radio connection that simplifies communications among Internet devices and between devices and the
Internet.')
,(@actid,N'body area network (BAN)',N'A form of personal area network that consists of small, lightweight biosensors implanted in the body.')
,(@actid,N'bus network',N'Wires on which data travels to and from the CPU.')
,(@actid,N'cable modem',N'Device that sends and receives digital data over a cable TV connection.')
,(@actid,N'client',N'A computer or mobile device on the network that relies on the server for its resources.')
,(@actid,N'client/server network',N'Network architecture in which one or more computers act as a server, and the other computers on the network request resources
from the server.')
,(@actid,N'cloud computing',N'Providing and using computer tools, such as software, via the Internet (or the cloud).')
,(@actid,N'denial of service (DoS) attack',N'A type of attack, usually on a server, that is meant to overload the server with network traffic so that it cannot provide
necessary services.')
,(@actid,N'distributed denial of service (DDoS) attack',N'A denial of service attack that uses multiple computers to attack a server or other network resource.')
,(@actid,N'DSL modem',N'A broadband technology that creates a high-speed connection to the Internet through standard telephone lines.')
,(@actid,N'encryption',N'A security method of “scrambling” information as it is transmitted over a network. Information is scrambled in such a way
that it cannot be read unless the user possesses the “key” to unlock it back to a readable format.')
,(@actid,N'Ethernet',N'The most common network standard for wired networks.')
,(@actid,N'evil twin',N'A normal-looking yet fraudulent Wi-Fi network that allows hackers to capture personal information users transmit.')
,(@actid,N'extranet',N'Allows outsiders (such as customers, vendors, and suppliers) to access an organization’s intranet.')
,(@actid,N'firewall',N'A protective barrier between a computer or network and others on the Internet.')
,(@actid,N'hub',N'A device that provides a central point for cables in a network, and transfers all data to all devices.')
,(@actid,N'Internet peer-to-peer (Internet P2P) network',N'A type of P2P network where users share files with each other over the Internet.')
,(@actid,N'Internet Service Provider (ISP)',N'A company that sells Internet access.')
,(@actid,N'intranet',N'An internal network site used by a group of people who work together.')
,(@actid,N'local area network (LAN)',N'A type of network installed to link multiple PCs together so they can share hardware and software resources.')
,(@actid,N'MAC address',N'A unique hardware address identified for your computer or device.')
,(@actid,N'malware',N'Malicious software, such as viruses and spyware, that can delete or corrupt files and gather personal information.')
,(@actid,N'mesh network',N'Network topology in which all devices interconnect with each other. If a single device on the network fails, the rest of the
network will continue to function by communicating via an alternate route.')
,(@actid,N'metropolitan area network (MAN)',N'A type of wide area network (WAN) that is operated by a city or county.')
,(@actid,N'mobile hotspot',N'Enables you to connect a phone, computer or other device to the Internet through the cellular network.')
,(@actid,N'modem',N'A device that sends and receives data over telephone or cable lines and is connected to your computer.')
,(@actid,N'net neutrality',N'The concept that one website has the same value or priority as other websites, resulting in equal, unrestricted access to
each site.')
,(@actid,N'network',N'A collection of two or more computers connected together to share resources.')
,(@actid,N'network architecture',N'The logical design of all devices on a network.')
,(@actid,N'network attached storage (NAS)',N'One or more hard drives that connect directly to a network and provide a centralized location for storing programs and data
on large and small networks.')
,(@actid,N'network interface card (NIC)',N'A device that connects a computer to a network.')
,(@actid,N'network standards',N'Specify the way computers access a network, the type(s) of hardware used, data transmission speeds, and the types of cable
and wireless technology used.')
,(@actid,N'network topology',N'The physical arrangement of computers and devices on a network.')
,(@actid,N'peer-to-peer (P2P) network',N'A network architecture in which a small number of computers (often fewer than 10) communicate directly with one another and
can share each other’s resources.')
,(@actid,N'personal area network (PAN)',N'Network that connects personal digital devices within a range of approximately 30 feet, such as a smartwatch that connects
to your cell phone.')
,(@actid,N'phishing',N'An attempt to deceive you into revealing personal or financial information when you respond to an email message or visit a
website.')
,(@actid,N'protocol',N'A standardized procedure used by computers to exchange information.')
,(@actid,N'ransomware',N'A type of malware that prevents a user’s device from properly and fully functioning until a fee is paid. The ransomware embeds
itself onto the computer in such a way that it cannot be bypassed, even by rebooting.')
,(@actid,N'ring network',N'Network topology in which data travels from one device to the next in a sequential fashion; if one device on the network fails,
network communication could cease to function. No longer common.')
,(@actid,N'rootkit',N'Malware that gains administrator-level, or root-level, access to a computer or network without the system or users detecting
its presence.')
,(@actid,N'router',N'A device that directs traffic on a network and lets you share a single Internet connection among several computers.')
,(@actid,N'server',N'A powerful, high-capacity computer you access using the Internet or other network; it stores files and “serves” them, that
is, makes the files available to, users; usually grouped at a location called a data center.')
,(@actid,N'social engineering',N'A category of attacks that attempts to trick the victim into giving valuable information to the attacker. At its core, social
engineering relies on an attacker’s clever manipulation of human nature in order to persuade the victim to provide information
or take actions.')
,(@actid,N'spyware',N'Software that tries to collect personal information or change computer settings without your consent.')
,(@actid,N'star network',N'Network topology in which each device on the network is attached to a central device such as a server or switch. If the central
device fails, the other devices will be unable to communicate. If a connected device fails, all other devices will still be
able to communicate.')
,(@actid,N'strong password',N'In Computer Concepts, a combination of letters, numbers, and/or symbols that unlocks access to protected electronic data that
is a minimum of 15-20 characters in length.')
,(@actid,N'switch',N'In a field in Word, a comman that follows \*, \#, \@, or \! and turns on or off certain features of a field.')
,(@actid,N'TCP/IP (Transmission Control Protocol/Internet Protocol)',N'A unique number that identifies every computer on the Internet; consists of four sets of numbers from 0 to 255 separated by
periods, or dots, as in 216.35.148.4.')
,(@actid,N'trojan',N'Malware that hides inside another program, often one downloaded from the web.')
,(@actid,N'Virtual Private Network (VPN)',N'A private, secure path across a public network that allows authorized users secure access to a company or other network.')
,(@actid,N'virus',N'In Computer Concepts, malicious computer code that reproduces itself on the same computer. Almost all viruses “infect” by
inserting themselves into a computer file. When the file is opened, the virus is activated.')
,(@actid,N'wide area network (WAN)',N'Network that connects devices in a large geographic region, such as a multinational company or national retail chain.')
,(@actid,N'Wi-Fi hotspot',N'Wireless network available in public places such as hotels, restaurants, and coffee shops.')
,(@actid,N'wired network',N'Sends signals and data through cables to connect to other network devices; tend to be more secure and transmit data faster
than wireless networks.')
,(@actid,N'wireless network',N'A type of printer or other device that is connected to either a wired or wireless network to which you have access.')
,(@actid,N'wireless network key',N'A broadband technology that uses infrared light or radio-frequency signals to communicate with devices that are physically
connected to a network or the Internet.')
,(@actid,N'worm',N'A collection of harmful computer code that spreads throughout a computer and/or network without requiring user interaction.')
,(@actid,N'zombie',N'A device infected with malware that an attacker uses to control the device remotely.')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 11. Digital Communication')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'About page',N'In a blog, a page where you describe yourself, list any relevant experience or skills, and insert a photo and display name.')
,(@actid,N'activity stream',N'On social networks, a listing of all your updates, likes, posts, and events.')
,(@actid,N'aggregating',N'A function, such as Sum or Avg, that performs an arithmetic operation on selected records in a database.')
,(@actid,N'anonymous messaging app',N'An app that lets you send messages without including your identity.')
,(@actid,N'archiving',N'The practice of moving email messages, usually those older than a specified date, to a file or folder separate from your active
email.')
,(@actid,N'blog',N'Short for web log, an informal website consisting of date- or time-stamped articles, or posts, in a diary or journal format.')
,(@actid,N'blogging network',N'A blogging site that uses the tools of social networking.')
,(@actid,N'blogosphere',N'The worldwide collection of blogs, which vary by media, length, and purpose.')
,(@actid,N'blogware',N'Blogging software.')
,(@actid,N'chat window',N'A window used to send typed messages among participants during a web conference.')
,(@actid,N'chatting',N'Real-time communication through the Internet between two or more people who are online at the same time.')
,(@actid,N'clips',N'A media file, such as a graphic, sound, animation, or movie that you can add to documents and web pages.')
,(@actid,N'consumer review network',N'A website or social network platform that lets product users post reviews of a product or service, such as TripAdvisor or
Yelp.')
,(@actid,N'content aggregators',N'A website that gathers, organizes, and then distributes web content.')
,(@actid,N'content management system (CMS)',N'A tool used to create a blog or website that you usually install or manage on your web server.')
,(@actid,N'crowdfunding',N'A type of crowdsourcing in which individuals come together on the Internet to provide funding that will support others in
an endeavor.')
,(@actid,N'crowdsourcing',N'A practice that uses the Internet and the “intelligence of the crowd” to accomplish a task or solve a problem for the benefit
of all.')
,(@actid,N'cyberbullying',N'')
,(@actid,N'cyberstalking',N'The use of technology to stalk another person through email, text messages, phone calls, and other forms of communication.')
,(@actid,N'digital communication',N'The transmittal of data, instructions, and information from one computer or mobile device to another, often via the internet.')
,(@actid,N'digital footprint',N'The records of everything you do online; can be nearly impossible to completely erase.')
,(@actid,N'discussion forum network',N'A network that lets you have online conversations on any topic; one example is Quora.')
,(@actid,N'disinformation',N'Intentionally-released inaccurate information designed to influence or harm the reputation of others, especially in a highly
charged political environment.')
,(@actid,N'domain name',N'In Computer Concepts, the portion of a URL or email address that identifies one or more IP addresses, such as cengage.com.')
,(@actid,N'electronic messaging',N'A system you use to send and receive messages and files using the Internet; also called email.')
,(@actid,N'email',N'A system used to send and receive messages and files using the Internet; also called electronic mail.')
,(@actid,N'email address',N'A unique combination of a user name and a domain name that identifies your email account on a network so you can send and
receive email messages.')
,(@actid,N'email app',N'An application that lets you create, send, receive, forward, store, print, and delete email messages.')
,(@actid,N'email attachment',N'A file, such as a photo or document, that you send with an email message.')
,(@actid,N'email client',N'An application that lets you compose, send, receive, store, and delete email messages.')
,(@actid,N'email provider',N'An organization that provides servers for routing and storing email messages.')
,(@actid,N'email server',N'A server on the Internet that manages email accounts and messages.')
,(@actid,N'emoji',N'A small graphics used in electronic communications, that express an emotion; also called an emoticon.')
,(@actid,N'emoticon',N'A small graphics used in electronic communications, that express an emotion; also called an emoticon.')
,(@actid,N'extended contacts',N'On social networks, friends of your friends and their friends.')
,(@actid,N'feed',N'Verbal and nonverbal oral and written messages that listeners send to a speaker or writer.')
,(@actid,N'flaming',N'On social media, posting hostile or insulting comments about another online participant; to be avoided.')
,(@actid,N'friends',N'On social networks, your contacts.')
,(@actid,N'hashtag',N'A word(s) preceded by a # symbol that describes or categorizes a post.')
,(@actid,N'interest-based network',N'A social network that is targeted to a particular audience and subject, such as cat lovers or book lovers.')
,(@actid,N'Internet forum',N'On a forum, an online discussion site where people with a common interest participate in a conversation by posting messages;
also called a message board.')
,(@actid,N'Internet service provider (ISP)',N'A company that sells Internet access.')
,(@actid,N'Internet telephony',N'Voice communications over the Internet; sometimes called Voice over Internet Telephony.')
,(@actid,N'label',N'In Publisher and Word, an instructive word or words, such as “Date” or “Location,” directing a user to enter suitable data
in forms.')
,(@actid,N'like',N'On social networks, to show appreciation for.')
,(@actid,N'live blog',N'Blogs that comment on an event while it is taking place, usually in the form of frequent short updates.')
,(@actid,N'media-sharing network',N'A website that enables members to manage media such as photos, videos, and music.')
,(@actid,N'message board',N'On a forum, an online discussion site where people with a common interest participate in a conversation by posting messages;
also called an Internet forum')
,(@actid,N'metadata',N'Another name for document properties that includes the author name, the document subject, the document title, and other personal
information; used by Windows in document searches.')
,(@actid,N'microblog',N'A blog that allows users to publish short messages, usually between 100 and 200 characters, such as Twitter.')
,(@actid,N'multimedia messaging',N'The sending of photos, video, or link to websites with your messages using desktop or mobile devices.')
,(@actid,N'netiquette',N'The rules of Internet etiquette.')
,(@actid,N'news feed',N'On the Microsoft Edge Start page, a collection of live headlines, images, and information from various websites.')
,(@actid,N'online communities',N'An online group of people with common interests or goals, with whom you can discuss ideas and share content.')
,(@actid,N'online reputation',N'Information about you that others can find on the Internet.')
,(@actid,N'oversharing',N'On social networking, the sharing of too much information.')
,(@actid,N'pageview',N'In a blog, the number of times people have viewed a blog post.')
,(@actid,N'password',N'A string of uppercase and lowercase letters, numbers, and symbols that when entered correctly, allow you to open a password-protected
database or to obtain access to a Window user’s account.')
,(@actid,N'podcast',N'Recorded media that users can download or stream to a computer or mobile device and listen to at any time.')
,(@actid,N'posts',N'An article in a blog.')
,(@actid,N'profile',N'On a social networking site, information about yourself that forms your virtual identity.')
,(@actid,N'sharing economy network',N'A social network in which people rent out things they own, such as a car, a tool, or a room in their house.')
,(@actid,N'social bookmarking',N'In the early days of the Internet, a practice that allowed users to mark (or bookmark) websites to which they wanted to return;
now largely replaced by social curation.')
,(@actid,N'social curation',N'Websites that let users share and save links to websites on selected news topics to target the most relevant, useful, and
high-quality information.')
,(@actid,N'social media',N'The many ways individuals and businesses share information and interact using the Internet; includes stories, photos, news,
and opinions to complete diaries, daily life updates, professional networking, and job searching, as well as sophisticated
games.')
,(@actid,N'social network',N'An online community where users can share their interests, ideas, stories, photos, music, and videos with other registered
users via a social networking website, such as Facebook, Google Plus, Twitter, Instagram, or Snapchat.')
,(@actid,N'social shopping networks',N'A social network that brings together people interested in buying similar kinds of products.')
,(@actid,N'tag',N'In HTML, codes used to identify or “mark up” the content in a webpage such as, 
….

 tags to markup a paragraph.')
,(@actid,N'text messaging',N'The sending of short text messages, usually over cellular networks using mobile phones.')
,(@actid,N'thread',N'An instant message conversation that consists of text exchanges.')
,(@actid,N'upvote',N'On a discussion forum, to promote an answer that you find useful.')
,(@actid,N'video calling',N'A face-to-face conversation held over a network such as the Internet using a webcam, microphone, speakers, display device,
and special software; also called video chat.')
,(@actid,N'video chat',N'A face-to-face conversation held over a network such as the Internet using a webcam, microphone, speakers, display device,
and special software; also called video calling.')
,(@actid,N'video conference',N'A meeting among several geographically separated people who use a network or the Internet to transmit audio and video data;
also called a web conference.')
,(@actid,N'video messaging',N'Leaving a video message for a recipient to pick up later.')
,(@actid,N'video podcast',N'A file that contains video and audio, and is usually offered as part of a subscription to a podcasting service.')
,(@actid,N'vlogs',N'A video blog consisting of video clips.')
,(@actid,N'voice mail',N'A voice message, a short audio recording sent to or from a smartphone or other mobile device.')
,(@actid,N'voice messaging',N'The recording and posting of digital messages for another person.')
,(@actid,N'voice-to-text',N'The convering of incoming or outgoing voicee messages to writteen text.')
,(@actid,N'Voice Over Internet Protocol (VoIP)',N'Voice communications over the Internet; sometimes called Internet telephony.')
,(@actid,N'web conference',N'A meeting among several geographically separated people who use a network or the Internet to transmit audio and video data;
also called a video conference.')
,(@actid,N'webcast',N'A video broadcast of an event transmitted across the Internet.')
,(@actid,N'webinar',N'A presentation an audience accesses over the web that shows a shared view of the presenter’s screen and may also include audio
and video of the presenter and allow for audience participation.')
,(@actid,N'webmail',N'An email system, such as Gmail or Yahoo Mail, that allows its users to send and receive messages using a web browser.')
,(@actid,N'wiki',N'')
select * from q where q_act=@actid
go

declare @actid int
insert into act(actname) values('Module 12. Digital Transformation: Cloud, E-commerce, and AI')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'artificial intelligence (AI)',N'The technological use of logic and prior experience to simulate human intelligence.')
,(@actid,N'artificial neural network (ANN)',N'A mesh network of signals that apply multiple layers of processing to perform deep learning processes similarly to how the
human brain functions.')
,(@actid,N'chatbot',N'A feature on a website or app that uses AI technology to provide text-based support and communication services.')
,(@actid,N'cloud computing',N'Providing and using computer tools, such as software, via the Internet (or the cloud).')
,(@actid,N'customer relationship management (CRM)',N'A collection of computer services that help companies customize their interactions with customers.')
,(@actid,N'data analytics',N'The analysis of data to detect patterns that improve business processes and answer questions related to strategic planning.')
,(@actid,N'dataset',N'Incoming information provided to an AI system.')
,(@actid,N'e-business',N'Any kind of business activity conducted over a network of some kind, such as the Internet.')
,(@actid,N'e-commerce',N'Business transactions that occur over an electronic network such as the Internet.')
,(@actid,N'Infrastructure as a Service (IaaS)',N'A type of cloud service that allows customers to configure cloud-based networking infrastructure the way they want, such as
routing, servers, operating systems, storage spaces, and security settings.')
,(@actid,N'Internet of Things (IoT)',N'An environment where processors are embedded in every product imaginable (things), and these things communicate with one another
via the Internet or wireless networks.')
,(@actid,N'machine learning (ML)',N'A branch of AI that uses statistics to help machines learn from data, identify patterns, and make decisions to progressively
improve their performance without much human intervention.')
,(@actid,N'natural language processing (NLP)',N'A form of data input in which computers interpret and digitize spoken words or commands.')
,(@actid,N'omnichannel',N'A marketing strategy that relies on multiple types of contact per customer, such as targeted ads on social media, paid results
on search engines, or contacts by email or phone.')
,(@actid,N'on-premises',N'Computer hardware in a local office or data center.')
,(@actid,N'Payment Card Industry Data Security Standard (PCI DSS)',N'A set of standards that applies to all merchants who use credit card services from any of the major credit card companies,
such as Visa, Mastercard, Discover, and American Express.')
,(@actid,N'Platform as a Service (PaaS)',N'A type of cloud service that allows cloud customers to run their own applications without having to manage underlying servers.')
,(@actid,N'private cloud',N'Cloud technology running on hardware used by only a single organization.')
,(@actid,N'public cloud',N'Cloud technology running on hardware used by many organizations.')
,(@actid,N'reinforcement learning',N'An AI learning model that is best used when the “right” answer is not available but some answers are better than others. The
machine attempts to optimize its performance given a certain set of standards.')
,(@actid,N'robotic process automation (RPA)',N'Automatic processes running on servers that input or transfer data, such as transferring customer data from a call center
system to a customer relationship management system.')
,(@actid,N'smart device',N'A device that can communicate, locate, and predict; part of the Internet of Things (IoT).')
,(@actid,N'Software as a Service (SaaS)',N'Software that is distributed online for a monthly subscription or an annual fee.')
,(@actid,N'supervised learning',N'An AI learning model that relies on a labeled training dataset so the machine can learn the “right” answers.')
,(@actid,N'Turing Test',N'A test scenario posed by Alan Turing to determine when an AI system has become sufficiently advanced to sound as natural as
a human.')
,(@actid,N'unique selling proposition (USP)',N'A statement about how a company and its products are different and better than the competition’s.')
,(@actid,N'unsupervised learning',N'An AI learning model that requires the machine to look for patterns and relationships in unlabeled training data and then
categorize data according to those patterns.')
,(@actid,N'wake word',N'A key word that alerts an AI-powered personal assistant to record and interpret a spoken command.')
select * from q where q_act=@actid
go









declare @actid int
insert into act(actname) values('Module 13. Databases')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'back-end database',N'Part of a split database that contains table objects and is stored on a file server that all users can access.')
,(@actid,N'Big Data',N'Large and complex data sources that defy easy handling with traditional data processing methods.')
,(@actid,N'business intelligence (BI)',N'Software tools designed to extract useful information from big data.')
,(@actid,N'Confidentiality, Integrity, and Availability (CIA) triad',N'A classic security model that guides efforts to protect data from unauthorized access, protect data from unauthorized changes,
and ensure data is accessible by authorized users when needed.')
,(@actid,N'dashboard',N'A data visualization tool such as Power View.')
,(@actid,N'data analytics',N'The analysis of data to detect patterns that improve business processes and answer questions related to strategic planning.')
,(@actid,N'data lake',N'A collection of both structured and unstructured data of diverse data formats.')
,(@actid,N'data validation',N'A process that sets cells so that the values they accept are restricted in terms of type and range of data.')
,(@actid,N'data warehouse',N'A type of database that serves as a central repository from other data sources and databases for the purpose of data analysis.')
,(@actid,N'database',N'A collection of data organized in a manner that allows access, retrieval, and use of that data.')
,(@actid,N'database administrator (DBA)',N'A trained professional who designs or manages databases.')
,(@actid,N'Database as a Service (DBaaS)',N'A type of cloud service that allows users to access a database remotely through a web browser.')
,(@actid,N'database management system (DBMS)',N'A software program that lets you create databases and then manipulate data in them.')
,(@actid,N'field',N'In an Access or in an Excel table or PivotTable, a column containing a specific property for each record, such as a person,
place, object, event, or idea.')
,(@actid,N'filter',N'To specify a set of restrictions to only display specific database records, online images, or files.')
,(@actid,N'foreign key',N'A primary key field from one table that you include as a field in a second table to form a relationship between the two tables.')
,(@actid,N'form',N'In Access, an object that provides an easy-to-use data entry screen that generally shows only one record at a time.')
,(@actid,N'front-end database',N'Part of a split database that contains the user interface and other objects, but not the tables that are needed for an application.')
,(@actid,N'high availability',N'A characteristic of a computing resource that identifies the percentage of time the resource functions reliably.')
,(@actid,N'index',N'In Access, a database object that is created based on a field or combination of fields. Also, a field property that keeps
track of the order of the values in the field, and a list that relates field values to the records that contain those values.')
,(@actid,N'information',N'Data that has been processed to become meaningful.')
,(@actid,N'input mask',N'A field property that provides a visual guide for users as they enter data.')
,(@actid,N'key-value database',N'A nonrelational database consisting of any number of key-value pairs for each record.')
,(@actid,N'many-to-many relationship',N'A relationship between two database tables that connects one or more records in one table with one or more records in the
other table.')
,(@actid,N'nonrelational database',N'A highly scalable and highly available database type that is designed to store unstructured data. Also called NoSQL database.')
,(@actid,N'NoSQL database',N'A highly scalable and highly available database type that is designed to store unstructured data. Also called nonrelational database.')
,(@actid,N'one-to-many relationship',N'A relationship between two database tables that connects each record in one table with one or more records in the other table.')
,(@actid,N'one-to-one relationship',N'A relationship between two database tables that connects each record in one table with exactly one record in the other table.')
,(@actid,N'open source program',N'Programs and apps (including operating systems) that have no restrictions from the copyright holder regarding modification
and redistribution; users can add functionality and sell or give away their versions to others')
,(@actid,N'primary key',N'The field in a database that contains unique information for each record; also called a unique identifier.')
,(@actid,N'query',N'In Access, an object that provides a spreadsheet-like view of data, similar to that in tables; it may provide the user with
a subset of fields and/or records from one or more tables. Also, SQL commands that are used to retrieve data.')
,(@actid,N'record',N'In Access and Excel, a row of data in a table, representing a complete set of field values for a specific person, place, object,
event, or idea; also called a tuple.')
,(@actid,N'relational database',N'A database that consists of a collection of tables that can be joined through a common field; each table contains information
on a specific subject, stored in the same file.')
,(@actid,N'relational database management system (RDBMS)',N'A software program in which data is organized as a collection of tables, and relationships between tables are formed through
a common field.')
,(@actid,N'relationship',N'In Power BI, the process by which two or more tables within a data table are connected.')
,(@actid,N'report',N'An Access object that creates a professional printout of data that may contain enhancements such as headers, footers, and
calculations on groups of records.')
,(@actid,N'scalable',N'A characteristic of a computing resource that allows that resource to be increased or decreased as needed.')
,(@actid,N'sort',N'To organize data, such as table rows, items in a list, or records in a mail merge, in ascending or descending order, based
on criteria such as date, alphabetical order, file size, or filename.')
,(@actid,N'SQL (Structured Query Language)',N'A language that provides a standardized way to request information from a relational database system.')
,(@actid,N'table',N'A small, flat computer with a touch-sensitive screen that accepts input from a digital pen, stylus, or your fingertip')
select '"' + qname + '"',qdesc
from q
where q_act=214--@actid
order by qid
go
declare @actid int
insert into act(actname) values('Module 14. Digital Ethics and Lifestyle')
select @actid=scope_identity()
-- Logo
insert into q(q_act,qname,qdesc) values(@actid,N'acceptable use policy (AUP)',N'A document that lists guidelines and repercussions of use of the Internet and other digital company resources, including network
storage, and email servers.')
,(@actid,N'accessibility',N'The practice of removing barriers that may prevent individuals with disabilities from interacting with data or an app. In
relation to digital content, term used to refer to content that is adaptable or available to users who require assistance.')
,(@actid,N'alternative text (alt text)',N'Text that provides descriptions for all visual elements or non-text objects in an electronic document or webpage.')
,(@actid,N'catfishing',N'A deliberate attempt to mislead people about your identify by creating a fake online profile')
,(@actid,N'code of conduct',N'Part of an AUP that includes rules against causing harm to others, misuse or unauthorized access of another person’s files
or data, protection of intellectual property, stealing, software piracy, and social considerations.')
,(@actid,N'cyberbullying',N'Bullying that takes place on technology devices like cell phones, computers, and tablets using online social media platforms,
public online forums, gaming sites, text messaging, or email. Cyberbullying includes sending, posting, or sharing negative,
harmful, mean-spirited, and usually false content about another person.')
,(@actid,N'data breach',N'Any unauthorized collection or distribution of data.')
,(@actid,N'digital citizen',N'Person familiar with how to use technology to become an educated and productive member of the digital world.')
,(@actid,N'Digital citizenship',N'The ethical, legal, and productive use of technology.')
,(@actid,N'digital detox',N'A period of time during which an individual refrains from using technology.')
,(@actid,N'digital divide',N'The gap between those who have access to technology and its resources and information, especially on the Internet, and those
who do not.')
,(@actid,N'digital ethics',N'The set of legal and moral guidelines that govern the use of technology, including computers, mobile devices, information
systems, databases, and more.')
,(@actid,N'digital footprint',N'The records of everything you do online; can be nearly impossible to completely erase.')
,(@actid,N'digital inclusion',N'The movement to ensure that all users, regardless of economic or geographic constraints, have access to the devices, data,
and infrastructure required to receive high-speed, accurate, reliable information.')
,(@actid,N'digital lifestyle',N'Living in a way that involves using a variety of technologies for work and play.')
,(@actid,N'digital literacy',N'Having a current knowledge and understanding of computers, mobile devices, the web, and related technologies')
,(@actid,N'distracted driving',N'Driving a vehicle while focusing on other activities, typically involving an electronic device such as a cell phone.')
,(@actid,N'e-waste',N'The waste caused from disposing of unwanted electronic devices and materials.')
,(@actid,N'eye strain',N'Eye fatigue by spending too much time looking at devices; makes eyes itchy, sore, or dry, and can cause headaches.')
,(@actid,N'hoax',N'A false warning, often contained in an email message, that pretends to come from a valid source like the company’s IT department.
Attackers use this method to break into computers. In relation to the Internet and social medial, the deliberate posting of
content intended to cause harm or mislead people by tricking them into believing something that is false.')
,(@actid,N'Internet of Things (IoT)',N'An environment where processors are embedded in every product imaginable (things), and these things communicate with one another
via the Internet or wireless networks.')
,(@actid,N'netiquette',N'The rules of Internet etiquette.')
,(@actid,N'plagiarize',N'Taking someone else’s work and passing it off as your own.')
,(@actid,N'repetitive strain injuries (RSI)',N'Aches and pains associated with repeated and long-term usage of the devices.')
,(@actid,N'smart devices',N'A device that can communicate, locate, and predict; part of the Internet of Things (IoT).')
,(@actid,N'technology addiction',N'A condition in which a person is obsessed with using technology and feels anxiety when away from devices.')
,(@actid,N'text neck',N'Tightness or discomfort in the neck due to looking down at your phone or device for long periods.')
,(@actid,N'wiki',N'A collaborative website where you and your colleagues can modify and publish content on a webpage.')
select '"' + qname + '"',qdesc
from q
where q_act=215--@actid
order by qid

go
select * from act
order by actid 
update act set act_cat=105,actlink='Key/Terms.cfm' where actlink is null

select * from cat
go
--drop proc act.where_cat
--(@catid int
--) as
--select actid,actname
--from act
--where act_cat=@catid
--order by actid
--go
/*
--truncate table poll
*/

declare @catid int=(select catid from cat where catname='Key Terms setup')
print @catid
insert into act(act_grp,act_cat,actname,actlink) values(4,@catid,'Module 3. Computer Hardware','KeyTerms/setup.cfm')

insert into ans(ans_q,ansimg)
select qid,'NoPictureAvailable.jpeg' 
from q
join act on q_act=actid
join cat on act_cat=catid
left join ans on ans_q=qid
where catname='Key Terms setup'
and ansid is null


select * from act
order by actid desc

select '"' + qname + '"',qdesc
from q
where q_act=213
order by qname
