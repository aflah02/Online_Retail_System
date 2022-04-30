-- this query is a trial for buy_now

-- first part select those product whose inventory cannot support quantities
use retaildb;
select product_id, product_name,brand_name
from product
where product_id IN
(select items_contained.Product_ID as id
from items_contained,inventory
where items_contained.Unique_id=1 and items_contained.Product_ID=inventory.product_id and items_contained.Quantity>inventory.quantity);

-- now adding items from cart to order table and billing_details
insert into billing_details (payment_mode, billing_address) values ('Net Banking', '39450 Leroy Street');

insert into order_table (Delivery_Address, Date_Time, Unique_id, billing_id ) values ('827 Pearson Pass', 14, CURDATE(), 1, 1);

-- insert into items_purchased (Order_id, Product_ID, Quantity) values (1, 33, 1);
INSERT INTO items_purchased (Order_id, Product_ID, Quantity)
SELECT 1, Product_ID, Quantity
FROM items_contained where Unique_id=1;

-- update inventory and empty cart and update details in car
UPDATE inventory
SET inventory.quantity=inventory.quantity - (SELECT items_contained.Quantity
  FROM items_contained
  WHERE items_contained.Unique_id=1 and items_contained.Product_ID=inventory.product_id);
  
  
  select max(billing_id) from billing_details;
  
  -- cancel order
-- check whether it is undelivered or not
Select order_table.billing_id From order_table,shipper 
Where order_table.Order_id=4 AND order_table.Shipper_id = shipper.shipper_id and DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) < 0;

-- update inventory
UPDATE inventory, items_purchased SET inventory.quantity = inventory.quantity + items_purchased.Quantity WHERE items_purchased.Order_id=4 and items_purchased.Product_ID=inventory.product_id;


-- delete order 
delete from billing_details where billing_details.billing_id 
IN (Select billing_id From order_table where order_table.Order_id = 4);
use retaildb;
select * from order_table where Order_id=4;
select * from items_purchased where Order_id=4;
select * from items_purchased where Order_id in (select Order_id from order_table where Unique_id = 1);
select * from inventory;