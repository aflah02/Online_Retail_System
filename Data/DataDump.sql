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

INSERT INTO cart_data(Unique_id) VALUES(1);
INSERT INTO cart_data(Unique_id) VALUES(2);
INSERT INTO cart_data(Unique_id) VALUES(3);
INSERT INTO cart_data(Unique_id) VALUES(4);
INSERT INTO cart_data(Unique_id) VALUES(5);
INSERT INTO cart_data(Unique_id) VALUES(6);
INSERT INTO cart_data(Unique_id) VALUES(7);
INSERT INTO cart_data(Unique_id) VALUES(8);
INSERT INTO cart_data(Unique_id) VALUES(9);
INSERT INTO cart_data(Unique_id) VALUES(10);
INSERT INTO cart_data(Unique_id) VALUES(11);
INSERT INTO cart_data(Unique_id) VALUES(12);
INSERT INTO cart_data(Unique_id) VALUES(13);
INSERT INTO cart_data(Unique_id) VALUES(14);
INSERT INTO cart_data(Unique_id) VALUES(15);
INSERT INTO cart_data(Unique_id) VALUES(16);
INSERT INTO cart_data(Unique_id) VALUES(17);
INSERT INTO cart_data(Unique_id) VALUES(18);
INSERT INTO cart_data(Unique_id) VALUES(19);
INSERT INTO cart_data(Unique_id) VALUES(20);
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

create table product (
	product_id INT NOT NULL AUTO_INCREMENT,
	primary key(product_id),
	product_name VARCHAR(50) NOT NULL,
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
insert into product (product_id, product_name,product_cost ,brand_name) values (35, 'S22',500,'Samsung');
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
drop view if exists userProductView;
drop view if exists categoryUserView;
drop view if exists protectedUserView;
drop view if exists usableCouponView;
-- View products using user privileges
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