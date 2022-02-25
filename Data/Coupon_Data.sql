create table Coupon_Data (
	Coupon_id VARCHAR(40) NOT NULL,
	Discount INT NOT NULL,
	Expiry_Date DATE NOT NULL,
	Unique_id INT NOT NULL,
	FOREIGN KEY(Unique_id) REFERENCES User(id) on DELETE CASCADE,
	PRIMARY KEY(Coupon_id)
);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('67697c5b-3ee5-4f67-921e-ae8dbb7d31d0', 7, '2022/08/16', 1);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('a93cca35-d0c5-478a-ad4f-6423f5ae2a04', 10, '2022/07/30', 1);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('aa698af7-bbee-4fa7-947b-dfbeed38b302', 26, '2022/06/11', 2);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('afcbc8e5-b841-44cb-85fa-d857952e5b01', 7, '2021/06/19', 2);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('f6a84202-12b2-4d53-9eff-16dfceaf0fef', 21, '2022/04/29', 3);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('908eb765-715d-4b14-aa01-1f93bc17bc0e', 3, '2021/02/03', 3);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('46fc3118-0359-4a3c-a783-845e58ddb9c5', 24, '2022/06/19', 3);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('938602a3-74d4-487b-9500-a479fe6da290', 25, '2022/11/08', 4);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('ad8bf759-3954-47b9-8d7c-93a21fb1cd53', 22, '2022/02/25', 5);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('52f20ca3-a2f6-4ac6-92bf-e67166def383', 5, '2021/03/27', 5);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('06f76098-2a14-440a-ae54-aaa28cbbd0e1', 22, '2022/06/11', 5);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('603a6be4-a124-47cb-b47d-11e909fc94d9', 4, '2021/09/22', 6);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('77795b05-0826-4eee-a533-d2b24e562ca4', 16, '2021/06/30', 6);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('d52e99f6-05d7-4ee4-b250-86671bdf6c14', 12, '2021/12/22', 6);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('c419f259-dcdf-4bd6-97bb-d753ba03921f', 9, '2022/02/22', 7);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('ee3a74f3-e3de-4c5b-a073-354655ffad88', 18, '2022/11/22', 7);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('e757d04b-ecdd-4844-8412-731cb3743e88', 13, '2022/03/27', 7);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('a846573b-14c7-4d0a-a454-f1071fb7bd20', 7, '2021/11/13', 8);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('a7b12bc7-841b-46c4-a49e-56b6fe672511', 10, '2022/07/28', 8);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('811bac9c-3b88-4204-b4d6-c2bb1a679c82', 21, '2021/03/13', 8);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('d685e1cb-bb08-40ed-ad44-e323b1e1f8df', 5, '2021/06/12', 9);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('6166c27f-fe41-4881-940b-7ebeacbb410b', 3, '2022/11/26', 9);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('93cae097-853c-4918-947e-516117056a54', 19, '2022/03/27', 9);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('276bb82a-b104-483b-8a4e-b5738c097720', 1, '2021/09/14', 9);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('a4fd1418-14aa-471e-b471-75642c4d3e08', 19, '2021/07/21', 10);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('1a10016c-54e6-447d-879a-28b9dc108954', 16, '2022/08/18', 11);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('9cbbdad8-50bd-477d-90a2-c648f00cf66c', 22, '2022/10/25', 12);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('048fcec9-c3f3-4ae2-b844-2bc18aed2a3c', 29, '2021/05/21', 12);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('3b621220-6f6d-4c56-8e04-b7776e07834e', 1, '2022/01/22', 12);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('d658e5cd-f8b1-4012-bc1f-42f7ede17740', 20, '2022/09/09', 12);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('939ebf85-187e-4405-8960-8605d8ad6f05', 1, '2022/08/22', 13);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('715ceee7-354f-432b-bfa4-e3bef608929b', 9, '2021/11/27', 13);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('5b73371b-262d-47d9-9730-c8c341090c2c', 2, '2021/03/29', 13);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('48734c96-fb8c-4ca4-8221-84cd5cf4b2f1', 1, '2021/07/26', 13);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('ad7876ff-4522-4be2-86df-1880f586e21f', 22, '2021/07/21', 14);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('34fb6bcf-335e-4684-a9d2-abb764f7bb63', 3, '2022/04/21', 14);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('7fbfccb4-13a8-47eb-8b97-6afdcc7d0c20', 21, '2021/03/21', 14);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('09c2a756-720b-4448-bbe1-f8abc69b5be3', 4, '2022/05/01', 15);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('649ff353-1d4a-47aa-946b-b7f68d29d2cc', 25, '2022/03/08', 15);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('7256d7cf-c419-4280-89c0-eb1573132ad5', 4, '2021/12/12', 16);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('56b92b44-dbdb-47c7-8060-b2401eab203d', 19, '2022/01/22', 16);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('3e087439-51bc-4b6d-91bc-24cfbf4f872f', 18, '2021/09/22', 17);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('1e7e1e0d-df54-42cb-99f1-2057f44e8a8f', 29, '2021/06/16', 17);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('8a8e7f20-aff7-48ba-8def-426e036720c1', 6, '2021/08/17', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('c4560834-3fbb-4f93-874d-310bba6a6f32', 22, '2022/09/16', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('3a80ce0c-c20b-4b4d-8a88-799153f55efe', 3, '2022/04/10', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('a8272772-a40a-433f-9d91-098e3dcd967f', 20, '2022/11/19', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('ef6f875e-c6ca-420d-a51b-d117ad86b669', 24, '2022/01/05', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('b01b2855-e879-4c72-8fd7-faeee12fdb06', 11, '2021/09/27', 18);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('3d4785e6-8f08-41f3-8aa3-18d02a09e86b', 24, '2022/03/12', 19);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('44ce5d8c-8229-42aa-93b6-a4e2b43b771c', 10, '2022/10/27', 19);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('5c476751-5ed8-4bbf-b258-ea60c85f18a1', 19, '2022/11/19', 19);
insert into Coupon_Data (Coupon_id, Discount, Expiry_Date, Unique_id) values ('72de7d06-c7a4-4ac6-b397-cedba792c8ad', 20, '2022/12/12', 19);