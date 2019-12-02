
CREATE DATABASE webshop;

CREATE TABLE product (
	nProductID INT PRIMARY KEY IDENTITY,
	cName VARCHAR(200) NOT NULL,
	 -- Dont know how long the VARCHAR should be in description
	cDescription VARCHAR(1000) NOT NULL,
	nPrice INT NOT NULL,
	nCurrentStock INT NOT NULL,
      nAverageRating FLOAT(4) NOT NULL
);

CREATE TABLE invoice (
	nInvoiceID INT PRIMARY KEY IDENTITY,
	dIssueDate DATETIME NOT NULL,
	nTax INT NOT NULL,
	nTotalAmount INT NOT NULL 
);

CREATE TABLE product_invoice (
	nProduct_invoiceID INT PRIMARY KEY IDENTITY,
	nProductID INT FOREIGN KEY REFERENCES product(nProductID),
	nInvoiceID INT FOREIGN KEY REFERENCES invoice(nInvoiceID),
	nQuantity INT NOT NULL,
	nPrice INT NOT NULL

);

CREATE TABLE users (
	nUserID INT PRIMARY KEY IDENTITY,
	cFirstName VARCHAR(64) NOT NULL,
	cLastName VARCHAR(64) NOT NULL,
	cGender VARCHAR(6) NOT NULL CHECK (cGender IN ('Male', 'Female')),
	cAddress VARCHAR(255) NOT NULL,
	nZipCode INT NOT NULL CHECK (nZipCode BETWEEN 0 AND 9999),
	nPhoneNumber INT NOT NULL CHECK (nPhoneNumber BETWEEN 0 AND 99999999) UNIQUE,
	cEmail VARCHAR(255) NOT NULL UNIQUE,
	cPassword VARCHAR(255) NOT NULL,
      nTotalAmount INT NOT NULL
);

CREATE TABLE rating (
	nUserID INT FOREIGN KEY REFERENCES users(nUserID),
	nProductID INT FOREIGN KEY REFERENCES product(nProductID),
	nRating float(4) CHECK (nRating BETWEEN 0 AND 5),
      cComment VARCHAR(255) 
);
	
CREATE TABLE card (
	nCardID INT PRIMARY KEY IDENTITY,
      cCardNumber VARCHAR(22) NOT NULL UNIQUE,
	cCardHolder VARCHAR(255) NOT NULL,
	dExpireDate DATE NOT NULL,
	-- Dont know if ccv can be longer than 3 digits
	cCCV CHAR(3),
      nTotalAmount INT NOT NULL,
      FOREIGN KEY
);

CREATE TABLE city (
     nZipCode INT PRIMARY KEY,
     cCity VARCHAR(60) NOT NULL 
);
