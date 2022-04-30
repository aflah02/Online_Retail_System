-- Delete User
-- use retaildb;
-- delete from billing_details where billing_details.billing_id 
-- IN (Select billing_id From order_table where order_table.Unique_id = 2) 
-- AND NOT EXISTS (Select * From order_table,shipper 
-- Where order_table.Unique_id=2 and DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) < 0
-- AND order_table.Shipper_id = shipper.shipper_id);
-- delete from user where user.id = 2 AND NOT EXISTS (Select * From order_table where order_table.Unique_id=2);
-- SELECT 
--     *
-- FROM
--     order_table
-- WHERE
--     Unique_id = 2;
-- select * from user where id=2;
-- View products using user privileges
-- Create VIEW userProductView AS
SELECT product_name, product_cost, brand_name
From product;

-- view categories from user privileges
create view categoryUserView as 
select category_name, category_info from category;

use retaildb;
delete from billing_details where billing_details.billing_id 
IN (Select billing_id From order_table where order_table.Unique_id = 2) 
AND NOT EXISTS (Select * From order_table,shipper 
Where order_table.Unique_id=2 and DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) < 0
AND order_table.Shipper_id = shipper.shipper_id);
delete from user where user.id = 2 AND NOT EXISTS (Select * From order_table where order_table.Unique_id=2);
SELECT 
    *
FROM
    order_table
WHERE
    Unique_id = 2;
select * from user where id=2;
