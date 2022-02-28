-- Delete User
SELECT *
CASE
    WHEN EXISTS where order_table.Date_Time + shipper.Delivery_speed DAY > CURRENT_DATE; THEN 
    ELSE delete from billing_details where billing_details.billing_id 
         IN (Select billing_id From order_table where order_table.Unique_id = 2); 
         delete from user where user.id = 2; 
         Select * 
         From billing_details
         Where billing_id = 2;
END
FROM order_table, shipper;
