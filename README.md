![alt tag](https://github.com/toekeyboard/ydl/blob/master/sample.gif?raw=true)  
<!--
![alt tag](http://i.imgur.com/TQl4i2J.gif)  
-->

[http://github.com/toekeyboard/ydl](http://github.com/toekeyboard/ydl)  
[https://board.net/p/ydl](https://board.net/p/ydl)  

IRC channel: #ydl on freenode  
7pm / 19h (3rd Tue of every month)  
([webchat1](https://kiwiirc.com/client/irc.freenode.net/?nick=a|?#ydl) / [webchat2](http://webchat.freenode.net/?randomnick=1&channels=ydl))  





## Usage ##

Video subtitle player:

	ydl -l LANGS https://www.youtube.com/USERNAME  
	ydl -l LANGS https://www.youtube.com/user/USERNAME  
	ydl -l LANGS https://www.youtube.com/channel/CHANNELID  
	ydl -l LANGS https://www.youtube.com/watch?v=VIDEOID

-l LANGS        Languages of the subtitles to download separated by commas  
d/ 		Videos and subtitles stored in this directory (under channel or username)
l.txt		Example Youtube Channels with language subtitles

Voice recorder:

	rec123 

r/		Recordings are stored in this directory


## Examples ##

	ydl -l es,fr,ja,ar https://www.youtube.com/JimmyKimmelLive  
	ydl -l es,fr,ja,ar https://www.youtube.com/user/JimmyKimmelLive  
	ydl -l es,fr,ja,ar https://www.youtube.com/channel/UCa6vGFO9ty8v5KZJXQxdhaw  
	ydl -l es,fr,ja,ar https://www.youtube.com/watch?v=AKEQwvaYI_k  




## Requirements ##
ydl:

	perl - Larry Wall's Practical Extraction and Report Language  
	youtube-dl - downloader of videos from YouTube and other sites  
	mpv - video player based on MPlayer/mplayer2  
	wget - retrieves files from the web  

rec123:

	sox - Swiss army knife of sound processing  
	libogg0 - Ogg bitstream library  
	ffmpeg - Tools for transcoding, streaming and playing of multimedia files  

In Debian/Ubuntu: 

	apt install perl youtube-dl mpv wget sox libogg0 ffmpeg


Extras:

	dwm - dynamic window manager
	terminology - Enlightenment efl based terminal emulator
	tmux - terminal multiplexer
	tmuxinator - Create and manage tmux sessions easily
	
	mixxx - Digital Disc Jockey Interface
	terminatorx - realtime audio synthesizer







## Languages ##

Available languages:

	youtube-dl https://www.youtube.com/watch?v=VIDEOID --list-subs


https://en.wikipedia.org/wiki/List_of_ISO_639-1_codes

	Language formats  
	lo       vtt, ttml
		Tai–Kadai 	Lao 	ພາສາລາວ 	lo 	lao 	lao 	lao 		
	ig       vtt, ttml
		Niger–Congo 	Igbo 	Asụsụ Igbo 	ig 	ibo 	ibo 	ibo 		
	kk       vtt, ttml
		Turkic 	Kazakh 	қазақ тілі 	kk 	kaz 	kaz 	kaz 		
	pl       vtt, ttml
		Indo-European 	Polish 	język polski, polszczyzna 	pl 	pol 	pol 	pol 	pols 	
	bg       vtt, ttml
		Indo-European 	Bulgarian 	български език 	bg 	bul 	bul 	bul 	buls 	
	su       vtt, ttml
		Austronesian 	Sundanese 	Basa Sunda 	su 	sun 	sun 	sun 		
	mt       vtt, ttml
		Afro-Asiatic 	Maltese 	Malti 	mt 	mlt 	mlt 	mlt 		
	fi       vtt, ttml
		Uralic 	Finnish 	suomi, suomen kieli 	fi 	fin 	fin 	fin 		
	ku       vtt, ttml
		Indo-European 	Kurdish 	Kurdî, كوردی‎ 	ku 	kur 	kur 	kur + 3 		macrolanguage
	ro       vtt, ttml
		Indo-European 	Romanian 	Română 	ro 	ron 	rum 	ron 		The identifiers mo and mol are deprecated, leaving ro and ron (639-2/T) and rum (639-2/B) the current language identifiers to be used for the variant of the Romanian language also known as Moldavian and Moldovan in English and moldave in French. The identifiers mo and mol will not be assigned to different items, and recordings using these identifiers will not be invalid.
	sr       vtt, ttml
		Indo-European 	Serbian 	српски језик 	sr 	srp 	srp 	srp 		The ISO 639-2/T code srp deprecated the ISO 639-2/B code scc[1]
	bn       vtt, ttml
		Indo-European 	Bengali, Bangla 	বাংলা 	bn 	ben 	ben 	ben 		
	hy       vtt, ttml
		Indo-European 	Armenian 	Հայերեն 	hy 	hye 	arm 	hye 		
	ga       vtt, ttml
		Indo-European 	Irish 	Gaeilge 	ga 	gle 	gle 	gle 		
	la       vtt, ttml          
		Indo-European 	Latin 	latine, lingua latina 	la 	lat 	lat 	lat 	lats 	ancient
	be       vtt, ttml                                   
		Indo-European 	Belarusian 	беларуская мова 	be 	bel 	bel 	bel 		
	vi       vtt, ttml                                 
		Austroasiatic 	Vietnamese 	Tiếng Việt 	vi 	vie 	vie 	vie 		
	sn       vtt, ttml                   
		Niger–Congo 	Shona 	chiShona 	sn 	sna 	sna 	sna 		
	km       vtt, ttml                                   
		Austroasiatic 	Khmer 	ខ្មែរ, ខេមរភាសា, ភាសាខ្មែរ 	km 	khm 	khm 	khm 		a.k.a. Cambodian
	mg       vtt, ttml                                       
		Austronesian 	Malagasy 	fiteny malagasy 	mg 	mlg 	mlg 	mlg + 10 		macrolanguage
	mr       vtt, ttml                   
		Indo-European 	Marathi (Marāṭhī) 	मराठी 	mr 	mar 	mar 	mar 		
	sd       vtt, ttml          
		Indo-European 	Sindhi 	सिन्धी, سنڌي، سندھی‎ 	sd 	snd 	snd 	snd 		
	te       vtt, ttml                  
		Dravidian 	Telugu 	తెలుగు 	te 	tel 	tel 	tel 		
	ml       vtt, ttml                        
		Dravidian 	Malayalam 	മലയാളം 	ml 	mal 	mal 	mal 		
	sw       vtt, ttml                                   
		Niger–Congo 	Swahili 	Kiswahili 	sw 	swa 	swa 	swa + 2 		macrolanguage
	sq       vtt, ttml                                 
		Indo-European 	Albanian 	Shqip 	sq 	sqi 	alb 	sqi + 4 		macrolanguage, "Albanian Phylozone" in 639-6
	bs       vtt, ttml                   
		Indo-European 	Bosnian 	bosanski jezik 	bs 	bos 	bos 	bos 	boss 	
	ne       vtt, ttml                                   
		Indo-European 	Nepali 	नेपाली 	ne 	nep 	nep 	nep 		
	ka       vtt, ttml                                       
		South Caucasian 	Georgian 	ქართული 	ka 	kat 	geo 	kat 		
	gl       vtt, ttml                   
		Indo-European 	Galician 	galego 	gl 	glg 	glg 	glg 		
	yo       vtt, ttml          
		Niger–Congo 	Yoruba 	Yorùbá 	yo 	yor 	yor 	yor 		
	gd       vtt, ttml                  
		Indo-European 	Scottish Gaelic, Gaelic 	Gàidhlig 	gd 	gla 	gla 	gla 		
	fa       vtt, ttml                        
		Indo-European 	Persian (Farsi) 	فارسی	fa 	fas 	per 	fas + 2 		macrolanguage
	lt       vtt, ttml
		Indo-European 	Lithuanian 	lietuvių kalba 	lt 	lit 	lit 	lit 		
	fil      vtt, ttml        
		Austronesian 	Tagalog 	Wikang Tagalog 	tl 	tgl 	tgl 	tgl 		Note: Filipino (Pilipino) has the code [fil]
	zh-Hant  vtt, ttml                                                    
		Sino-Tibetan 	Chinese 	中文 (Zhōngwén), 汉语, 漢語 	zh 	zho 	chi 	zho + 13 		macrolanguage
		Traditional  (Hong Kong / Taiwan)
	am       vtt, ttml                                                                                                                    
		Afro-Asiatic 	Amharic 	አማርኛ 	am 	amh 	amh 	amh 		
	ky       vtt, ttml                        
		Turkic 	Kyrgyz 	Кыргызча, Кыргыз тили 	ky 	kir 	kir 	kir 		
	ca       vtt, ttml                                   
		Indo-European 	Catalan 	català 	ca 	cat 	cat 	cat 		
	ar       vtt, ttml                                 
		Afro-Asiatic 	Arabic 	العربية	ar 	ara 	ara 	ara + 30 		macrolanguage, Standard Arabic is [arb]
	si       vtt, ttml                   
		Indo-European 	Sinhalese, Sinhala 	සිංහල 	si 	sin 	sin 	sin 		
	hi       vtt, ttml                                   
		Indo-European 	Hindi 	हिन्दी, हिंदी 	hi 	hin 	hin 	hin 	hins 	
	uk       vtt, ttml                             
		Indo-European 	Ukrainian 	Українська 	uk 	ukr 	ukr 	ukr 		
	yi       vtt, ttml                           
		Indo-European 	Yiddish 	ייִדיש	yi 	yid 	yid 	yid + 2 		macrolanguage
	gu       vtt, ttml
		Indo-European 	Gujarati 	ગુજરાતી 	gu 	guj 	guj 	guj 		
	cy       vtt, ttml
		Indo-European 	Welsh 	Cymraeg 	cy 	cym 	wel 	cym 		
	zh-Hans  vtt, ttml
		Sino-Tibetan 	Chinese 	中文 (Zhōngwén), 汉语, 漢語 	zh 	zho 	chi 	zho + 13 		macrolanguage
		Simplified (China)
	hr       vtt, ttml
		Indo-European 	Croatian 	hrvatski jezik 	hr 	hrv 	hrv 	hrv 		
	iw       vtt, ttml
		pas de "he"
		Afro-Asiatic 	Hebrew (modern) 	עברית	he 	heb 	heb 	heb 		
		https://www.quora.com/Why-was-the-old-ISO-639-language-code-for-Hebrew-iw?share=1
	fr       vtt, ttml
		Indo-European 	French 	français, langue française 	fr 	fra 	fre 	fra 	fras 	
	so       vtt, ttml
		Afro-Asiatic 	Somali 	Soomaaliga, af Soomaali 	so 	som 	som 	som 		
	ms       vtt, ttml
		Austronesian 	Malay 	bahasa Melayu, بهاس ملايو‎ 	ms 	msa 	may 	msa + 13 		macrolanguage, Standard Malay is [zsm], Indonesian is [id/ind]
	mk       vtt, ttml
		Indo-European 	Macedonian 	македонски јазик 	mk 	mkd 	mac 	mkd 		
	kn       vtt, ttml
		Dravidian 	Kannada 	ಕನ್ನಡ 	kn 	kan 	kan 	kan 		
	my       vtt, ttml
		Sino-Tibetan 	Burmese 	ဗမာစာ 	my 	mya 	bur 	mya 		
	lb       vtt, ttml
		Indo-European 	Luxembourgish, Letzeburgesch 	Lëtzebuergesch 	lb 	ltz 	ltz 	ltz 		
	pt       vtt, ttml
		Indo-European 	Portuguese 	Português 	pt 	por 	por 	por 		
	nl       vtt, ttml
		Indo-European 	Dutch 	Nederlands, Vlaams 	nl 	nld 	dut 	nld 		
	eo       vtt, ttml
		Constructed 	Esperanto 	Esperanto 	eo 	epo 	epo 	epo 		constructed, initiated from L.L. Zamenhof, 1887
	az       vtt, ttml          
		Turkic 	Azerbaijani 	azərbaycan dili 	az 	aze 	aze 	aze + 2 		macrolanguage
	tg       vtt, ttml                                                  
		Indo-European 	Tajik 	тоҷикӣ, toçikī, تاجیکی‎ 	tg 	tgk 	tgk 	tgk 		
	ko       vtt, ttml                                 
		Koreanic 	Korean 	한국어 	ko 	kor 	kor 	kor 		
	hu       vtt, ttml                   
		Uralic 	Hungarian 	magyar 	hu 	hun 	hun 	hun 		
	et       vtt, ttml                                   
		Uralic 	Estonian 	eesti, eesti keel 	et 	est 	est 	est + 2 		macrolanguage
	it       vtt, ttml                                       
		Indo-European 	Italian 	italiano 	it 	ita 	ita 	ita 	itas 	
	lv       vtt, ttml                   
		Indo-European 	Latvian 	latviešu valoda 	lv 	lav 	lav 	lav + 2 		macrolanguage
	ha       vtt, ttml          
		Afro-Asiatic 	Hausa 	(Hausa) هَوُسَ	ha 	hau 	hau 	hau 		
	de       vtt, ttml                  
		Indo-European 	German 	Deutsch 	de 	deu 	ger 	deu 	deus 	
	sv       vtt, ttml                        
		Indo-European 	Swedish 	svenska 	sv 	swe 	swe 	swe 		
	af       vtt, ttml                                   
		Indo-European 	Afrikaans 	Afrikaans 	af 	afr 	afr 	afr 	afrs 	
	ny       vtt, ttml                                 
		Niger–Congo 	Chichewa, Chewa, Nyanja 	chiCheŵa, chinyanja 	ny 	nya 	nya 	nya 		
	no       vtt, ttml                   
		Indo-European 	Norwegian 	Norsk 	no 	nor 	nor 	nor + 2 		macrolanguage, Bokmål is [nb/nob], Nynorsk is [nn/nno]
	es       vtt, ttml                                   
		Indo-European 	Spanish 	español 	es 	spa 	spa 	spa 		
	el       vtt, ttml                                       
		Indo-European 	Greek (modern) 	ελληνικά 	el 	ell 	gre 	ell 	ells 	
	tr       vtt, ttml                   
		Turkic 	Turkish 	Türkçe 	tr 	tur 	tur 	tur 		
	en       vtt, ttml          
		Indo-European 	English 	English 	en 	eng 	eng 	eng 	engs 	
	cs       vtt, ttml                  
		Indo-European 	Czech 	čeština, český jazyk 	cs 	ces 	cze 	ces 		
	sl       vtt, ttml                        
		Indo-European 	Slovene 	slovenski jezik, slovenščina 	sl 	slv 	slv 	slv 		
	haw      vtt, ttml
		│ 215 │ Hawaiian         │ Hawai`i           │ haw          
		https://meta.wikimedia.org/wiki/List_of_Wikipedias
		https://www.ethnologue.com/language/haw			
			Austronesian
		https://en.wikipedia.org/wiki/Hawaiian_language
		https://en.wikipedia.org/wiki/Polynesian_languages
			They are classified as part of the Austronesian family, 
	sm       vtt, ttml        
		Austronesian 	Samoan 	gagana fa'a Samoa 	sm 	smo 	smo 	smo 		
	ru       vtt, ttml                                                    
		Indo-European 	Russian 	Русский 	ru 	rus 	rus 	rus 		
	ur       vtt, ttml                                                                                                                    
		Indo-European 	Urdu 	اردو	ur 	urd 	urd 	urd 		
	hmn      vtt, ttml                        
		A macrolanguage of China	https://www.ethnologue.com/language/hmn
		https://en.wikipedia.org/wiki/ISO_639_macrolanguage
		https://en.wikipedia.org/wiki/Hmong_language
		https://en.wikipedia.org/wiki/Hmongic_languages
	th       vtt, ttml                                   
		Tai–Kadai 	Thai 	ไทย 	th 	tha 	tha 	tha 		
	is       vtt, ttml                                 
		Indo-European 	Icelandic 	Íslenska 	is 	isl 	ice 	isl 		
	fy       vtt, ttml                   
		Indo-European 	Western Frisian 	Frysk 	fy 	fry 	fry 	fry 		
	mn       vtt, ttml                                   
		Mongolic 	Mongolian 	Монгол хэл 	mn 	mon 	mon 	mon + 2 		macrolanguage
	id       vtt, ttml                             
		Austronesian 	Indonesian 	Bahasa Indonesia 	id 	ind 	ind 	ind 		Covered by macrolanguage [ms/msa]
	ja       vtt, ttml                           
		Japonic 	Japanese 	日本語 (にほんご) 	ja 	jpn 	jpn 	jpn 		
	pa       vtt, ttml
		Indo-European 	Eastern Punjabi, Eastern Panjabi 	ਪੰਜਾਬੀ 	pa 	pan 	pan 	pan 		
	jv       vtt, ttml
		Austronesian 	Javanese 	ꦧꦱꦗꦮ, Basa Jawa 	jv 	jav 	jav 	jav 		
	ht       vtt, ttml
		Creole 	Haitian, Haitian Creole 	Kreyòl ayisyen 	ht 	hat 	hat 	hat 		
	sk       vtt, ttml
		Indo-European 	Slovak 	slovenčina, slovenský jazyk 	sk 	slk 	slo 	slk 		
	ta       vtt, ttml
		Dravidian 	Tamil 	தமிழ் 	ta 	tam 	tam 	tam 		Ancient, Still spoken
	mi       vtt, ttml
		Austronesian 	Māori 	te reo Māori 	mi 	mri 	mao 	mri 		
	da       vtt, ttml
		Indo-European 	Danish 	dansk 	da 	dan 	dan 	dan 		
	co       vtt, ttml
		Indo-European 	Corsican 	corsu, lingua corsa 	co 	cos 	cos 	cos 		
	uz       vtt, ttml
		Turkic 	Uzbek 	Oʻzbek, Ўзбек, أۇزبېك‎ 	uz 	uzb 	uzb 	uzb + 2 		macrolanguage
	eu       vtt, ttml
		Language isolate 	Basque 	euskara, euskera 	eu 	eus 	baq 	eus 		
	ps       vtt, ttml
		Indo-European 	Pashto, Pushto 	پښتو	ps 	pus 	pus 	pus + 3 		macrolanguage
	st       vtt, ttml
		Niger–Congo 	Southern Sotho 	Sesotho 	st 	sot 	sot 	sot 		
	zu       vtt, ttml
		Niger–Congo 	Zulu 	isiZulu 	zu 	zul 	zul 	zul 		
	ceb      vtt, ttml
		closely related to other Filipino languages.	fil
		│ 3  │ Cebuano     │ Sinugboanong │ ceb  
		│    │             │ Binisaya     │      
		https://meta.wikimedia.org/wiki/List_of_Wikipedias
		https://en.wikipedia.org/wiki/Cebuano_language
		https://en.wikipedia.org/wiki/Visayan_languages
	xh       vtt, ttml
		Niger–Congo 	Xhosa 	isiXhosa 	xh 	xho 	xho 	xho 		






## Other Resources ##

	https://en.wikiversity.org/wiki/School:Language_and_Literature
	https://en.wikiversity.org/wiki/Portal:Foreign_Language_Learning  
                https://en.wikiversity.org/wiki/Korean
                https://en.wikiversity.org/wiki/Portal:Korean
		https://en.wikiversity.org/wiki/Category:Korean

	https://en.wikibooks.org/wiki/Wikibooks:Languages_bookshelf  
		https://en.wikibooks.org/wiki/Korean

	https://www.reddit.com/subreddits
	https://www.reddit.com/subreddits/search?q=language
		http://www.reddit.com/r/languagelearning
		https://www.reddit.com/r/linguistics            75k
		https://www.reddit.com/r/language               5k
		https://www.reddit.com/r/translation            2k
		https://www.reddit.com/r/translations           9
		https://www.reddit.com/r/translator             10k
		https://www.reddit.com/r/translators            33
		https://www.reddit.com/r/russian                13k
		https://www.reddit.com/r/german                 23k
		https://www.reddit.com/r/deutsch                600
		https://www.reddit.com/r/spanish                23k
		https://www.reddit.com/r/espanol                3k
		https://www.reddit.com/r/french                 31k
		https://www.reddit.com/r/francais               400
		https://www.reddit.com/r/chinese                6k
		https://www.reddit.com/r/japanese               7k
		https://www.reddit.com/r/portuguese             4k

	https://voat.co/subverses/search
	https://voat.co/search/findsubverse?q=language
		https://voat.co/v/russian
		https://voat.co/v/german
		https://voat.co/v/deutsch
		https://voat.co/v/spanish
		https://voat.co/v/espanol
		https://voat.co/v/french
		https://voat.co/v/francais
		https://voat.co/v/chinese
		https://voat.co/v/japanese
		https://voat.co/v/portuguese


	http://irc.netsplit.de/channels/?net=freenode&chat=language
		##russian
		##espanol
		##italiano

		http://webchat.freenode.net/?randomnick=1&channels=language
		https://kiwiirc.com/client/irc.freenode.net/?nick=a|?#language
		http://irc2go.com/webchat/?net=freenode&room=language  

	http://linguistics.stackexchange.com/
		http://english.stackexchange.com/
		http://ell.stackexchange.com/
		http://rus.stackexchange.com/
		http://german.stackexchange.com/
		http://spanish.stackexchange.com/
		http://french.stackexchange.com/
		http://japanese.stackexchange.com/
		http://chinese.stackexchange.com/
		http://italian.stackexchange.com/
		http://russian.stackexchange.com/
		http://portuguese.stackexchange.com/

	https://www.duolingo.com
		https://en.wikipedia.org/wiki/Duolingo

	https://github.com/melling/LanguageLearning  

	https://github.com/dae/anki
		https://www.ankiapp.com/
		https://apps.ankiweb.net/
		https://en.wikipedia.org/wiki/Anki_%28software%29


Version: 2017-05-31
