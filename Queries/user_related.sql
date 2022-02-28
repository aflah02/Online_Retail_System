-- Delete User
delete from billing_details where billing_details.billing_id 
IN (Select billing_id From order_table where order_table.Unique_id = 3) 
AND EXISTS (Select * From order_table,shipper 
Where DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) > 0
AND order_table.Shipper_id = shipper.shipper_id And order_table.billing_id=billing_details.billing_id);
delete from user where user.id = 3 AND NOT EXISTS (Select * From order_table,shipper 
Where DATEDIFF(CURRENT_DATE, DATE_ADD(order_table.Date_Time, INTERVAL shipper.Delivery_speed DAY)) > 0 
AND order_table.Shipper_id = shipper.shipper_id);
SELECT 
    *
FROM
    order_table
WHERE
    Unique_id = 3
