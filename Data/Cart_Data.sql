-- Use RetailDB;
create table Cart_Data (
	Unique_id INT NOT NULL, 
	FOREIGN KEY (Unique_id) REFERENCES User (id) on DELETE CASCADE,
	PRIMARY KEY (Unique_id)
);

CREATE TABLE Items_Contained (
Unique_id INT NOT NULL, 
Product_ID INT NOT NULL,
Quantity INT NOT NULL, 
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
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (1, 25, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (1, 28, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (1, 36, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (2, 10, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (2, 36, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (2, 3, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (3, 12, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (19, 5, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (3, 43, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (3, 3, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (4, 39, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (4, 32, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (16, 30, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (5, 42, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (6, 28, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (6, 30, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 9, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 12, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 22, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (15, 28, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 25, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (7, 33, 10);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 35, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 26, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 7, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 28, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 1, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (8, 21, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (9, 40, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (9, 37, 8);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (9, 21, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (9, 30, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (10, 20, 1);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (10, 42, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 17, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 34, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 22, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 30, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 2, 2);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 6, 9);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (11, 9, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (12, 37, 5);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (12, 32, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (13, 32, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (13, 39, 4);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (13, 30, 7);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (14, 18, 3);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (14, 16, 6);
insert into Items_Contained (Unique_id, Product_ID, Quantity) values (14, 38, 7);
