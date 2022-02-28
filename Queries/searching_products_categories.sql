-- search using product name
select product_name, product_cost,brand_name
from product
where product_name='Milk' and exists(
select product_id 
from inventory
where inventory.product_id = product.product_id and inventory.quantity>0);

-- search using brand name
select product_name, product_cost,brand_name
from product
where brand_name='Nike' and exists(
select product_id 
from inventory
where inventory.product_id = product.product_id and inventory.quantity>0);

-- search using product cost
select product_name, product_cost, brand_name
from product P
where product_cost>=10000 and product_id IN (select product_id from inventory I where I.product_id=P.product_id and I.quantity>0);

-- search products using category name
select product_name,product_cost,brand_name
from product natural join belongsto
where category_id IN
(select category_id
from category
where category_name='Electronics');

-- list all categories and information
select category_name,category_info
from category

