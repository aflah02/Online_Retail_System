-- List customer orders by shipper name
SELECT O.order_id, U.name AS "Customer Name", O.delivery_address, S.shipper_name, S.delivery_speed
FROM order_table O NATURAL JOIN shipper S INNER JOIN User U ON U.id=O.Unique_id
WHERE S.shipper_name="Nicolas LLC";

-- Update the inventory of a product by its name & brand
UPDATE Inventory I
SET I.quantity = I.quantity + 10
WHERE I.product_id = (
    SELECT product_id from product where product_name = 'Milk' AND brand_name='London Dairy'
);

-- list all orders where there exists atleast one product belonging to a particular category (say Electronics)
SELECT * from order_table where order_id in (
    SELECT DISTINCT I.order_id from items_purchased I where I.product_id in (
        SELECT product_id from belongsTo where category_id = (
            SELECT category_id from category where category_name = 'Electronics'
        )
    )
);

-- List all shippers with speed >=2
SELECT S.shipper_name, S.delivery_speed
FROM shipper S
WHERE S.delivery_speed >= 2;

-- update product cost 
UPDATE product I
SET I.product_cost = I.product_cost + 10
WHERE I.product_name='Milk' and I.brand_name='London Dairy';

-- insert a new product
DELETE FROM brand WHERE brand_name='Google';
DELETE FROM product WHERE product_id=46;
delete from belongsto where product_id=46 and category_id=11;
delete from inventory where product_id=46;
insert into brand values ('Google');
insert into product (product_id, product_name,product_cost ,brand_name) values (46, 'Pixel',20000 ,'Google');
insert into belongsTo (product_id,category_id) values (46,11);
insert into inventory (product_id, quantity) values (46, 1);

-- View users using admin privileges
Create VIEW protectedUserView AS
SELECT id, address, name, EmailID, PhoneNumber
From user;
SELECT P.Product_ID,B.category_id,SUM(P.Cost) Cost,AVG(P.Cost) OVER( PARTITION BY B.category_id ORDER BY P.cost DESC) AS Avg_Cost
            FROM items_purchased P NATURAL JOIN belongsTo B
            GROUP BY P.Product_ID;

# Show average purchase cost of each product category next to purchased products
SELECT T.Product_ID,T.category_id,T.Cost,AVG(T.Cost) OVER( PARTITION BY T.category_id) AS Avg_Category_Cost
FROM (SELECT P.Product_ID AS Product_ID,B.category_id AS category_id, SUM(P.Cost) AS Cost FROM items_purchased P NATURAL JOIN belongsTo B GROUP BY P.Product_ID) AS T;
