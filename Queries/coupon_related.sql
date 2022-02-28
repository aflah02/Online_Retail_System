-- Remove Expired Coupons
delete from coupon_data where coupon_data.ExpiryDate < CURRENT_DATE;

-- View Coupons which the User can Currently Use
CREATE VIEW usableCoupon AS
select *
from coupon_data
where coupon_data.ExpiryDate > CURRENT_DATE AND coupon_data.Unique_id = 5 AND coupon_data.isUsed = 0;