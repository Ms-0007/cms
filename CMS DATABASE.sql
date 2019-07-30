USE CMS;
CREATE TABLE ITEM(ItemIdPk int PRIMARY KEY,Price int,quantity int);
INSERT INTO ITEM(ItemIdPk,Price,quantity) values(101,25,2);
INSERT INTO ITEM(ItemIdPk,Price,quantity) values(102,35,2);
INSERT INTO ITEM(ItemIdPk,Price,quantity) values(104,40,2);
SELECT * FROM ITEM;

CREATE TABLE CUSTOMER(
CustIdPk int PRIMARY KEY auto_increment,Email varchar(250),Contact int,Custname varchar(250),LoginId int,Pwd varchar(250));
INSERT INTO CUSTOMER(Email,Contact,Custname,LoginId,Pwd) VALUES('hgh@gmail.com',64889,'raghav',4556,'cgfh584');
INSERT INTO CUSTOMER(Email,Contact,Custname,LoginId,Pwd) VALUES('shiva@gmail.com',656479,'ragha',445,'a48');
select * from CUSTOMER;

CREATE TABLE WALLET
(
WalletIdPk int primary key auto_increment,
WalletBalance decimal(5,2),
WalletModifiedDate varchar(50),
CustIdFk int,
foreign key(CustIdFk) references CUSTOMER(CustIdPk)
);
select * from WALLET;

CREATE TABLE USERS(
LoginIdPk int Primary key auto_increment,
Userstype CHAR(255),
psw varchar(200)
);
insert into USERS(Userstype,psw) values("customer","878589lk46");
insert into USERS(Userstype,psw) values("Vendor","878546");
select * from USERS;

CREATE TABLE VENDOR(
VendorIdPk int primary key auto_increment,
Vendorname CHAR(255),
contact int8
);
insert into VENDOR(Vendorname,contact) values("al arabian","9698959492");
insert into VENDOR(Vendorname,contact) values("Chettinad","8587848582");

create table menu(
ItemIdPk int primary key auto_increment,
VendorIdFk int,
ItemName char(255),
category char(255),
foreign key(VendorIdFk) references VENDOR(VendorIdPk)
);

INSERT into menu(VendorIdFk,ItemName,category) values("1","Mutton","Non Veg");
INSERT into menu(VendorIdFk,ItemName,category) values("2","Curd","Veg");
select * from menu;
 
 -- update menu
-- set VendorIdFk=2
-- where ItemIdPk=2
create table cart(
CustIdFk int,
ItemIdFk int,
foreign key(CustIdFk) references CUSTOMER(CustIdPk),
foreign key(ItemIdFk) references menu(ItemIdPk),
Amount int8
);
INSERT into cart(CustIdFK,ItemIdFk,Amount) values("1","1","250");
INSERT into cart(CustIdFK,ItemIdFk,Amount) values("2","2","350");
select * from cart;

create table Bill(

BillIdPk int primary key auto_increment,TransIdPk int8,
OrderIdPk int8,
CustIdFk int,
WalletIdFk int,
amount int8,
Bill varchar(100),Paymentmode char(10)
);
INSERT into Bill(CustIdFk,WalletIdFk,Bill,TransIdPk,Paymentmode,amount,OrderIdPk) values("1","1","101","1025425","online","201","2000");
select * from Bill;
 
