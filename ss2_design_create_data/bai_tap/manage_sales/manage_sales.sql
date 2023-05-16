create database manage_sales;
use manage_sales;
create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge int
);
create table order_product(
oID int primary key auto_increment,
cID int,
foreign key(cID) references customer(cID),
oDate date,
oTotalPrice double
);
create table product(
pID int primary key auto_increment,
pName varchar(45) not null,
pPrice double not null
);

create table order_detail(
oID int ,
pID int ,
primary key(oID,pID),
foreign key(pID) references product(pID),
foreign key(oID) references order_product(oID),
odQTY varchar(45) not null
)