create database case_study_2;
use case_study_2;
CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);
CREATE TABLE account_users(
	account_id INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) UNIQUE NOT NULL,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
	role_id INT,
    account_id INT,
    PRIMARY KEY(role_id, account_id),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY(account_id) REFERENCES account_users(account_id)
);
CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    account_id INT,
     FOREIGN KEY (account_id) REFERENCES account_users(account_id)
    );
CREATE TABLE products(
	product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price double,
    `describe` varchar(100),
    product_image text
);
CREATE TABLE `order`(
	order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME,
    customer_id INT,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_detail(
	order_detail_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    FOREIGN KEY(order_id) REFERENCES `order`(order_id),
    product_id int,
        FOREIGN KEY(product_id) REFERENCES products(product_id),
        quanlity int,
        price double
);
insert into roles(role_name)
value ("nhân viên"),("khách hàng");
insert into account_users(user_name,password)
value ("abc","123"),
("acbd","1234"),
("xyz","987"),
("bcd","456");
insert into users_role
value (1,1),(2,2),(2,3),(2,4);
insert into customers(customer_name,email,phone_number,address,account_id)
values ("Hạnh","hanh@gamil.com","0987654321","Đà Nẵng",1),
 ("Nhàn","nhan@gamil.com","0987654345","Đà Nẵng",2),
 ("Kiệt","kiet@gamil.com","0987654324","Đà Nẵng",3),
 ("Huy","huy@gamil.com","0987654326","Đà Nẵng",4);
insert into products(product_name,price,`describe`,product_image)
value ("Áo 1",10,"New","Ảnh 1"),
 ("Áo 2",20,"New hoodie","Ảnh 2"),
 ("Áo 3",30,"New nike","Ảnh 3"),
 ("Áo 4",40,"New adidas","Ảnh 4");
insert into `order`(order_date,customer_id)
value (20230303,1),(20230404,2);

DELIMITER //

CREATE FUNCTION confirm_login(user_name VARCHAR(50), password_account VARCHAR(50))
    RETURNS INT
BEGIN
    DECLARE customer_id INT DEFAULT -1;
    SET customer_id = (
        SELECT customers.customer_id
        FROM account_users
        JOIN customers ON customers.account_id = account_users.account_id
        WHERE account_users.user_name = user_name AND account_users.`password` = password_account
    );
    RETURN customer_id;
END; //
DELIMITER ;

DELIMITER //

CREATE FUNCTION confirm_login(user_name VARCHAR(50), password_account VARCHAR(50))
RETURNS INT
DETERMINISTIC
BEGIN
   DECLARE customer_id INT;
    SET customer_id = (
        SELECT customers.customer_id
        FROM account_users
        JOIN customers ON customers.account_id = account_users.account_id
        WHERE account_users.user_name = user_name AND account_users.`password` = password_account
    );
    RETURN customer_id;

END; //

DELIMITER ;


DELIMITER //
CREATE procedure show_user(user_name VARCHAR(50), password_account VARCHAR(50))
begin
 DECLARE customer_id INT;
 SET customer_id = confirm_login(user_name , password_account );
 IF customer_id is not  null 
 THEN 
 SELECT customers.customer_name ,customers.address,customers.email,customers.phone_number,roles.role_name
 from customers 
 join account_users on account_users.account_id=customers.account_id
 join users_role on users_role.account_id = account_users.account_id
 join roles on roles.role_id = users_role.role_id
 where customers.customer_id=customer_id;
 ELSE
 SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Đăng nhập không phù hợp ';
      END IF;
END //
DELIMITER ;

call show_user("acbd","1234")

DELIMITER //
CREATE procedure add_customer(user_name VARCHAR(50), password_account VARCHAR(50),customer_name VARCHAR(50) ,email VARCHAR(50),phone_number VARCHAR(11) ,address TEXT )
begin
 DECLARE customer_id INT;
 SET customer_id = confirm_login(user_name , password_account );
 IF customer_id is  null 
 THEN 
 insert into account_users(user_name,`password`)
 value (user_name,password_account);
 insert into customers(customer_name,email,phone_number,address,account_id)
 value (customer_name,email,phone_number,address,last_insert_id());
 end if;
END //
DELIMITER ;

call add_customer("sangid","12345678","sang","sang@gmail.com","0798654287","Hoa Khach")
