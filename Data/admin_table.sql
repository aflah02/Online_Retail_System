create table admin_table (
	admin_id INT NOT NULL AUTO_INCREMENT,
	username VARCHAR(50) NOT NULL,
	passKey VARCHAR(50) NOT NULL,
    PRIMARY KEY(admin_id)
);
insert into admin_table (admin_id, username, passKey) values (1, 'Aryaman', 'Raina1');
insert into admin_table (admin_id, username, passKey) values (2, 'Aflah', 'Khan2');
insert into admin_table (admin_id, username, passKey) values (3, 'Faizan', 'Haider3');
insert into admin_table values(4,'Shivaansh','Mital4');
insert into admin_table (username, passKey) values ('ABC','XYZ');
