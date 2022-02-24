create table category (
	category_id INT NOT NULL,
	category_name VARCHAR(50) NOT NULL,
	category_info VARCHAR(50),
    PRIMARY KEY(category_id)
);
insert into category (category_id, category_name, category_info) values (1, 'Food', 'This category encompasses all food items');
insert into category (category_id, category_name, category_info) values (2, 'Health', 'This category is aimed for the people trying to live healthier lives');
insert into category (category_id, category_name, category_info) values (3, 'Beauty', 'For those who want to sparkle');
insert into category (category_id, category_name, category_info) values (4, 'Clothes', 'This covers everything that you would need from top to bottom');
insert into category (category_id, category_name, category_info) values (5, 'Furtniture', 'Furniture for both home and work');
insert into category (category_id, category_name, category_info) values (6, 'Daily_Items', 'The items you would use on your daily basis');
insert into category (category_id, category_name, category_info) values (7, 'Appliances', 'The appliances you need');
insert into category (category_id, category_name, category_info) values (8, 'Books', 'All genres available');
insert into category (category_id, category_name, category_info) values (9, 'Beverages', 'Cocktails not available');
insert into category (category_id, category_name, category_info) values (10, 'Ready To Eat', 'When you just wanna enjoy a home cooked meal without going through the effort');
insert into category (category_id, category_name, category_info) values (11, 'Electronics', 'Electronic items');
insert into category (category_id, category_name, category_info) values (12, 'Sports Equipment', 'This category encompasses all you would want to satisfy the athlete within you');

create table Brand (
	brand_name VARCHAR(50) NOT NULL,
    primary key(brand_name)
);
insert into Brand (brand_name) values ('Amul');
insert into Brand (brand_name) values ('London Dairy');
insert into Brand (brand_name) values ('Britannia');
insert into Brand (brand_name) values ('Nestle');
insert into Brand (brand_name) values ('Kelloggs');
insert into Brand (brand_name) values ('FitBit');
insert into Brand (brand_name) values ('Amway');
insert into Brand (brand_name) values ('Loreal');
insert into Brand (brand_name) values ('Nivea');
insert into Brand (brand_name) values ('Gillette');
insert into Brand (brand_name) values ('Dove');
insert into Brand (brand_name) values ('Adidas');
insert into Brand (brand_name) values ('Nike');
insert into Brand (brand_name) values ('Puma');
insert into Brand (brand_name) values ('Gap');
insert into Brand (brand_name) values ('Coca-Cola');
insert into Brand (brand_name) values ('Dabur');
insert into Brand (brand_name) values ('PepsiCo');
insert into Brand (brand_name) values ('Samsung');
insert into Brand (brand_name) values ('LG');
insert into Brand (brand_name) values ('Whirlpool');
insert into Brand (brand_name) values ('Godrej Interio');
insert into Brand (brand_name) values ('Apple');
insert into Brand (brand_name) values ('JBL');
insert into Brand (brand_name) values ('Haldirams');

create table product (
	product_id INT NOT NULL,
	primary key(product_id),
	product_name VARCHAR(50) NOT NULL,
    product_cost Decimal(10,2) NOT NULL,
	brand_name VARCHAR(50) NOT NULL, 
    Foreign key(brand_name) references Brand(brand_name) On delete Cascade
);
insert into product (product_id, product_name,product_cost ,brand_name) values (1, 'Milk',10, 'Amul');
insert into product (product_id, product_name,product_cost ,brand_name) values (2, 'Ghee', 20,'Amul');
insert into product (product_id, product_name,product_cost ,brand_name) values (3, 'Milk', 11,'London Dairy');
insert into product (product_id, product_name,product_cost ,brand_name) values (4, 'Biscuit', 5,'Britannia');
insert into product (product_id, product_name,product_cost ,brand_name) values (5, 'Bread', 20,'Britannia');
insert into product (product_id, product_name,product_cost ,brand_name) values (6, 'Maggie', 12,'Nestle');
insert into product (product_id, product_name,product_cost ,brand_name) values (7, 'Chocolate',5,'Nestle');
insert into product (product_id, product_name,product_cost ,brand_name) values (8, 'Corn Flakes',100 ,'Kelloggs');
insert into product (product_id, product_name,product_cost ,brand_name) values (9, 'Chocos',120 ,'Kelloggs');
insert into product (product_id, product_name,product_cost ,brand_name) values (10, 'Watch',5000,'FitBit');
insert into product (product_id, product_name,product_cost ,brand_name) values (11, 'Cream', 80,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (12, 'Suppliments',500 ,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (13, 'Toothpaste',1000,'Amway');
insert into product (product_id, product_name,product_cost ,brand_name) values (14, 'Shampoo',100 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (15, 'Shaving Cream',200 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (16, 'Conditioner',80 ,'Loreal');
insert into product (product_id, product_name,product_cost ,brand_name) values (17, 'Cream', 50,'Nivea');
insert into product (product_id, product_name,product_cost ,brand_name) values (18, 'Shaving cream',160 ,'Nivea');
insert into product (product_id, product_name,product_cost ,brand_name) values (19, 'Shaving Cream',170,'Gillette');
insert into product (product_id, product_name,product_cost ,brand_name) values (20, 'Soap', 20,'Dove');
insert into product (product_id, product_name,product_cost ,brand_name) values (21, 'Shoes',10000 ,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (22, 'Football',1200 ,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (23, 'Bag', 1000,'Adidas');
insert into product (product_id, product_name,product_cost ,brand_name) values (24, 'T-shirt',500,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (25, 'Shoes', 5000,'Nike');
insert into product (product_id, product_name,product_cost ,brand_name) values (26, 'Shoes',6000 ,'Puma');
insert into product (product_id, product_name,product_cost ,brand_name) values (27, 'T-shirt',500 ,'Gap');
insert into product (product_id, product_name,product_cost ,brand_name) values (28, 'Shirt',1000 ,'Gap');
insert into product (product_id, product_name,product_cost ,brand_name) values (29, 'Coke', 50,'Coca-Cola');
insert into product (product_id, product_name,product_cost ,brand_name) values (30, 'Sprite',45 ,'Coca-Cola');
insert into product (product_id, product_name,product_cost ,brand_name) values (31, 'Honey', 50,'Dabur');
insert into product (product_id, product_name,product_cost ,brand_name) values (32, 'Pepsi',100 ,'PepsiCo');
insert into product (product_id, product_name,product_cost ,brand_name) values (33, 'TV',120000 ,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (34, 'Fridge', 10000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (35, 'S22',500,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (36, 'Air Conditioner', 5000,'Samsung');
insert into product (product_id, product_name,product_cost ,brand_name) values (37, 'TV',6000 ,'LG');
insert into product (product_id, product_name,product_cost ,brand_name) values (38, 'Fridge',50000 ,'LG');
insert into product (product_id, product_name,product_cost ,brand_name) values (39, 'Washing Machine',10000 ,'Whirlpool');
insert into product (product_id, product_name,product_cost ,brand_name) values (40, 'Sofa', 5000,'Godrej Interio');
insert into product (product_id, product_name,product_cost ,brand_name) values (41, 'Iphone',100000 ,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (42, 'Airpods',22000 ,'Apple');
insert into product (product_id, product_name,product_cost ,brand_name) values (43, 'Earbuds',1000 ,'JBL');
insert into product (product_id, product_name,product_cost ,brand_name) values (44, 'Bhujia',100 ,'Haldirams');
insert into product (product_id, product_name,product_cost ,brand_name) values (45, 'Dal Makhni',200 ,'Haldirams');

create table belongsTo(
	product_id INT NOT NULL,
	category_id INT NOT NULL,
	Foreign key(product_id) references product(product_id) on delete cascade,
	Foreign key(category_id) references category(category_id) on delete cascade,
	Primary key(product_id,category_id)
);
insert into belongsTo(product_id, category_id) values (1,1);
insert into belongsTo(product_id, category_id) values (1,6);
insert into belongsTo(product_id, category_id) values (1,9);
insert into belongsTo(product_id, category_id) values (2,1);
insert into belongsTo(product_id, category_id) values (2,6);
insert into belongsTo(product_id, category_id) values (3,1);
insert into belongsTo(product_id, category_id) values (3,6);
insert into belongsTo(product_id, category_id) values (3,9);
insert into belongsTo(product_id, category_id) values (4,1);
insert into belongsTo(product_id, category_id) values (5,1);
insert into belongsTo(product_id, category_id) values (5,6);
insert into belongsTo(product_id, category_id) values (6,1);
insert into belongsTo(product_id, category_id) values (7,1);
insert into belongsTo(product_id, category_id) values (8,1);
insert into belongsTo(product_id, category_id) values (8,6);
insert into belongsTo(product_id, category_id) values (8,2);
insert into belongsTo(product_id, category_id) values (8,10);
insert into belongsTo(product_id, category_id) values (9,1);
insert into belongsTo(product_id, category_id) values (9,6);
insert into belongsTo(product_id, category_id) values (9,10);
insert into belongsTo(product_id, category_id) values (10,2);
insert into belongsTo(product_id, category_id) values (10,11);
insert into belongsTo(product_id, category_id) values (10,12);
insert into belongsTo(product_id, category_id) values (11,3);
insert into belongsTo(product_id, category_id) values (12,2);
insert into belongsTo(product_id, category_id) values (13,6);
insert into belongsTo(product_id, category_id) values (13,3);
insert into belongsTo(product_id, category_id) values (13,2);
insert into belongsTo(product_id, category_id) values (14,6);
insert into belongsTo(product_id, category_id) values (14,3);
insert into belongsTo(product_id, category_id) values (14,2);
insert into belongsTo(product_id, category_id) values (15,3);
insert into belongsTo(product_id, category_id) values (16,3);
insert into belongsTo(product_id, category_id) values (17,3);
insert into belongsTo(product_id, category_id) values (18,3);
insert into belongsTo(product_id, category_id) values (19,3);
insert into belongsTo(product_id, category_id) values (20,3);
insert into belongsTo(product_id, category_id) values (20,6);
insert into belongsTo(product_id, category_id) values (21,12);
insert into belongsTo(product_id, category_id) values (22,12);
insert into belongsTo(product_id, category_id) values (23,6);
insert into belongsTo(product_id, category_id) values (24,4);
insert into belongsTo (product_id,category_id) values (25,12);
insert into belongsTo (product_id,category_id) values (26,12);
insert into belongsTo (product_id,category_id) values (27,4);
insert into belongsTo (product_id,category_id) values (28,4);
insert into belongsTo (product_id,category_id) values (29,9);
insert into belongsTo (product_id,category_id) values (29,1);
insert into belongsTo (product_id,category_id) values (30,9);
insert into belongsTo (product_id,category_id) values (30,1);
insert into belongsTo (product_id,category_id) values (31,1);
insert into belongsTo (product_id,category_id) values (31,2);
insert into belongsTo (product_id,category_id) values (32,9);
insert into belongsTo (product_id,category_id) values (32,1);
insert into belongsTo (product_id,category_id) values (33,11);
insert into belongsTo (product_id,category_id) values (33,7);
insert into belongsTo (product_id,category_id) values (34,7);
insert into belongsTo (product_id,category_id) values (35,11);
insert into belongsTo (product_id,category_id) values (36,7);
insert into belongsTo (product_id,category_id) values (37,11);
insert into belongsTo (product_id,category_id) values (37,7);
insert into belongsTo (product_id,category_id) values (38,7);
insert into belongsTo (product_id,category_id) values (39,7);
insert into belongsTo (product_id,category_id) values (40,5);
insert into belongsTo (product_id,category_id) values (41,11);
insert into belongsTo (product_id,category_id) values (42,11);
insert into belongsTo (product_id,category_id) values (43,11);
insert into belongsTo (product_id,category_id) values (44,1);
insert into belongsTo (product_id,category_id) values (44,10);
insert into belongsTo (product_id,category_id) values (45,1);
insert into belongsTo (product_id,category_id) values (45,10);

