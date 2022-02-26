-- list out cart summary provied everything is in stock
select P.product_name as "Name",P.brand_name As Brand ,P.product_cost as "Product Cost",I.Quantity,P.product_cost*I.Quantity As Cost
from product P,Items_Contained I
where P.product_id=I.Product_ID and I.Unique_id = 1 and P.product_id IN (select product_id from INVENTORY where quantity>0);

-- list out total cart cost 

-- list users with empty carts