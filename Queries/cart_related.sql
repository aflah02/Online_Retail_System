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

-- list users with empty carts
