CREATE DATABASE ecommerce;
USE ecommerce;

CREATE TABLE users (
	userid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    username varchar(50) NOT NULL,
    useradd varchar(50),
    userphone INT NOT NULL);

CREATE TABLE suppliers (
	supplierid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    suppliername varchar(50),
    supplieradd varchar(50),
    suppliertype INT,
    supplierphone INT NOT NULL);
    
CREATE TABLE products (
	productid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    productname varchar(25) NOT NULL,
    supplierid INT,
    FOREIGN KEY(supplierid) REFERENCES suppliers(supplierid)
    );
    
CREATE TABLE sessions (
	sessionid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userid INT,
    productid INT,
    sessionstart TIMESTAMP,
    sessionend TIMESTAMP,
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );
    
CREATE TABLE carts (
	cartid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userid INT,
    productid INT,
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );

CREATE TABLE checkouts (
	checkoutid INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    userid INT,
    productid INT,
    checkoutstatus INT,
    FOREIGN KEY(userid) REFERENCES users(userid),
    FOREIGN KEY(productid) REFERENCES products(productid)
    );
    