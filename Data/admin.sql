create table ADMIN (
	admin_id INT NOT NULL,
	username VARCHAR(50) NOT NULL,
	password VARCHAR(50) NOT NULL,
    PRIMARY KEY(admin_id)
);
insert into ADMIN (admin_id, username, password) values (1, 'Aryaman', 'Raina1');
insert into ADMIN (admin_id, username, password) values (2, 'Aflah', 'Khan2');
insert into ADMIN (admin_id, username, password) values (3, 'Faizan', 'Haider3');
insert into ADMIN values(4,'Shivaansh','Mital4');
