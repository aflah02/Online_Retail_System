-- Use retaildb;
-- DROP TABLE IF EXISTS admin;
-- create table ADMIN (
-- 	admin_id INT NOT NULL AUTO_INCREMENT,
-- 	username VARCHAR(50) NOT NULL,
-- 	password VARCHAR(50) NOT NULL,
--     PRIMARY KEY(admin_id)
-- );
-- insert into ADMIN (admin_id, username, password) values (1, 'Aryaman', 'Raina1');
-- insert into ADMIN (admin_id, username, password) values (2, 'Aflah', 'Khan2');
-- insert into ADMIN (admin_id, username, password) values (3, 'Faizan', 'Haider3');
-- insert into ADMIN values(4,'Shivaansh','Mital4');
-- insert into ADMIN (username, password) values ('ABC','XYZ');
create table dummy (
	Coupon_id VARCHAR(40) NOT NULL,
	PRIMARY KEY(Coupon_id)
);
insert into dummy values ('012');
insert into dummy values ('0AB');
insert into dummy values ('ABC');
insert into dummy values ('A12');
Select *
From dummy;