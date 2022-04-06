create table inventory (
	product_id INT NOT NULL AUTO_INCREMENT,
	quantity INT NOT NULL,
	FOREIGN KEY (product_id) REFERENCES PRODUCT(product_id) ON DELETE CASCADE,
	PRIMARY KEY (product_id),
	CONSTRAINT quantity_pos CHECK ( quantity>= 0)
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
