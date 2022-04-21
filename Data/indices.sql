
-- CREATE UNIQUE INDEX AccountNo_idx ON Accounts (AccountNo);
-- CREATE UNIQUE INDEX Employee_ID_idx ON Employees (Employee_ID);
-- CREATE UNIQUE INDEX Payment_ID_idx ON Transactions (Payment_ID);
-- CREATE INDEX Customer_Account_idx ON Accounts (Customer_ID, AccountNo);
-- CREATE INDEX Status_idx ON Transactions (Status);
-- CREATE INDEX Designation_idx ON Employees (Designation);

-- use retaildb;
-- alter table category drop index if exists categoryname; 
create index categoryname on category(category_name);
create index shipperspeed on shipper(Delivery_speed);

-- the above index is for the delivery speed of a shipper which is being utilized in the API/query listShippersbySpeed where we need to find the shippers by a given speed