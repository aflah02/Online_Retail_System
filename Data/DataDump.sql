Use retaildb;
DROP TABLE IF EXISTS items_purchased;
DROP TABLE IF EXISTS belongsto;
DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS order_table;
DROP TABLE IF EXISTS items_contained;
DROP TABLE IF EXISTS shipper;
DROP TABLE IF EXISTS admin_table;
DROP TABLE IF EXISTS billing_details;
DROP TABLE IF EXISTS category;
DROP TABLE IF EXISTS product;
DROP TABLE IF EXISTS brand;
DROP TABLE IF EXISTS cart_data;
DROP TABLE IF EXISTS coupon_data;
DROP TABLE IF EXISTS user;

Use RetailDB;
create table user (
	id INT NOT NULL AUTO_INCREMENT,
	Address VARCHAR(50) NOT NULL,
	Name VARCHAR(50) NOT NULL,
	EmailID VARCHAR(50) NOT NULL unique,
	Password VARCHAR(50) NOT NULL,
	PhoneNumber VARCHAR(50) NOT NULL,
	PRIMARY KEY (id)
);
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (1, '827 Pearson Pass', 'Kerwinn Libby', 'klibby0@webeden.co.uk', 'iYRXekK', '1863621343');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (2, '37 Lindbergh Park', 'Annetta Stanislaw', 'astanislaw1@sun.com', 'cKQNRxJguFR', '9896569130');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (3, '467 Roxbury Hill', 'Nathan McCrory', 'nmccrory2@newsvine.com', 'IFdaKdsQzgI', '2258449848');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (4, '7 Novick Park', 'Amerigo Polamontayne', 'apolamontayne3@admin.ch', 'w9XskuJ', '5095944974');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (5, '6856 Ridgeview Place', 'Heath Curdell', 'hcurdell4@google.com.au', 'ZbaCjGm8X', '7037490329');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (6, '6 Kings Center', 'Gerri Straker', 'gstraker5@marketwatch.com', '63OdqXX', '8137631753');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (7, '1231 Northridge Plaza', 'Sileas Braz', 'sbraz6@hud.gov', 'sVEZ5RqJj3r', '7503701488');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (8, '821 Muir Road', 'Rochell Ivasyushkin', 'rivasyushkin7@i2i.jp', 'tznJd2k6', '9836607797');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (9, '701 Little Fleur Crossing', 'Olivia Caistor', 'ocaistor8@dailymail.co.uk', 'XhD9T8FGEQ', '5809372849');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (10, '335 Transport Circle', 'Florella Edgerton', 'fedgerton9@umich.edu', 'Yq3nMQpZsMwA', '8426489472');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (11, '4421 Summerview Point', 'Deborah Benasik', 'dbenasika@cdbaby.com', '1zWt73', '6199848047');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (12, '1 Tennessee Junction', 'Durand Myers', 'dmyersb@ebay.co.uk', 'PVaRlHrrqk', '1165440484');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (13, '01642 Lyons Alley', 'Jemimah Petrina', 'jpetrinac@fastcompany.com', 'HuCcUxo', '5092726302');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (14, '2 Texas Way', 'Blanch Hasted', 'bhastedd@woothemes.com', 'iJttzA6k', '7585215612');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (15, '137 Portage Lane', 'Cleve Pasfield', 'cpasfielde@hibu.com', '8XzCqAUhF4', '4461868722');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (16, '18 Briar Crest Junction', 'Duke Bagshawe', 'dbagshawef@geocities.jp', 'Wo076m4I', '3889661378');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (17, '2 Brown Way', 'Lela Bessom', 'lbessomg@virginia.edu', 'ilmAD10D', '8572740956');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (18, '52 Merrick Drive', 'Ody Dann', 'odannh@archive.org', '3qQJOpWmYxy', '2083594521');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (19, '4057 Bowman Park', 'Haslett Brandenberg', 'hbrandenbergi@mac.com', 'wkTB2XD7GQR', '1172140750');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (20, '5086 Fuller Terrace', 'Anastassia Whiteside', 'awhitesidej@youtu.be', '8TbbqpzA', '2848944007');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (21, '7606 Mendota Junction', 'Heidi Pynner', 'hpynnerk@flavors.me', 'p0tfCVxcDbbF', '7759279787');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (22, '011 Center Place', 'Ammamaria Trengrove', 'atrengrovel@360.cn', '9ua7UB', '7899964103');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (23, '8 Mosinee Point', 'Caresse Gaiter', 'cgaiterm@chicagotribune.com', 'IbyWuZ2ZhV6', '2762505349');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (24, '70221 Hagan Circle', 'Eugenio Suthren', 'esuthrenn@illinois.edu', 'cKTfxREm0PX', '9405277968');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (25, '3153 Duke Street', 'Leslie Eason', 'leasono@dion.ne.jp', 'WG7JQNm', '8913846151');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (26, '76 Shopko Avenue', 'Abrahan Ayre', 'aayrep@sohu.com', '3rMqpR9', '1476492935');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (27, '258 Evergreen Crossing', 'Danita Huitson', 'dhuitsonq@gov.uk', 'ZcE10RhWIZun', '6059967004');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (28, '9185 Magdeline Alley', 'Nydia Phillcox', 'nphillcoxr@jalbum.net', 'Ikh9E453e', '9112880536');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (29, '161 South Court', 'Briant Doyle', 'bdoyles@youku.com', 'W4cBbMXq', '3813098998');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (30, '6535 Arapahoe Crossing', 'Othelia Gilliland', 'ogillilandt@4shared.com', 'Tnj2IBrD', '6665110730');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (31, '93526 Cardinal Terrace', 'Ad Tregido', 'atregidou@mediafire.com', 'tz6SDosGtQr', '4154417673');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (32, '2042 Dapin Trail', 'Marylee Readwin', 'mreadwinv@goo.gl', '3MtNpPxoV', '2513819018');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (33, '3886 Park Meadow Way', 'Aurthur Murtagh', 'amurtaghw@apache.org', 'CCV2vs3ezCmR', '4725707227');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (34, '75 Northland Plaza', 'Suzi Payn', 'spaynx@nbcnews.com', 'HrLkzt1dn', '2434558410');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (35, '2796 Lunder Drive', 'Maggie Parsell', 'mparselly@elpais.com', 'JH0Ki2UhdKwU', '3877278570');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (36, '2 Boyd Court', 'Boy Gibbett', 'bgibbettz@sogou.com', 'VMIm8vQq', '4342513806');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (37, '18 Garrison Drive', 'Maureen Kindred', 'mkindred10@uol.com.br', 'vIP0UjDQG', '6469895115');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (38, '842 Ohio Park', 'Lucinda Fennell', 'lfennell11@typepad.com', 'zPPG3gd070', '5896369389');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (39, '71 Straubel Alley', 'Gilligan Duell', 'gduell12@odnoklassniki.ru', 'INUTX9', '5257856769');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (40, '9 Hudson Alley', 'Buiron Limerick', 'blimerick13@dion.ne.jp', 'gmniTr0i', '4829573644');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (41, '39 South Alley', 'Rob Giacoboni', 'rgiacoboni14@sakura.ne.jp', 'GMaVoi', '3767785237');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (42, '92 High Crossing Terrace', 'Orrin Seawell', 'oseawell15@mac.com', 'sxnskN', '8166531160');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (43, '06648 Twin Pines Place', 'Rhetta Sowle', 'rsowle16@yelp.com', '6ME4QXBT6uE', '6567205545');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (44, '446 North Park', 'Casie Gresser', 'cgresser17@sitemeter.com', 'W4G0pJx', '4809774510');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (45, '2 Moulton Plaza', 'Katheryn Crisell', 'kcrisell18@histats.com', 'D5iVc7EMhwFb', '3144894172');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (46, '0 Stuart Park', 'Kore Blader', 'kblader19@addtoany.com', 'ko6JWKKAsP', '4719286013');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (47, '0874 Surrey Place', 'Wallas Duhig', 'wduhig1a@devhub.com', 'gdVoogSd', '4164762231');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (48, '88408 Eagle Crest Place', 'Morten Bollom', 'mbollom1b@dropbox.com', 'DYNbKJUmNg', '7526523471');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (49, '4 Hanson Way', 'Rebe Strangward', 'rstrangward1c@narod.ru', 'bT2PcJ7', '4158945460');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (50, '17958 Golf View Point', 'Leif Clapham', 'lclapham1d@bravesites.com', 'fp8hyE', '2583872295');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (51, '59 Truax Junction', 'Jeramie Cobain', 'jcobain1e@economist.com', 'aINj96AjxTJ', '8057021862');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (52, '75044 Northwestern Place', 'Lorry Jekel', 'ljekel1f@slate.com', 'rpLz6oe6f', '8401294983');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (53, '25 Magdeline Lane', 'Tami Faye', 'tfaye1g@ibm.com', 'HEWoz1d', '1768400459');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (54, '77985 Montana Road', 'Bryna Fridaye', 'bfridaye1h@foxnews.com', '8yd0RULf', '4051867220');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (55, '0 Canary Drive', 'Pavia Bucktrout', 'pbucktrout1i@china.com.cn', 'jXKxcI', '5108232859');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (56, '2 Becker Crossing', 'Cosette McIlvaney', 'cmcilvaney1j@wikia.com', 'ocSSvH', '1313283846');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (57, '5083 Merrick Crossing', 'Aliza Kiernan', 'akiernan1k@booking.com', 'n8UJfsOKR', '7542660956');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (58, '2705 Stuart Lane', 'Tudor Figgs', 'tfiggs1l@tamu.edu', 'Vqjv0Rara', '5813259908');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (59, '28 Novick Circle', 'Hetty Pendered', 'hpendered1m@google.pl', 'Fj8jztz5x8O', '7096947117');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (60, '8 Gerald Plaza', 'Hestia Soot', 'hsoot1n@elegantthemes.com', '2Lux5j', '8949607630');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (61, '2701 Dexter Drive', 'Tonie Duddan', 'tduddan1o@archive.org', 'j4K5vitd', '4034617780');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (62, '4 Dakota Pass', 'Amandi Kernell', 'akernell1p@oakley.com', 'i7yzK89tFo', '3477220335');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (63, '03 Laurel Parkway', 'Brien Braund', 'bbraund1q@youku.com', 'us2EtqQY9', '6742320159');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (64, '18 Shopko Trail', 'Sylvan Mangenet', 'smangenet1r@google.ca', '9PNI9M', '6585237518');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (65, '6 Bellgrove Plaza', 'Charmine Louisot', 'clouisot1s@tripadvisor.com', 'ej5c6x', '4562511974');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (66, '029 Oakridge Avenue', 'Ole Bedrosian', 'obedrosian1t@altervista.org', 'SQoW1jmb0Pr', '7607996774');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (67, '731 Valley Edge Crossing', 'Myriam Verman', 'mverman1u@youku.com', 'VPjGqTNbFE', '5827334551');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (68, '5 Spenser Alley', 'Willey Crosio', 'wcrosio1v@so-net.ne.jp', 'DaOXd9U', '6315676957');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (69, '0414 Tennessee Court', 'Dorry Durtnell', 'ddurtnell1w@cpanel.net', 'ly6quKNepMyd', '4048465414');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (70, '06099 Loftsgordon Crossing', 'Rakel Aviss', 'raviss1x@biblegateway.com', 'nHidXEDzw', '2688226199');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (71, '89 Tomscot Hill', 'Paco Brafield', 'pbrafield1y@tuttocitta.it', 'jin4laHCJ', '6693660728');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (72, '460 6th Circle', 'Donica Fillary', 'dfillary1z@github.io', 'GJpWUql', '5899669783');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (73, '027 Dottie Road', 'Daryl McGragh', 'dmcgragh20@vk.com', 'sWNjicM', '5084991807');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (74, '4654 Clove Trail', 'Leanna Lawden', 'llawden21@surveymonkey.com', 'Dw99q3hCnh', '1588210283');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (75, '89950 Stone Corner Terrace', 'Teri Domoni', 'tdomoni22@whitehouse.gov', 'VmG2nxSeEGJ', '7142447487');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (76, '83126 Sloan Lane', 'Onfroi Maren', 'omaren23@cbsnews.com', 'F6O49nr', '8122999759');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (77, '34921 Blaine Alley', 'Lynsey Bassett', 'lbassett24@hibu.com', 'GCWBCdg', '3547674789');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (78, '665 Knutson Trail', 'Dorree Annear', 'dannear25@naver.com', '4PKlgud', '5231329746');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (79, '5747 2nd Pass', 'Igor Yakutin', 'iyakutin26@istockphoto.com', '8RvuiJItsX', '1054200465');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (80, '90 Oakridge Road', 'Juieta Bohan', 'jbohan27@symantec.com', 'HfWisfQ9P', '5544382527');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (81, '2 Canary Road', 'Sherill Freestone', 'sfreestone28@adobe.com', 'TIe8kF', '2356077240');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (82, '8510 Straubel Lane', 'Gavan Durrell', 'gdurrell29@ovh.net', '5hm2A6', '4283880054');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (83, '340 Thompson Parkway', 'Jacquelynn Grimble', 'jgrimble2a@unesco.org', 'aLt0usbJ5R', '6688813061');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (84, '147 Iowa Terrace', 'Wallie Fishe', 'wfishe2b@nytimes.com', 'BrAYQy35', '8159644150');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (85, '62 Northridge Lane', 'Jacinthe Allinson', 'jallinson2c@dion.ne.jp', 'OJvChq9b', '2654478091');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (86, '62 Sauthoff Place', 'Minetta Seywood', 'mseywood2d@angelfire.com', 'hLbNjzXC', '2733547227');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (87, '38 8th Way', 'Lyndsey Maceur', 'lmaceur2e@phpbb.com', 'qE84Rf2nZX', '6213705431');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (88, '6542 Clarendon Road', 'Sherye Pinckney', 'spinckney2f@hostgator.com', 'AW8BWTrsO', '4453636794');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (89, '6 Scofield Pass', 'Kelila Eskriet', 'keskriet2g@cisco.com', '5CBIsf', '5506294085');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (90, '750 Corscot Alley', 'Rufe Spitell', 'rspitell2h@ehow.com', 'O5ZXl40tvWP', '7795872586');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (91, '53689 Kings Pass', 'Missy Mongin', 'mmongin2i@weibo.com', '3boJvsug', '7969770300');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (92, '88 Loomis Lane', 'Zsazsa Comber', 'zcomber2j@mediafire.com', 'e7mHQb67D3v', '4909079905');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (93, '2 Spenser Alley', 'Dorree Taber', 'dtaber2k@harvard.edu', '7H1EE2MCQ', '8739334276');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (94, '0277 Claremont Circle', 'Kearney Norwich', 'knorwich2l@spotify.com', 'bboT18ujC08', '2797478782');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (95, '83 Shoshone Court', 'Idalina Morillas', 'imorillas2m@reuters.com', 't5ctah99Q', '5711222921');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (96, '4 Annamark Junction', 'Marion Gravenor', 'mgravenor2n@cornell.edu', 'k0nA15ihw', '7079079025');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (97, '22761 Killdeer Circle', 'Vittoria Cauldwell', 'vcauldwell2o@businessweek.com', 'FueLpJq9mKr', '7655299127');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (98, '68 Vahlen Place', 'Anthea Baggallay', 'abaggallay2p@japanpost.jp', 'kIB7zGMdtDI1', '5381793214');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (99, '9 Vahlen Trail', 'Saxon Poleye', 'spoleye2q@cnn.com', 'vWwOD2Qds', '7747208174');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (100, '4545 Gina Court', 'Rakel Borborough', 'rborborough2r@is.gd', 'khDcAD4fca', '1395377684');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (101, '309 Prentice Terrace', 'Lauraine Marie', 'lmarie2s@ezinearticles.com', 'R8yrX5VHLa', '4957736636');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (102, '92 Parkside Drive', 'Rana Gary', 'rgary2t@dailymotion.com', 'fuD8kg', '4515077039');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (103, '0961 Sundown Parkway', 'Starlene Tomkinson', 'stomkinson2u@freewebs.com', '0yMucrz', '1618025131');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (104, '667 Lukken Place', 'Nalani Walburn', 'nwalburn2v@infoseek.co.jp', 'fH3ochTH', '9084042731');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (105, '5 Weeping Birch Alley', 'Ingmar Lochead', 'ilochead2w@blinklist.com', 'AwqsAx8eBh', '2638391426');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (106, '5959 Old Shore Avenue', 'Rodger Toretta', 'rtoretta2x@hatena.ne.jp', 'sYyw7OP', '8783308998');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (107, '5515 Algoma Center', 'Theresita Krystof', 'tkrystof2y@github.io', 'vivTLl0SX', '4912162822');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (108, '1715 Loomis Court', 'Gaye Zouch', 'gzouch2z@elpais.com', 'RilORU', '7852832489');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (109, '258 Summer Ridge Center', 'Pippo Hornung', 'phornung30@theatlantic.com', 'izKRcAPPhJ', '8164799306');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (110, '6958 Northridge Circle', 'Rita Kendell', 'rkendell31@scribd.com', 'TPdIrCxn5jZb', '2245494973');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (111, '474 Fordem Center', 'Floria Ribchester', 'fribchester32@jigsy.com', 'iS4eSxOIvn', '5695077290');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (112, '5 Thackeray Center', 'Meghan Pumfrey', 'mpumfrey33@icio.us', 'HkUTl8gw6g', '7277767970');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (113, '69606 Dexter Terrace', 'Marianna Bollum', 'mbollum34@elpais.com', 'KM6o49VNb', '5972117686');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (114, '2224 Hollow Ridge Lane', 'Miran Fitchett', 'mfitchett35@mit.edu', '1FXxYaOvlnsz', '2636275699');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (115, '9 Debs Junction', 'Bernarr Triswell', 'btriswell36@eventbrite.com', '52VavcWUA', '2245934470');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (116, '650 Di Loreto Drive', 'Cloe Gladman', 'cgladman37@sina.com.cn', 'OKMIwH4QIG', '2359107521');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (117, '075 Ridgeway Road', 'Anthia Pankettman', 'apankettman38@jimdo.com', 'jYFG9pahF1e', '3213663931');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (118, '1 Gerald Avenue', 'Madelene Guitte', 'mguitte39@twitter.com', 'mjAe1XS', '7226153548');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (119, '78466 Dahle Center', 'Brade Turneux', 'bturneux3a@usa.gov', 'E048vtDUL6', '3074178202');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (120, '2 Norway Maple Point', 'Barron Sanger', 'bsanger3b@infoseek.co.jp', 'pMztcWjr', '3758306916');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (121, '67922 Messerschmidt Way', 'Merry Frankum', 'mfrankum3c@multiply.com', 'Iq0P4JTt', '7193671455');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (122, '3198 Dwight Point', 'Bridget Koppke', 'bkoppke3d@artisteer.com', '6yxgfjG2c', '2766840703');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (123, '11296 Mandrake Place', 'Crosby Prewett', 'cprewett3e@cbc.ca', 'nxOoNTXv', '6258737405');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (124, '5 Del Sol Hill', 'Temple Rubinfeld', 'trubinfeld3f@domainmarket.com', 'EOwgsu2oK', '7441429684');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (125, '4 Stuart Pass', 'Sharia Saunders', 'ssaunders3g@163.com', 'cJteQL', '9923000696');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (126, '00 Graedel Center', 'Tobi Pride', 'tpride3h@sina.com.cn', 'vdsnIH', '8188825738');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (127, '012 North Court', 'Ruthy Bedford', 'rbedford3i@vkontakte.ru', 'rHdPa9UJlsw', '7546047611');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (128, '4984 Raven Pass', 'Madge Dulen', 'mdulen3j@xrea.com', 'OADQXmbKcn', '3383317455');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (129, '41519 Mcguire Parkway', 'Umeko Minette', 'uminette3k@columbia.edu', 'kM3EpAZM8xN', '6751898119');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (130, '8 Acker Pass', 'Lynnelle Gerrad', 'lgerrad3l@infoseek.co.jp', 'R3Hi6lBp', '2517362973');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (131, '0916 Merry Hill', 'Karisa Danher', 'kdanher3m@google.es', 'ZPmBKyBL3q6', '2906775059');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (132, '449 Heath Point', 'Esther Haggar', 'ehaggar3n@bbb.org', 'BSPaYpy', '4676183106');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (133, '9 Gulseth Road', 'Lolita Cluet', 'lcluet3o@xinhuanet.com', 'Rlwa0xC', '3132052829');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (134, '89101 Mcguire Avenue', 'Clarette Chatenet', 'cchatenet3p@tuttocitta.it', 'XFyVqJU', '5189607160');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (135, '1414 Buell Drive', 'Shelly Ryam', 'sryam3q@ebay.com', 'Sdm9sg', '4214454995');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (136, '8 Merrick Place', 'Wayland Drinkel', 'wdrinkel3r@fc2.com', 'GdKHz3EvB', '2531943776');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (137, '289 Westport Terrace', 'Llywellyn Snow', 'lsnow3s@reverbnation.com', 'TanMRZ5', '6236484487');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (138, '30690 Forster Crossing', 'Thatcher O''Scanlan', 'toscanlan3t@ucoz.ru', 'BYq8mC0Y', '7798495421');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (139, '02 Leroy Drive', 'Pauletta McEntegart', 'pmcentegart3u@wikispaces.com', 'GuSuOu2QCD', '6988933566');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (140, '24279 Oak Court', 'Auria Glaisner', 'aglaisner3v@who.int', 'nmNDSZ6mu0U5', '3374260890');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (141, '03 3rd Hill', 'Crin Simkins', 'csimkins3w@ted.com', 'ztScdqGL', '2812482057');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (142, '51067 Nobel Junction', 'Giorgia Happs', 'ghapps3x@dropbox.com', '6oDWqFC', '2665402481');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (143, '7510 Scofield Street', 'Lorie Rawles', 'lrawles3y@noaa.gov', 'DTYjhN', '3113981032');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (144, '557 Vidon Way', 'Maggy Essery', 'messery3z@google.com.au', '1W6uXfXRRkXp', '5544676073');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (145, '93303 Buhler Junction', 'Micky Benbough', 'mbenbough40@yellowbook.com', 'wD9D0g', '4337542620');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (146, '42 Moland Center', 'Devi Northcote', 'dnorthcote41@storify.com', '8qyYhykIzON', '2427627821');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (147, '0461 Badeau Street', 'Conchita Brou', 'cbrou42@economist.com', 'YOinlOTBnZBb', '1111522046');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (148, '6242 Waxwing Pass', 'Ivonne Owbrick', 'iowbrick43@bizjournals.com', 'QDntSYw', '8284959763');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (149, '5139 Muir Street', 'Heath Pountain', 'hpountain44@webmd.com', 'Jb0OHOlQ6Kl', '4558374604');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (150, '9727 Springview Pass', 'Eustacia Balmforth', 'ebalmforth45@boston.com', 'n8dGt9pjs9', '4041417456');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (151, '9806 Glendale Lane', 'Howey Janecki', 'hjanecki46@nih.gov', 'sIesScxaJ', '6299971492');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (152, '56582 Brentwood Circle', 'Celina Ivoshin', 'civoshin47@answers.com', 'Y4WFeyB', '4318772279');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (153, '232 Lakewood Gardens Center', 'Matthieu Harnor', 'mharnor48@time.com', '9sUvzsWj5', '8999477501');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (154, '4 Nelson Park', 'Malory Hauxby', 'mhauxby49@xinhuanet.com', 'X9BUCyYBya', '7181855959');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (155, '663 Clarendon Center', 'Herb Jewell', 'hjewell4a@msn.com', 'RTGrVF6e', '5946428493');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (156, '3120 Chive Road', 'Garwin Galilee', 'ggalilee4b@nba.com', 'qDCYEY', '2139124325');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (157, '8782 Chive Junction', 'Cheslie Hrus', 'chrus4c@rambler.ru', 'kcevKCMCZf', '5991695972');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (158, '1 Anzinger Place', 'Jean Orrow', 'jorrow4d@engadget.com', 'RTnt4QTqsj', '1996902332');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (159, '15 Carberry Point', 'Jule Klemencic', 'jklemencic4e@clickbank.net', '0w8kvofEw5', '1351830051');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (160, '58 Esker Point', 'Jolene De la Eglise', 'jde4f@shinystat.com', 'WCSaZti', '8414512738');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (161, '3463 Goodland Alley', 'Conrad McClory', 'cmcclory4g@simplemachines.org', 'nyGQ4jxpPYV', '7242279065');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (162, '28 Forest Court', 'Eb Gimson', 'egimson4h@sphinn.com', 'qwBWdwWar', '7449397711');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (163, '4789 Doe Crossing Circle', 'Janella Loade', 'jloade4i@oracle.com', '0wYcfN', '5676952995');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (164, '5202 Walton Street', 'Ring Theyer', 'rtheyer4j@youku.com', 'qwfqex7z', '8182577599');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (165, '8988 Charing Cross Circle', 'Tiebold Gobel', 'tgobel4k@1688.com', 'so0yjyLsOfb', '4342719484');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (166, '49686 Blaine Pass', 'Ferrell Fransman', 'ffransman4l@bizjournals.com', '7ZU3qp', '9274648821');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (167, '9 Luster Court', 'Erasmus Tenbrug', 'etenbrug4m@npr.org', 'UBVLs25', '2862442341');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (168, '44 Riverside Park', 'Talyah Polglaze', 'tpolglaze4n@dion.ne.jp', '2wU2Mv', '9595475428');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (169, '86645 Granby Lane', 'Pinchas Whawell', 'pwhawell4o@domainmarket.com', 'yYUqPP', '3261598744');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (170, '9209 Gina Terrace', 'Goldie Peyntue', 'gpeyntue4p@goo.ne.jp', 'ZTr3MTH0v3', '4922827874');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (171, '2748 Bunting Place', 'Berty Gatecliff', 'bgatecliff4q@behance.net', 'ezvkB7dtEAD', '4347192961');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (172, '070 Quincy Park', 'Corabelle Wooding', 'cwooding4r@topsy.com', '5Mjwht', '4509544793');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (173, '9 Elmside Alley', 'Marysa Munson', 'mmunson4s@nyu.edu', 'SddFQle', '1793006264');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (174, '26768 Burning Wood Crossing', 'Garrik Gallo', 'ggallo4t@addthis.com', 'rSegUVFH4y', '8062127338');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (175, '28 Esch Alley', 'Doralia Laurisch', 'dlaurisch4u@usgs.gov', 'hWZZ2OxDqBH', '1096736624');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (176, '557 Sheridan Street', 'Hyacinth Cossam', 'hcossam4v@booking.com', 'LTpIKK', '4307290783');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (177, '5842 Maple Center', 'Liana Crowcher', 'lcrowcher4w@nsw.gov.au', 'EOEAQZwXXx', '8203544630');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (178, '66074 Sachs Crossing', 'Willa Clausen', 'wclausen4x@reuters.com', 'lNPc6F', '5926440424');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (179, '304 Gulseth Court', 'Addy Mosdill', 'amosdill4y@dailymotion.com', 'NeaRSSvhz', '1717434457');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (180, '29696 Warner Point', 'Jan Dundredge', 'jdundredge4z@squidoo.com', 'BJJ3NM29', '9239808974');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (181, '25625 Kensington Lane', 'Aron Saggs', 'asaggs50@marriott.com', 'i55vMinvfj', '1394956532');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (182, '13 Golf Street', 'Hana Biaggiotti', 'hbiaggiotti51@ca.gov', 'Au6HrX9D', '4333405651');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (183, '0056 Grim Road', 'Ulrica Dosdell', 'udosdell52@freewebs.com', 'QRY3kJJCX', '2886809087');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (184, '3850 Killdeer Pass', 'Patience Riceards', 'priceards53@berkeley.edu', 'xRwATr', '1826367666');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (185, '8 5th Street', 'Herold Whipp', 'hwhipp54@whitehouse.gov', 'MuzUiXANAg', '9717585912');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (186, '73 Hazelcrest Road', 'Mohammed Triplet', 'mtriplet55@rediff.com', '86foBMv', '7392782712');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (187, '8003 Jackson Crossing', 'Georgianne Escofier', 'gescofier56@nasa.gov', 'OHMuXkmJnyj', '9991440744');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (188, '7165 Northridge Road', 'Delila Presnail', 'dpresnail57@simplemachines.org', 'ab4Rqn', '1936857892');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (189, '542 Mifflin Circle', 'Sheila-kathryn Murtimer', 'smurtimer58@ning.com', 'C4YEdNTxOs', '5822431446');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (190, '99765 Dunning Parkway', 'Mendy Arlet', 'marlet59@yahoo.com', 'anhoKYDnKo', '5178855411');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (191, '09431 Del Mar Avenue', 'Brad Guerin', 'bguerin5a@surveymonkey.com', 'xvU84kpa', '5844309319');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (192, '0 Old Shore Way', 'Benyamin Totterdell', 'btotterdell5b@mtv.com', 'FXaLft', '2539441972');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (193, '1665 Kinsman Hill', 'Christel Eich', 'ceich5c@tmall.com', 's6DsGwGGIHQa', '4646648198');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (194, '9 Basil Place', 'Hillard Cannam', 'hcannam5d@goo.ne.jp', 'ZK8FPDV', '7547406300');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (195, '0 Bay Park', 'Carmine Upstone', 'cupstone5e@freewebs.com', 'OtAdtC', '2025468737');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (196, '06 Milwaukee Avenue', 'Sula d'' Elboux', 'sd5f@fc2.com', 'QUMFghYEmSUj', '6653669613');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (197, '8 Stone Corner Way', 'Mady Gullick', 'mgullick5g@google.co.uk', 'yJ2bdgWQI27', '4216990731');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (198, '83312 Morningstar Center', 'Merla Stockney', 'mstockney5h@newsvine.com', 'y1ZcxN9', '1397790085');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (199, '128 Golden Leaf Drive', 'Anetta Guillot', 'aguillot5i@booking.com', 'CBh65R', '7355099187');
insert into user (id, Address, Name, EmailID, Password, PhoneNumber) values (200, '7084 Chive Parkway', 'Randi Hoffman', 'rhoffman5j@techcrunch.com', 'sVY9kz', '7199012506');

Use retaildb;

create table coupon_data (
	Coupon_id VARCHAR(40) NOT NULL,
	Discount DOUBLE NOT NULL,
	ExpiryDate DATE NOT NULL,
	Unique_id INT NOT NULL,
	isUsed INT DEFAULT 0,
	FOREIGN KEY(Unique_id) REFERENCES User(id) on DELETE CASCADE,
	PRIMARY KEY(Coupon_id),
    CONSTRAINT discount_pos CHECK (Discount > 0)
);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('67697c5b-3ee5-4f67-921e-ae8dbb7d31d0', 7, '2022/08/16', 1);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a93cca35-d0c5-478a-ad4f-6423f5ae2a04', 10, '2022/07/30', 1);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('aa698af7-bbee-4fa7-947b-dfbeed38b302', 26, '2022/06/11', 2);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('afcbc8e5-b841-44cb-85fa-d857952e5b01', 7, '2022/06/19', 2);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f6a84202-12b2-4d53-9eff-16dfceaf0fef', 21, '2022/04/29', 3);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('908eb765-715d-4b14-aa01-1f93bc17bc0e', 3, '2022/02/03', 3);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('46fc3118-0359-4a3c-a783-845e58ddb9c5', 24, '2022/06/19', 3);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('938602a3-74d4-487b-9500-a479fe6da290', 25, '2022/11/08', 4);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ad8bf759-3954-47b9-8d7c-93a21fb1cd53', 22, '2022/02/25', 5);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('52f20ca3-a2f6-4ac6-92bf-e67166def383', 5, '2022/03/27', 5);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('06f76098-2a14-440a-ae54-aaa28cbbd0e1', 22, '2022/06/11', 5);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('603a6be4-a124-47cb-b47d-11e909fc94d9', 4, '2022/09/22', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('77795b05-0826-4eee-a533-d2b24e562ca4', 16, '2022/06/30', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d52e99f6-05d7-4ee4-b250-86671bdf6c14', 12, '2022/12/22', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c419f259-dcdf-4bd6-97bb-d753ba03921f', 9, '2022/02/22', 7);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ee3a74f3-e3de-4c5b-a073-354655ffad88', 18, '2022/11/22', 7);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('e757d04b-ecdd-4844-8412-731cb3743e88', 13, '2022/03/27', 7);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a846573b-14c7-4d0a-a454-f1071fb7bd20', 7, '2022/11/13', 8);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a7b12bc7-841b-46c4-a49e-56b6fe672511', 10, '2022/07/28', 8);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('811bac9c-3b88-4204-b4d6-c2bb1a679c82', 21, '2022/03/13', 8);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d685e1cb-bb08-40ed-ad44-e323b1e1f8df', 5, '2022/06/12', 9);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6166c27f-fe41-4881-940b-7ebeacbb410b', 3, '2022/11/26', 9);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('93cae097-853c-4918-947e-516117056a54', 19, '2022/03/27', 9);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('276bb82a-b104-483b-8a4e-b5738c097720', 1, '2022/09/14', 9);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a4fd1418-14aa-471e-b471-75642c4d3e08', 19, '2022/07/21', 10);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1a10016c-54e6-447d-879a-28b9dc108954', 16, '2022/08/18', 11);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9cbbdad8-50bd-477d-90a2-c648f00cf66c', 22, '2022/10/25', 12);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('048fcec9-c3f3-4ae2-b844-2bc18aed2a3c', 29, '2022/05/21', 12);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3b621220-6f6d-4c56-8e04-b7776e07834e', 1, '2022/01/22', 12);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d658e5cd-f8b1-4012-bc1f-42f7ede17740', 20, '2022/09/09', 12);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('939ebf85-187e-4405-8960-8605d8ad6f05', 1, '2022/08/22', 13);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('715ceee7-354f-432b-bfa4-e3bef608929b', 9, '2022/11/27', 13);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5b73371b-262d-47d9-9730-c8c341090c2c', 2, '2022/03/29', 13);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('48734c96-fb8c-4ca4-8221-84cd5cf4b2f1', 1, '2022/07/26', 13);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ad7876ff-4522-4be2-86df-1880f586e21f', 22, '2022/07/21', 14);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('34fb6bcf-335e-4684-a9d2-abb764f7bb63', 3, '2022/04/21', 14);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7fbfccb4-13a8-47eb-8b97-6afdcc7d0c20', 21, '2022/03/21', 14);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('09c2a756-720b-4448-bbe1-f8abc69b5be3', 4, '2022/05/01', 15);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('649ff353-1d4a-47aa-946b-b7f68d29d2cc', 25, '2022/03/08', 15);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7256d7cf-c419-4280-89c0-eb1573132ad5', 4, '2022/12/12', 16);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('56b92b44-dbdb-47c7-8060-b2401eab203d', 19, '2022/01/22', 16);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3e087439-51bc-4b6d-91bc-24cfbf4f872f', 18, '2022/09/22', 17);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1e7e1e0d-df54-42cb-99f1-2057f44e8a8f', 29, '2022/06/16', 17);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('8a8e7f20-aff7-48ba-8def-426e036720c1', 6, '2022/08/17', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c4560834-3fbb-4f93-874d-310bba6a6f32', 22, '2022/09/16', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3a80ce0c-c20b-4b4d-8a88-799153f55efe', 3, '2022/04/10', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a8272772-a40a-433f-9d91-098e3dcd967f', 20, '2022/11/19', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ef6f875e-c6ca-420d-a51b-d117ad86b669', 24, '2022/01/05', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b01b2855-e879-4c72-8fd7-faeee12fdb06', 11, '2022/09/27', 18);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3d4785e6-8f08-41f3-8aa3-18d02a09e86b', 24, '2022/03/12', 19);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('44ce5d8c-8229-42aa-93b6-a4e2b43b771c', 10, '2022/10/27', 19);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5c476751-5ed8-4bbf-b258-ea60c85f18a1', 19, '2022/11/19', 19);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('72de7d06-c7a4-4ac6-b397-cedba792c8ad', 20, '2022/12/12', 19);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f2015be6-143a-4062-aaf3-52d9339af588', 18, '2021/05/22', 158);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('fadf5aaf-62de-4a1b-8817-b8fb0804eec1', 12, '2021/06/15', 197);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9cc99444-902e-4d45-b96c-d2de7a0f5655', 12, '2022/02/15', 186);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b9190e1c-9b2a-4257-977f-b698b28acff8', 2, '2021/09/06', 134);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6de1db2b-b594-4af7-9412-f9336269f845', 17, '2022/03/27', 16);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ce65101d-8556-4980-a36e-b4da751eadb8', 14, '2021/06/24', 130);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f319e5a0-7165-4daa-958d-e4a4c5d5e8b1', 7, '2021/08/31', 135);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3a048537-b546-47b3-9170-3b0714f9c927', 17, '2021/05/25', 199);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('56ea8e07-253e-4bf8-b16c-d81f061702ad', 20, '2021/06/11', 102);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0a9ec289-98fd-4639-b808-31566e03f600', 6, '2021/12/25', 77);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('983f55dc-2fa6-4938-b857-ab63b31bba30', 13, '2022/01/11', 3);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('61b16bf2-4e7c-438c-93fa-7e14a888e857', 10, '2022/01/24', 113);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1f7eac34-cf49-498c-8d8f-a1465509e4c4', 14, '2021/11/13', 93);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('14464765-74f4-4511-b872-724e32844dd5', 6, '2022/01/21', 141);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('80d90c4a-ab3e-411e-a18c-69fcc75a206e', 13, '2022/01/03', 103);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('83538176-c9bd-4f24-a993-84d309de85bc', 8, '2021/05/19', 36);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('32710c84-0cf4-487a-90d1-c88cb544781d', 12, '2022/02/10', 2);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('350dfcb2-a5c2-4a56-94ea-eadeb4684951', 19, '2021/12/17', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('229dfc99-c8e3-4431-95d6-6a6c7b8d569a', 3, '2021/05/16', 78);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('973a938d-60f5-4b1c-834c-a405930db2a1', 16, '2022/02/22', 161);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ba7bd19d-506e-4069-abac-a6ddaffa52e4', 15, '2021/11/20', 175);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d4e4425c-b0cc-4296-b203-3e11940e11fe', 17, '2021/11/28', 58);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a45e4cdd-ce1e-4666-a88f-3dff39c4f7bb', 7, '2021/05/14', 142);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('dcd0d284-0b1f-4d27-9be7-f9d8036fa931', 4, '2021/08/22', 140);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ef2e25d7-4f33-4671-9ee7-0cfaa43703a8', 18, '2021/05/24', 196);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('46132e36-51cd-4617-90f8-1844950b560b', 5, '2021/08/04', 154);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0e18b3b5-267a-4fca-b7ab-55e3b03d2c7a', 20, '2021/08/17', 45);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c891d939-a948-4e43-bf3e-d0c7ebacc769', 14, '2021/08/03', 11);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f1a7b37b-2493-43f5-af19-6c4c6f72347a', 13, '2021/09/16', 147);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('babd3518-189d-4e9d-b7f8-290ed209f5f8', 17, '2021/07/16', 57);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a816d9a9-ea88-43de-8470-1943a2f17a9c', 17, '2021/05/09', 22);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a53dc110-e7dd-4818-8554-1a3eedee355a', 8, '2021/10/06', 57);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('60a48eb0-cae9-474f-949a-0cb7d7d8b2f0', 13, '2022/02/15', 165);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4b04ec36-161f-4ebc-a29d-3ff8a8056f8e', 6, '2022/03/19', 91);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('28bfd2c6-3b81-4f00-b285-13a248f62bd0', 2, '2021/12/21', 114);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('77828d53-4982-448b-8ef1-b1a1bdae5137', 20, '2022/01/21', 182);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('26802c49-bb9e-4c18-9a22-17892c3f20cc', 20, '2021/06/24', 158);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('bc6bb794-1484-45af-a3b4-8f38e347dc2b', 1, '2021/11/14', 175);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5d4a8a7e-4e3d-4fdd-b800-52fb38d882c0', 5, '2021/09/19', 98);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3e6418aa-3e6c-441c-90ad-12e2fbd04eb8', 5, '2021/12/28', 108);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('19b65bf5-6bd6-4236-9f66-5fbb4eba7667', 19, '2021/04/03', 191);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6286aa7e-a094-4575-8881-1b33b24f574e', 20, '2021/09/13', 189);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a84c9781-4e80-4450-9e2c-d7f9bbc2fd60', 10, '2021/06/11', 98);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('64d6e59c-33c2-4c82-8fa5-abfe2d5bca47', 17, '2021/12/08', 76);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('36afdcad-2cad-4fc8-9553-a890b8127d9f', 2, '2021/12/22', 4);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f93d94c2-d2c7-4dbf-912a-433a61bfd14f', 3, '2021/11/15', 135);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('069488d8-8aa0-41fd-90c6-80329cd52c0c', 17, '2021/04/27', 66);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d06caab7-575e-4a03-abdf-ffae90dff51d', 6, '2021/05/20', 120);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5d4de954-c67c-4679-b590-1bfdc0e9b8a1', 20, '2021/06/10', 162);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('01043b0e-699e-4b60-9754-d02448a3a80a', 13, '2022/02/06', 71);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('38ff5f2f-b19b-4cbe-beed-18e3b021b24a', 12, '2022/03/13', 111);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4563d02d-5276-447f-87c5-d44f11914a8f', 19, '2022/02/12', 127);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c0bc77f4-10b0-4b21-973d-649bba8ede29', 10, '2021/10/14', 166);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9851d2c8-7330-4433-8f54-3d53745e9055', 8, '2021/10/30', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('e121f1cc-a232-420e-a0e8-d9124f23df10', 12, '2021/12/04', 6);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9030b105-029d-41b8-a3b8-066ca9deb1ce', 20, '2021/08/30', 28);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c65bbc50-2763-4468-b820-2f7af145c087', 14, '2021/08/16', 133);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9ac8112d-11d0-4fe6-9d8b-558f9495e505', 2, '2022/01/04', 154);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c465953b-6064-434f-9574-444a37f50e10', 8, '2021/10/18', 200);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ebe0cd47-a1d6-48d5-8484-39ab1c932ff1', 15, '2022/03/11', 35);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('258327d9-7933-4af0-b80f-0cf67f3c004a', 7, '2022/02/19', 158);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('23fc3988-3c04-4eab-8660-3421eb94c357', 18, '2021/08/27', 197);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('8af14232-93b2-4706-beab-975bf957a954', 13, '2021/06/11', 31);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('96059a56-b390-427d-b9bd-79117acbf6b0', 19, '2022/02/15', 87);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('931fe364-b487-4567-872a-5efdd78ea517', 11, '2021/04/08', 200);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1441148f-84fb-4337-a179-527b82672824', 14, '2022/02/10', 127);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0dc03fdf-45ab-4b67-8318-b043febb63b0', 7, '2021/06/23', 22);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1f63946b-89c5-437e-a14e-ca1d280dcf39', 8, '2021/10/05', 101);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ad467d08-4236-4e44-b8d3-83086df565f4', 11, '2021/06/25', 7);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5160bbbe-9dd1-4899-b5b3-61372d32dd62', 16, '2021/05/13', 164);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('aaf3afc4-6464-4bee-840e-98f89e7f9773', 10, '2021/04/08', 156);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4c8702d7-45c6-43bb-bc1d-730d866182d8', 1, '2022/02/14', 174);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b2a7e103-f2d7-4220-bac9-614e8918f068', 15, '2021/12/28', 139);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('bcf9996d-0d83-40b4-931c-577c658c3732', 10, '2021/12/28', 54);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a7f9cb67-8607-4b3f-8b42-baf4bdc5f288', 9, '2021/09/03', 100);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9cb20397-12b9-419b-b39b-ba00cbdb05d8', 13, '2021/07/02', 162);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('cfd32e36-b553-4e3e-aefa-56e35cf13d33', 10, '2021/10/24', 104);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('09f832fa-f009-47f9-8d79-ef4cd532216b', 8, '2021/10/12', 71);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('003097e0-383f-4106-8d92-5581deb371aa', 13, '2021/11/14', 200);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('44275c2b-3170-44fc-92ab-ed8d6ad73386', 5, '2022/02/22', 72);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1bbdd39f-52f9-415c-9074-1a6a3ef1499e', 15, '2021/09/19', 106);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c8baac95-0654-463b-b27c-a7fedf4d90d7', 2, '2021/07/28', 146);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c15386bb-1f8c-4eeb-bcf8-8bb748f42813', 3, '2021/11/19', 68);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('e253368f-d19c-4ab6-81ce-2fb5ea62dbce', 8, '2021/09/15', 104);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b165f4a4-b897-4fc0-9ac2-23cfbfe4674d', 4, '2022/03/10', 62);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ddf892dc-b701-4974-a9b5-ee246b4a6636', 3, '2021/10/27', 16);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('bfb9eb8e-8f9e-466d-85f6-ab1e826472d0', 4, '2022/03/15', 123);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('080bb951-3651-4779-900f-9b6c79853c3e', 11, '2021/05/27', 129);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('13736e99-ddc9-49d8-9f2e-cc24b59a2320', 10, '2021/12/24', 84);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('398bc04d-2671-45f5-82ff-30fad778cd8f', 14, '2021/04/13', 191);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('8306879c-53cf-4e2d-9b9a-e40cd35e9367', 4, '2021/08/06', 21);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('85c2b840-ed8b-42fb-a159-d99221d520e6', 15, '2022/01/08', 133);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a41d023d-d1ca-4af5-b2c2-2bd98dd21a6b', 17, '2021/06/17', 102);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('78b28473-bd5c-4fe9-9f58-af85ae4c5479', 18, '2022/01/06', 30);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a3d01c0d-f0ac-4a3c-a3d6-50dd10753064', 1, '2021/08/28', 44);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6f5dbb97-2439-4cc2-ba7f-a9b374915bd2', 11, '2021/09/11', 149);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('fbe8c26a-6181-499e-b7e2-425fb466bdd7', 7, '2021/12/27', 161);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b5ce6915-e926-455c-966d-f5d86913bc35', 17, '2021/11/14', 168);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c486c0af-5683-419b-8598-221bc872368a', 6, '2021/09/10', 179);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d89487e7-d510-471f-86cc-8c0757cf0691', 2, '2021/11/07', 195);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a74aa83b-1e2b-465f-adc9-21bd9d310aba', 19, '2021/05/17', 89);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5097384d-bfd4-469d-ad69-b1e8131a9f4c', 11, '2022/03/16', 8);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('fda95c0f-d2b2-41c6-aafb-8704d5f39f79', 8, '2021/12/15', 191);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('098e09a5-ef24-4640-a06f-6fc63980ba12', 7, '2021/06/15', 139);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('96456ad1-8357-4acc-8989-060ace42fc3a', 7, '2021/08/31', 145);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b7a39fb2-04bc-40c8-8097-1ed03ca890ad', 4, '2021/12/01', 23);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('51cba5f0-9dba-46f1-9073-bcbf3169c8ff', 12, '2021/06/25', 161);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f0575134-5f81-4677-8421-22c4c53b950d', 9, '2021/08/26', 123);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b7eaf836-38a3-4d5a-a562-1b128382e135', 17, '2021/05/29', 155);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('97d39e08-54cc-4f11-b20a-fbae20425f06', 6, '2021/04/19', 164);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f1373ba6-6419-4ac8-86c9-c0c41f20a787', 16, '2022/03/19', 61);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7abb7ffd-758f-4a3e-be3b-85269dcacf6c', 11, '2021/05/08', 192);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('50ed8070-eca3-4cfa-af97-1f3d403cdb4a', 12, '2021/12/24', 14);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('131f5b29-fe3c-418d-9e71-3f1043e0705e', 10, '2021/05/13', 41);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6ab1a1d0-0091-42e8-89b8-83f66f9d6117', 9, '2021/04/08', 161);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('77d269ac-7e24-4e92-90fd-8c43bb698603', 14, '2021/09/16', 5);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('97d6ed08-fef6-4ba8-b2c0-893a55233bfe', 10, '2021/11/30', 23);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('abc11627-1fc6-4046-b41f-55e0a28d6885', 18, '2022/02/27', 184);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('00216d82-fc6b-4232-af33-506e4f6c53ce', 2, '2022/03/17', 142);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a39f3900-a6cf-4e14-865b-8a7a3bba3ca8', 14, '2021/07/17', 109);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('44a14347-52f3-4d51-994b-d6fb469030ba', 12, '2021/09/18', 195);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('337d707d-335c-4e59-b935-2d86133b131f', 18, '2021/06/21', 94);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('9f0d83eb-3ede-43da-a327-2298059470b6', 11, '2021/12/15', 129);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a14645b5-7e78-48b9-95cc-ad85fc7e02e1', 4, '2021/08/01', 67);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('61447119-40de-465c-b2e7-b5598a8e6220', 8, '2021/04/06', 184);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('3517f2b6-8a48-49f8-bc4a-190acda59391', 3, '2021/08/05', 162);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2ad0e493-0679-41c9-a940-cb7f95db6839', 12, '2021/12/26', 135);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b0897eaa-d5a5-4438-bc47-f0a00ef878df', 19, '2022/03/26', 146);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2a2c266d-4c3f-40e9-a235-8fbcc9d77e12', 15, '2021/06/14', 179);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1a7bd3a4-778b-4046-b542-42d25f5bd820', 18, '2021/10/11', 191);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b741456a-174e-40fa-9b79-be343c55c8b0', 6, '2022/02/15', 104);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('dc2be89d-5709-4326-ae13-8467d1ae758f', 7, '2021/07/03', 134);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('66ce1d3e-99d8-403c-9785-41ee77abe168', 10, '2022/02/20', 25);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f87a2713-1e38-4aa4-ae91-56500bbabb05', 16, '2021/10/15', 196);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('fe8a3613-e4d9-46f7-ae07-fd5773c92224', 9, '2021/07/31', 154);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7b732b32-8c01-4918-9abd-64560534bee3', 10, '2021/06/01', 25);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('fa356483-e3a4-4154-9684-a5e95b3988c2', 17, '2021/12/01', 145);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('59e6f1d5-cfff-4cb3-9bf1-56bf5a864ff1', 8, '2021/09/08', 34);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a8f8bfd9-7553-4282-b009-e709b7602589', 9, '2021/08/12', 189);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('aa2c9da5-cb5a-4f81-89f2-44cecdf49b62', 10, '2022/01/28', 4);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f2a5c473-bf4e-440e-ba9f-bf3b5fb7dfb3', 1, '2021/05/23', 87);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5f4f08c3-cbf6-4e50-8e53-d71cf01ae7ac', 1, '2021/11/30', 65);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('56122be5-4b34-4cba-a779-40fe7e54c9d4', 9, '2021/04/09', 120);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('49d3e078-f771-4ef0-a35b-e28f1266eda1', 12, '2021/07/07', 117);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('87287767-1ed2-4e19-ad19-7e0cd9fd3e66', 11, '2021/08/07', 197);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ab3617e1-03ea-4741-ae9f-ef793989b6c7', 1, '2021/08/01', 49);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('10fc7cad-08a0-46e8-8b83-d6423e156c7c', 3, '2021/11/24', 200);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4c0a0212-1ea4-493b-bb39-6875264ecb64', 3, '2021/04/04', 103);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('bc557e3b-4986-4ad7-ac92-97c831390bb6', 1, '2021/06/01', 21);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2ad42cd6-75f4-462f-afe4-747c5c8a6df3', 6, '2021/08/17', 197);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('18a80d81-56ce-4436-8de1-29708ece687a', 3, '2021/08/19', 131);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('be610fbf-0e59-41d8-af27-f768b4ee46eb', 15, '2022/01/02', 56);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2c08d335-226e-492c-b8d8-3fb7e2f00b9d', 2, '2021/10/03', 170);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('409d44ea-9b96-4afe-9e88-0da6144afbf1', 9, '2021/07/09', 114);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2e3a5bbc-35f2-43bd-990f-4f0f2903213c', 19, '2021/04/24', 51);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('574ac3df-0df8-4984-a549-682482b82cac', 17, '2021/07/26', 183);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('dff74988-946e-4c4d-ac3e-90fa76e4e622', 11, '2021/09/29', 21);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('07cd8066-bdb1-4fb0-9bc4-440df7a37342', 10, '2021/04/11', 142);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('a0cc8f5a-5c74-45c5-96dd-c89f1ae656a8', 10, '2021/11/18', 20);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('067a273e-e840-494a-99f2-3b052bfdcc52', 18, '2021/09/13', 2);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1823cf4a-e61c-44cb-97e8-9a8e3b6a7cc1', 5, '2021/10/27', 135);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('2e0b07ab-29f2-4c13-8711-0564a3383abe', 20, '2021/09/20', 36);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('59026f56-99c9-49f3-80cb-d512eac77ed4', 3, '2021/12/18', 102);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('63fc76ab-0d5a-442d-a954-f06d76dd72b5', 20, '2021/04/06', 58);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('49396944-595e-4542-ae21-ac918fb0edf4', 11, '2021/07/11', 155);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('149d050d-df38-4b4d-8f0c-375c1f644cfe', 15, '2022/01/03', 52);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('8ef5b46e-cb68-4459-bcd5-1252c89795db', 13, '2022/01/03', 126);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('e03fcfdc-eb66-49ad-bcbe-9189a68c6a26', 12, '2021/08/20', 134);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('cd7c561f-e2b8-4a0d-b7a1-cd67a75cb6f6', 8, '2021/10/28', 140);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f5e354de-1bde-454c-9822-9f3e2096c7a2', 20, '2021/04/22', 126);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('6db9acd3-0b48-47dc-9027-9d7e797e5413', 11, '2021/05/13', 186);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('eb82e3b9-b8f3-42f3-b0f3-3005f61fb940', 11, '2022/01/23', 169);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('96d4f400-c046-4e8b-9cca-ed7104297a18', 13, '2021/05/11', 87);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('c05235a9-8a3c-49cf-b116-325c4e243129', 3, '2021/04/07', 128);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('725f1ff9-3a0c-493d-a122-1441c46eac2e', 4, '2021/06/25', 119);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('8f8f07cc-18e9-4b7b-ba4a-b85ac4c14778', 18, '2021/04/18', 129);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1f09a3d4-a07f-4e3b-b49d-590007f98e54', 19, '2021/04/28', 115);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('bd29fccd-6ff4-4c74-a096-de8cc35787fe', 14, '2021/09/09', 12);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1d1eec6b-d482-48b1-87e3-2c32f16acc51', 6, '2021/11/24', 145);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('d7933452-6717-4314-8999-117ce542daa9', 9, '2021/08/08', 126);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4e5feb02-b44b-4de8-90b5-5d994a5c048d', 16, '2021/10/10', 97);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('86076cf5-abfd-40d5-9c1a-22f0d0750387', 17, '2021/08/26', 4);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('5038494c-2577-4900-866e-5a186a6d43e0', 14, '2021/10/17', 116);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0d609a0c-1da6-44b6-b767-c595acf4c7e7', 14, '2022/02/12', 182);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('786631c7-4611-4f73-b81c-28a19b965ace', 3, '2021/07/05', 136);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('1b1a867c-f3bf-45e2-b0ba-bf3b5b60f11b', 11, '2021/06/22', 110);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('198af577-b52d-4d87-bb3f-cbc10ad1a792', 5, '2021/09/19', 133);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0ceb2fa7-2422-48a4-b729-d485a7956ff6', 7, '2021/10/20', 32);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('786d996f-2f1a-4501-bb08-c748e9450b5d', 20, '2022/03/10', 152);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('654e0cef-3409-46f2-ac43-d22f6d448401', 14, '2021/04/16', 187);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('b3c5f730-93bd-499e-98d4-2468d0ad773c', 1, '2021/08/30', 106);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('64ef326f-fd21-4965-b736-3d8f9107a27e', 19, '2022/02/05', 63);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('4768d129-3b40-47e1-917d-abe732956969', 12, '2021/12/03', 195);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7c7855e5-cef2-49d1-93b1-45c9da0787ad', 8, '2021/11/05', 77);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('735630fb-7a9b-45fa-96b6-4e8d78830aa3', 11, '2021/05/23', 82);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('ea1a73aa-19e9-4b85-8a4d-1bc541a3d583', 20, '2021/07/31', 57);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0165cd7a-78fa-4b30-a844-23f3ef0ddd43', 3, '2022/02/27', 71);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('0d782c36-14f3-4438-81d0-cdec8ae2ca8f', 10, '2021/07/06', 72);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('7197c413-f94a-40c1-baed-7601bd17f404', 7, '2021/05/31', 169);
insert into coupon_data (Coupon_id, Discount, ExpiryDate, Unique_id) values ('f4f404be-d2fe-4e01-878b-59da3279ffa9', 4, '2021/12/19', 135);

-- Use RetailDB;
create table cart_data (
	Unique_id INT NOT NULL, 
	FOREIGN KEY (Unique_id) REFERENCES User (id) on DELETE CASCADE,
	PRIMARY KEY (Unique_id)
);

CREATE TABLE items_contained (
Unique_id INT NOT NULL, 
Product_ID INT NOT NULL,
Quantity INT NOT NULL, 
Primary key(Unique_id , Product_ID, Quantity), 
foreign key(Unique_id)
REFERENCES cart_data(Unique_id) on DELETE CASCADE,
CONSTRAINT quan_pos CHECK (Quantity > 0)
);

insert into cart_data (Unique_id) values (1);
insert into cart_data (Unique_id) values (2);
insert into cart_data (Unique_id) values (3);
insert into cart_data (Unique_id) values (4);
insert into cart_data (Unique_id) values (5);
insert into cart_data (Unique_id) values (6);
insert into cart_data (Unique_id) values (7);
insert into cart_data (Unique_id) values (8);
insert into cart_data (Unique_id) values (9);
insert into cart_data (Unique_id) values (10);
insert into cart_data (Unique_id) values (11);
insert into cart_data (Unique_id) values (12);
insert into cart_data (Unique_id) values (13);
insert into cart_data (Unique_id) values (14);
insert into cart_data (Unique_id) values (15);
insert into cart_data (Unique_id) values (16);
insert into cart_data (Unique_id) values (17);
insert into cart_data (Unique_id) values (18);
insert into cart_data (Unique_id) values (19);
insert into cart_data (Unique_id) values (20);
insert into cart_data (Unique_id) values (21);
insert into cart_data (Unique_id) values (22);
insert into cart_data (Unique_id) values (23);
insert into cart_data (Unique_id) values (24);
insert into cart_data (Unique_id) values (25);
insert into cart_data (Unique_id) values (26);
insert into cart_data (Unique_id) values (27);
insert into cart_data (Unique_id) values (28);
insert into cart_data (Unique_id) values (29);
insert into cart_data (Unique_id) values (30);
insert into cart_data (Unique_id) values (31);
insert into cart_data (Unique_id) values (32);
insert into cart_data (Unique_id) values (33);
insert into cart_data (Unique_id) values (34);
insert into cart_data (Unique_id) values (35);
insert into cart_data (Unique_id) values (36);
insert into cart_data (Unique_id) values (37);
insert into cart_data (Unique_id) values (38);
insert into cart_data (Unique_id) values (39);
insert into cart_data (Unique_id) values (40);
insert into cart_data (Unique_id) values (41);
insert into cart_data (Unique_id) values (42);
insert into cart_data (Unique_id) values (43);
insert into cart_data (Unique_id) values (44);
insert into cart_data (Unique_id) values (45);
insert into cart_data (Unique_id) values (46);
insert into cart_data (Unique_id) values (47);
insert into cart_data (Unique_id) values (48);
insert into cart_data (Unique_id) values (49);
insert into cart_data (Unique_id) values (50);
insert into cart_data (Unique_id) values (51);
insert into cart_data (Unique_id) values (52);
insert into cart_data (Unique_id) values (53);
insert into cart_data (Unique_id) values (54);
insert into cart_data (Unique_id) values (55);
insert into cart_data (Unique_id) values (56);
insert into cart_data (Unique_id) values (57);
insert into cart_data (Unique_id) values (58);
insert into cart_data (Unique_id) values (59);
insert into cart_data (Unique_id) values (60);
insert into cart_data (Unique_id) values (61);
insert into cart_data (Unique_id) values (62);
insert into cart_data (Unique_id) values (63);
insert into cart_data (Unique_id) values (64);
insert into cart_data (Unique_id) values (65);
insert into cart_data (Unique_id) values (66);
insert into cart_data (Unique_id) values (67);
insert into cart_data (Unique_id) values (68);
insert into cart_data (Unique_id) values (69);
insert into cart_data (Unique_id) values (70);
insert into cart_data (Unique_id) values (71);
insert into cart_data (Unique_id) values (72);
insert into cart_data (Unique_id) values (73);
insert into cart_data (Unique_id) values (74);
insert into cart_data (Unique_id) values (75);
insert into cart_data (Unique_id) values (76);
insert into cart_data (Unique_id) values (77);
insert into cart_data (Unique_id) values (78);
insert into cart_data (Unique_id) values (79);
insert into cart_data (Unique_id) values (80);
insert into cart_data (Unique_id) values (81);
insert into cart_data (Unique_id) values (82);
insert into cart_data (Unique_id) values (83);
insert into cart_data (Unique_id) values (84);
insert into cart_data (Unique_id) values (85);
insert into cart_data (Unique_id) values (86);
insert into cart_data (Unique_id) values (87);
insert into cart_data (Unique_id) values (88);
insert into cart_data (Unique_id) values (89);
insert into cart_data (Unique_id) values (90);
insert into cart_data (Unique_id) values (91);
insert into cart_data (Unique_id) values (92);
insert into cart_data (Unique_id) values (93);
insert into cart_data (Unique_id) values (94);
insert into cart_data (Unique_id) values (95);
insert into cart_data (Unique_id) values (96);
insert into cart_data (Unique_id) values (97);
insert into cart_data (Unique_id) values (98);
insert into cart_data (Unique_id) values (99);
insert into cart_data (Unique_id) values (100);
insert into cart_data (Unique_id) values (101);
insert into cart_data (Unique_id) values (102);
insert into cart_data (Unique_id) values (103);
insert into cart_data (Unique_id) values (104);
insert into cart_data (Unique_id) values (105);
insert into cart_data (Unique_id) values (106);
insert into cart_data (Unique_id) values (107);
insert into cart_data (Unique_id) values (108);
insert into cart_data (Unique_id) values (109);
insert into cart_data (Unique_id) values (110);
insert into cart_data (Unique_id) values (111);
insert into cart_data (Unique_id) values (112);
insert into cart_data (Unique_id) values (113);
insert into cart_data (Unique_id) values (114);
insert into cart_data (Unique_id) values (115);
insert into cart_data (Unique_id) values (116);
insert into cart_data (Unique_id) values (117);
insert into cart_data (Unique_id) values (118);
insert into cart_data (Unique_id) values (119);
insert into cart_data (Unique_id) values (120);
insert into cart_data (Unique_id) values (121);
insert into cart_data (Unique_id) values (122);
insert into cart_data (Unique_id) values (123);
insert into cart_data (Unique_id) values (124);
insert into cart_data (Unique_id) values (125);
insert into cart_data (Unique_id) values (126);
insert into cart_data (Unique_id) values (127);
insert into cart_data (Unique_id) values (128);
insert into cart_data (Unique_id) values (129);
insert into cart_data (Unique_id) values (130);
insert into cart_data (Unique_id) values (131);
insert into cart_data (Unique_id) values (132);
insert into cart_data (Unique_id) values (133);
insert into cart_data (Unique_id) values (134);
insert into cart_data (Unique_id) values (135);
insert into cart_data (Unique_id) values (136);
insert into cart_data (Unique_id) values (137);
insert into cart_data (Unique_id) values (138);
insert into cart_data (Unique_id) values (139);
insert into cart_data (Unique_id) values (140);
insert into cart_data (Unique_id) values (141);
insert into cart_data (Unique_id) values (142);
insert into cart_data (Unique_id) values (143);
insert into cart_data (Unique_id) values (144);
insert into cart_data (Unique_id) values (145);
insert into cart_data (Unique_id) values (146);
insert into cart_data (Unique_id) values (147);
insert into cart_data (Unique_id) values (148);
insert into cart_data (Unique_id) values (149);
insert into cart_data (Unique_id) values (150);
insert into cart_data (Unique_id) values (151);
insert into cart_data (Unique_id) values (152);
insert into cart_data (Unique_id) values (153);
insert into cart_data (Unique_id) values (154);
insert into cart_data (Unique_id) values (155);
insert into cart_data (Unique_id) values (156);
insert into cart_data (Unique_id) values (157);
insert into cart_data (Unique_id) values (158);
insert into cart_data (Unique_id) values (159);
insert into cart_data (Unique_id) values (160);
insert into cart_data (Unique_id) values (161);
insert into cart_data (Unique_id) values (162);
insert into cart_data (Unique_id) values (163);
insert into cart_data (Unique_id) values (164);
insert into cart_data (Unique_id) values (165);
insert into cart_data (Unique_id) values (166);
insert into cart_data (Unique_id) values (167);
insert into cart_data (Unique_id) values (168);
insert into cart_data (Unique_id) values (169);
insert into cart_data (Unique_id) values (170);
insert into cart_data (Unique_id) values (171);
insert into cart_data (Unique_id) values (172);
insert into cart_data (Unique_id) values (173);
insert into cart_data (Unique_id) values (174);
insert into cart_data (Unique_id) values (175);
insert into cart_data (Unique_id) values (176);
insert into cart_data (Unique_id) values (177);
insert into cart_data (Unique_id) values (178);
insert into cart_data (Unique_id) values (179);
insert into cart_data (Unique_id) values (180);
insert into cart_data (Unique_id) values (181);
insert into cart_data (Unique_id) values (182);
insert into cart_data (Unique_id) values (183);
insert into cart_data (Unique_id) values (184);
insert into cart_data (Unique_id) values (185);
insert into cart_data (Unique_id) values (186);
insert into cart_data (Unique_id) values (187);
insert into cart_data (Unique_id) values (188);
insert into cart_data (Unique_id) values (189);
insert into cart_data (Unique_id) values (190);
insert into cart_data (Unique_id) values (191);
insert into cart_data (Unique_id) values (192);
insert into cart_data (Unique_id) values (193);
insert into cart_data (Unique_id) values (194);
insert into cart_data (Unique_id) values (195);
insert into cart_data (Unique_id) values (196);
insert into cart_data (Unique_id) values (197);
insert into cart_data (Unique_id) values (198);
insert into cart_data (Unique_id) values (199);
insert into cart_data (Unique_id) values (200);


insert into items_contained (Unique_id, Product_ID, Quantity) values (1, 14, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (1, 25, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (1, 28, 6);
insert into items_contained (Unique_id, Product_ID, Quantity) values (1, 36, 10);
insert into items_contained (Unique_id, Product_ID, Quantity) values (2, 10, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (2, 36, 6);
insert into items_contained (Unique_id, Product_ID, Quantity) values (2, 3, 7);
insert into items_contained (Unique_id, Product_ID, Quantity) values (3, 12, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (19, 5, 8);
insert into items_contained (Unique_id, Product_ID, Quantity) values (3, 43, 5);
insert into items_contained (Unique_id, Product_ID, Quantity) values (3, 3, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (4, 39, 10);
insert into items_contained (Unique_id, Product_ID, Quantity) values (4, 32, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (16, 30, 8);
insert into items_contained (Unique_id, Product_ID, Quantity) values (5, 42, 6);
insert into items_contained (Unique_id, Product_ID, Quantity) values (6, 28, 5);
insert into items_contained (Unique_id, Product_ID, Quantity) values (6, 30, 5);
insert into items_contained (Unique_id, Product_ID, Quantity) values (7, 9, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (7, 12, 8);
insert into items_contained (Unique_id, Product_ID, Quantity) values (7, 22, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (15, 28, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (7, 25, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (7, 33, 10);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 35, 3);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 26, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 7, 4);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 28, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 1, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (8, 21, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (9, 40, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (9, 37, 8);
insert into items_contained (Unique_id, Product_ID, Quantity) values (9, 21, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (9, 30, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (10, 20, 1);
insert into items_contained (Unique_id, Product_ID, Quantity) values (10, 42, 7);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 17, 4);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 34, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 22, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 30, 7);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 2, 2);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 6, 9);
insert into items_contained (Unique_id, Product_ID, Quantity) values (11, 9, 4);
insert into items_contained (Unique_id, Product_ID, Quantity) values (12, 37, 5);
insert into items_contained (Unique_id, Product_ID, Quantity) values (12, 32, 3);
insert into items_contained (Unique_id, Product_ID, Quantity) values (13, 32, 4);
insert into items_contained (Unique_id, Product_ID, Quantity) values (13, 39, 4);
insert into items_contained (Unique_id, Product_ID, Quantity) values (13, 30, 7);
insert into items_contained (Unique_id, Product_ID, Quantity) values (14, 18, 3);
insert into items_contained (Unique_id, Product_ID, Quantity) values (14, 16, 6);
insert into items_contained (Unique_id, Product_ID, Quantity) values (14, 38, 7);

create table category (
	category_id INT NOT NULL AUTO_INCREMENT,
	category_name VARCHAR(50) NOT NULL unique,
	category_info VARCHAR(100),
    PRIMARY KEY(category_id)
    
);
insert into category (category_id, category_name, category_info) values (1, 'Food', 'This category encompasses all food items');
insert into category (category_id, category_name, category_info) values (2, 'Health', 'This category is aimed for the people trying to live healthier lives');
insert into category (category_id, category_name, category_info) values (3, 'Beauty', 'For those who want to sparkle');
insert into category (category_id, category_name, category_info) values (4, 'Clothes', 'This covers everything that you would need from top to bottom');
insert into category (category_id, category_name, category_info) values (5, 'Furtniture', 'Furniture for both home and work');
insert into category (category_id, category_name, category_info) values (6, 'Daily_Items', 'The items you would use on your daily basis');
insert into category (category_id, category_name, category_info) values (7, 'Appliances', 'The appliances you need');
insert into category (category_id, category_name, category_info) values (8, 'Books', 'All genres available');
insert into category (category_id, category_name, category_info) values (9, 'Beverages', 'Cocktails not available');
insert into category (category_id, category_name, category_info) values (10, 'Ready To Eat', 'When you just wanna enjoy a home cooked meal without going through the effort');
insert into category (category_id, category_name, category_info) values (11, 'Electronics', 'Electronic items');
insert into category (category_id, category_name, category_info) values (12, 'Sports Equipment', 'This category encompasses all you would want to satisfy the athlete within you');
insert into category (category_id, category_name, category_info) values (13, 'Heavy Duty Equipment', 'This category contains industrial and home use heavy duty equipments');
insert into category (category_id, category_name, category_info) values (14, 'Cleaning', 'Cleaning Supplies to keep yourself and your surroundings safe');
insert into category (category_id, category_name, category_info) values (15, 'Office Supplies and Stationary', 'Office Supplies');
insert into category (category_id, category_name, category_info) values (16, 'Medical Supplies', 'Medical Supplies for you');
create table brand (
	brand_name VARCHAR(50) NOT NULL,
    primary key(brand_name)
);
insert into brand (brand_name) values ('Amul');
insert into brand (brand_name) values ('London Dairy');
insert into brand (brand_name) values ('Britannia');
insert into brand (brand_name) values ('Nestle');
insert into brand (brand_name) values ('Kelloggs');
insert into brand (brand_name) values ('FitBit');
insert into brand (brand_name) values ('Amway');
insert into brand (brand_name) values ('Loreal');
insert into brand (brand_name) values ('Nivea');
insert into brand (brand_name) values ('Gillette');
insert into brand (brand_name) values ('Dove');
insert into brand (brand_name) values ('Adidas');
insert into brand (brand_name) values ('Nike');
insert into brand (brand_name) values ('Puma');
insert into brand (brand_name) values ('Gap');
insert into brand (brand_name) values ('Coca-Cola');
insert into brand (brand_name) values ('Dabur');
insert into brand (brand_name) values ('PepsiCo');
insert into brand (brand_name) values ('Samsung');
insert into brand (brand_name) values ('LG');
insert into brand (brand_name) values ('Whirlpool');
insert into brand (brand_name) values ('Godrej Interio');
insert into brand (brand_name) values ('Apple');
insert into brand (brand_name) values ('JBL');
insert into brand (brand_name) values ('Haldirams');
insert into brand (brand_name) values ('Levis');
insert into brand (brand_name) values ('Lays');
insert into brand (brand_name) values ('Jockey');
insert into brand (brand_name) values ('Rupa');
insert into brand (brand_name) values ('Parachute');
insert into brand (brand_name) values ('Lakme');
insert into brand (brand_name) values ('Mylab');
insert into brand (brand_name) values ('Thumbs Up');
insert into brand (brand_name) values ('Lifebuoy');
insert into brand (brand_name) values ('Kinley');
insert into brand (brand_name) values ('Kurkure');
insert into brand (brand_name) values ('Yonex');
insert into brand (brand_name) values ('Wilson');
insert into brand (brand_name) values ('Head');
insert into brand (brand_name) values ('Pigeon');
insert into brand (brand_name) values ('Bajaj');
insert into brand (brand_name) values ('Philips');
insert into brand (brand_name) values ('Cosco');
insert into brand (brand_name) values ('ITC');
insert into brand (brand_name) values ('Reckitt');
insert into brand (brand_name) values ('Rasper');
insert into brand (brand_name) values ('Beiersdorf');
insert into brand (brand_name) values ('Staedtler Noris Gmbh');
create table product (
	product_id INT NOT NULL AUTO_INCREMENT,
	primary key(product_id),
	product_name VARCHAR(150) NOT NULL,
    product_cost Decimal(10,2) NOT NULL,
	brand_name VARCHAR(50) NOT NULL, 
    Foreign key(brand_name) references brand(brand_name) On delete Cascade,
    unique(product_name,brand_name),
	CONSTRAINT quantity_positive CHECK ( product_cost> 0)
);
insert into product (product_id, product_name,product_cost ,brand_name) values (1, 'Milk',10, 'Amul');
insert into product (product_id, product_name,product_cost ,brand_name) values (2, 'Ghee', 20,'Amul');
insert into product (product_id, product_name,product_cost ,brand_name) values (3, 'Milk', 11,'London Dairy');
insert into product (product_id, product_name,product_cost ,brand_name) values (4, 'Biscuit', 5,'Britannia');
insert into product (product_id, product_name,product_cost ,brand_name) values (5, 'Bread', 20,'Britannia');
insert into product (product_id, product_name,product_cost ,brand_name) values (6, 'Maggie', 12,'Nestle');
insert into product (product_id, product_name,product_cost ,brand_name) values (7, 'Chocolate',5,'Nestle');
insert into product (product_id, product_name,product_cost ,brand_name) values (8, 'Corn Flakes',100 ,'Kelloggs');
insert into product (product_id, product_name,product_cost ,brand_name) values (9, 'Chocos',120 ,'Kelloggs');
insert into product (product_id, product_name,product_cost ,brand_name) values (10, 'Watch',5000,'FitBit');
insert into product (product_id, product_name,product_cost ,brand_name) values (11, 'Cream', 80,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (12, 'Supplements',500 ,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (13, 'Toothpaste',1000,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (14, 'Shampoo',100 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (15, 'Shaving Cream',200 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (16, 'Conditioner',80 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (17, 'Cream', 50,'Nivea');
insert into product (product_id, product_name,product_cost ,brand_name) values (18, 'Shaving cream',160 ,'Nivea');
insert into product (product_id, product_name,product_cost ,brand_name) values (19, 'Shaving Cream',170,'Gillette');
insert into product (product_id, product_name,product_cost ,brand_name) values (20, 'Soap', 20,'Dove');
insert into product (product_id, product_name,product_cost ,brand_name) values (21, 'Shoes',10000 ,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (22, 'Football',1200 ,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (23, 'Bag', 1000,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (24, 'T-shirt',500,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (25, 'Shoes', 5000,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (26, 'Shoes',6000 ,'Puma');
insert into product (product_id, product_name,product_cost ,brand_name) values (27, 'T-shirt',500 ,'Gap');
insert into product (product_id, product_name,product_cost ,brand_name) values (28, 'Shirt',1000 ,'Gap');
insert into product (product_id, product_name,product_cost ,brand_name) values (29, 'Coke', 50,'Coca-Cola');
insert into product (product_id, product_name,product_cost ,brand_name) values (30, 'Sprite',45 ,'Coca-Cola');
insert into product (product_id, product_name,product_cost ,brand_name) values (31, 'Honey', 50,'Dabur');
insert into product (product_id, product_name,product_cost ,brand_name) values (32, 'Pepsi',100 ,'PepsiCo');
insert into product (product_id, product_name,product_cost ,brand_name) values (33, 'TV',120000 ,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (34, 'Fridge', 10000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (35, 'Galaxy S22',80000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (36, 'Air Conditioner', 50000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (37, 'TV',60000 ,'LG');
insert into product (product_id, product_name,product_cost ,brand_name) values (38, 'Fridge',50000 ,'LG');
insert into product (product_id, product_name,product_cost ,brand_name) values (39, 'Washing Machine',10000 ,'Whirlpool');
insert into product (product_id, product_name,product_cost ,brand_name) values (40, 'Sofa', 5000,'Godrej Interio');
insert into product (product_id, product_name,product_cost ,brand_name) values (41, 'Iphone',100000 ,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (42, 'Airpods',22000 ,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (43, 'Earbuds',1000 ,'JBL');
insert into product (product_id, product_name,product_cost ,brand_name) values (44, 'Bhujia',100 ,'Haldirams');
insert into product (product_id, product_name,product_cost ,brand_name) values (45, 'Dal Makhni',200 ,'Haldirams');
insert into product (product_id, product_name,product_cost ,brand_name) values (46, 'Dal Tadka',300 ,'Haldirams');
insert into product (product_id, product_name,product_cost ,brand_name) values (47, 'Dal Biji',400 ,'Haldirams');
insert into product (product_id, product_name,product_cost ,brand_name) values (48, 'Galaxy S10',50000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (49, 'Galaxy S20',60000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (50, 'Galaxy S21',70000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (51, 'Macbook Pro',100000,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (52, 'Macbook Air',80000,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (53, 'Earphones',1000,'JBL');
insert into product (product_id, product_name,product_cost ,brand_name) values (54, 'Jeans',1000,'Levis');
insert into product (product_id, product_name,product_cost ,brand_name) values (55, 'Innerwear',500,'Levis');
insert into product (product_id, product_name,product_cost ,brand_name) values (56, 'Boxers',300,'Jockey');
insert into product (product_id, product_name,product_cost ,brand_name) values (57, 'Vest',200,'Rupa');
insert into product (product_id, product_name,product_cost ,brand_name) values (58, 'Trouser',500,'Rupa');
insert into product (product_id, product_name,product_cost ,brand_name) values (59, 'Mask',100,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (60, 'Deodorant',200,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (61, 'Hair Oil',300,'Parachute');
insert into product (product_id, product_name,product_cost ,brand_name) values (62, 'Eyeliner',400,'Lakme');
insert into product (product_id, product_name,product_cost ,brand_name) values (63, 'Coviself',500,'Mylab');
insert into product (product_id, product_name,product_cost ,brand_name) values (64, 'Tulsi Drops',600,'Dabur');
insert into product (product_id, product_name,product_cost ,brand_name) values (65, 'Soap',50,'Lifebuoy');
insert into product (product_id, product_name,product_cost ,brand_name) values (66, 'Thumbs Up',100,'Thumbs Up');
insert into product (product_id, product_name,product_cost ,brand_name) values (67, 'Limca',50,'Coca-Cola');
insert into product (product_id, product_name,product_cost ,brand_name) values (68, 'Ice Tea',40,'Nestle');
insert into product (product_id, product_name,product_cost ,brand_name) values (69, 'Soda',40,'Kinley');
insert into product (product_id, product_name,product_cost ,brand_name) values (70, 'Chips',20,'Lays');
insert into product (product_id, product_name,product_cost ,brand_name) values (71, 'Chips',20,'Kurkure');
insert into product (product_id, product_name,product_cost ,brand_name) values (72, 'Headband',100,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (73, 'Badminton Racket',600,'Yonex');
insert into product (product_id, product_name,product_cost ,brand_name) values (74, 'Tennis Racket',800,'Wilson');
insert into product (product_id, product_name,product_cost ,brand_name) values (75, 'Tennis Ball',100,'Wilson');
insert into product (product_id, product_name,product_cost ,brand_name) values (76, 'Squash Racket',500,'Head');
insert into product (product_id, product_name,product_cost ,brand_name) values (77, 'Kettle',1000,'Pigeon');
insert into product (product_id, product_name,product_cost ,brand_name) values (78, 'Sandwich Maker',500,'Pigeon');
insert into product (product_id, product_name,product_cost ,brand_name) values (79, 'Mixer',1500,'Bajaj');
insert into product (product_id, product_name,product_cost ,brand_name) values (80, 'Toaster',2000,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (81, 'Grinder',2500,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (82, 'Hand Blender',1200,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (83, 'Hair Straightener',2800,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (84, 'Hair Dryer',3000,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (85, 'Hair Curler',1375,'Philips');
insert into product (product_id, product_name,product_cost ,brand_name) values (86, 'Soundproof Petrol Generator',175000,'Bajaj');
insert into product (product_id, product_name,product_cost ,brand_name) values (87, 'Low Noise Diesel Generator',99000,'Bajaj');
insert into product (product_id, product_name,product_cost ,brand_name) values (88, 'Football',790,'Cosco');
insert into product (product_id, product_name,product_cost ,brand_name) values (89, 'Tennis Ball (Pack of 6)',380,'Cosco');
insert into product (product_id, product_name,product_cost ,brand_name) values (90, 'Basketball',2000,'Cosco');
insert into product (product_id, product_name,product_cost ,brand_name) values (91, 'Inline Skates',2000,'Cosco');
insert into product (product_id, product_name,product_cost ,brand_name) values (92, 'Godihittu Whole Wheat 10 kg',419,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (93, 'Aashirvaad Atta with Multi Grains',300,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (94, 'Fortified Chakki Atta',400,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (95, 'Aashirvaad Sugar Release Control Atta',350,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (96, 'Whole Wheat Flour Atta',250,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (97, 'Aashirvaad Select Premium Sharbati Atta, 5kg',299,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (98, 'Aashirvaad Select Superior Sharbati Whole Wheat Atta - 5 kg',399,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (99, 'Chana Dal',200,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (100, 'Bingo Cream and Onion',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (101, 'Bingo Masala',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (102, 'Bingo Chilli Sprinkled',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (103, 'Bingo Salted',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (104, 'Bingo Salt Sprinkled',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (105, 'Mad Angles Tomato Madness',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (106, 'Mad Angles Masala Madness',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (107, 'Mad Angles Chaat Masti',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (108, 'Mad Angles Very Peri Peri',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (109, 'Mad Angles Achaari Masti',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (110, 'Mad Angles Pizza Aaaah',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (111, 'Mad Angles Mmmmm Masala',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (112, 'Mad Angles Cheese Nachos',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (113, 'Mad Angles Tomato Mischief',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (114, 'Mad Angles Chilli Dhamaka',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (115, 'Tangles Masala Cheese',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (116, 'Salted Tangle',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (117, 'Savlon Handwash',80,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (118, 'Savlon Soap',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (119, 'Savlon Mask',10,'ITC');
insert into product (product_id, product_name,product_cost ,brand_name) values (120, 'Lizol Liquid',100,'Reckitt');
insert into product (product_id, product_name,product_cost ,brand_name) values (121, 'Harpic',100,'Reckitt');
insert into product (product_id, product_name,product_cost ,brand_name) values (122, 'Mortein Powergard',140,'Reckitt');
insert into product (product_id, product_name,product_cost ,brand_name) values (123, 'Mortein Powergard Coil',40,'Reckitt');
insert into product (product_id, product_name,product_cost ,brand_name) values (124, 'Mortein Machine',90,'Reckitt');
insert into product (product_id, product_name,product_cost ,brand_name) values (125, 'Pen Stand',200,'Rasper');
insert into product (product_id, product_name,product_cost ,brand_name) values (126, 'Acrylic Writing Desk',1500,'Rasper');
insert into product (product_id, product_name,product_cost ,brand_name) values (127, 'Acrylic Paper Weight',150,'Rasper');
insert into product (product_id, product_name,product_cost ,brand_name) values (128, 'Leather Writing Desk',3000,'Rasper');
insert into product (product_id, product_name,product_cost ,brand_name) values (129, 'Hansaplast Regular Bandage',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (130, 'Hansaplast Crepe Bandage',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (131, 'Hansaplast Self Adhesive Bandage',400,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (132, 'Hansaplast Wound Spray',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (133, 'Hansaplast Corn Plaster',300,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (134, 'Hansaplast Lion Plaster',300,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (135, 'Hansaplast Fixation Tape',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (136, 'Hansaplast Lion Heat Plaster',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (137, 'Hansaplast Spiral Heat',200,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (138, 'Hansaplast Junior Wound Care',50,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (139, 'Hansaplast Fingertip Plaster',100,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (140, 'Hansaplast Soft Plaster Roll',100,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (141, 'Hansaplast Chhota Bheem Edition',100,'Beiersdorf');
insert into product (product_id, product_name,product_cost ,brand_name) values (142, 'Mars Lumograph 100G6 Soft Grades 8B HB Pencil',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (143, 'Noris Club 320 NWP12 Fibre Tip Pen',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (144, 'Textsurfer Classic',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (145, 'Jumbo Pencil',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (146, 'Compass',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (147, 'Color Pencils',675,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (148, 'Sharpner',100,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (149, 'Eraser',90,'Staedtler Noris Gmbh');
insert into product (product_id, product_name,product_cost ,brand_name) values (150, 'Mechanical Pencil',100,'Staedtler Noris Gmbh');

create table belongsto(
	product_id INT NOT NULL,
	category_id INT NOT NULL,
	Foreign key(product_id) references product(product_id) on delete cascade,
	Foreign key(category_id) references category(category_id) on delete cascade,
	Primary key(product_id,category_id)
);
insert into belongsto(product_id, category_id) values (1,1);
insert into belongsto(product_id, category_id) values (1,6);
insert into belongsto(product_id, category_id) values (1,9);
insert into belongsto(product_id, category_id) values (2,1);
insert into belongsto(product_id, category_id) values (2,6);
insert into belongsto(product_id, category_id) values (3,1);
insert into belongsto(product_id, category_id) values (3,6);
insert into belongsto(product_id, category_id) values (3,9);
insert into belongsto(product_id, category_id) values (4,1);
insert into belongsto(product_id, category_id) values (5,1);
insert into belongsto(product_id, category_id) values (5,6);
insert into belongsto(product_id, category_id) values (6,1);
insert into belongsto(product_id, category_id) values (7,1);
insert into belongsto(product_id, category_id) values (8,1);
insert into belongsto(product_id, category_id) values (8,6);
insert into belongsto(product_id, category_id) values (8,2);
insert into belongsto(product_id, category_id) values (8,10);
insert into belongsto(product_id, category_id) values (9,1);
insert into belongsto(product_id, category_id) values (9,6);
insert into belongsto(product_id, category_id) values (9,10);
insert into belongsto(product_id, category_id) values (10,2);
insert into belongsto(product_id, category_id) values (10,11);
insert into belongsto(product_id, category_id) values (10,12);
insert into belongsto(product_id, category_id) values (11,3);
insert into belongsto(product_id, category_id) values (12,2);
insert into belongsto(product_id, category_id) values (13,6);
insert into belongsto(product_id, category_id) values (13,3);
insert into belongsto(product_id, category_id) values (13,2);
insert into belongsto(product_id, category_id) values (14,6);
insert into belongsto(product_id, category_id) values (14,3);
insert into belongsto(product_id, category_id) values (14,2);
insert into belongsto(product_id, category_id) values (15,3);
insert into belongsto(product_id, category_id) values (16,3);
insert into belongsto(product_id, category_id) values (17,3);
insert into belongsto(product_id, category_id) values (18,3);
insert into belongsto(product_id, category_id) values (19,3);
insert into belongsto(product_id, category_id) values (20,3);
insert into belongsto(product_id, category_id) values (20,6);
insert into belongsto(product_id, category_id) values (21,12);
insert into belongsto(product_id, category_id) values (22,12);
insert into belongsto(product_id, category_id) values (23,6);
insert into belongsto(product_id, category_id) values (24,4);
insert into belongsto (product_id,category_id) values (25,12);
insert into belongsto (product_id,category_id) values (26,12);
insert into belongsto (product_id,category_id) values (27,4);
insert into belongsto (product_id,category_id) values (28,4);
insert into belongsto (product_id,category_id) values (29,9);
insert into belongsto (product_id,category_id) values (29,1);
insert into belongsto (product_id,category_id) values (30,9);
insert into belongsto (product_id,category_id) values (30,1);
insert into belongsto (product_id,category_id) values (31,1);
insert into belongsto (product_id,category_id) values (31,2);
insert into belongsto (product_id,category_id) values (32,9);
insert into belongsto (product_id,category_id) values (32,1);
insert into belongsto (product_id,category_id) values (33,11);
insert into belongsto (product_id,category_id) values (33,7);
insert into belongsto (product_id,category_id) values (34,7);
insert into belongsto (product_id,category_id) values (35,11);
insert into belongsto (product_id,category_id) values (36,7);
insert into belongsto (product_id,category_id) values (37,11);
insert into belongsto (product_id,category_id) values (37,7);
insert into belongsto (product_id,category_id) values (38,7);
insert into belongsto (product_id,category_id) values (39,7);
insert into belongsto (product_id,category_id) values (40,5);
insert into belongsto (product_id,category_id) values (41,11);
insert into belongsto (product_id,category_id) values (42,11);
insert into belongsto (product_id,category_id) values (43,11);
insert into belongsto (product_id,category_id) values (44,1);
insert into belongsto (product_id,category_id) values (44,10);
insert into belongsto (product_id,category_id) values (45,1);
insert into belongsto (product_id,category_id) values (45,10);
insert into belongsto (product_id,category_id) values (46,10);
insert into belongsto (product_id,category_id) values (47,10);
insert into belongsto (product_id,category_id) values (48,11);
insert into belongsto (product_id,category_id) values (49,11);
insert into belongsto (product_id,category_id) values (50,11);
insert into belongsto (product_id,category_id) values (51,11);
insert into belongsto (product_id,category_id) values (52,11);
insert into belongsto (product_id,category_id) values (53,11);
insert into belongsto (product_id,category_id) values (54,4);
insert into belongsto (product_id,category_id) values (55,4);
insert into belongsto (product_id,category_id) values (56,4);
insert into belongsto (product_id,category_id) values (57,4);
insert into belongsto (product_id,category_id) values (58,4);
insert into belongsto (product_id,category_id) values (59,6);
insert into belongsto (product_id,category_id) values (60,6);
insert into belongsto (product_id,category_id) values (61,6);
insert into belongsto (product_id,category_id) values (62,6);
insert into belongsto (product_id,category_id) values (63,2);
insert into belongsto (product_id,category_id) values (64,2);
insert into belongsto (product_id,category_id) values (65,6);
insert into belongsto (product_id,category_id) values (66,9);
insert into belongsto (product_id,category_id) values (67,9);
insert into belongsto (product_id,category_id) values (68,9);
insert into belongsto (product_id,category_id) values (69,9);
insert into belongsto (product_id,category_id) values (70,10);
insert into belongsto (product_id,category_id) values (71,10);
insert into belongsto (product_id,category_id) values (72,12);
insert into belongsto (product_id,category_id) values (73,12);
insert into belongsto (product_id,category_id) values (74,12);
insert into belongsto (product_id,category_id) values (75,12);
insert into belongsto (product_id,category_id) values (76,12);
insert into belongsto (product_id,category_id) values (77,7);
insert into belongsto (product_id,category_id) values (78,7);
insert into belongsto (product_id,category_id) values (79,7);
insert into belongsto (product_id,category_id) values (80,7);
insert into belongsto (product_id,category_id) values (81,7);
insert into belongsto (product_id,category_id) values (82,7);
insert into belongsto (product_id,category_id) values (83,7);
insert into belongsto (product_id,category_id) values (84,7);
insert into belongsto (product_id,category_id) values (85,7);
insert into belongsto (product_id,category_id) values (86,13);
insert into belongsto (product_id,category_id) values (87,13);
insert into belongsto (product_id,category_id) values (88,12);
insert into belongsto (product_id,category_id) values (89,12);
insert into belongsto (product_id,category_id) values (90,12);
insert into belongsto (product_id,category_id) values (91,12);
insert into belongsto (product_id,category_id) values (92,1);
insert into belongsto (product_id,category_id) values (93,1);
insert into belongsto (product_id,category_id) values (94,1);
insert into belongsto (product_id,category_id) values (95,1);
insert into belongsto (product_id,category_id) values (96,1);
insert into belongsto (product_id,category_id) values (97,1);
insert into belongsto (product_id,category_id) values (98,1);
insert into belongsto (product_id,category_id) values (99,1);
insert into belongsto (product_id,category_id) values (100,1);
insert into belongsto (product_id,category_id) values (101,1);
insert into belongsto (product_id,category_id) values (102,1);
insert into belongsto (product_id,category_id) values (103,1);
insert into belongsto (product_id,category_id) values (104,1);
insert into belongsto (product_id,category_id) values (105,1);
insert into belongsto (product_id,category_id) values (106,1);
insert into belongsto (product_id,category_id) values (107,1);
insert into belongsto (product_id,category_id) values (108,1);
insert into belongsto (product_id,category_id) values (109,1);
insert into belongsto (product_id,category_id) values (110,1);
insert into belongsto (product_id,category_id) values (111,1);
insert into belongsto (product_id,category_id) values (112,1);
insert into belongsto (product_id,category_id) values (113,1);
insert into belongsto (product_id,category_id) values (114,1);
insert into belongsto (product_id,category_id) values (115,1);
insert into belongsto (product_id,category_id) values (116,1);
insert into belongsto (product_id,category_id) values (117,14);
insert into belongsto (product_id,category_id) values (118,14);
insert into belongsto (product_id,category_id) values (119,16);
insert into belongsto (product_id,category_id) values (120,14);
insert into belongsto (product_id,category_id) values (121,14);
insert into belongsto (product_id,category_id) values (122,6);
insert into belongsto (product_id,category_id) values (123,6);
insert into belongsto (product_id,category_id) values (124,6);
insert into belongsto (product_id,category_id) values (125,15);
insert into belongsto (product_id,category_id) values (126,15);
insert into belongsto (product_id,category_id) values (127,15);
insert into belongsto (product_id,category_id) values (128,15);
insert into belongsto (product_id,category_id) values (129,16);
insert into belongsto (product_id,category_id) values (130,16);
insert into belongsto (product_id,category_id) values (131,16);
insert into belongsto (product_id,category_id) values (132,16);
insert into belongsto (product_id,category_id) values (133,16);
insert into belongsto (product_id,category_id) values (134,16);
insert into belongsto (product_id,category_id) values (135,16);
insert into belongsto (product_id,category_id) values (136,16);
insert into belongsto (product_id,category_id) values (137,16);
insert into belongsto (product_id,category_id) values (138,16);
insert into belongsto (product_id,category_id) values (139,16);
insert into belongsto (product_id,category_id) values (140,16);
insert into belongsto (product_id,category_id) values (141,16);
insert into belongsto (product_id,category_id) values (142,15);
insert into belongsto (product_id,category_id) values (143,15);
insert into belongsto (product_id,category_id) values (144,15);
insert into belongsto (product_id,category_id) values (145,15);
insert into belongsto (product_id,category_id) values (146,15);
insert into belongsto (product_id,category_id) values (147,15);
insert into belongsto (product_id,category_id) values (148,15);
insert into belongsto (product_id,category_id) values (149,15);
insert into belongsto (product_id,category_id) values (150,15);


create table billing_details (
	billing_id INT NOT NULL auto_increment,
	payment_mode VARCHAR(30) NOT NULL,
	billing_address VARCHAR(50) NOT NULL,
	PRIMARY KEY (billing_id)
);
insert into billing_details (billing_id, payment_mode, billing_address) values (1, 'Net Banking', '39450 Leroy Street');
insert into billing_details (billing_id, payment_mode, billing_address) values (2, 'Digital Wallet', '540 Melby Terrace');
insert into billing_details (billing_id, payment_mode, billing_address) values (3, 'Digital Wallet', '6881 Eliot Avenue');
insert into billing_details (billing_id, payment_mode, billing_address) values (4, 'Digital Wallet', '7 Vahlen Pass');
insert into billing_details (billing_id, payment_mode, billing_address) values (5, 'Net Banking', '673 Eastwood Hill');
insert into billing_details (billing_id, payment_mode, billing_address) values (6, 'Digital Wallet', '825 Artisan Pass');
insert into billing_details (billing_id, payment_mode, billing_address) values (7, 'Credit Card', '71 Forster Court');
insert into billing_details (billing_id, payment_mode, billing_address) values (8, 'Cash On Delivery', '510 Basil Avenue');
insert into billing_details (billing_id, payment_mode, billing_address) values (9, 'Cash On Delivery', '9801 High Crossing Road');
insert into billing_details (billing_id, payment_mode, billing_address) values (10, 'Digital Wallet', '1 Cardinal Road');
insert into billing_details (billing_id, payment_mode, billing_address) values (11, 'Digital Wallet', '2 Orin Lane');
insert into billing_details (billing_id, payment_mode, billing_address) values (12, 'Cash On Delivery', '57 Muir Parkway');
insert into billing_details (billing_id, payment_mode, billing_address) values (13, 'Net Banking', '976 Bartelt Alley');
insert into billing_details (billing_id, payment_mode, billing_address) values (14, 'UPI', '3 Arkansas Way');
insert into billing_details (billing_id, payment_mode, billing_address) values (15, 'Net Banking', '78 Grasskamp Road');
insert into billing_details (billing_id, payment_mode, billing_address) values (16, 'Net Banking', '63032 Lerdahl Hill');
insert into billing_details (billing_id, payment_mode, billing_address) values (17, 'Debit Card', '3 4th Lane');
insert into billing_details (billing_id, payment_mode, billing_address) values (18, 'Digital Wallet', '50 Pearson Lane');
insert into billing_details (billing_id, payment_mode, billing_address) values (19, 'Digital Wallet', '3034 Texas Parkway');
insert into billing_details (billing_id, payment_mode, billing_address) values (20, 'Net Banking', '442 Stone Corner Plaza');
insert into billing_details (billing_id, payment_mode, billing_address) values (21, 'Net Banking', '7 Kropf Junction');
insert into billing_details (billing_id, payment_mode, billing_address) values (22, 'Digital Wallet', '2623 Dorton Terrace');
insert into billing_details (billing_id, payment_mode, billing_address) values (23, 'Digital Wallet', '19 Hagan Pass');
insert into billing_details (billing_id, payment_mode, billing_address) values (24, 'UPI', '1 Tennyson Court');
insert into billing_details (billing_id, payment_mode, billing_address) values (25, 'Digital Wallet', '69279 Linden Park');
insert into billing_details (billing_id, payment_mode, billing_address) values (26, 'Digital Wallet', '1878 Logan Center');
insert into billing_details (billing_id, payment_mode, billing_address) values (27, 'Net Banking', '46432 Surrey Street');
insert into billing_details (billing_id, payment_mode, billing_address) values (28, 'Digital Wallet', '03710 Karstens Way');
insert into billing_details (billing_id, payment_mode, billing_address) values (29, 'Net Banking', '1 2nd Junction');
insert into billing_details (billing_id, payment_mode, billing_address) values (30, 'Net Banking', '708 Butternut Place');

create table admin_table (
	admin_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	passKey VARCHAR(50) NOT NULL,
    PRIMARY KEY(admin_id)
);
insert into admin_table (admin_id, username, passKey) values (1, 'Aryaman', 'Raina1');
insert into admin_table (admin_id, username, passKey) values (2, 'Aflah', 'Khan2');
insert into admin_table (admin_id, username, passKey) values (3, 'Faizan', 'Haider3');
insert into admin_table values(4,'Shivaansh','Mital4');
insert into admin_table (username, passKey) values ('ABC','XYZ');

create table shipper (
	shipper_id INT NOT NULL AUTO_INCREMENT,
	shipper_name VARCHAR(50) NOT NULL,
	Delivery_speed INT NOT NULL,
	PRIMARY KEY(shipper_id)
);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (1, 'Witting, Jenkins and Fadel', 3);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (2, 'Stamm-DuBuque', 3);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (3, 'Terry Inc', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (4, 'Nicolas LLC', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (5, 'Brakus LLC', 3);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (6, 'McDermott-Pouros', 3);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (7, 'Hyatt-Weissnat', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (8, 'Conroy-Koepp', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (9, 'Spinka Group', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (10, 'Koss LLC', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (11, 'Kuhn-Toy', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (12, 'Bashirian and Sons', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (13, 'Fahey-Homenick', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (14, 'Crist-Emmerich', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (15, 'Greenholt LLC', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (16, 'Prohaska-Hickle', 3);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (17, 'Rath-Moore', 2);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (18, 'Ratke LLC', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (19, 'Crist-Oberbrunner', 1);
insert into shipper (shipper_id, shipper_name, Delivery_speed) values (20, 'Schinner, Ryan and Leffler', 3);
DROP TABLE IF EXISTS items_purchased;
DROP TABLE IF EXISTS order_table;

create table order_table (
	Order_id INT NOT NULL AUTO_INCREMENT,
	Delivery_Address VARCHAR(50) NOT NULL,
	Shipper_id INT DEFAULT 1,
	Date_Time datetime NOT NULL,
	Unique_id INT NOT NULL,
	billing_id INT NOT NULL,
    totalCost INT DEFAULT 0,
	couponID VARCHAR(40) DEFAULT NULL,
	FOREIGN KEY (couponID) 
	REFERENCES coupon_data(Coupon_id) ON DELETE SET NULL,
	FOREIGN KEY (billing_id) 
	REFERENCES billing_details(billing_id) on DELETE CASCADE,
	foreign key(Shipper_id)
	REFERENCES shipper(Shipper_id) on DELETE CASCADE,
	foreign key(Unique_id)
	REFERENCES user(id) on DELETE CASCADE,
	PRIMARY KEY (Order_id),
	CONSTRAINT cos_pos CHECK ( totalCost>=0)
);
CREATE TABLE items_purchased
(
Order_id INT NOT NULL, 
Product_ID INT NOT NULL,
Quantity INT NOT NULL,
Cost INT DEFAULT 0, 
Primary key(Order_id , Product_ID), 
foreign key(Order_id)
REFERENCES order_table(Order_id) on DELETE CASCADE,
CONSTRAINT quant_pos CHECK ( Quantity> 0),
CONSTRAINT cost_pos CHECK ( Cost>= 0)
);
    
DELIMITER $$
CREATE TRIGGER `getCurrentCost` BEFORE INSERT ON `items_purchased`
FOR EACH ROW BEGIN
    SET NEW.Cost = (Select product_cost*NEW.Quantity From product Where product_id = NEW.Product_ID);
    UPDATE order_table
    Set totalCost = 
    Case
    WHEN (couponID IS NOT NULL) THEN totalCost + (NEW.Cost)*(1-((Select Discount From coupon_data Where coupon_data.Coupon_id = couponID)/100))
	ELSE totalCost + (NEW.Cost) 
    END
    WHERE NEW.Order_id = order_table.Order_id;
END $$
DELIMITER ;

DELIMITER $$
CREATE TRIGGER `setCoupon` BEFORE INSERT ON `items_purchased`
FOR EACH ROW BEGIN
	UPDATE coupon_data, order_table
    Set isUsed = 
    Case
    WHEN (couponID IS NOT NULL) THEN 1
	ELSE 0
    END
    WHERE couponID IS NOT NULL AND couponID = coupon_data.Coupon_id AND NEW.Order_id = order_table.Order_id;
END $$
DELIMITER ;

insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id, couponID ) values (1, '827 Pearson Pass', 14, '2022-01-20 11:00:27', 1, 1, 'a93cca35-d0c5-478a-ad4f-6423f5ae2a04');
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (2, '37 Lindbergh Park', 11, '2022-10-23 12:28:43', 2, 2);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (3, '467 Roxbury Hill', 15, '2022-01-27 18:43:51', 3, 3);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (4, '7 Novick Park', 10, '2022-08-02 19:11:44', 4, 4);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (5, '6856 Ridgeview Place', 12, '2022-04-25 00:11:37', 5, 5);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (6, '6 Kings Center', 18, '2022-02-18 09:19:59', 6, 6);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (7, '1231 Northridge Plaza', 5, '2022-06-22 00:58:38', 7, 7);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id , couponID ) values (8, '821 Muir Road', 8, '2022-08-14 09:04:12', 8, 8, 'a846573b-14c7-4d0a-a454-f1071fb7bd20');
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (9, '701 Little Fleur Crossing', 1, '2022-03-14 03:39:11', 9, 9);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (10, '335 Transport Circle', 3, '2022-10-25 09:36:41', 10, 10);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (11, '4421 Summerview Point', 1, '2022-10-29 18:20:11', 11, 11);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id , couponID ) values (12, '1 Tennessee Junction', 11, '2022-06-07 23:30:19', 12, 12, 'd658e5cd-f8b1-4012-bc1f-42f7ede17740');
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (13, '01642 Lyons Alley', 12, '2022-07-26 14:15:55', 13, 13);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (14, '2 Texas Way', 9, '2022-10-24 18:29:45', 14, 14);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (15, '137 Portage Lane', 13, '2022-08-09 06:09:00', 15, 15);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id , couponID ) values (16, '18 Briar Crest Junction', 4, '2022-09-19 05:56:49', 16, 16, '56b92b44-dbdb-47c7-8060-b2401eab203d');
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (17, '2 Brown Way', 2, '2022-10-17 00:32:34', 17, 17);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (18, '52 Merrick Drive', 11, '2022-04-18 08:50:15', 18, 18);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id , couponID ) values (19, '4057 Bowman Park', 19, '2022-06-28 07:20:21', 19, 19, '5c476751-5ed8-4bbf-b258-ea60c85f18a1');
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (20, '5086 Fuller Terrace', 4, '2022-06-14 11:13:21', 20, 20);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (21, '7 Novick Park', 7, '2022-05-07 15:36:31', 4, 21);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (22, '2 Brown Way', 12, '2022-04-03 10:43:04', 17, 22);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (23, '1 Tennessee Junction', 4, '2022-07-08 17:47:22', 12, 23);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (24, '821 Muir Road', 4, '2022-05-04 03:02:35', 8, 24);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (25, '701 Little Fleur Crossing', 16, '2022-10-12 04:21:40', 9, 25);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (26, '827 Pearson Pass', 16, '2022-09-16 16:34:38', 1, 26);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (27, '821 Muir Road', 4, '2022-07-05 13:25:56', 8, 27);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (28, '4421 Summerview Point', 4, '2022-10-12 14:24:56', 11, 28);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (29, '6 Kings Center', 1, '2022-01-18 00:41:12', 6, 29);
insert into order_table (Order_id, Delivery_Address, Shipper_id, Date_Time, Unique_id, billing_id ) values (30, '7 Novick Park', 5, '2022-03-15 11:26:00', 4, 30);

insert into items_purchased (Order_id, Product_ID, Quantity) values (1, 33, 1);
insert into items_purchased (Order_id, Product_ID, Quantity) values (1, 15, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (2, 26, 8);
insert into items_purchased (Order_id, Product_ID, Quantity) values (3, 9, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (4, 5, 9);
insert into items_purchased (Order_id, Product_ID, Quantity) values (5, 33, 1);
insert into items_purchased (Order_id, Product_ID, Quantity) values (6, 15, 10);
insert into items_purchased (Order_id, Product_ID, Quantity) values (7, 7, 10);
insert into items_purchased (Order_id, Product_ID, Quantity) values (7, 4, 3);
insert into items_purchased (Order_id, Product_ID, Quantity) values (8, 44, 3);
insert into items_purchased (Order_id, Product_ID, Quantity) values (8, 5, 3);
insert into items_purchased (Order_id, Product_ID, Quantity) values (8, 41, 1);
insert into items_purchased (Order_id, Product_ID, Quantity) values (9, 17, 5);
insert into items_purchased (Order_id, Product_ID, Quantity) values (9, 8, 8);
insert into items_purchased (Order_id, Product_ID, Quantity) values (10, 24, 9);
insert into items_purchased (Order_id, Product_ID, Quantity) values (11, 36, 9);
insert into items_purchased (Order_id, Product_ID, Quantity) values (12, 7, 5);
insert into items_purchased (Order_id, Product_ID, Quantity) values (13, 25, 5);
insert into items_purchased (Order_id, Product_ID, Quantity) values (14, 7, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (15, 38, 1);
insert into items_purchased (Order_id, Product_ID, Quantity) values (16, 7, 2);
insert into items_purchased (Order_id, Product_ID, Quantity) values (17, 44, 8);
insert into items_purchased (Order_id, Product_ID, Quantity) values (18, 6, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (19, 42, 2);
insert into items_purchased (Order_id, Product_ID, Quantity) values (20, 11, 7);
insert into items_purchased (Order_id, Product_ID, Quantity) values (21, 34, 4);
insert into items_purchased (Order_id, Product_ID, Quantity) values (22, 37, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (23, 38, 4);
insert into items_purchased (Order_id, Product_ID, Quantity) values (24, 23, 8);
insert into items_purchased (Order_id, Product_ID, Quantity) values (25, 19, 1);
insert into items_purchased (Order_id, Product_ID, Quantity) values (26, 9, 2);
insert into items_purchased (Order_id, Product_ID, Quantity) values (27, 7, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (28, 42, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (29, 41, 3);
insert into items_purchased (Order_id, Product_ID, Quantity) values (30, 14, 7);
insert into items_purchased (Order_id, Product_ID, Quantity) values (29, 30, 5);
insert into items_purchased (Order_id, Product_ID, Quantity) values (30, 6, 6);
insert into items_purchased (Order_id, Product_ID, Quantity) values (30, 19, 9);
insert into items_purchased (Order_id, Product_ID, Quantity) values (1, 12, 4);
insert into items_purchased (Order_id, Product_ID, Quantity) values (1, 14, 1);

create table inventory (
	product_id INT NOT NULL AUTO_INCREMENT,
	quantity INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE,
	PRIMARY KEY (product_id),
	CONSTRAINT quantity_pos CHECK ( quantity>=0)
);
insert into inventory (product_id, quantity) values (1, 0);
insert into inventory (product_id, quantity) values (2, 283);
insert into inventory (product_id, quantity) values (3, 427);
insert into inventory (product_id, quantity) values (4, 282);
insert into inventory (product_id, quantity) values (5, 335);
insert into inventory (product_id, quantity) values (6, 477);
insert into inventory (product_id, quantity) values (7, 120);
insert into inventory (product_id, quantity) values (8, 472);
insert into inventory (product_id, quantity) values (9, 440);
insert into inventory (product_id, quantity) values (10, 95);
insert into inventory (product_id, quantity) values (11, 424);
insert into inventory (product_id, quantity) values (12, 302);
insert into inventory (product_id, quantity) values (13, 46);
insert into inventory (product_id, quantity) values (14, 168);
insert into inventory (product_id, quantity) values (15, 97);
insert into inventory (product_id, quantity) values (16, 8);
insert into inventory (product_id, quantity) values (17, 41);
insert into inventory (product_id, quantity) values (18, 498);
insert into inventory (product_id, quantity) values (19, 284);
insert into inventory (product_id, quantity) values (20, 328);
insert into inventory (product_id, quantity) values (21, 151);
insert into inventory (product_id, quantity) values (22, 390);
insert into inventory (product_id, quantity) values (23, 181);
insert into inventory (product_id, quantity) values (24, 208);
insert into inventory (product_id, quantity) values (25, 124);
insert into inventory (product_id, quantity) values (26, 44);
insert into inventory (product_id, quantity) values (27, 135);
insert into inventory (product_id, quantity) values (28, 345);
insert into inventory (product_id, quantity) values (29, 302);
insert into inventory (product_id, quantity) values (30, 419);
insert into inventory (product_id, quantity) values (31, 480);
insert into inventory (product_id, quantity) values (32, 103);
insert into inventory (product_id, quantity) values (33, 126);
insert into inventory (product_id, quantity) values (34, 187);
insert into inventory (product_id, quantity) values (35, 444);
insert into inventory (product_id, quantity) values (36, 174);
insert into inventory (product_id, quantity) values (37, 209);
insert into inventory (product_id, quantity) values (38, 156);
insert into inventory (product_id, quantity) values (39, 132);
insert into inventory (product_id, quantity) values (40, 173);
insert into inventory (product_id, quantity) values (41, 442);
insert into inventory (product_id, quantity) values (42, 253);
insert into inventory (product_id, quantity) values (43, 444);
insert into inventory (product_id, quantity) values (44, 456);
insert into inventory (product_id, quantity) values (45, 142);
insert into inventory (product_id, quantity) values (46, 463);
insert into inventory (product_id, quantity) values (47, 234);
insert into inventory (product_id, quantity) values (48, 312);
insert into inventory (product_id, quantity) values (49, 102);
insert into inventory (product_id, quantity) values (50, 94);
insert into inventory (product_id, quantity) values (51, 34);
insert into inventory (product_id, quantity) values (52, 93);
insert into inventory (product_id, quantity) values (53, 442);
insert into inventory (product_id, quantity) values (54, 29);
insert into inventory (product_id, quantity) values (55, 361);
insert into inventory (product_id, quantity) values (56, 463);
insert into inventory (product_id, quantity) values (57, 291);
insert into inventory (product_id, quantity) values (58, 42);
insert into inventory (product_id, quantity) values (59, 512);
insert into inventory (product_id, quantity) values (60, 921);
insert into inventory (product_id, quantity) values (61, 8);
insert into inventory (product_id, quantity) values (62, 9);
insert into inventory (product_id, quantity) values (63, 134);
insert into inventory (product_id, quantity) values (64, 621);
insert into inventory (product_id, quantity) values (65, 135);
insert into inventory (product_id, quantity) values (66, 661);
insert into inventory (product_id, quantity) values (67, 78);
insert into inventory (product_id, quantity) values (68, 226);
insert into inventory (product_id, quantity) values (69, 696);
insert into inventory (product_id, quantity) values (70, 721);
insert into inventory (product_id, quantity) values (71, 783);
insert into inventory (product_id, quantity) values (72, 12);
insert into inventory (product_id, quantity) values (73, 81);
insert into inventory (product_id, quantity) values (74, 92);
insert into inventory (product_id, quantity) values (75, 385);
insert into inventory (product_id, quantity) values (76, 332);
insert into inventory (product_id, quantity) values (77, 218);
insert into inventory (product_id, quantity) values (78, 7);
insert into inventory (product_id, quantity) values (79, 78);
insert into inventory (product_id, quantity) values (80, 289);
insert into inventory (product_id, quantity) values (81, 7);
insert into inventory (product_id, quantity) values (82, 8);
insert into inventory (product_id, quantity) values (83, 9);
insert into inventory (product_id, quantity) values (84, 22);
insert into inventory (product_id, quantity) values (85, 8);
insert into inventory (product_id, quantity) values (86, 9);
insert into inventory (product_id, quantity) values (87, 12);
insert into inventory (product_id, quantity) values (88, 81);
insert into inventory (product_id, quantity) values (89, 92);
insert into inventory (product_id, quantity) values (90, 385);
insert into inventory (product_id, quantity) values (91, 332);
insert into inventory (product_id, quantity) values (92, 218);
insert into inventory (product_id, quantity) values (93, 7);
insert into inventory (product_id, quantity) values (94, 78);
insert into inventory (product_id, quantity) values (95, 289);
insert into inventory (product_id, quantity) values (96, 7);
insert into inventory (product_id, quantity) values (97, 8);
insert into inventory (product_id, quantity) values (98, 9);
insert into inventory (product_id, quantity) values (99, 22);
insert into inventory (product_id, quantity) values (100, 8);
insert into inventory (product_id, quantity) values (101, 9);
insert into inventory (product_id, quantity) values (102, 12);
insert into inventory (product_id, quantity) values (103, 81);
insert into inventory (product_id, quantity) values (104, 92);
insert into inventory (product_id, quantity) values (105, 385);
insert into inventory (product_id, quantity) values (106, 332);
insert into inventory (product_id, quantity) values (107, 218);
insert into inventory (product_id, quantity) values (108, 7);
insert into inventory (product_id, quantity) values (109, 78);
insert into inventory (product_id, quantity) values (110, 289);
insert into inventory (product_id, quantity) values (111, 7);
insert into inventory (product_id, quantity) values (112, 8);
insert into inventory (product_id, quantity) values (113, 9);
insert into inventory (product_id, quantity) values (114, 22);
insert into inventory (product_id, quantity) values (115, 8);
insert into inventory (product_id, quantity) values (116, 9);
insert into inventory (product_id, quantity) values (117, 12);
insert into inventory (product_id, quantity) values (118, 81);
insert into inventory (product_id, quantity) values (119, 92);
insert into inventory (product_id, quantity) values (120, 385);
insert into inventory (product_id, quantity) values (121, 332);
insert into inventory (product_id, quantity) values (122, 218);
insert into inventory (product_id, quantity) values (123, 7);
insert into inventory (product_id, quantity) values (124, 78);
insert into inventory (product_id, quantity) values (125, 289);
insert into inventory (product_id, quantity) values (126, 7);
insert into inventory (product_id, quantity) values (127, 8);
insert into inventory (product_id, quantity) values (128, 9);
insert into inventory (product_id, quantity) values (129, 22);
insert into inventory (product_id, quantity) values (130, 8);
insert into inventory (product_id, quantity) values (131, 9);
insert into inventory (product_id, quantity) values (132, 12);
insert into inventory (product_id, quantity) values (133, 81);
insert into inventory (product_id, quantity) values (134, 92);
insert into inventory (product_id, quantity) values (135, 385);
insert into inventory (product_id, quantity) values (136, 332);
insert into inventory (product_id, quantity) values (137, 218);
insert into inventory (product_id, quantity) values (138, 7);
insert into inventory (product_id, quantity) values (139, 78);
insert into inventory (product_id, quantity) values (140, 289);
insert into inventory (product_id, quantity) values (141, 7);
insert into inventory (product_id, quantity) values (142, 8);
insert into inventory (product_id, quantity) values (143, 9);
insert into inventory (product_id, quantity) values (144, 22);
insert into inventory (product_id, quantity) values (145, 8);
insert into inventory (product_id, quantity) values (146, 9);
insert into inventory (product_id, quantity) values (147, 12);
insert into inventory (product_id, quantity) values (148, 81);
insert into inventory (product_id, quantity) values (149, 92);
insert into inventory (product_id, quantity) values (150, 385);


drop view if exists userProductView;
drop view if exists categoryUserView;
drop view if exists protectedUserView;
drop view if exists usableCouponView;
-- View products using user 
Create VIEW userProductView AS
SELECT product_name, product_cost, brand_name
From product;

-- view categories from user privileges
create view categoryUserView as 
select category_name, category_info from category;

-- View users using admin privileges
Create VIEW protectedUserView AS
SELECT id, address, name, EmailID, PhoneNumber
From user;

-- View Usable Coupons
CREATE VIEW usableCouponView AS
select Coupon_id, Discount, ExpiryDate, Unique_id
from coupon_data
where coupon_data.ExpiryDate > CURRENT_DATE AND coupon_data.isUsed = 0;

-- alter table category drop index categoryname; 
-- alter table shipper drop index shipperspeed;
-- alter table brand drop index brandn;
-- alter table product drop index prod_id;
-- alter table product drop index product_name_brand_name;
-- alter table billing_details drop index billing;
-- alter table user drop index username_password;
-- alter table items_contained drop index items_contained_index;
 
create unique index categoryname on category(category_name);
create index shipperspeed on shipper(Delivery_speed);
-- the above index is for the delivery speed of a shipper which is being utilized in the API/query listShippersbySpeed where we need to find the shippers by a given speed
create index brandn on brand(brand_name);
-- for brandname 
create unique index prod_id on product(product_id);
create unique index product_name_brand_name on product(product_name,brand_name);
create index billing on billing_details(billing_id);
create unique index username_password on user(EmailID,Password);
create unique index items_contained_index on items_contained(Unique_id , Product_ID, Quantity);


-- grants and roles here

use retaildb;

-- role for our customers
create Role if not exists user_role;
grant select on retaildb.usableCouponView to user_role;
grant select on retaildb.userProductView to user_role;
grant select on retaildb.categoryUserView to user_role;
grant select,update on retaildb.inventory to user_role;
grant select, update,insert,delete on retaildb.items_purchased to user_role;
grant select, update,insert,delete on retaildb.order_table to user_role;
grant select on retaildb.shipper to user_role;
grant select, insert,update,delete on retaildb.billing_details to user_role;
grant select on retaildb.belongsto to user_role;
grant select on retaildb.product to user_role;
grant select on retaildb.brand to user_role;
grant select on retaildb.category to user_role;
grant select,update,insert,delete on retaildb.items_contained to user_role;
grant select on retaildb.cart_data to user_role;
grant select,update on retaildb.coupon_data to user_role;
grant select on retaildb.user to user_role;
grant select on retaildb.protectedUserView to user_role;

-- role for our admins
create role if not exists admin_role;

grant all on retaildb.user to admin_role;
grant all on retaildb.coupon_data to admin_role;
-- not given admin any data related to cart and order
grant all on retaildb.category to admin_role;
grant all on retaildb.brand to admin_role;
grant all on retaildb.product to admin_role;
grant all on retaildb.belongsto to admin_role;
grant all on retaildb.billing_details to admin_role;
-- for the time being an admin does not have to write alter on other admins
grant select on retaildb.admin_table to admin_role;
grant all on retaildb.shipper to admin_role;
grant select,update,insert,delete,create,drop on retaildb.order_table to admin_role;
grant select,update,insert,delete,create,drop on retaildb.items_purchased to admin_role;
grant all on retaildb.inventory to admin_role;
grant all on retaildb.userProductView to admin_role;
grant all on retaildb.categoryUserView to admin_role;
grant all on retaildb.protectedUserView to admin_role;
grant all on retaildb.usableCouponView to admin_role;

SET GLOBAL sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
SET SESSION sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
