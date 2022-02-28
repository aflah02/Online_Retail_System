-- Remove Expired Coupons
delete from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE;