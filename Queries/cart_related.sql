-- list out cart summary provied everything is in stock
select P.product_name as "Name",P.brand_name As brand ,P.product_cost as "Product Cost",I.Quantity,P.product_cost*I.Quantity As Cost
from product P,items_contained I
where P.product_id=I.Product_ID and I.Unique_id = 1 and P.product_id IN (select product_id from inventory where quantity>0);

-- list out total cart cost 
select Temp.Username, SUM(Temp.Total) as "Total cost"
from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
from User U, items_contained I,product P
where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
group by Temp.Username;


-- empty cart for a particular user
delete from items_contained where items_contained.Unique_id = 19;

-- Remove particular product from cart for a particular user
delete from items_contained where items_contained.Unique_id = 19 and items_contained.product_id = 20;

-- add to cart a particular product in a particular quantity to a particular user's cart if order doesn't exist
insert into items_contained values (19,20,5);

-- add to cart a particular product in a particular quantity to a particular user's cart if order exists

update  items_contained 
set quantity = case 
    when product_id in (select product_id from items_contained where unique_id = 5) 
    then quantity + 10 
    else quantity  end;

-- calculate cost of a particular order
select order_id as "Order Number", sum(items_purchased.quantity * (select product_cost from product where product.product_id = items_purchased.product_id )) from items_purchased where items_purchased.order_id = 1;

-- cancel an order
update inventory set quantity = quantity + (select quantity from items_purchased where 
order_id = 2 and inventory.product_id = items_purchased.product_id) where product_id in (select product_id from items_purchased where order_id = 2);

delete from items_purchased where order_id = 2;
delete from order_table where order_id = 2;

-- buy now
-- update inventory, update billing, insert into order, remove from cart
-- you have cart_id and Unique_id
update inventory set quantity = quantity - (select quantity from items_contained 
where inventory.product_id = items_contained.product_id and items_contained.Unique_id = 1)
where product_id in (select product_id from items_contained where Unique_id = 1);

-- inventory updated

insert into billing_details (payment_mode,billing_address) values ('Net Banking','East Avenue, New York');
-- inserted into billing_address

insert into order_table values (31,'East Avenue, New York', 3,'2021-07-26 14:15:55',1,31);
insert into items_purchased values (31,5,15);
insert into items_purchased values (31,3,5);
insert into items_purchased values (31,8,2);

-- inserted into Order tables
delete from items_contained where Unique_id = 1;

-- deleted from cart
-- buy now done

-- all orders with cost < average 
 select * from order_table where (select Order_id from items_purchased where cost < (select avg(cost) from items_purchased group by (Order_id)));
-- all orders from a particular user
select * from items_purchased where Order_id in (select Order_id from order_table where Unique_id = 1);



-- list users with empty carts
