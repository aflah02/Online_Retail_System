use retaildb;
-- DROP USER IF EXISTS customer@localhost;
-- FLUSH PRIVILEGES;
-- CREATE USER customer@localhost IDENTIFIED BY '1234';
-- RANT user_role TO customer@localhost; 
set role all;
-- flush privileges;
show grants for customer@localhost;
-- show grants for user_role
-- select user from mysql.user;