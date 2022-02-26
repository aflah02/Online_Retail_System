-- select Temp.Username, Temp.Total as "Total cost"
-- from (select Items_Contained.Unique_id,Items_Contained.Product_ID,User.NAME as Username, SUM(Items_Contained.Quantity*product.product_cost) as Total
-- from User, Items_Contained,product
-- where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from INVENTORY where quantity>0)) as Temp;
-- Select *
-- From cart_data, Items_Contained
-- Where cart_data.Unique_id = Items_Contained.Unique_id group by cart_data.Unique_id, items_contained.Product_ID

select Temp.Username, SUM(Temp.Total) as "Total cost"
from (select I.Unique_id,I.Product_ID,U.NAME as Username, SUM(I.Quantity*P.product_cost) as Total
from User U, Items_Contained I,product P
where P.product_id=I.Product_ID and I.Unique_id=U.id and P.product_id IN (select product_id from INVENTORY where quantity>0) Group BY I.Unique_id,I.Product_ID) as Temp
group by Temp.Username;
