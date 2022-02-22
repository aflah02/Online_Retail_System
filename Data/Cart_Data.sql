create table Cart_Data (
	Cart_id INT,
);
CREATE TABLE Items_Contained
(
Cart_ID int, 
Product_ID INT,
Quantity INT, 
Primary key(Cart_ID , Product_ID, Quantity), 
foreign key(Cart_ID)
REFERENCES Cart_Data(Cart_ID)
);

INSERT INTO Cart_Data(Cart_id) VALUES(1);
INSERT INTO Cart_Data(Cart_id) VALUES(2);
INSERT INTO Cart_Data(Cart_id) VALUES(3);
INSERT INTO Cart_Data(Cart_id) VALUES(4);
INSERT INTO Cart_Data(Cart_id) VALUES(5);
INSERT INTO Cart_Data(Cart_id) VALUES(6);
INSERT INTO Cart_Data(Cart_id) VALUES(7);
INSERT INTO Cart_Data(Cart_id) VALUES(8);
INSERT INTO Cart_Data(Cart_id) VALUES(9);

INSERT INTO Items_Contained VALUES(1, 1, 1);
