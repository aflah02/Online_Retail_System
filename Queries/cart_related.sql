-- list out cart summary provied everything is in stock
select P.product_name as "Name",P.brand_name As Brand ,P.product_cost as "Product Cost",I.Quantity,P.product_cost*I.Quantity As Cost
from product P,Items_Contained I
where P.product_id=I.Product_ID and I.Unique_id = 1 and P.product_id IN (select product_id from INVENTORY where quantity>0);

-- list out total cart cost 
select Temp.Username, SUM(Temp.Total) as "Total cost"
from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
from User U, Items_Contained I,product P
where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from INVENTORY where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
group by Temp.Username;


--empty cart for a particular user
delete from Items_Contained where Items_Contained.Unique_id = 19;

--Remove particular product from cart for a particular user
delete from Items_Contained where Items_Contained.Unique_id = 19 and Items_Contained.product_id = 20;

--add to cart a particular product in a particular quantity to a particular user's cart
insert into Items_Contained values (19,20,5);

--calculate cost of a particular order
select order_id as "Order Number", sum(Items_purchased.quantity * (select product_cost from product where product.product_id = Items_purchased.product_id )) from Items_purchased where Items_purchased.order_id = 1;

--cancel an order


update inventory set quantity = quantity + (select quantity from items_purchased where 
order_id = 2 and inventory.product_id = items_purchased.product_id) where product_id in (select product_id from items_purchased where order_id = 2);

delete from items_purchased where order_id = 2;
delete from order_table where order_id = 2;

-- buy now
-- update inventory, update billing, insert into order, remove from cart
-- you have cart_id and Unique_id



update inventory set quantity = quantity - (select quantity from Items_contained 
where inventory.product_id = Items_contained.product_id and Items_contained.Unique_id = 1)
where product_id in (select product_id from Items_contained where Unique_id = 1);
-- inventory updated

insert into Billing_Details (payment_mode,billing_address) values ('Net Banking','East Avenue, New York');
-- inserted into billing_address

insert into order_table (31,'East Avenue, New York', 3,'2021-07-26 14:15:55',1,31);
insert into Items_purchased (31,5,15);
insert into Items_purchased (31,3,5);
insert into Items_purchased (31,8,2);

-- inserted into Order tables
delete from Items_contained where Unique_id = 1;

--buy now done

-- deleted from cart



-- list users with empty carts
