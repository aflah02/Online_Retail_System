-- List customer orders by shipper name
SELECT O.order_id, U.name AS "Customer Name", O.delivery_address, S.shipper_name, S.delivery_speed
FROM Order_table O, Shipper S, User U
WHERE O.shipper_id = S.shipper_id AND U.id = O.unique_id;

-- Update the inventory of a product by its name & brand
UPDATE Inventory I
SET I.quantity = I.quantity + 10
WHERE I.product_id = (
    SELECT product_id from product where product_name = 'Milk' AND brand_name='Amul'
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
FROM Shipper S
WHERE S.delivery_speed >= 2;

