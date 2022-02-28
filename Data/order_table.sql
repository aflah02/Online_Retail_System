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
	PRIMARY KEY (Order_id)
);
CREATE TABLE items_purchased
(
Order_id INT NOT NULL, 
Product_ID INT NOT NULL,
Quantity INT NOT NULL,
Cost INT DEFAULT 0, 
Primary key(Order_id , Product_ID), 
foreign key(Order_id)
REFERENCES order_table(Order_id) on DELETE CASCADE
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
    
	UPDATE coupon_data
    Set isUsed = 
    Case
    WHEN (couponID IS NOT NULL) THEN 1
	ELSE 0
    END
    WHERE NEW.Order_id = order_table.Order_id AND NEW.couponID IS NOT NULL AND NEW.couponID = coupon_data.Coupon_id;
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
