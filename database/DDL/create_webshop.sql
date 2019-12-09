CREATE TABLE tProduct (
	nProductID INT PRIMARY KEY IDENTITY,
	cName VARCHAR(200) NOT NULL,
	cDescription TEXT NOT NULL,
	nPrice INT NOT NULL,
	nCurrentStock INT NOT NULL,
    nAverageRating FLOAT(4) NOT NULL DEFAULT 0
);

CREATE TABLE tCity (
	nCityID INT PRIMARY KEY,
    cCity VARCHAR(50) NOT NULL 
);

CREATE TABLE tUsers (
	nUserID INT PRIMARY KEY IDENTITY,
	cFirstName VARCHAR(64) NOT NULL,
	cLastName VARCHAR(64) NOT NULL,
	cAddress VARCHAR(255) NOT NULL,
	nZipCode VARCHAR(4) NOT NULL,
	nPhoneNumber VARCHAR(16) NOT NULL UNIQUE,
	cEmail VARCHAR(255) NOT NULL UNIQUE,
	cPassword VARCHAR(255) NOT NULL,
    nTotalAmount INT NOT NULL,
	nCityID INT FOREIGN KEY REFERENCES tCity(nCityID)
);

CREATE TABLE tCard (
	nCardID INT PRIMARY KEY IDENTITY,
    cCardNumber VARCHAR(22) NOT NULL UNIQUE,
	cCardHolder VARCHAR(255) NOT NULL,
	dExpireDate DATE NOT NULL,
	cCCV CHAR(3),
    nTotalAmount INT NOT NULL,
	nUserID INT FOREIGN KEY REFERENCES tUsers(nUserID)
);

CREATE TABLE tInvoice (
	nInvoiceID INT PRIMARY KEY IDENTITY,
	dIssueDate DATETIME NOT NULL,
	nTax INT NOT NULL,
	nTotalAmount INT NOT NULL,
	nCardID INT FOREIGN KEY REFERENCES tCard(nCardID)

);

CREATE TABLE tInvoiceLine (
	nProduct_invoiceID INT PRIMARY KEY IDENTITY,
	nProductID INT FOREIGN KEY REFERENCES tProduct(nProductID),
	nInvoiceID INT FOREIGN KEY REFERENCES tInvoice(nInvoiceID),
	nQuantity INT NOT NULL,
	nPrice INT NOT NULL
);

CREATE TABLE tRating (
	nUserID INT FOREIGN KEY REFERENCES tUsers(nUserID),
	nProductID INT FOREIGN KEY REFERENCES tProduct(nProductID),
	nRating float(4) CHECK (nRating BETWEEN 0 AND 5),
    cComment TEXT 
);
