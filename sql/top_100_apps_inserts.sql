-- Top 100 apps, activity 364
-- Declare category variables (@social, @communication, etc.), @catid and @qid before running.
-- Image answers are included only where a matching image was identifiable in the supplied source.

-- 1. WhatsApp
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'WhatsApp',N'WhatsApp delivers free, end-to-end-encrypted texts, voice notes, and video calls to users worldwide.',7400000000)
select @qid=scope_identity()

-- 2. TikTok
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'TikTok',N'[TikTok](https://www.blog.udonis.co/mobile-marketing/mobile-apps/tiktok) serves an endless feed of short, creative videos that users can record, remix, and share in seconds.',6900000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2020/06/Tiktok-Updates.png')

-- 3. Facebook
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Facebook',N'Facebook connects friends and communities through posts, groups, events, and a personalized news feed.',6900000000)
select @qid=scope_identity()

-- 4. Instagram
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Instagram',N'Instagram lets people share photos, Reels, and Stories while following creators and trends in a visual feed.',6000000000)
select @qid=scope_identity()

-- 5. Messenger
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Messenger',N'Messenger is Meta’s standalone chat app for instant messages plus voice and video calls with individuals or groups.',5600000000)
select @qid=scope_identity()

-- 6. Snapchat
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Snapchat',N'[Snapchat](https://www.blog.udonis.co/mobile-marketing/mobile-apps/snapchat) offers disappearing messages, playful AR lenses, and short video stories popular with younger audiences.',3200000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2019/02/snapchat.jpg')

-- 7. CapCut
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@videoediting,N'CapCut',N'CapCut is a mobile editor that simplifies trimming, effects, and music syncing for social-ready videos.',2500000000)
select @qid=scope_identity()

-- 8. Telegram
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Telegram',N'Telegram is a cloud-based messenger known for large group chats, speedy file sharing, and privacy-focused features.',2500000000)
select @qid=scope_identity()

-- 9. Subway Surfers
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Subway Surfers',N'[Subway Surfers](https://www.blog.udonis.co/mobile-marketing/mobile-games/subway-surfers) is an endless-runner game where players dodge obstacles and collect coins across vibrant cityscapes.',2100000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2023/12/subway-surfers-game-design.png')

-- 10. Spotify
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@musicaudio,N'Spotify',N'Spotify streams millions of songs and podcasts on demand, creating personalized playlists and recommendations.',2100000000)
select @qid=scope_identity()

-- 11. YouTube
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@video,N'YouTube',N'[YouTube](https://www.blog.udonis.co/mobile-marketing/mobile-apps/youtube) hosts the world’s largest collection of user-generated and professional videos, from tutorials to live streams.',2000000000)
select @qid=scope_identity()

-- 12. SHAREit
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'SHAREit',N'SHAREit moves files, photos, and apps between devices quickly without relying on mobile data or cables.',1900000000)
select @qid=scope_identity()

-- 13. Netflix
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@entertainment,N'Netflix',N'Netflix lets subscribers stream a vast library of movies, series, and documentaries on demand across devices.',1800000000)
select @qid=scope_identity()

-- 14. UC Browser
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'UC Browser',N'UC Browser is a lightweight mobile web browser with built-in ad blocking, data-saving modes, and fast downloads.',1700000000)
select @qid=scope_identity()

-- 15. Zoom
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@business,N'Zoom',N'Zoom powers secure video meetings, team chat, and screen-sharing for seamless remote collaboration.',1600000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/zoom.jpg')

-- 16. Amazon
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Amazon',N'Amazon’s app lets shoppers browse, buy, and track millions of products with one-tap checkout and Prime perks.',1600000000)
select @qid=scope_identity()

-- 17. Pinterest
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Pinterest',N'[Pinterest](https://www.blog.udonis.co/mobile-marketing/mobile-apps/pinterest) is a visual discovery platform where users pin and organize ideas for projects, style, and recipes.',1600000000)
select @qid=scope_identity()

-- 18. X
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'X',N'X (formerly Twitter) delivers real-time posts, news, and live conversations in short text, image, and video formats.',1500000000)
select @qid=scope_identity()

-- 19. WhatsApp Business
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'WhatsApp Business',N'WhatsApp Business adds catalogs, auto-replies, and verified profiles to the wildly popular messaging platform.',1500000000)
select @qid=scope_identity()

-- 20. Picsart
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@photography,N'Picsart',N'Picsart offers AI-powered tools, filters, and templates for creating standout photo and video edits on mobile.',1400000000)
select @qid=scope_identity()

-- 21. Candy Crush Saga
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Candy Crush Saga',N'[Candy Crush Saga](https://www.blog.udonis.co/mobile-marketing/mobile-games/candy-crush) is a colorful match-3 puzzle game where players swap sweets to clear levels and top leaderboards.',1400000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2019/12/candy-crush-mobile-game-industry-leaders-statistics-2020.png')

-- 22. Free Fire
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Free Fire',N'[Free Fire](https://www.blog.udonis.co/mobile-marketing/mobile-games/free-fire-player-count) drops 50 players onto an island for fast-paced battle-royale shoot-outs lasting just 10 minutes.',1400000000)
select @qid=scope_identity()

-- 23. Roblox
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Roblox',N'[Roblox](https://www.blog.udonis.co/mobile-marketing/mobile-games/roblox-player-count) is a user-generated world where players build, share, and monetize 3-D games and experiences.',1300000000)
select @qid=scope_identity()

-- 24. Uber
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@travellocal,N'Uber',N'Uber connects riders with drivers for on-demand trips, food delivery, and package courier services.',1300000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/uber.webp')

-- 25. Truecaller
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Truecaller',N'Truecaller identifies unknown callers, blocks spam, and offers secure messaging in one handy app.',1300000000)
select @qid=scope_identity()

-- 26. 8 Ball Pool
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'8 Ball Pool',N'8 Ball Pool is a competitive billiards game where players challenge friends or strangers in real-time matches.',1200000000)
select @qid=scope_identity()

-- 27. Temu
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Temu',N'Temu is a bargain-friendly marketplace that ships factory-direct fashion, gadgets, and home goods at ultra-low prices.',1200000000)
select @qid=scope_identity()

-- 28. PUBG Mobile
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'PUBG Mobile',N'[PUBG Mobile](https://www.blog.udonis.co/mobile-marketing/mobile-games/pubg-mobile-player-count) drops 100 players onto an ever-shrinking map where they scavenge weapons and fight to be the last squad standing.',1200000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/04/pubg-mobile-player-count.jpeg')

-- 29. SHEIN
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'SHEIN',N'SHEIN pushes daily drops of trend-driven apparel and accessories with fast global shipping and in-app styling tools.',1200000000)
select @qid=scope_identity()

-- 30. IMO
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'IMO',N'IMO offers free HD video calls and group chats while keeping data usage remarkably light.',1200000000)
select @qid=scope_identity()

-- 31. Google Maps
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@navigation,N'Google Maps',N'Google Maps supplies turn-by-turn directions, live traffic, and local business info almost everywhere on the planet.',1200000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/google-maps.webp')

-- 32. Ludo King
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Ludo King',N'Ludo King turns the classic board game into an online multiplayer hit with voice chat and themed boards.',1200000000)
select @qid=scope_identity()

-- 33. Google Meet
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@business,N'Google Meet',N'Google Meet lets teams, classrooms, and friends run secure video calls with screen sharing and real-time captions.',1100000000)
select @qid=scope_identity()

-- 34. Google Translate
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'Google Translate',N'Google Translate instantly converts text, speech, or images between more than 100 languages online or offline.',1100000000)
select @qid=scope_identity()

-- 35. Shopee
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Shopee',N'Shopee packs flash sales, free-shipping vouchers, and in-app games into Southeast Asia’s favorite e-commerce app.',1100000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/shopee.png')

-- 36. Kwai
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@video,N'Kwai',N'Kwai serves up short-form videos plus easy editing tools and challenges that spark viral trends.',1100000000)
select @qid=scope_identity()

-- 37. Jio Hotstar
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@entertainment,N'Jio Hotstar',N'Jio Hotstar streams live cricket, local TV dramas, and Disney content to viewers across India and Southeast Asia.',1000000000)
select @qid=scope_identity()

-- 38. Google Play Games
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Google Play Games',N'Google Play Games tracks achievements, leaderboards, and cloud saves while recommending new Android titles.',1000000000)
select @qid=scope_identity()

-- 39. Google Chrome
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Google Chrome',N'Google Chrome delivers fast, secure web browsing with cross-device sync and built-in password management.',1000000000)
select @qid=scope_identity()

-- 40. MX Player
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@video,N'MX Player',N'MX Player plays almost any video format offline and now streams free shows and originals.',1000000000)
select @qid=scope_identity()

-- 41. My Talking Tom
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'My Talking Tom',N'My Talking Tom lets players raise a virtual cat, dress him up, and play mini-games.',1000000000)
select @qid=scope_identity()

-- 42. YouTube Music
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@musicaudio,N'YouTube Music',N'YouTube Music mixes official tracks, remixes, and live performances into personalized playlists and radio stations.',973000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/youtube-music.jpg')

-- 43. AliExpress
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'AliExpress',N'AliExpress connects global shoppers with sellers for bargain-priced gadgets, fashion, and home goods.',956000000)
select @qid=scope_identity()

-- 44. Flipkart
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Flipkart',N'Flipkart is India’s home-grown marketplace offering everything from smartphones to groceries with quick delivery options.',950000000)
select @qid=scope_identity()

-- 45. Prime Video
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@entertainment,N'Prime Video',N'Prime Video streams blockbuster movies, hit series, and live sports to Amazon Prime members worldwide.',948000000)
select @qid=scope_identity()

-- 46. WeChat
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'WeChat',N'WeChat rolls messaging, social feeds, payments, and mini-apps into one super-app used across China and beyond.',935000000)
select @qid=scope_identity()

-- 47. Duolingo
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@education,N'Duolingo',N'[Duolingo](https://www.blog.udonis.co/mobile-marketing/mobile-apps/duolingo) gamifies language learning with bite-sized lessons, streak rewards, and cheerful animations.',921000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/duolingo.webp')

-- 48. Likee
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@video,N'Likee',N'Likee lets creators shoot, edit, and share short videos packed with AR effects and music clips.',920000000)
select @qid=scope_identity()

-- 49. Google Photos
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@photography,N'Google Photos',N'Google Photos backs up images to the cloud and uses AI to organize, search, and enhance them.',917000000)
select @qid=scope_identity()

-- 50. ChatGPT
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@productivity,N'ChatGPT',N'[ChatGPT](https://www.blog.udonis.co/mobile-marketing/mobile-apps/chatgpt) answers questions, drafts content, and explains ideas through natural, conversational AI.',917000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/chat-gpt.jpg')

-- 51. InShot
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@videoediting,N'InShot',N'InShot trims clips, adds filters, and syncs music for share-ready videos on social platforms.',908000000)
select @qid=scope_identity()

-- 52. My Talking Tom 2
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'My Talking Tom 2',N'My Talking Tom 2 brings fresh mini-games and pet-care activities to the beloved virtual-pet series.',898000000)
select @qid=scope_identity()

-- 53. Gmail
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Gmail',N'Gmail delivers fast, spam-free email plus smart filters, offline access, and powerful search on mobile.',896000000)
select @qid=scope_identity()

-- 54. Temple Run 2
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Temple Run 2',N'[Temple Run 2](https://www.blog.udonis.co/mobile-marketing/mobile-games/temple-run-2) is an endless-runner where you swipe, jump, and slide to outrun demons through twisting jungle paths.',890000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2023/06/temple-run-cover.png')

-- 55. Google
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'Google',N'The Google app brings instant search, personalized Discover news, and voice-based answers right to your phone.',877000000)
select @qid=scope_identity()

-- 56. Hill Climb Racing
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Hill Climb Racing',N'Hill Climb Racing is a physics-based driving game where you conquer steep hills using upgradeable vehicles.',875000000)
select @qid=scope_identity()

-- 57. Sniper 3D
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Sniper 3D',N'Sniper 3D drops you into quick missions to eliminate targets with realistic ballistics and dozens of rifles.',864000000)
select @qid=scope_identity()

-- 58. Google Wallet
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@finance,N'Google Wallet',N'Google Wallet stores payment cards, transit passes, and IDs for tap-to-pay checkout online and in-store.',863000000)
select @qid=scope_identity()

-- 59. Among Us
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Among Us',N'[Among Us](https://www.blog.udonis.co/mobile-marketing/mobile-games/among-us-player-count) is a social-deduction hit where crewmates complete tasks while rooting out hidden impostors.',856000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/02/among-us.webp')

-- 60. B612
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@photography,N'B612',N'B612 offers selfie retouching, AI filters, and AR stickers for studio-quality photos and short videos.',856000000)
select @qid=scope_identity()

-- 61. My Talking Angela
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'My Talking Angela',N'My Talking Angela lets players adopt, dress, and play mini-games with a virtual cat that repeats what you say.',855000000)
select @qid=scope_identity()

-- 62. YouTube Kids
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@entertainment,N'YouTube Kids',N'YouTube Kids curates family-friendly videos and includes parental controls for a safer viewing experience.',833000000)
select @qid=scope_identity()

-- 63. Magic Tiles 3
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Magic Tiles 3',N'Magic Tiles 3 is a rhythm game where you tap piano tiles in time with popular songs to rack up combos.',818000000)
select @qid=scope_identity()

-- 64. PhonePe
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@finance,N'PhonePe',N'PhonePe enables instant UPI payments, bill recharges, and money transfers for millions of users in India.',808000000)
select @qid=scope_identity()

-- 65. Discord
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Discord',N'Discord combines voice channels, text chat, and community servers for gamers, creators, and friends worldwide.',806000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/discordf.webp')

-- 66. Wish
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Wish',N'Wish offers deep-discount gadgets, apparel, and home goods shipped straight from global merchants to your door.',791000000)
select @qid=scope_identity()

-- 67. Clash of Clans
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Clash of Clans',N'[Clash of Clans](https://www.blog.udonis.co/mobile-marketing/mobile-games/clash-of-clans-player-count) lets you build a village, raise armies, and battle millions of players in real-time strategic raids.',790000000)
select @qid=scope_identity()

-- 68. Canva
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@photography,N'Canva',N'Canva provides drag-and-drop design tools and AI features to create social posts, presentations, and videos in minutes.',781000000)
select @qid=scope_identity()

-- 69. LINE
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'LINE',N'LINE combines encrypted chats with payments, games, and brand channels, making it a super-app across East Asia.',779000000)
select @qid=scope_identity()

-- 70. Microsoft Teams
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@business,N'Microsoft Teams',N'Microsoft Teams unifies video meetings, group chat, and file sharing to keep hybrid workforces connected.',776000000)
select @qid=scope_identity()

-- 71. Meesho
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Meesho',N'Meesho lets Indian entrepreneurs resell fashion and home goods through social networks at wholesale prices.',761000000)
select @qid=scope_identity()

-- 72. Microsoft Word
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@productivity,N'Microsoft Word',N'Microsoft Word’s mobile app brings full editing, collaboration, and cloud sync to documents on the go.',757000000)
select @qid=scope_identity()

-- 73. Temple Run
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Temple Run',N'[Temple Run](https://www.blog.udonis.co/mobile-marketing/mobile-games/temple-run-idle-explorers) is the original endless-runner where you swipe, jump, and slide to escape demonic guardians.',754000000)
select @qid=scope_identity()

-- 74. Bigo Live
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@video,N'Bigo Live',N'Bigo Live lets creators broadcast in real time, earn virtual gifts, and join multi-guest streams.',739000000)
select @qid=scope_identity()

-- 75. Traffic Rider
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Traffic Rider',N'Traffic Rider puts you on superbikes to weave through traffic in first-person races across dynamic day-night roads.',729000000)
select @qid=scope_identity()

-- 76. Clean Master
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'Clean Master',N'Clean Master frees up storage and boosts performance by clearing junk files and managing memory on Android devices.',728000000)
select @qid=scope_identity()

-- 77. Shazam
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@musicaudio,N'Shazam',N'Shazam identifies any song in seconds and links you to full tracks, lyrics, and playlists.',721000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/shazam.png')

-- 78. Skype Lite
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Skype Lite',N'Skype Lite provides video calls, SMS relay, and data-friendly chat optimized for slower networks and low-cost phones.',721000000)
select @qid=scope_identity()

-- 79. Waze
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@navigation,N'Waze',N'Waze crowdsources real-time traffic and hazard alerts to plot the quickest routes and help drivers dodge jams.',713000000)
select @qid=scope_identity()

-- 80. iQIYI
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@entertainment,N'iQIYI',N'iQIYI streams Chinese dramas, [anime](https://www.blog.udonis.co/top-games/mobile-anime-games) and variety shows alongside blockbuster movies and originals.',708000000)
select @qid=scope_identity()

-- 81. Gardenscapes
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Gardenscapes',N'Gardenscapes blends match-3 puzzles with estate-renovation tasks as players restore a sprawling garden.',700000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2020/11/gardenscapes-e1604587566612.jpg')

-- 82. Outlook
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@productivity,N'Outlook',N'Microsoft Outlook unifies email, calendar and contacts with a focused inbox and seamless cloud sync.',698000000)
select @qid=scope_identity()

-- 83. Pokémon GO
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Pokémon GO',N'[Pokémon GO](https://www.blog.udonis.co/mobile-marketing/mobile-games/pokemon-go) uses augmented reality and location tracking to let trainers catch, trade and battle creatures in the real world.',697000000)
select @qid=scope_identity()

-- 84. Adobe Acrobat Reader
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@productivity,N'Adobe Acrobat Reader',N'Adobe Acrobat Reader lets users view, fill, sign and annotate PDFs while syncing changes across devices.',693000000)
select @qid=scope_identity()

-- 85. Mobile Legends
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Mobile Legends',N'Mobile Legends is a 5-on-5 MOBA where fast, 10-minute matches pit heroes with unique skills against rival teams.',691000000)
select @qid=scope_identity()

-- 86. Pou
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Pou',N'Pou lets players feed, dress and mini-game with a cute, blob-shaped virtual pet that grows over time.',689000000)
select @qid=scope_identity()

-- 87. Tinder
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@dating,N'Tinder',N'[Tinder’s](https://www.blog.udonis.co/mobile-marketing/mobile-apps/tinder) swipe interface helps people discover and message nearby matches for dating, friendship or networking.',687000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/tinder.png')

-- 88. Mercado Libre
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@shopping,N'Mercado Libre',N'Mercado Libre is Latin America’s largest e-commerce app, offering electronics, fashion and groceries with local delivery.',687000000)
select @qid=scope_identity()

-- 89. slither.io
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'slither.io',N'slither.io is a multiplayer arena where players guide a snake, consume glowing pellets and outmaneuver rivals to grow longest.',684000000)
select @qid=scope_identity()

-- 90. EA Sports FC Mobile
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'EA Sports FC Mobile',N'EA Sports FC Mobile (formerly FIFA Mobile) lets fans build teams, play real-time matches and compete in global soccer events.',675000000)
select @qid=scope_identity()

-- 91. My Talking Tom Gold Run
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'My Talking Tom Gold Run',N'My Talking Tom Gold Run combines endless-runner action with the beloved Talking Tom characters and collectible rewards.',674000000)
select @qid=scope_identity()

-- 92. Threads
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@social,N'Threads',N'Threads is Meta’s real-time conversation app where users share text updates, replies, and reposts with followers.',672000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/06/threads.jpg')

-- 93. MyJio
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'MyJio',N'MyJio lets Jio subscribers manage plans, payments, entertainment, and smart-home services in one hub.',670000000)
select @qid=scope_identity()

-- 94. Clash Royale
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Clash Royale',N'[Clash Royale](https://www.blog.udonis.co/mobile-marketing/mobile-games/clash-royale-player-count) pits players in fast, card-based battles where they deploy troops and spells to topple rival towers.',659000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2025/03/clash-royale-player-count.jpg')

-- 95. CamScanner
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@productivity,N'CamScanner',N'CamScanner turns a phone camera into a portable scanner, creating searchable, shareable PDFs with OCR and cloud backup.',657000000)
select @qid=scope_identity()

-- 96. QR & Barcode Scanner
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@tools,N'QR & Barcode Scanner',N'QR & Barcode Scanner instantly reads any QR or barcode format and saves scanned data for quick sharing or lookup.',654000000)
select @qid=scope_identity()

-- 97. Opera Mini
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Opera Mini',N'Opera Mini speeds up web browsing with data compression, ad blocking, and offline page saving for low-bandwidth users.',646000000)
select @qid=scope_identity()

-- 98. Viber
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@communication,N'Viber',N'Viber offers free encrypted calls and messages, group video chats, and lively sticker packs across platforms.',637000000)
select @qid=scope_identity()

-- 99. My Talking Tom Friends
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'My Talking Tom Friends',N'My Talking Tom Friends lets players care for multiple Talking Tom characters together, each with unique mini-games.',633000000)
select @qid=scope_identity()

-- 100. Stumble Guys
insert into q(q_act,q_cat,qname,qdesc,qsort) values(364,@games,N'Stumble Guys',N'[Stumble Guys](https://www.blog.udonis.co/mobile-marketing/mobile-games/stumble-guys) is a chaotic multiplayer knockout game where up to 32 players dash through obstacle courses to be last standing.',631000000)
select @qid=scope_identity()
insert into ans(ans_q,ans_cat,ansname) values(@qid,@catid,N'https\://cms.udonis.co/wp-content/uploads/2022/03/stumble-guys.jpg')
