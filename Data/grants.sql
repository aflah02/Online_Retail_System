use retaildb;

-- role for our customers
-- create Role if not exists user_role;
grant select on retaildb.usableCouponView to customer@localhost;
grant select on retaildb.userProductView to customer@localhost;
grant select on retaildb.categoryUserView to customer@localhost;
grant select,update on retaildb.inventory to customer@localhost;
grant select, update,insert,delete on retaildb.items_purchased to customer@localhost;
grant select, update,insert,delete on retaildb.order_table to customer@localhost;
grant select on retaildb.shipper to customer@localhost;
grant select, insert,update,delete on retaildb.billing_details to customer@localhost;
grant select on retaildb.belongsto to customer@localhost;
grant select on retaildb.product to customer@localhost;
grant select on retaildb.brand to customer@localhost;
grant select on retaildb.category to customer@localhost;
grant select,update,insert,delete on retaildb.items_contained to customer@localhost;
grant select on retaildb.cart_data to customer@localhost;
grant select,update on retaildb.coupon_data to customer@localhost;
grant select on retaildb.user to customer@localhost;
grant select on retaildb.protectedUserView to customer@localhost;

-- role for our admins
create role if not exists admin_role;

grant all on retaildb.user to admin_role;
grant all on retaildb.coupon_data to admin_role;
-- not given admin any data related to cart and order
grant all on retaildb.category to admin_role;
grant all on retaildb.brand to admin_role;
grant all on retaildb.product to admin_role;
grant all on retaildb.belongsto to admin_role;
grant all on retaildb.billing_details to admin_role;
-- for the time being an admin does not have to write alter on other admins
grant select on retaildb.admin_table to admin_role;
grant all on retaildb.shipper to admin_role;
grant select,update,insert,delete,create,drop on retaildb.order_table to admin_role;
grant select,update,insert,delete,create,drop on retaildb.items_purchased to admin_role;
grant all on retaildb.inventory to admin_role;
grant all on retaildb.userProductView to admin_role;
grant all on retaildb.categoryUserView to admin_role;
grant all on retaildb.protectedUserView to admin_role;
grant all on retaildb.usableCouponView to admin_role;
