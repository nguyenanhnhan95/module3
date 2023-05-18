create database demo;
use demo;
create table products(
		id int primary key auto_increment,
		code_product int not null,
		name_product varchar(45) not null,
		price_product double not null,
		amount_product int,
		description_product varchar(45),
		status_product boolean
);

insert into products(code_product,name_product,price_product,amount_product,
description_product,status_product)

		value(152,"Sinh to",150,2,"gia dung",1),(135,"Sam sum",200,10,"dien thoai",0),(101,"Dell",500,6,"may tinh",1);

create unique index product_index on products(id);

create index composit_index on products(name_product,price_product);

drop index product_index on products;


explain  select * from products;

create view view_product(code_product,name_product,price_product,status_product) as
	select code_product,name_product,price_product,status_product
		from products;
        
select *from view_product;

insert into view_product(code_product,name_product,price_product,status_product)
	value(123,"ban hoc",156,1);
    
drop view view_product;

DELIMITER //
 
 CREATE PROCEDURE product_store()
 
 BEGIN 
	select *from products;
 END //
 
DELIMITER //



call product_store();

DELIMITER //
 
 CREATE PROCEDURE add_product_store(code_product int ,name_product varchar(45),
		price_product double ,amount_product int,
		description_product varchar(45),status_product boolean)
 
 BEGIN 
	insert into products(code_product,name_product,price_product,
    amount_product,description_product,status_product)
    value(code_product,name_product,price_product,
    amount_product,description_product,status_product);
 END //
 
DELIMITER //

call add_product_store(152,"ghe",252,5,"de ngoi",0)

DELIMITER //
 
 CREATE PROCEDURE edit_product_store(id_index int,price_product_new double)
 
 BEGIN 
	update products
    set  price_product = price_product_new
    where id=id_index;
 END //
 
DELIMITER //

DELIMITER //
 
 CREATE PROCEDURE delete_product_store(id_index int)
 
 BEGIN 
	delete from products
    where id=id_index;
 END //
 
DELIMITER //

call delete_product_store(2);
