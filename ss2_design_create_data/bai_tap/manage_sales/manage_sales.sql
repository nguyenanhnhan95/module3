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
)