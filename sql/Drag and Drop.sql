--insert into act(act_grp,act_cat,actname,actlink) values(4,106,'Module 2. The Web','Drag/Drop.cfm')
--select * from cat
--select * from grp
--select * from act

--insert into cat(catname) values('Drag and Drop')



declare @actid int=219
delete from grade where gradeid in(
	select gradeid 
	from grade
	where grade_act=@actid
)
delete from poll where pollid in(
	select pollid
	from poll
	join q on poll_q=qid
	where q_act=@actid
)
delete from ans where ansid in(
	select ansid
	from ans
	join q on ans_q=qid
	where q_act=@actid
)
delete from q where q_act=@actid
declare @qid int
insert into q(q_act,qname,qdesc) values(@actid,'Introduction','Module2/Introduction.jpg')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Jalen Washington is a power user of the web, even as he commutes to school. Connecting to the cloud with his mobile phone, he stores, retrieves, and shares files. He opens the Google Chrome browser to check his grades, watch required video lectures on YouTube, and gather content for class projects from reliable online resources. He completes assignments using web apps, compares deals on headphones at e-commerce websites, and buys and sells sports memorabilia on eBay.')
insert into ans(ans_q,ansname) values(@qid,'You probably use the web dozens or hundreds of times a day to find a place for lunch, keep track of scores, shop for a new phone, post a comment on a blog or message board, and search for photos you need to complete a project at school or work. As a vast library of content, the web is where you go for entertainment, bargains, news, and information of all kinds. To find what you need on the web, you should understand the types of resources the web provides.')
insert into ans(ans_q,ansname) values(@qid,'In this module, you examine the role of the web in daily life. You explore the components of websites, webpages, and e-commerce and learn how to search the web to find information you can trust.')

insert into q(q_act,qname) values(@actid,'2.1. Explain the Role of the Web in Daily Life')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Since its introduction, the 
<a>web</a>, originally known as the 
<a>World Wide Web</a>, has changed the way people access information, conduct business transactions, and communicate, as shown in Figure 2-1. Almost everyone can use the web because it is part of the 
<a>Internet</a>, a global collection of millions of computers linked together to share information worldwide. Today, more than 3.2 billion people use the Internet and the web. The more you know about the web and how to access its contents, the more you can get out of it.'
,'Module2/Figure2-1.jpg')

insert into q(q_act,qname) values(@actid,'Define Web Browsing Terms')
select @qid=scope_identity()

insert into ans(ans_q,ansname,ansdesc) values(@qid,'When you use a mobile phone or other device to access the web, you are accessing a collection of webpages located on computers around the world, connected through the Internet. 
<a>A webpage</a> like the one shown in Figure 2-2 is an electronic document that can contain text, graphics, sound, video, and links to other webpages.'
,'Module2/Figure2-2.png')

insert into ans(ans_q,ansname) values(@qid,'The content of most webpages makes them visually appealing. The links make it possible to pursue information in a nonlinear fashion, following a route that looks more like a web than a straight line.')

insert into ans(ans_q,ansname) values(@qid,'A collection of webpages (often shortened to “pages”) makes up a 
<a>website</a>. A company, organization, institution, group, or person creates and maintains a website. In general, websites focus on a specific topic, business, or purpose.')

insert into ans(ans_q,ansname,ansdesc) values(@qid,'When you visit a website for the first time, figure out its purpose so you know what type of content to expect and which actions are appropriate. For example, the purpose of the ESPN website shown in Figure 2-3 is to provide sports news and entertainment, while the Sports Reference website provides statistics only. Both websites are dedicated to sports, but each has a different purpose.'
,'Module2/Figure2-3.png')

insert into ans(ans_q,ansname) values(@qid,'To access the web, you open a 
<a>browser</a>, an app designed to display webpages. For example, Google Chrome, Apple Safari, and Microsoft Edge are browsers. You use the tools in a browser to 
<a>navigate</a> the web, or move from one webpage to another.')

insert into ans(ans_q,ansname) values(@qid,'The webpage that appears when you open a browser is called the 
<a>home page</a> or 
<a>start page</a>. (The main page in a website is also called the home page. For example, the webpage shown in Figure 2-2 is the home page on the Cengage website.) To display a different webpage, you use links, short for 
<a>hyperlinks</a>, words or graphics you can click to display a webpage or other resource on the Internet, such as a file.')

insert into ans(ans_q,ansname,ansdesc) values(@qid,'To keep track of billions of webpages, the Internet assigns each one a 
<a>uniform resource locator (URL)</a>, an address that identifies the location of the page on the Internet. A URL can consist of the parts shown in Figure 2-4.'
,'Module2/Figure2-4.png')

insert into ans(ans_q,ansname) values(@qid,'If you can interpret a URL, you can learn about the sponsor, origin, and location of the webpage and catch a glimpse of how the web works. Table 2-1 defines each part of a URL.')
insert into ans(ans_q,ansname) values(@qid,'<table>
<thead>
                     
<tr>
<th>URL Part</th>
<th>Definition</th>
</tr>
</thead>
<tbody>
<tr>
<td><a>Protocol</a></td>
<td>A standardized procedure computers use to exchange information</td>
</tr>
<tr>
<td>
<b>Server address</b>
</td>
<td>The address of the server storing the webpage</td>
</tr>
<tr>
<td>
<b>Pathname</b>
</td>
<td>The address to the folder containing the webpage</td>
</tr>
<tr>
<td>
<b>File name</b>
</td>
<td>The name of the webpage file</td>
</tr>
</tbody>
</table>')

insert into ans(ans_q,ansname) values(@qid,'When the URL for a webpage starts with http://, the browser uses the 
<a>Hypertext Transfer Protocol (HTTP)</a>, the most common way to transfer information around the web, to retrieve the page.')

insert into ans(ans_q,ansname) values(@qid,'A server is a powerful networked computer that provides resources to other computers. A 
<a>web server</a> delivers webpages to computers requesting the pages through a browser. In the server address www.cengage.com, the www indicates that the server is a web server, cengage is the name the Cengage company chose for this website, and .com means that a commercial entity runs the web server.')

insert into ans(ans_q,ansname) values(@qid,'The server address in a URL corresponds to an Internet Protocol (IP) address, which identifies every computer on the Internet. 
An <a>IP address</a> is a unique number that consists of four sets of numbers from 0 to 255 separated by periods, or dots, as in 69.32.132.255. Although computers can use IP addresses easily, they are difficult for people to remember, so domain names were created. 
A <a>domain name</a> identifies one or more IP addresses, such as cengage.com. URLs use the domain name in the server address part of the URL to identify a particular website.')

insert into ans(ans_q,ansname) values(@qid,'In addition, each file stored on a web server has a unique pathname, just like files stored on a computer. The pathname in a URL includes the names of the folders containing the file, the file name, and its extension. A common file name extension for webpages is .html, sometimes shortened to .htm. For example, the pathname might be student/index.html, which specifies a file named index.html stored in a folder named student.')

insert into ans(ans_q,ansname) values(@qid,'Not all URLs include a pathname. If you don’t specify a pathname or file name in a URL, most web browsers open a file named index.html or index.htm, which is the default name for a website’s main page.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'A browser displays the URL for the current webpage in its 
<a>address bar</a>, as shown in Figure 2-5. You can also use the address bar to type the URL of the webpage you want to display.'
,'Module2/Figure2-5.jpg')
insert into ans(ans_q,ansname) values(@qid,'As you navigate websites, your browser keeps a copy of each page you view in a 
<a>cache</a>, so that the next time you go to a webpage, it loads more quickly. The browser also keeps track of pages you have viewed in sequence by tracking 
<a>breadcrumbs</a>—the path you followed to display a webpage. 
The <a>navigation bar</a> in a browser includes buttons such as Back and Forward that you can use to revisit webpages along the breadcrumb path.')

insert into q(q_act,qname) values(@actid,'Explain the Purpose of a Top-Level Domain')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'In a web address, the three-letter extension after the period indicates a top-level domain (TLD), such as the “com” in “cengage.com”. The TLD identifies the type of organization associated with the domain. As you visit websites, you might notice some that have TLDs other than .com, such as .edu for educational institutions and .gov for U.S. government agencies. The TLD provides a clue about the content of the website.')
insert into ans(ans_q,ansname) values(@qid,'An organization called Public Technical Identifiers (PTI) approves and controls TLDs, such as those in Table 2-2, which lists popular TLDs in the United States. For websites outside the United States, the suffix of the domain name often includes a two-letter country code TLD, such as .au for Australia and .uk for the United Kingdom.')
insert into ans(ans_q,ansname) values(@qid,'<table><thead>
<tr><th>TLD</th><th>Generally used for</th></thead><tbody>
<tr><td>.biz</td><td>Unrestricted use, but usually identifies businesses
<tr><td>.com</td><td>Most commercial sites that sell products and services
<tr><td>.edu</td><td>Academic and research sites such as schools and universities
<tr><td>.gov</td><td>U.S. government organizations
<tr><td>.int</td><td>International treaty organizations
<tr><td>.mil</td><td>Military organizations
<tr><td>.mobi</td><td>Sites optimized for mobile devices
<tr><td>.net</td><td>Network providers, ISPs, and other Internet administrative organizations
<tr><td>.org</td><td>Organizations such as political or not for profit (any website can have the .org TLD but, traditionally, only professional and nonprofit organizations such as churches and humanitarian groups use it)
<tr><td>.pro</td><td>Licensed professionals
</table>')




insert into q(q_act,qname) values(@actid,'Describe Internet Standards')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Have you ever wondered who is in charge of the web? Who maintains the webpages? Who makes sure all the parts of the complex system work together? One organization is the 
				<a href="JavaScript:">Internet Engineering Task Force (IETF)</a>. This group sets standards that allow devices, services, and applications to work together across the Internet. For example, the IETF sets standards for IP addresses. Other standards set rules for routing data, securing websites, and developing guidelines for responsible Internet use.')
insert into ans(ans_q,ansname) values(@qid,'Another leading organization is the <a href="JavaScript:">World Wide Web Consortium (W3C)</a>, which consists of hundreds of organizations and experts that work together to write web standards. The W3C publishes standards on topics ranging from building webpages, to technologies for enabling web access from any device, to browser and search engine design.')

insert into q(q_act,qname) values(@actid,'2.2. Describe Websites and Webpages')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'People around the world visit websites and webpages to accomplish the types of online tasks shown in Figure 2-6.'
,'Module2/Figure2-6.jpg')
insert into ans(ans_q,ansname) values(@qid,'In addition, you can use websites to play games; access news, weather, and sports information; download or read books; participate in online training; attend classes; and more.')


insert into q(q_act,qname) values(@actid,'Identify the Types of Websites')
select @qid=scope_identity()

insert into ans(ans_q,ansname) values(@qid,'What do you want to do on the web today? Chances are, a certain type of website provides exactly what you’re looking for. Most websites fall into one or more of the following categories:')
insert into ans(ans_q,ansname) values(@qid,'<table><tbody>
<tr><td>banking and finance</td><td>entertainment</td><td>portals
<tr><td>blogs</td><td>government or organization</td><td>retail and auctions
<tr><td>bookmarking</td><td>health and fitness</td><td>science
<tr><td>business</td><td>information and research</td><td>search sites
<tr><td>careers and employment</td><td>mapping</td><td>travel and tourism
<tr><td>content aggregation</td><td>media sharing</td><td>website creation and management
<tr><td>e-commerce</td><td>news, weather, sports, and other mass media</td><td>web apps and software as a service (SaaS)
<tr><td>educational</td><td>online social networks</td><td>wikis and collaboration
</table>')

insert into ans(ans_q,ansname) values(@qid,'Besides displaying information and other content, websites let you interact with it. You can contribute ideas, comments, images, and videos to an online conversation through interactive community pages, social media sites, and 
<a>blogs</a>, which are informal websites with time-stamped articles, or posts, in a diary or journal format.')
insert into ans(ans_q,ansname) values(@qid,'A <a>content aggregator</a> site such as News360 or Flipboard gathers, organizes, and then distributes web content. As a subscriber, you choose the type of content you want and receive updates when new content is available.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'An educational website such as ed2go, shown in Figure 2-7, offers formal and informal teaching and learning. The web contains thousands of tutorials where you can learn how to build a website or cook a meal. For a more structured learning experience, companies provide online training to employees, and colleges offer online classes and degrees.'
,'Module2/Figure2-7.jpg')
insert into ans(ans_q,ansname) values(@qid,'On entertainment websites, you can view or discuss activities ranging from sports to videos. For example, you can cast a vote on a topic for a television show.')
insert into ans(ans_q,ansname) values(@qid,'With a <a>media sharing site</a>, such as YouTube or Flickr, you can manage media such as photos, videos, and music and share them with other site members. Use a media sharing site to post, organize, store, and download media.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'An <a>online social network</a>, also called a social networking site or social media site, is a website that encourages members to share their interests, ideas, stories, photos, music, and videos online with other registered users. In many online social networks, you can communicate through text, voice, and video chat, and play games with other members. Facebook, Twitter, Whatsapp, Instagram, Pinterest, and Tumblr are some websites classified as online social networks. As shown in Figure 2-8, you interact with an online social network through a website or mobile app on your computer or mobile device.'
,'Module2/Figure2-8.jpg')
insert into ans(ans_q,ansname) values(@qid,'A <a>web portal</a>, or <a>portal</a>, is a website that combines pages from many sources and provides access to those pages. Most web portals are customized to meet your needs and interests. For example, your bank might create a web portal that includes snapshots of your accounts and access to financial information.')
insert into ans(ans_q,ansname) values(@qid,'Using a search site such as Google, you can find websites, webpages, images, videos, news, maps, and other information related to a specific topic. 
Search sites use <a>search engines</a>, software designed to find webpages based on your search criteria. You also can use a search engine to solve mathematical equations, define words, find flights, and more.')
insert into ans(ans_q,ansname) values(@qid,'General-purpose search sites such as Google, Yahoo!, and Bing help you locate web information when you don’t know an exact web address or are not seeking a specific website.')
insert into ans(ans_q,ansname) values(@qid,'As the web becomes more interactive, an increasing amount of content is supplied by users. You can contribute comments and opinions to informational sites such as news sites, blogs, and wikis. 
A <a>wiki</a> is a collaborative website where you and your colleagues can modify and publish content on a webpage. Wikis are especially useful for group projects.')



insert into q(q_act,qname) values(@actid,'Explain the Pros and Cons of Web Apps')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'In addition to using a browser to visit websites and display webpages, you can use it to access 
<a>web apps</a>, which are apps you can run entirely in a browser. (An <a>app</a>, short for <a>application</a>, is software you use to perform a task.) A web app resides on a server on the Internet, rather than on your computer or mobile device. For example, Microsoft Office provides Excel, PowerPoint, and Word as web apps, shown in Figure 2-9. Other popular web apps include Slack (for group collaboration), Trello (for project management), and Google Docs (for word processing).'
,'Module2/Figure2-9.png')
insert into ans(ans_q,ansname) values(@qid,'When you use a web app, you usually store your data on the web app’s server, or in the cloud, a practice known as cloud storage.')
insert into ans(ans_q,ansname) values(@qid,'You can run many apps as traditional installed apps or as web apps. Examples include Dropbox (which lets you store and exchange files in the cloud) and Skype (which lets you communicate with others using video and voice). Which type of app should you select? To help you decide, Table 2-3 summarizes the pros and cons of using web apps.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-3 Pros and Cons of Web Apps')
insert into ans(ans_q,ansname) values(@qid,'<table>
<thead><tr><th>Pros</th><th>Cons<tbody>
<tr><td>Access web apps from any device with a browser and Internet connection.</td><td>You must be online to use web apps.
<tr><td>Collaborate with others no matter their location.</td><td>Your files are more vulnerable to security and privacy violations.
<tr><td>Store your work on the app’s website so you can access it anytime and anywhere.</td><td>If the web app provider has technical problems, you might not be able to access your work.
<tr><td>Save storage space on your device.</td><td>If the web app provider goes out of business, you can lose your files.
<tr><td>Access the latest version of the app without installing updates.</td><td>Web apps often offer fewer features and may run more slowly than installed apps.
</table>')


insert into q(q_act,qname) values(@actid,'Identify the Major Components of a Webpage')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Webpages typically include five major areas: header or banner, navigation bar or menu, body, sidebar, and footer. Figure 2-10 identifies these areas on a webpage. Each area can include text, graphics, links, and media such as audio and video. If you are familiar with these components, you’ll know where to find the information you might be seeking.'
,'Module2/Figure2-10.png')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Header: Located at the top of a webpage, the header or banner usually includes a logo to identify the organization sponsoring the webpage and a title to indicate the topic or purpose of the webpage. Headers and navigation bars can also provide a Search tool for searching the website.
<li>Navigation bar: A bar or menu lists links to other major parts of the website.
<li>Body: The body is the main content area of the webpage, and can provide text, images, audio, and video.
<li>Sidebar: A column on the left or right of the webpage provides supplemental material, including social networking feeds, ads, and links. A current trend is to omit the sidebar to let the body span the full width of the webpage, especially if the body contains images.
<li>Footer: Located at the bottom of a webpage, the footer contains links to other parts of the website and lists information about the webpage, such as when it was last updated.
</ul>')

insert into q(q_act,qname) values(@actid,'Identify Secure and Insecure Websites')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Before you make a payment on a website or provide sensitive information such as a credit card number, make sure the website is secure. Otherwise, an unauthorized web user could intercept the payment or information and steal your funds or identity. Figure 2-11 shows how you can identify a secure website.'
,'Module2/Figure2-11.png')
insert into ans(ans_q,ansname) values(@qid,'A secure website uses <a>encryption</a> to safeguard transmitted information. 
<a>Encryption</a> is a security method that scrambles or codes data as it is transmitted over a network so it is not readable until it is decrypted.')
insert into ans(ans_q,ansname) values(@qid,'An encrypted website connection displays https instead of http in the URL. The “s” in https stands for “secure,” so https means 
<a>Hypertext Transfer Protocol Secure (HTTPS)</a>. Websites such as banks and retail stores use the https protocol to make a secure connection to your computer. Secure websites often use a 
<a>digital certificate</a> to verify the identity of the organization and vouch for the authenticity of the website.')
insert into ans(ans_q,ansname) values(@qid,'An insecure website does not include indicators such as a lock icon. In addition, the URL starts with “http,” indicating an unprotected protocol for transmitting information. The address bar in the Chrome browser identifies such websites as “Not secure.”')


insert into q(q_act,qname) values(@actid,'2.3. Use E-Commerce')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'<a>E-commerce</a>, short for electronic commerce, refers to business transactions on an electronic network such as the Internet. If you have bought or sold products such as clothing, electronics, music, tickets, hotel reservations, or gift certificates, you have engaged in e-commerce. Table 2-4 describes three types of e-commerce websites.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-4 Three Types of E-Commerce Websites')
insert into ans(ans_q,ansname) values(@qid,'<table><thead><tr><th>Type of E-commerce</th><th>Description</th><th>Example</thead><tbody>
<tr><td><a>Business-to-consumer (B2C)</a></td><td>Involves the sale of goods and services to the general public</td><td>Shopping websites
<tr><td><a>Consumer-to-consumer (C2C)</a></td><td>Occurs when one consumer sells directly to another</td><td>Online auctions
<tr><td><a>Business-to-business (B2B)</a></td><td>Consists of businesses providing goods and services to other businesses</td><td>Market research websites
</table>')

insert into q(q_act,qname) values(@actid,'Explain the Role of E-Commerce in Daily Life')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Consumers use e-commerce because it’s convenient, and businesses use e-commerce because it can increase revenue. In fact, e-commerce is so popular, it has reshaped the modern marketplace. Business analysts say that physical retail stores are in decline, while e-commerce websites such as Amazon are more popular than ever.')
insert into ans(ans_q,ansname) values(@qid,'You should understand the advantages and risks of using e-commerce to make your online transactions satisfying and safe. Table 2-5 outlines the pros and cons of e-commerce for consumers.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-5 E-Commerce Pros and Cons for Consumers')
insert into ans(ans_q,ansname) values(@qid,'<table><thead><tr><th>Pros</th><th>Explanation</thead><tbody>
<tr><td>Variety</td><td>You can choose goods from any vendor in the world.

<p>Websites have more models, sizes, and colors, for example, than a physical store.

<tr><td>Convenience</td><td>You can shop no matter your location, time of day, or conditions, such as bad weather.You save time by visiting websites instead of stores.
<tr><td>Budget</td><td>By searching effectively and comparing prices online, you can find products that meet your budget.
<tr><td>Cons</td><td>Explanation
<tr><td>Security</td><td>At insecure e-commerce sites, you risk unauthorized users intercepting your credit card information and other personal data.
<tr><td>Fraud</td><td>Some shopping websites are fraudulent, designed to look legitimate while accessing your account information.
<tr><td>Indirect experience</td><td>
You cannot experience a product directly to verify its color, quality, or texture.
<p>You lose the social interaction that is a natural part of shopping at a physical retailer.
</table>')

insert into q(q_act,qname) values(@actid,'Use E-Commerce in Business Transactions')
select @qid=scope_identity()
insert into ans(ans_q,ansname,ansdesc) values(@qid,'B2B e-commerce involves transferring goods, services, or information between businesses. In fact, most e-commerce is actually between businesses. B2B services include advertising, technical support, and training. B2B products include raw materials, tools and machinery, and electronics. Figure 2-12 shows the Livingston International website, which helps businesses ship goods from other countries.'
,'Module2/Figure2-12.png')


insert into ans(ans_q,ansname) values(@qid,'The more you know about B2B websites, the more valuable you can be to your employer. For example, B2B websites are different from B2C websites. For consumers, shopping websites offer fixed, consistent pricing. For B2B purchases, pricing can vary based on the level of service provided, negotiated terms, and other factors.')
insert into ans(ans_q,ansname) values(@qid,'At B2C websites, the consumer is the decision maker. In a B2B transaction, a team of people often need to review and make a purchasing decision. They usually have to follow company procedures, which can lengthen or complicate the transaction.')

insert into q(q_act,qname) values(@actid,'Use E-Commerce in Personal Transactions')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You can purchase just about any product or service at a B2C e-commerce website. Doing so is sometimes called e-retail (short for electronic retail). To purchase online, you visit an 
<a>electronic storefront</a>, which contains product descriptions, images, and a shopping cart to collect items you want to purchase. When you’re ready to complete the sale, you enter personal data and the method of payment, which should be through a secure Internet connection.')
insert into ans(ans_q,ansname) values(@qid,'A B2C website tracks your selected items using <a>cookies</a>, small text files generated by a web server that act like a storage bin for the items you place in your shopping cart. Cookies store shopping cart item numbers, saved preferences, and other information.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'As shown in Figure 2-13, B2C websites are usually designed to be easy to use so you can find what you want fast. They include reviews from other customers to help you make purchasing decisions, special offers for web customers only, and wish lists to encourage you to return to the site. Many B2C websites let you research online and then pick up the purchased item in a physical store.'
,'Module2/Figure2-13.png')
insert into ans(ans_q,ansname) values(@qid,'Online classified ads and online auctions are examples of C2C e-commerce websites. An online auction works much like a real-life auction or yard sale. You bid on an item being sold by someone else. The highest bidder at the end of the bidding period purchases the item. eBay is one of the more popular online auction websites.')
insert into ans(ans_q,ansname) values(@qid,'C2C sites have many sellers promoting the goods, rather than a single merchant hosting a B2C site. Many C2C sites use email forwarding, which hides real email identities, to connect buyer with seller and still protect everyone’s privacy. You pay a small fee to the auction site if you sell an item.')
insert into ans(ans_q,ansname) values(@qid,'To make e-commerce payments in a B2C transaction, you can provide a credit card number. Be sure the B2C website uses a secure connection. 3D Secure is a standard protocol for securing credit card transactions over the Internet. Using both encryption and digital certificates, 3D Secure provides an extra layer of security on a website. Sites that use Verified by Visa, MasterCard SecureCode, and American Express SafeKey use the added 3D Secure protocol.')
insert into ans(ans_q,ansname) values(@qid,'Besides the https protocol, e-commerce sites also use <a>Transport Layer Security (TLS)</a> to encrypt data. This helps protect consumers and businesses from fraud and identity theft when conducting commerce on the Internet.')
insert into ans(ans_q,ansname) values(@qid,'To provide an alternative to entering credit card information online, some shopping and auction websites let you use an online payment service, such as PayPal, Square Cash, Venmo, and Zelle. To use an online payment service, you create an account that is linked to your credit card or funds at a financial institution. When you make a purchase, you use your online payment service account, which manages the payment transaction without revealing your financial information.')
insert into ans(ans_q,ansname) values(@qid,'You can also use smartwatches and smartphones to make e-commerce payments. Apple-Pay and Google Wallet are two of several mobile payment and digital wallet services available on smartphones. Scan the watch or phone over a reader, often available in stores, to make the electronic payment.')
insert into ans(ans_q,ansname) values(@qid,'Another payment method is to use a one-time or virtual account number, which lets you make a single online payment without revealing your actual account number. These numbers are good only at the time of the transaction; if they are stolen, they are worthless to thieves.')

insert into q(q_act,qname) values(@actid,'Find E-Commerce Deals')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You can find online deals in at least two ways: visiting comparison shopping sites and using digital deals.')
insert into ans(ans_q,ansname) values(@qid,'Websites such as BizRate, NexTag, and PriceGrabber are comparison shopping websites that save you time and money by letting you compare prices from multiple vendors.')
insert into ans(ans_q,ansname) values(@qid,'Digital deals come in the form of gift certificates, gift cards, and coupons. Groupon and NewEgg are examples of deal-of-the-day websites, which help you save money on restaurant meals, retail products, travel, and personal services. Digital coupons consist of promotional codes that you enter when you check out and pay for online purchases. Sites such as RetailMeNot and browser extensions such as Honey provide coupon codes and offer alerts for discounts, as shown in Figure 2-14.')

insert into q(q_act,qname) values(@actid,'2.4. Apply Information Literacy Skills to Web Searches')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'You can find virtually any information you want on the Internet; all you need to do is to search for it. Search engines let you enter search criteria and then do the legwork for you, compiling a list of webpages that match your criteria. Of the billions of webpages you can access using Google or another search site, some are valuable and some are not. Telling the difference is a skill you need to succeed in work and life.')


insert into q(q_act,qname) values(@actid,'Define Information Literacy')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'How you find, evaluate, use, and communicate online information depends on your information literacy. 
If you have <a>information literacy</a>, you can do the following:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Navigate many sources of information, including the Internet, online libraries, and popular media sites.
<li>Select the right tool for finding the information you need.
<li>Recognize that not all information is created equal.
<li>Evaluate whether information is misleading, biased, or out of date.
<li>Manage information to become a knowledgeable decision maker.
</ul>')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'You become information literate by understanding and selecting the tools, techniques, and strategies for locating and evaluating information, as shown in Figure 2-15.'
,'Module2/Figure2-15.png')



insert into q(q_act,qname) values(@actid,'Explain How Search Engines Work')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Suppose you’re working on a presentation about mobile phone technology and need to know about current innovations. How can you find this information quickly?')
insert into ans(ans_q,ansname) values(@qid,'You’d probably start a <a>general search engine</a> such as Google, Bing, or Yahoo! and enter a search term or phrase such as mobile phone innovations. Within seconds, the first page of search results lists a dozen webpages that might contain the information you need.')
insert into ans(ans_q,ansname) values(@qid,'How does a general search engine choose the results you see? When you perform a search, a general search engine does not search the entire Internet. Instead, it compiles a database of information about webpages. It uses programs called 
<a>spiders</a> or 
<a>crawlers</a>, software that combs the web to find webpages and add new data about them to the database. These programs build an 
<a>index</a> of terms and their locations.')
insert into ans(ans_q,ansname) values(@qid,'When you enter a search term, or <a>query</a>, a general search engine refers to its database index and then lists pages that match your search term, ranked by how closely they answer your query.')
insert into ans(ans_q,ansname) values(@qid,'Each search engine uses a different method to retrieve webpage information from an index and create a ranked list of results. The ranking depends on how often and where a search term appears on the webpage, how long the webpage has been published, and the number of other webpages that link to it.')


insert into q(q_act,qname) values(@actid,'Use Search Tools and Strategies')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'A <a>search tool</a> finds online information based on criteria you specify or selections you make. Search tools include search engines and search boxes on webpages. The more effectively you use search tools, the more quickly you can find information and the more relevant that information will be.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Another type of search tool is a <a>web directory</a>, or <a>subject directory</a>, an online guide to subjects or websites, usually arranged in alphabetic order, as shown in Figure 2-16.'
,'Module2/Figure2-16.png')

insert into ans(ans_q,ansname) values(@qid,'Search engines and web directories take different approaches to searching for information. Instead of using an index created by digital spiders, a human editor creates the index for a web directory, selecting categories that make sense for the information the web directory provides. The editor usually reviews sites that are submitted to the directory and can exclude those that do not seem credible or reliable. For this reason, a web directory is often a better choice than a search engine if you are conducting research online.')
insert into ans(ans_q,ansname) values(@qid,'<a>Specialized search tools</a> concentrate on specific resources, such as scholarly journals or the United States Congress. Examples include the Directory of Open Access Journals, Congress.gov Legislative Search, and Google Books. If you need to research the latest academic studies or look up the status of a bill, using a specialized search tool is more efficient than using a general search engine such as Google.')
insert into ans(ans_q,ansname) values(@qid,'To get the most out of a web search, develop a search strategy, which involves performing the following tasks before you start searching:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>State what kind of information you are seeking, as specifically as possible.
<li>Phrase the search term as a question, as in “How do businesses use augmented reality?”
<li>Identify the keywords or phrases that could answer the question.
<li>Select an appropriate search tool.
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Next, perform the search. For example, if you want to know about how businesses use augmented reality, you could search using augmented reality as the <a>keywords</a>, the words that best describe what you want to find and produce a list of results that include the words or phrase. If you find the results you need, you can stop searching.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'If the term you use is too general, you are likely to find millions of webpages that mention the term. If the term you use is too specific, you might miss useful webpages related to your term. In either case, you need to refine the web search to narrow or broaden the results. Figure 2-17 summarizes an online search strategy.'
,'Module2/Figure2-17.png')


insert into q(q_act,qname) values(@actid,'Refine Web Searches')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Suppose you are interested in the next generation of the mobile Internet, called 5G Internet, and how it can make you more productive when you’re on the go. Enter 5G internet in a search engine, and the results could include millions of webpages about 5G products, news, definitions, and research.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'To find the information you’re seeking, learn from the search engine results page (SERP) by using the features your search tool provides, as shown in Figure 2-18.'
,'Module2/Figure2-18.png')

insert into ans(ans_q,ansname) values(@qid,'In addition to the features shown in Figure 2-18, many search engines follow practices when listing search results:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Search engines list the most relevant results, or <a>hits</a>, on the first page.
<li>Results labeled as an “Ad” or “Sponsored link” are from advertisers.
<li>Each type of filter offers related features. For example, if you filter Google search results to show only images, you can filter the images by size, color, and 
<a>usage rights</a>, which indicate when you can use, share, or modify the images you find online.
<li>In addition to listing related links at the bottom of the SERP, Google displays a “People also search for” list below a link you visited.
</ul>')
insert into ans(ans_q,ansname) values(@qid,'You can also refine a web search by using <a>search operators</a>, also called 
<a>Boolean operators</a>, which are characters, words, or symbols that focus the search. Table 2-6 lists common search operators.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-6 Common Search Operators')
insert into ans(ans_q,ansname) values(@qid,'<table><thead><tr><th>Operator</th><th>Means</th><th>Example</thead><tbody>
<tr><td>“ ” (quotation marks)</td><td>Find webpages with the exact words in the same order</td><td>“augmented reality” in business
<tr><td>| (vertical bar)</td><td>OR</td><td>augmented | virtual
<tr><td>- (hyphen)</td><td>NOT</td><td>augmented reality -virtual
<tr><td>*</td><td><a>Wildcard</a> (placeholder for any number of characters)</td><td>augment* reality
<tr><td>#..#</td><td>Find webpages within a range of numbers</td><td>augmented reality 2017..2022
</table>')
insert into ans(ans_q,ansname) values(@qid,'Now you’re ready to try a new search. Table 2-7 lists examples of keywords you might use to find information on buying used Android smartphones.')

insert into ans(ans_q,ansname) values(@qid,'Table 2-7 Examples of Web Searches')
insert into ans(ans_q,ansname) values(@qid,'<table><thead><tr><th>Keywords</th><th>Possible results</th><th>Suggested change</thead><tbody>
<tr><td>Looking for a used smartphone</td><td>A list of all used phones; returns too many hits</td><td>Add the word “Android.”
<tr><td>Looking for a used Android smartphone</td><td>Still too many hits</td><td>Remove common words such as “the” and “an”; remove verb.
<tr><td>Used Android smartphone</td><td>Results still include other smartphones</td><td>Search for an exact phrase by entering it in quotation marks.
<tr><td>Used “Android smartphone”</td><td>List of used Android smartphones</td><td></td>
</table>')
insert into ans(ans_q,ansname) values(@qid,'Many search sites have advanced search operators, which are special terms followed by a colon ( : ). For example, site: means to search only the specified site, as in site: www.cengage.com sam, which finds information about SAM on the cengage.com website. You can find the advanced search operators by referring to the site’s help pages.')
insert into ans(ans_q,ansname) values(@qid,'To broaden a search, you can use a <a>word stem</a>, which is the base of a word. For example, instead of using businesses as a keyword, use business. You can also combine the word stem with an asterisk (*), as in tech* to find technology, technician, and technique.')


insert into q(q_act,qname) values(@actid,'2.5. Conduct Online Research')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'When you need to conduct online research for an assignment or project, look beyond general search engines such as Google and Bing. Using search engines designed for research yields more reliable results, saving you time and effort.')


insert into q(q_act,qname) values(@actid,'Use Specialty Search Engines')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Where do you go to find academic information for your research? Try using a 
<a>specialty search engine</a>, which lets you search databases, news providers, podcasts, and other online information sources that general search engines do not always access.')
insert into ans(ans_q,ansname) values(@qid,'Searching databases is usually a good idea when conducting research, because much of the information on the web is stored in databases. To access this database information, you need to use a special search form and may need to enter a user name and password. For example, Google Scholar searches scholarly literature from many disciplines and includes articles, books, theses, and abstracts.')
insert into ans(ans_q,ansname) values(@qid,'Other specialty search tools let you find information published on certain types of sites. For example, use Google News or Alltop to find news stories and Podcast Search Service to search podcasts.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-8 lists additional search tools. Some of these sites help you refine research topics, while others help you find media such as images and videos.')
insert into ans(ans_q,ansname) values(@qid,'Table 2-8 Additional Search Tools')
insert into ans(ans_q,ansname) values(@qid,'<table><thead><tr><th>Search tool</th><th>What it does<tbody>
<tr><td>Wolfram Alpha</td><td>Answers factual questions directly, without listing webpages that might contain the answer
<tr><td>RhythmOne</td><td>Finds videos or other multimedia; uses speech recognition to match the audio part of a video with your search term
<tr><td>Ask a Librarian</td><td>Connects you to librarians at the Library of Congress and other libraries; allows you to engage in an online chat or submit your question in an online form
<tr><td>TinEye</td><td>Does a reverse search for submitted images, rather than keywords, to locate the original image and match it with other indexed images
</table>')
insert into q(q_act,qname) values(@actid,'Evaluate Online Information')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'On the Internet, anyone can publish anything to a website, a blog, or a social media site, regardless of whether the information is true. How can you tell if a website is worth your time? In general, look for sites from trusted, expert institutions or authors. Avoid sites that show bias or contain outdated information.')
insert into ans(ans_q,ansname) values(@qid,'If you use the Internet for research, be skeptical about the information you find online. Evaluate a webpage before you use it as an information source. One way to evaluate a webpage is to use the CARS checklist and determine whether the online information is credible, accurate, reasonable, and supportable.')
insert into ans(ans_q,ansname) values(@qid,'Credibility: When someone is providing you information face to face, you pay attention to clues such as body language and voice tone to determine whether that information is credible, or believable. Obviously, you can’t use that same technique to evaluate the credibility of a webpage.')
insert into ans(ans_q,ansname) values(@qid,'To determine the credibility of a website:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Identify the author of the webpage and check their credentials. This information is often listed on the Contact Us page or the About page.
<li>If you find biographical information, read it to learn whether the author has a degree in a field related to the topic.
<li>Use a search engine such as Google or the professional networking site LinkedIn to search for the author’s name and see whether the author is an expert on the subject.
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Accuracy: You’re attending a classmate’s presentation on the history of the personal computer, and he mentions that Bill Gates invented the first PC for home use in 1980, citing an online resource. You know it was actually Steve Wozniak and Steve Jobs in 1976. That inaccuracy makes you doubt the quality of the rest of the presentation.')
insert into ans(ans_q,ansname) values(@qid,'To check the accuracy of a website:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Verify its facts and claims. Consult an expert or use fact-checking sites such as 
<a>snopes.com</a> and 
<a>factcheck.org</a> to find professionally researched information.
<li>Evaluate the information source. Be wary of web addresses that contain slight modifications of legitimate sites, use unusual domain names, or have long URLs.
<li>Find out more about an organization that has no history, physical location, or staff.
<li>Check to see if the source has a bias and evaluate the information with the bias in mind.
<li>Check the webpage footer for the date the information was published or updated. For many topics, especially technology, you need current information.
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Reasonableness: Along with credibility and accuracy, consider how reasonable an online information source is. Reasonable means fair and sensible, not extreme or excessive.')
insert into ans(ans_q,ansname) values(@qid,'To check how reasonable a website is:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Identify the purpose of the webpage. Is the page designed to provide facts and other information, sell a product or service, or express opinions?
<li>Evaluate whether the webpage offers more than one point of view.
<li>Emotional, persuasive, or biased language is often a sign that the author is not being fair or moderate. Even opinions should be expressed in a moderate tone.
<li>Look for a conflict of interest. For example, if the page reviews a certain brand of smartphone and the author sells those types of phones, he or she has a conflict of interest.
</ul>')
insert into ans(ans_q,ansname) values(@qid,'Support: Suppose a webpage refers to a study concluding that most people consider computer professionals to be highly ethical. But the page doesn’t link to the study itself or mention other sources that support this claim. The page is failing the final criterion in the CARS checklist: support.')
insert into ans(ans_q,ansname) values(@qid,'To evaluate a webpage’s support:')
insert into ans(ans_q,ansname) values(@qid,'<ul>
<li>Look for links or citations to reputable sources or authorities. Test the links to make sure they work.
<li>Check other webpages and print material on the topic to see if they cite the same sources.
<li>Look for quotations from experts.
<li>For photos or other reproduced content, a credit line should appear somewhere on the page that states the source and any necessary copyright information.
</ul>')

insert into q(q_act,qname) values(@actid,'Gather Content from Online Sources')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'As you conduct research online, you gather content from webpages, including text, photos, and links to resources. Follow ethical guidelines and be aware of ownership rights to avoid legal, academic, and professional sanctions and be a responsible member of the online community.')
insert into ans(ans_q,ansname) values(@qid,'If you copy a photo from the Internet and use it in a report, you might be violating the photographer’s 
<a>intellectual property rights</a>, which are legal rights protecting those who create works such as photos, art, writing, inventions, and music.')
insert into ans(ans_q,ansname) values(@qid,'A <a>copyright</a> gives authors and artists the legal right to sell, publish, or distribute an original work. A copyright goes into effect as soon as the work exists in physical form.')
insert into ans(ans_q,ansname) values(@qid,'If you want to use a photo in your report, you need to get permission from the photo’s owner. Contact the photographer by email, and explain what you want to use and how you plan to use it. If a copyright holder gives you permission, keep a copy of the message or document for your records. The holder may also tell you how a credit line should appear. Acquiring permission protects you from potential concerns over your usage and protects the copyright holder’s intellectual property rights.')
insert into ans(ans_q,ansname) values(@qid,'Some online resources, such as e-books, newspapers, magazines, and journals, are protected by <a>digital rights management (DRM)</a>, which are techniques such as authentication, copy protection, or encryption that limit access to proprietary materials. It is a violation of copyright law to circumvent these protections to obtain and then use the materials. To avoid legal trouble, only use materials to which you have legal access, and then follow accepted usage laws for any information you obtain.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Some work is in the <a>public domain</a>, which means that the item, such as a photo, is available and accessible to the public without requiring permission to use, and therefore not subject to copyright. This applies to material for which the copyright has expired and to work that has been explicitly released to the public domain by its owner. Many websites provide public domain files free for you to download. Much information on U.S. government sites is in the public domain, as shown in Figure 2-19, although you must attribute the information and be aware that the sites might contain other copyrighted information.'
,'Module2/Figure2-19.png')
insert into ans(ans_q,ansname) values(@qid,'For any online source, if you don’t see a copyright symbol, look for a statement that specifically defines the work as being in the public domain. For quotations and other cited material, the United States fair use doctrine allows you to use a sentence or paragraph of text without permission if you include a citation to the original source.')
insert into ans(ans_q,ansname) values(@qid,'If the discussion about rights and legal trouble makes you nervous, you’re not alone. Clearly, it can be hard to know what is acceptable to use and what’s not. Most people are not legal experts, so how can you know what you can use and how you can use it? If you make your writing, photographs, or artwork available online, how do you specify to others how they can use that content?')
insert into ans(ans_q,ansname) values(@qid,'Creative Commons (CC) is a nonprofit organization that helps content creators keep copyright to their materials while allowing others to use, copy, or distribute their work. As a creator, you select a CC license that explains how others can use your work. For example, you can choose whether to allow commercial use of your poem, or allow derivative works, such as translations or adaptations. People who use content that carries a Creative Commons license must follow CC license rules on giving credit for works they use and displaying copyright notices.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'CC licenses are based on copyright law and are legal around the world. The CC organization is helping to build a large and ever-growing digital commons, shown in Figure 2-20, a collection of content that users can legally copy, distribute, and expand.'
,'Module2/Figure2-20.jpg')


insert into q(q_act,qname) values(@actid,'Apply Information Literacy Standards')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'Part of information literacy involves the ethical use of the information you find on the web. When you use the Internet for research, you face ethical decisions. 
<a>Ethics</a> is the set of moral principles that govern people’s behavior. Many schools and other organizations post codes of conduct for computer use, which can help you make ethical decisions while using a computer.')
insert into ans(ans_q,ansname) values(@qid,'Ethically and legally, you can use other people’s ideas in your research papers and presentations as long as you cite the source for any information that is not common knowledge. 
A <a>citation</a> is a formal reference to a source, such as a published work.')
insert into ans(ans_q,ansname,ansdesc) values(@qid,'Thorough research on technology and other topics usually involves books, journals, magazines, and websites. Each type of information source uses a different 
<a>citation style</a>. Instructors often direct you to use a particular citation style, such as MLA, APA, or Chicago. You can find detailed style guides for each style online. Some software, such as Microsoft Word, helps you create and manage citations and then produce a bibliography, which is an alphabetical collection of citations, as shown in Figure 2-21.'
,'Module2/Figure2-21.png')
insert into ans(ans_q,ansname) values(@qid,'If you use the content from a Wikipedia article but change some of the words, do you have to cite the source for that material? Yes, you do. Otherwise, you are guilty of 
<a>plagiarism</a>, which is using the work or ideas of someone else and claiming them as your own.')
insert into ans(ans_q,ansname) values(@qid,'To avoid plagiarism, cite your sources for statements that are not common knowledge. 
Even if you <a>paraphrase</a>, which means to restate an idea using words different from those used in the original text, you are still trying to claim someone else’s idea as your own. Cite sources when you borrow ideas or words to avoid plagiarism.')



select qname,ansname from ans join q on ans_q=qid where q_act=@actid
/*
insert into q(q_act,qname) values(@actid,'

insert into q(q_act,qname) values(@actid,'')
select @qid=scope_identity()
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
insert into ans(ans_q,ansname) values(@qid,'')
*/



