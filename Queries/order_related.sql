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