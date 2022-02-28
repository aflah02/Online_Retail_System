Use retaildb;
SET FOREIGN_KEY_CHECKS=0;
delete from Coupon_Data where Coupon_Data.Expiry_Date < CURRENT_DATE;
SET FOREIGN_KEY_CHECKS=1;