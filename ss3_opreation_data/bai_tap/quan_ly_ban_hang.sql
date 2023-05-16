create database manage_sales;
use manage_sales;
CREATE TABLE customer (
    cID INT PRIMARY KEY AUTO_INCREMENT,
    cName VARCHAR(45),
    cAge INT
);
CREATE TABLE order_product (
    oID INT PRIMARY KEY AUTO_INCREMENT,
    cID INT,
    FOREIGN KEY (cID)
        REFERENCES customer (cID),
    oDate DATE,
    oTotalPrice DOUBLE
);
CREATE TABLE product (
    pID INT PRIMARY KEY AUTO_INCREMENT,
    pName VARCHAR(45) NOT NULL,
    pPrice DOUBLE NOT NULL
);

CREATE TABLE order_detail (
    oID INT,
    pID INT,
    PRIMARY KEY (oID , pID),
    FOREIGN KEY (pID)
        REFERENCES product (pID),
    FOREIGN KEY (oID)
        REFERENCES order_product (oID),
    odQTY VARCHAR(45) NOT NULL
);

insert into  customer(cName,cAge)
value ("Minh Quan",10),("Ngoc Oanh",20),("Hoang Ha",50);

insert into order_product(cID,oDate,oTotalPrice)
value (1,'2006-03-21',null),(2,'2006-03-23',null),(1,'2006-03-16',null);
insert into product(pName,pPrice)
value("May Giat",3),("Tu Lanh",5),("Dieu Hoa",7),("Quat",1),("Bep Dien",2);
insert into order_detail(oID,pID,odQTY)
value(1,1,3),(1,3,7),(1,4,2),(2,1,1),(3,1,8),(2,5,4),(2,3,3);
select oID,oDate,oTotalPrice from order_product;

SELECT 
    customer.cName
FROM
    customer
        JOIN
    order_product ON customer.cID = order_product.cID
GROUP BY customer.cName;

SELECT 
    pName
FROM
    product
        JOIN
    order_detail ON product.pID = order_detail.pID
GROUP BY product.pName;

SELECT 
    *
FROM
    customer
        LEFT JOIN
    order_product ON customer.cID = order_product.cID
WHERE
    order_product.oID IS NULL;

SELECT 
    order_product.oID,
    order_product.oDate,
    SUM(odQTY * pPrice) AS 'Total Price'
FROM
    order_product
        LEFT JOIN
    order_detail ON order_product.oID = order_detail.oID
        JOIN
    product ON order_detail.pID = product.pID
GROUP BY order_product.oID;

