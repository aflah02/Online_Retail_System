create table Order_Data (
	Order_id INT,
	Delivery_Address VARCHAR(50),
	Shipper_id INT,
	DateTime DATE
);
CREATE TABLE Items_Purchased
(
Order_id INT, 
Product_ID INT,
Quantity INT, 
Primary key(Order_id , Product_ID, Quantity), 
foreign key(Order_id)
REFERENCES Order_Data(Order_id)
);
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (1, '827 Pearson Pass', 14, '3/25/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (2, '37 Lindbergh Park', 11, '3/16/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (3, '467 Roxbury Hill', 15, '8/22/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (4, '7 Novick Park', 10, '11/24/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (5, '6856 Ridgeview Place', 12, '4/22/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (6, '6 Kings Center', 18, '1/30/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (7, '1231 Northridge Plaza', 5, '8/8/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (8, '821 Muir Road', 8, '12/1/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (9, '701 Little Fleur Crossing', 1, '1/10/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (10, '335 Transport Circle', 3, '1/14/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (11, '4421 Summerview Point', 1, '1/10/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (12, '1 Tennessee Junction', 11, '7/9/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (13, '01642 Lyons Alley', 12, '9/6/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (14, '2 Texas Way', 9, '8/26/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (15, '137 Portage Lane', 13, '1/6/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (16, '18 Briar Crest Junction', 4, '8/14/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (17, '2 Brown Way', 2, '9/20/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (18, '52 Merrick Drive', 11, '5/17/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (19, '4057 Bowman Park', 19, '1/2/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (20, '5086 Fuller Terrace', 4, '12/17/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (21, '7 Novick Park', 7, '11/20/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (22, '2 Brown Way', 12, '2/14/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (23, '1 Tennessee Junction', 4, '3/3/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (24, '821 Muir Road', 4, '4/19/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (25, '701 Little Fleur Crossing', 16, '7/31/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (26, '827 Pearson Pass', 16, '9/13/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (27, '821 Muir Road', 4, '4/5/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (28, '4421 Summerview Point', 4, '9/29/2021');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (29, '6 Kings Center', 1, '3/14/2022');
insert into MOCK_DATA (Order_id, Delivery_Address, Shipper_id, DateTime) values (30, '7 Novick Park', 5, '5/22/2021');
