-- Remove Expired Coupons
delete from coupon_table where coupon_table.expiry_date < CURRENT_DATE;`