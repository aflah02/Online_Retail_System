use retaildb;
-- alter table category drop index categoryname; 
-- alter table shipper drop index shipperspeed;
-- alter table brand drop index brandn;
-- alter table product drop index prod_id;
-- alter table product drop index product_name_brand_name;
-- alter table billing_details drop index billing;
-- alter table user drop index username_password;
-- alter table items_contained drop index items_contained_index;
 
create unique index categoryname on category(category_name);
create index shipperspeed on shipper(Delivery_speed);
-- the above index is for the delivery speed of a shipper which is being utilized in the API/query listShippersbySpeed where we need to find the shippers by a given speed
create index brandn on brand(brand_name);
-- for brandname 
create unique index prod_id on product(product_id);
create unique index product_name_brand_name on product(product_name,brand_name);
create index billing on billing_details(billing_id);
create unique index username_password on user(EmailID,Password);
create unique index items_contained_index on items_contained(Unique_id , Product_ID, Quantity);
