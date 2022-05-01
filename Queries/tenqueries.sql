SELECT T.Product_ID,T.category_id,T.Cost,AVG(T.Cost) OVER( PARTITION BY T.category_id) AS Avg_Category_Cost
FROM (SELECT P.Product_ID AS Product_ID,B.category_id AS category_id, SUM(P.Cost) AS Cost FROM items_purchased P NATURAL JOIN belongsTo B GROUP BY P.Product_ID) AS T;

--------------------------------------------
Select Product_ID, HighestSeller from (
            SELECT  Product_ID, SUM(Quantity) Quantity, rank () over (order by Quantity desc) as HighestSeller
            FROM    items_purchased
            GROUP BY Product_ID) as H;
--------------------------------------------
 Select Product_ID, HighestSeller from (
            SELECT  Product_ID, Quantity, SUM(Cost) Cost, rank () over (order by Cost desc) as HighestSeller
            FROM    items_purchased
            GROUP BY Product_ID) as H;

--------------------------------------------

-- delete user
delete from billing_details where billing_details.billing_id 
IN (Select billing_id From order_table where order_table.Unique_id = 4) 
AND NOT EXISTS (Select * From order_table,shipper 
Where order_table.Unique_id=4 and DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) < 0
AND order_table.Shipper_id = shipper.shipper_id);
delete from user where user.id = 4 AND NOT EXISTS (Select * From order_table where order_table.Unique_id=4);

SELECT 
    *
FROM
    order_table
WHERE
    Unique_id = 4;
select * from user where id=4;

-----------------------------------------------

    -- cancel order
-- check whether it is undelivered or not
Select order_table.billing_id From order_table,shipper 
Where order_table.Order_id=4 AND order_table.Shipper_id = shipper.shipper_id and DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) < 0;

-- update inventory
UPDATE inventory, items_purchased SET inventory.quantity = inventory.quantity + items_purchased.Quantity WHERE items_purchased.Order_id=4 and items_purchased.Product_ID=inventory.product_id;


-- delete order 
delete from billing_details where billing_details.billing_id 
IN (Select billing_id From order_table where order_table.Order_id = 4);

SELECT * from order_table where Order_id=4;

-------------------------------------------------

-- cart total - returns the cart total of all the users when products are in the inventory

select Temp.Username, SUM(Temp.Total) as "Total cost"
        from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
        from User U, items_contained I,product P
        where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
        group by Temp.Username;

-------------------------------------------------
-- List customer orders by shipper name
SELECT O.order_id, U.name AS "Customer Name", O.delivery_address, S.shipper_name, S.delivery_speed
                           FROM order_table O NATURAL JOIN shipper S INNER JOIN User U ON U.id=O.Unique_id
                           WHERE S.shipper_name='Witting, Jenkins and Fadel';

------------------------------------------------

-- cart total post coupon
select * from (select Temp.Unique_id, Temp.Username, SUM(Temp.Total) as "Total cost"
            from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
            from User U, items_contained I,product P
            where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from inventory where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
            group by Temp.Unique_id) as BigTemp where BigTemp.Unique_id = 1;

------------------------------------------------

-- list all orders where there exists atleast one product belonging to a particular category (say Electronics)
SELECT * from order_table where order_id in (
    SELECT DISTINCT I.order_id from items_purchased I where I.product_id in (
        SELECT product_id from belongsTo where category_id = (
            SELECT category_id from category where category_name = 'Electronics'
        )
    )
);
------------------------------------------------
-- search products using category name
select product_name,product_cost,brand_name
from product natural join belongsto
where category_id IN
(select category_id
from category
where category_name='Electronics');


------------------------------------------------
-- buy now

select product_id, product_name,brand_name from product where product_id IN (select items_contained.Product_ID as id from items_contained,inventory where items_contained.Unique_id=1 and items_contained.Product_ID=inventory.product_id and items_contained.Quantity>inventory.quantity);
insert into billing_details (payment_mode, billing_address) values ('Net Banking', '2923 Street');
select max(billing_id) from billing_details;
insert into order_table (Delivery_Address,Shipper_id, Date_Time, Unique_id, billing_id ) values ('2923 Street',1,CURDATE(), 1, 31);
insert into order_table (Delivery_Address,Shipper_id, Date_Time, Unique_id, billing_id,couponID ) values ('2923 Street',1,CURDATE(), 1, 31,'67697c5b-3ee5-4f67-921e-ae8dbb7d31d0');
Select max(Order_id) from order_table;
INSERT INTO items_purchased (Order_id, Product_ID, Quantity) SELECT 31, Product_ID, Quantity FROM items_contained where Unique_id=1;
UPDATE inventory, items_contained SET inventory.quantity = inventory.quantity - items_contained.Quantity WHERE items_contained.Unique_id=1 and items_contained.Product_ID=inventory.product_id;

------------------------------------------------

-- list out cart summary provied everything is in stock
select P.product_name as "Name",P.brand_name As brand ,P.product_cost as "Product Cost",I.Quantity,P.product_cost*I.Quantity As Cost
from product P,items_contained I
where P.product_id=I.Product_ID and I.Unique_id = 1 and P.product_id IN (select product_id from inventory where quantity>0);
