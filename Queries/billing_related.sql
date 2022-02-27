-- Get Billing Details for an Order
Use retaildb;
Select * From billing_details, order_table
Where billing_details.billing_id = order_table.billing_id AND billing_details.billing_id = 1



