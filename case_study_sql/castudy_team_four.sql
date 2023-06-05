create database case_study_2;
use case_study_2;
CREATE TABLE roles (
	role_id INT PRIMARY KEY AUTO_INCREMENT,
    role_name VARCHAR(50) NOT NULL
);
CREATE TABLE account_users(
	email_user varchar(50) PRIMARY KEY unique,
    `password` VARCHAR(50) NOT NULL
);
CREATE TABLE users_role (
	role_id INT,
    email_user varchar(50),
    PRIMARY KEY(role_id,email_user),
    FOREIGN KEY (role_id) REFERENCES roles(role_id),
    FOREIGN KEY (email_user) REFERENCES account_users(email_user)
);
CREATE TABLE customers(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    email_user varchar(50),
     FOREIGN KEY (email_user) REFERENCES account_users(email_user)
    );
    CREATE TABLE employee(
	employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(50) NOT NULL,
    phone_number VARCHAR(11) UNIQUE NOT NULL,
    address TEXT NOT NULL,
    email_user varchar(50),
     FOREIGN KEY (email_user) REFERENCES account_users(email_user)
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
	customer_id int,
	FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
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
insert into account_users(email_user,password)
value ("hanh@gamil.com","123"),
("chanh@gamil.com","1234"),
("nhan@gamil.com","987"),
("trung@gamil.com","456"),
("kiet@gamil.com","45678"),
("huy@gamil.com","4567896");
insert into users_role(role_id,email_user)
value (2,"hanh@gamil.com"),(1,"chanh@gamil.com"),(2,"nhan@gamil.com"),(1,"trung@gamil.com"),(1,"kiet@gamil.com"),(1,"huy@gamil.com");
insert into customers(customer_name,phone_number,address,email_user)
values ("Hạnh","0987654321","Đà Nẵng","hanh@gamil.com"),
 ("Nhàn","0987654345","Đà Nẵng","nhan@gamil.com"),
 ("Kiệt","0987654324","Đà Nẵng","kiet@gamil.com"),
 ("Huy","0987654326","Đà Nẵng","huy@gamil.com");
 insert into employee(employee_name,phone_number,address,email_user)
values ("trung","0987654581","Đà Nẵng","chanh@gamil.com"),
 ("chanh","0987654312","Đà Nẵng","trung@gamil.com");
insert into products(product_name,price,`describe`,product_image)
value ("Áo 1",10,"New","Ảnh 1"),
 ("Áo 2",20,"New hoodie","Ảnh 2"),
 ("Áo 3",30,"New nike","Ảnh 3"),
 ("Áo 4",40,"New adidas","Ảnh 4");
insert into `order`(order_date,customer_id)
value (20230303,5),(20230404,6);

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

call add_customer("sangid","12345678","sang","sang@gmail.com","0798654287","Hoa Khach");

alter table customers
add is_delete int(1) default 0;

DELIMITER $$
CREATE PROCEDURE find_customer(customer_name varchar(45),customer_address varchar(45))
BEGIN
select *from customers
where customers.address like customer_address and customers.customer_name=customer_name;
END $$
DELIMITER ;

CALL find_customer("Kiệt","Đà Nẵng")
