create table Cart_Data (
	Unique_id INT, 
	FOREIGN KEY (Unique_id) REFERENCES User on DELETE CASCADE
);

CREATE TABLE Items_Contained
(
Unique_id INT, 
Product_ID INT,
Quantity INT, 
Primary key(Unique_id , Product_ID, Quantity), 
foreign key(Unique_id)
REFERENCES Cart_Data(Unique_id) on DELETE CASCADE
);

INSERT INTO Cart_Data(Unique_id) VALUES(1);
INSERT INTO Cart_Data(Unique_id) VALUES(2);
INSERT INTO Cart_Data(Unique_id) VALUES(3);
INSERT INTO Cart_Data(Unique_id) VALUES(4);
INSERT INTO Cart_Data(Unique_id) VALUES(5);
INSERT INTO Cart_Data(Unique_id) VALUES(6);
INSERT INTO Cart_Data(Unique_id) VALUES(7);
INSERT INTO Cart_Data(Unique_id) VALUES(8);
INSERT INTO Cart_Data(Unique_id) VALUES(9);
INSERT INTO Cart_Data(Unique_id) VALUES(10);
INSERT INTO Cart_Data(Unique_id) VALUES(11);
INSERT INTO Cart_Data(Unique_id) VALUES(12);
INSERT INTO Cart_Data(Unique_id) VALUES(13);
INSERT INTO Cart_Data(Unique_id) VALUES(14);
INSERT INTO Cart_Data(Unique_id) VALUES(15);
INSERT INTO Cart_Data(Unique_id) VALUES(16);
INSERT INTO Cart_Data(Unique_id) VALUES(17);
INSERT INTO Cart_Data(Unique_id) VALUES(18);
INSERT INTO Cart_Data(Unique_id) VALUES(19);
INSERT INTO Cart_Data(Unique_id) VALUES(20);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (1, 14, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (2, 25, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (3, 28, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (4, 36, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (5, 10, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (6, 36, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 3, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 12, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (9, 5, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (10, 43, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 3, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (12, 39, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (13, 32, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (14, 30, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (15, 42, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (16, 28, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (17, 30, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (18, 9, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (19, 12, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (20, 22, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (21, 28, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (22, 25, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (23, 33, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (24, 35, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (25, 26, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (26, 7, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (27, 28, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (28, 1, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (29, 21, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (30, 40, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (31, 37, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (32, 21, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (33, 30, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (34, 20, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (35, 42, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (36, 17, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (37, 34, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (38, 22, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (39, 30, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (40, 2, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (41, 6, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (42, 9, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (43, 37, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (44, 32, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (45, 32, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (46, 39, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (47, 30, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (48, 18, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (49, 16, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (50, 38, 7);
