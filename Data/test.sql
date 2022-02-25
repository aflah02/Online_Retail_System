CREATE TRIGGER Items_Purchased.getCost
ON Items_Purchased
AFTER INSERT
AS
BEGIN
    -- SET NOCOUNT ON;
    UPDATE Items_Purchased I SET cost = INSERTED.Quantity*(FROM product SELECT product_cost Where product_id = INSERTED.Product_ID) WHERE I.Order_id = INSERTED.Order_ID AND I.Product_ID = INSERTED.Product_ID AND I.Product_ID = Inserted.Product_ID; 
END