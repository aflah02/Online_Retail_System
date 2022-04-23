use retaildb;

-- role for our customers
create Role if not exists user_role;
grant select on usableCouponView to user_role;
grant select on userProductView to user_role;
grant select on categoryUserView to user_role;
grant select on inventory to user_role;
grant select, update,insert,delete on items_purchased to user_role;
grant select, update,insert,delete on order_table to user_role;
grant select on shipper to user_role;
grant select, insert,update,delete on billing_details to user_role;
grant select on belongsto to user_role;
grant select on product to user_role;
grant select on brand to user_role;
grant select on category to user_role;
grant select,update,insert,delete on items_contained to user_role;
grant select on cart_data to user_role;
grant select,update on coupon_data to user_role;
grant select on protectedUserView to user_role;

-- role for our admins
create role if not exists admin_role;

grant all on user to admin_role;
grant all on coupon_data to admin_role;
-- not given admin any data related to cart and order
grant all on category to admin_role;
grant all on brand to admin_role;
grant all on product to admin_role;
grant all on belongsto to admin_role;
grant all on billing_details to admin_role;
-- for the time being an admin does not have to write alter on other admins
grant select on admin_table to admin_role;
grant all on shipper to admin_role;
grant select,update,insert,delete,create,drop on order_table to admin_role;
grant select,update,insert,delete,create,drop on items_purchased to admin_role;
grant all on inventory to admin_role;
grant all on userProductView to admin_role;
grant all on categoryUserView to admin_role;
grant all on protectedUserView to admin_role;
grant all on usableCouponView to admin_role;
