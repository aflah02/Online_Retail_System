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
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);
INSERT INTO Items_Contained VALUES(1, 1, 1);