create table Order (
	-- Triggers to add
	Order_id INT,
	Delivery_Address VARCHAR(50),
	Shipper_id INT,
	DateTime DATE,
	Unique_id INT,
	foreign key(Shipper_id)
	REFERENCES Shipper(Shipper_id) on DELETE CASCADE,
	foreign key(Unique_id)
	REFERENCES User(Unique_id) on DELETE CASCADE
);
CREATE TABLE Items_Purchased
(
Order_id INT, 
Product_ID INT,
Quantity INT, 
Primary key(Order_id , Product_ID), 
foreign key(Order_id)
REFERENCES Order(Order_id) on DELETE CASCADE
);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (1, '827 Pearson Pass', 14, '3/25/2022', 1);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (2, '37 Lindbergh Park', 11, '3/16/2021', 2);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (3, '467 Roxbury Hill', 15, '8/22/2021', 3);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (4, '7 Novick Park', 10, '11/24/2021', 4);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (5, '6856 Ridgeview Place', 12, '4/22/2022', 5);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (6, '6 Kings Center', 18, '1/30/2022', 6);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (7, '1231 Northridge Plaza', 5, '8/8/2021', 7);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (8, '821 Muir Road', 8, '12/1/2021', 8);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (9, '701 Little Fleur Crossing', 1, '1/10/2022', 9);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (10, '335 Transport Circle', 3, '1/14/2022', 10);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (11, '4421 Summerview Point', 1, '1/10/2022', 11);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (12, '1 Tennessee Junction', 11, '7/9/2021', 12);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (13, '01642 Lyons Alley', 12, '9/6/2021', 13);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (14, '2 Texas Way', 9, '8/26/2021', 14);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (15, '137 Portage Lane', 13, '1/6/2022', 15);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (16, '18 Briar Crest Junction', 4, '8/14/2021', 16);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (17, '2 Brown Way', 2, '9/20/2021', 17);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (18, '52 Merrick Drive', 11, '5/17/2022', 18);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (19, '4057 Bowman Park', 19, '1/2/2022', 19);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (20, '5086 Fuller Terrace', 4, '12/17/2021', 20);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (21, '7 Novick Park', 7, '11/20/2021', 4);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (22, '2 Brown Way', 12, '2/14/2022', 17);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (23, '1 Tennessee Junction', 4, '3/3/2021', 12);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (24, '821 Muir Road', 4, '4/19/2022', 8);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (25, '701 Little Fleur Crossing', 16, '7/31/2021', 9);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (26, '827 Pearson Pass', 16, '9/13/2021', 1);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (27, '821 Muir Road', 4, '4/5/2021', 8);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (28, '4421 Summerview Point', 4, '9/29/2021', 11);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (29, '6 Kings Center', 1, '3/14/2022', 6);
insert into Order (Order_id, Delivery_Address, Shipper_id, DateTime, Unique_id ) values (30, '7 Novick Park', 5, '5/22/2021', 4);

insert into Items_Purchased (Order_id, Product_ID, Quantity) values (1, 33, 1);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (1, 15, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (2, 26, 8);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (3, 9, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (4, 5, 9);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (5, 33, 1);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (6, 15, 10);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (7, 7, 10);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (7, 4, 3);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (8, 44, 3);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (8, 5, 3);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (8, 44, 1);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (9, 17, 5);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (9, 8, 8);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (10, 24, 9);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (11, 36, 9);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (12, 7, 5);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (13, 25, 5);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (14, 7, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (15, 38, 1);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (16, 7, 2);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (17, 44, 8);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (18, 6, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (19, 42, 2);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (20, 11, 7);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (21, 34, 4);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (22, 37, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (23, 38, 4);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (24, 23, 8);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (25, 19, 1);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (26, 9, 2);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (27, 7, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (28, 42, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (29, 41, 3);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (30, 14, 7);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (29, 30, 5);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (30, 6, 6);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (30, 19, 9);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (1, 12, 4);
insert into Items_Purchased (Order_id, Product_ID, Quantity) values (1, 14, 1);
