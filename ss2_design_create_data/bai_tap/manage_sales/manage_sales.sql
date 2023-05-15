create database manage_sales;
use manage_sales;
create table product(
pID int primary key auto_increment,
pName varchar(45) not null,
pPrice double not null
);
create table customer(
cID int primary key auto_increment,
cName varchar(45),
cAge int
);
create table OrderProduct(

);
create table OrderDetail(
oID int ,
pID int ,
primary key(oID,pID),
foreign key(pID) references product(pID),
odQTY varchar(45) not null
)