select product_name, product_cost,brand_name
from product
where product_name='Milk' and exists(
select product_id 
from INVENTORY
where INVENTORY.product_id = product.product_id and INVENTORY.quantity>0);
