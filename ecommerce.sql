CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE users (
	userid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    createdon TIMESTAMP,
    username varchar(50) NOT NULL,
    useradd varchar(50) DEFAULT NULL,
    userphone INT NOT NULL
    );

CREATE TABLE suppliertypes (
	suppliertype INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    suppliertypedes varchar(50)
    );

CREATE TABLE suppliers (
	supplierid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    suppliername varchar(50) NOT NULL,
    supplieradd varchar(50) DEFAULT NULL,
    suppliertype INT DEFAULT NULL,
    supplierphone INT NOT NULL,
    FOREIGN KEY(suppliertype) REFERENCES suppliertypes(suppliertype)
    );

CREATE TABLE producttypes (
	producttype INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    producttypedes varchar(50)
    );
    
CREATE TABLE products (
	productid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    productname varchar(25) NOT NULL,
    productdes varchar(200),
    productprice DOUBLE(7,2),
    producttype INT,
    supplierid INT,
    FOREIGN KEY(supplierid) REFERENCES suppliers(supplierid),
    FOREIGN KEY(producttype) REFERENCES producttypes(producttype)
    );
    
CREATE TABLE sessions (
	sessionid INT NOT NULL,
    userid INT,
    productid INT,
    sessionstart TIMESTAMP,
    sessionend TIMESTAMP, #check if session duration can be stored in 1 value
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );
    
CREATE TABLE carts (
	cartid INT NOT NULL,
    userid INT,
    productid INT,
    quantity INT,
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );

CREATE TABLE checkouts (
	checkoutid INT NOT NULL,
    userid INT,
    productid INT,
    quantity INT, #check how to make it minimum 1
    checkoutdate DATE DEFAULT CURRENT_TIMESTAMP(),
    checkoutstatus INT,
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );
    