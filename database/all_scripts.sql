-------------------------------------------------------
--            DDL: CREATE DATABASE AND TABLES        --
-------------------------------------------------------
CREATE DATABASE webshop

CREATE TABLE TProduct (
	nProductID INT PRIMARY KEY IDENTITY,
	cName VARCHAR(200) NOT NULL,
	cDescription TEXT NOT NULL,
	nPrice INT NOT NULL,
	nCurrentStock INT NOT NULL,
    nAverageRating FLOAT(4) NOT NULL DEFAULT 0
);

CREATE TABLE TCity (
	nCityID INT PRIMARY KEY,
    cCity VARCHAR(50) NOT NULL
);

CREATE TABLE TUsers (
	nUserID INT PRIMARY KEY IDENTITY,
	cFirstName VARCHAR(64) NOT NULL,
	cLastName VARCHAR(64) NOT NULL,
	cAddress VARCHAR(255) NOT NULL,
	cZipCode CHAR(4) NOT NULL,
	cPhoneNumber VARCHAR(16) NOT NULL UNIQUE,
	cEmail VARCHAR(255) NOT NULL UNIQUE,
	cPassword VARCHAR(255) NOT NULL,
    nTotalAmount INT NOT NULL,
	nCityID INT FOREIGN KEY REFERENCES TCity(nCityID)
);

CREATE TABLE TCard (
	nCardID INT PRIMARY KEY IDENTITY,
    cCardNumber VARCHAR(22) NOT NULL UNIQUE,
	cCardHolder VARCHAR(255) NOT NULL,
	dExpireDate DATE NOT NULL,
	cCCV CHAR(3),
    nTotalAmount INT NOT NULL,
	nUserID INT FOREIGN KEY REFERENCES TUsers(nUserID)
);

CREATE TABLE TInvoice (
	nInvoiceID INT PRIMARY KEY IDENTITY,
	dIssueDate DATETIME NOT NULL,
	nTax INT NOT NULL,
	nTotalAmount INT NOT NULL,
	nCardID INT FOREIGN KEY REFERENCES TCard(nCardID)

);

CREATE TABLE TInvoiceLine (
	nProduct_invoiceID INT PRIMARY KEY IDENTITY,
	nProductID INT FOREIGN KEY REFERENCES TProduct(nProductID),
	nInvoiceID INT FOREIGN KEY REFERENCES TInvoice(nInvoiceID),
	nQuantity INT NOT NULL,
	nPrice INT NOT NULL
);

CREATE TABLE TRating (
    nRatingID INT PRIMARY KEY IDENTITY,
	nUserID INT FOREIGN KEY REFERENCES TUsers(nUserID),
	nProductID INT FOREIGN KEY REFERENCES TProduct(nProductID),
	nRating float(4) CHECK (nRating BETWEEN 0 AND 5),
    cComment TEXT
);
-------------------------------------------------------
--                TEMPORAL TABLE                     --
-------------------------------------------------------
ALTER TABLE TProduct
ADD dStart DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN DEFAULT GETUTCDATE(),
	dEnd DATETIME2 GENERATED ALWAYS AS ROW END DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
PERIOD FOR SYSTEM_TIME (dStart, dEnd);

ALTER TABLE TProduct SET (SYSTEM_VERSIONING = ON);

ALTER TABLE TRating
ADD dStart DATETIME2 GENERATED ALWAYS AS ROW START HIDDEN DEFAULT GETUTCDATE(),
	dEnd DATETIME2 GENERATED ALWAYS AS ROW END DEFAULT CONVERT(DATETIME2, '9999-12-31 23:59:59.9999999'),
PERIOD FOR SYSTEM_TIME (dStart, dEnd);

ALTER TABLE TRating SET (SYSTEM_VERSIONING = ON);


-------------------------------------------------------
--                TRIGGERS/AUDITS                    --
-------------------------------------------------------
--Audit card

CREATE TABLE audit_card (
    nAuditCard BIGINT IDENTITY(1,1) PRIMARY KEY,
    cOldCardNumber VARCHAR(22),
    cOldCardHolder VARCHAR(255),
    dOldExpireDate DATE,
    cOldCCV CHAR(3),
    cOldTotalAmount INT,
    cNewCardNumber VARCHAR(22),
    cNewCardHolder VARCHAR(255),
    dNewExpireDate DATE,
    cNewCCV CHAR(3),
    cNewTotalAmount INT,
    cAction CHAR(1) NOT NULL,
    dTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nUserID VARBINARY(85) NOT NULL DEFAULT SUSER_ID(),
    cUserName NVARCHAR(128) NOT NULL DEFAULT SUSER_NAME(),
    nHostID CHAR(10) NOT NULL DEFAULT HOST_ID(),
    cHostName NVARCHAR(128) NOT NULL DEFAULT HOST_NAME(),
    CONSTRAINT chkCardAction CHECK(cAction IN ('I','U','D'))

);
GO
CREATE OR ALTER TRIGGER trg_card_audit_delete_after ON dbo.TCard
    AFTER DELETE
AS
BEGIN
    DECLARE @cCardNumber AS VARCHAR(22)
    DECLARE @cCardHolder AS VARCHAR(255)
    DECLARE @dExpireDate AS DATE
    DECLARE @cCCV AS CHAR(3)
    DECLARE @nTotalAmount AS INTEGER

    SELECT @cCardNumber = cCardNumber, @cCardHolder = cCardHolder, @dExpireDate = dExpireDate,
            @cCCV = cCCV, @nTotalAmount = nTotalAmount
    FROM deleted

    INSERT INTO dbo.audit_card (cOldCardNumber, cOldCardHolder, dOldExpireDate, cOldCCV,
                cOldTotalAmount, cAction)
                --'D' stands for DELETE
           VALUES (@cCardNumber, @cCardHolder, @dExpireDate, @cCCV, @nTotalAmount, 'D')
END
GO
CREATE OR ALTER TRIGGER trg_card_audit_insert_after ON dbo.TCard
    AFTER INSERT
AS
BEGIN
    DECLARE @cCardNumber AS VARCHAR(22)
    DECLARE @cCardHolder AS VARCHAR(255)
    DECLARE @dExpireDate AS DATE
    DECLARE @cCCV AS CHAR(3)
    DECLARE @nTotalAmount AS INTEGER

    SELECT @cCardNumber = cCardNumber, @cCardHolder = cCardHolder, @dExpireDate = dExpireDate,
            @cCCV = cCCV, @nTotalAmount = nTotalAmount
    FROM inserted

    INSERT INTO dbo.audit_card (cNewCardNumber, cNewCardHolder, dNewExpireDate, cNewCCV,
                cNewTotalAmount, cAction)
                --'I' stands for INSERT
           VALUES (@cCardNumber, @cCardHolder, @dExpireDate, @cCCV, @nTotalAmount, 'I')
END
GO
CREATE OR ALTER TRIGGER trg_card_audit_update_after ON dbo.TCard
    AFTER DELETE
AS
BEGIN
    DECLARE @cOldCardNumber AS VARCHAR(22)
    DECLARE @cOldCardHolder AS VARCHAR(255)
    DECLARE @dOldExpireDate AS DATE
    DECLARE @cOldCCV AS CHAR(3)
    DECLARE @nOldTotalAmount AS INTEGER
    DECLARE @cNewCardNumber AS VARCHAR(22)
    DECLARE @cNewCardHolder AS VARCHAR(255)
    DECLARE @dNewExpireDate AS DATE
    DECLARE @cNewCCV AS CHAR(3)
    DECLARE @nNewTotalAmount AS INTEGER

    SELECT @cOldCardNumber = cCardNumber, @cOldCardHolder = cCardHolder, @dOldExpireDate = dExpireDate,
            @cOldCCV = cCCV, @nOldTotalAmount = nTotalAmount
    FROM deleted

    SELECT @cNewCardNumber = cCardNumber, @cNewCardHolder = cCardHolder, @dNewExpireDate = dExpireDate,
            @cNewCCV = cCCV, @nNewTotalAmount = nTotalAmount
    FROM inserted

    INSERT INTO dbo.audit_card (cOldCardNumber, cOldCardHolder, dOldExpireDate, cOldCCV,
                cOldTotalAmount, cNewCardNumber, cNewCardHolder, dNewExpireDate, cNewCCV,
                cNewTotalAmount, cAction)
                --'U' stands for UPDATE
           VALUES (@cOldCardNumber, @cOldCardHolder, @dOldExpireDate, @cOldCCV,
                   @nOldTotalAmount,@cNewCardNumber, @cNewCardHolder, @dNewExpireDate, @cNewCCV, @nNewTotalAmount, 'D')
END
GO
-------------------------------------------------------
--                STORED PROCEDURES                  --
-------------------------------------------------------
--Create product
CREATE PROCEDURE sp_create_product (
@cName AS VARCHAR(80),
@cDescription AS TEXT,
@nPrice AS INTEGER,
@nCurrentStock AS INTEGER,
@nAverageRating AS REAL
)
AS
IF (SELECT COUNT(*) FROM TProduct WHERE cName = @cName) < 1
BEGIN
        INSERT INTO TProduct (cName, cDescription, nPrice, nCurrentStock, nAverageRating)
        VALUES (@cName,@cDescription,@nPrice,@nCurrentStock,@nAverageRating)
END

GO
--Get all products
CREATE PROCEDURE sp_get_all_products
AS
    BEGIN
    select * from TProduct;
end;

GO
-- Get product
CREATE PROCEDURE sp_get_product (
@nProductID AS INTEGER
)
AS
    BEGIN
    select * from tProduct;
    WHERE nProductID = 1
end;

GO

--Update product
CREATE PROCEDURE sp_update_product (
@cName AS VARCHAR(80),
@cDescription AS TEXT,
@nPrice AS INTEGER,
@nCurrentStock AS INTEGER,
@nAverageRating AS REAL
)
AS
BEGIN
        UPDATE tProduct (cName, cDescription, nPrice)
        SET cName = @cName, cDescription = @cDescription, nPrice = @nPrice
        WHERE nProductID = 1
END

GO
--Create user
CREATE OR ALTER PROCEDURE sp_create_user (
@cFirstName AS VARCHAR(64),
@cLastName AS VARCHAR(64),
@cAddress AS VARCHAR(255),
@cZipCode AS CHAR(4),
@cPhoneNumber AS VARCHAR(16),
@cEmail AS VARCHAR (255),
@cPassword AS VARCHAR(255),
@nTotalAmount AS INTEGER
)
AS
IF (SELECT COUNT(*) FROM TUsers WHERE cEmail = @cEmail) < 1
BEGIN
            INSERT INTO TUsers (cFirstName, cLastName, cAddress, cZipCode, cPhoneNumber, cEmail, cPassword, nTotalAmount)
        VALUES (@cFirstName,@cLastName,@cAddress,@cZipCode,@cPhoneNumber,@cEmail,@cPassword,@nTotalAmount)
END

GO
--Delete user
CREATE PROCEDURE sp_delete_user (
    @cEmail AS VARCHAR(255),
    @cPassword AS VARCHAR(255)
)
AS
    BEGIN
        DELETE
        from TUsers
        WHERE cEmail = @cEmail AND cPassword = @cPassword;
end;

GO

--Login user
CREATE PROCEDURE sp_login (
@cEmail AS VARCHAR(255),
@cPassword AS VARCHAR(255)
)
AS
     BEGIN
        SELECT cEmail, cPassword
        FROM TUsers
        WHERE cEmail = @cEmail AND cPassword = @cPassword;
     END;
GO
-------------------------------------------------------
--                TRANSACTIONS                       --
-------------------------------------------------------

--Buy product TODO: Insert buy product here

--Rate product TODO: Insert buy product here


-------------------------------------------------------
--                  Security                         --
-------------------------------------------------------

USE webshop

CREATE LOGIN webshopAdmin
    WITH PASSWORD = 'Password123';

CREATE USER webshopAdmin FOR LOGIN webshopAdmin;
ALTER ROLE db_owner ADD MEMBER webshopAdmin;
ALTER LOGIN webshopAdmin WITH DEFAULT_DATABASE = webshop

CREATE LOGIN webshopReader
	WITH PASSWORD = 'Qwerty123'

CREATE USER webshopReader FOR LOGIN webshopReader;

ALTER ROLE db_datareader ADD MEMBER webshopReader;
ALTER LOGIN webshopReader WITH DEFAULT_DATABASE = webshop

CREATE LOGIN webshopRestricted
	WITH PASSWORD = 'Wasd123'

CREATE USER webshopRestricted FOR LOGIN webshopRestricted;

ALTER ROLE db_datareader ADD MEMBER webshopRestricted;
ALTER LOGIN webshopRestricted WITH DEFAULT_DATABASE = webshop
DENY SELECT ON webshop::TInvoice TO webshopRestricted;
DENY SELECT ON webshop::TInvoiceLine TO webshopRestricted;
-------------------------------------------------------
--                  TEST DATA                        --
-------------------------------------------------------
-- 20 products
INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Screwdriver','Can screw screws', '30', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Battery','Fuels your electrics', '10', '50','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Table cloth','Cleans like everything', '10', '40','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Water bottle','Hydrates body and soul', '10', '25','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Nokia 3310','Drop it and you break the floor', '600', '3','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Hammer','Nail things the way you like', '60', '15','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Fidget spinner','2017 what a year!', '15', '10','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Scissor','Ideal for a chrismas gift!', '13', '55','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Nail','Can be used with a hammer or Nokia 3310', '2', '400','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Belt','Holds your jeans tight', '100', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Notebook','Write or burn up, to you', '15', '40','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('USB-C Charger','Innovative fast charging', '60', '80','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Thunderbolt Charger','For the hipsters', '150', '10','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Micro USB Charger','For the outdated', '30', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Ethernet Cable','Who knows what version? Its from China.', '50', '50','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('VHS tape','Dont know we found it in the trash', '5', '1','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Food container','Can contain food', '12', '33','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Fake money: 100kr','Yes we are illegal', '50', '100','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Mouse pad','Cures cancer in the wrist', '70', '44','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Asprin','For writing 20 product test data inserts', '25', '1000','0')

-- Cities

INSERT INTO TCity([cCity]) VALUES('København NV');
INSERT INTO TCity([cCity]) VALUES('Frederiksberg');
INSERT INTO TCity([cCity]) VALUES('Vanløse');
INSERT INTO TCity([cCity]) VALUES('Næstved');
INSERT INTO TCity([cCity]) VALUES('Silkeborg');
INSERT INTO TCity([cCity]) VALUES('Køge');
INSERT INTO TCity([cCity]) VALUES('Hvidovre');
INSERT INTO TCity([cCity]) VALUES('Kongens Lyngby');
INSERT INTO TCity([cCity]) VALUES('Skanderborg');
INSERT INTO TCity([cCity]) VALUES('Slagelse');

-- 15 users
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('John','Doe','Rentemestervej 1','2400',1,'88331212','a@a.dk',157.50);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Jakob','Jensen','Hvidovrevej 280','2650',7,'76567777','jako@jens.dk',107.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Mehmet','Deniz','Egevolden 188','2650',7,'76567777','me@me.dk',79.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Mia','Olsen','Bymuren 22','2650',7,'55662121','mia@olsen.dk',53.95);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Jakob','Fisker','Lygten 37','2400',1,'90897867','j@j.dk',83.25);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Mette','Mortensen','Valbyvej 65','4200',10,'76567777','me@Mortensen.dk',166.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Jens','Olesen','Vandværksvej 3','4200',10,'76313244','jens@olesen.dk',33.50);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Bibi','Albert','Nordre Fasanvej 32','2000',2,'89785544','bibi@albert.dk',39.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Lone','Kragh','Smalegade 8','2000',2,'34233344','lone@kragh.dk',174.50);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Britta','Nielsen','Ålekistevej 230','2720',3,'90908888','britta@nielsen.dk',74.50);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Hanibal','Stump','Linde Alle 3','2720',3,'77664454','hanibal@stump.dk',55.70);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Ali','Kaya','Engelsborgvej 32','2800',8,'43543322','ali@kaya.dk',113.50);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('David','Lorenzen','Dyrlundsvej 12','4600',6,'60778855','d@l.dk',0.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Jytte','Jensen','Nørre Alle 2','8660',9,'54667788','jytte@jensen.dk',0.00);
INSERT INTO TUser(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,nTotalAmount,nCityID) VALUES ('Ole','Skam','Fuglevænget 7','4700',4,'76564433','ole@skam.dk',0.00);

-- Cards
-- Insert credit cards TODO: Add cardholder corresponding to user firstname and lastname

INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1122334455667788','04/20','444',157.50,1);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1133445566778899','05/20','555',0.00,1);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1144556677889900','06/20','666',0.00,1);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1155667788990011','07/20','777',107.00,2);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1166778899001122','08/20','888',79.00,3);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1177889900112233','09/20','999',26.10,4);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1188990011223344','10/20','111',27.85,4);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','1199001122334455','11/20','222',45.85,5);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2211223344556677','12/20','333',37.40,5);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2222334455667788','01/21','456',166.00,6);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2244556677889900','02/21','467',0.00,6);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2255667788990011','03/21','478',33.50,7);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2266778899001122','04/21','489',39.00,8);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2277889900112233','05/21','512',174.50,9);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2288990011223344','06/21','522',0.00,9);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','2299001122334455','07/21','533',0.00,9);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3311223344556677','08/21','544',74.50,10);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3322334455667788','09/21','556',55.70,11);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3333445566778899','10/21','567',0.00,11);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3344556677889900','11/21','578',0.00,11);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3355667788990011','12/21','580',95.50,12);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3366778899001122','01/22','590',18.00,12);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3377889900112233','02/22','610',0.00,12);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3388990011223344','03/22','620',0.00,13);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','3399001122334455','04/22','630',0.00,13);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4411223344556677','04/22','640',0.00,13);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4422334455667788','05/22','650',0.00,14);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4433445566778899','06/22','660',0.00,14);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4444556677889900','07/22','670',0.00,14);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4455667788990011','08/22','680',0.00,15);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4466778899001122','09/22','690',0.00,15);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4477889900112233','10/22','700',0.00,15);
INSERT INTO TCard(cCardNumber,cCardHolder,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Test','4488990011223344','11/22','710',0.00,15);


-- UserID 14 -- UserID 13 -- UserID 11 -- UserID 10 -- UserID 9 -- UserID 7 -- UserID 5 -- UserID 3 -- UserID 2 -- UserID 1

-- productID 20 -- productID 17 -- productID 16 -- productID 15 -- productID 14 -- productID 12 -- productID 11 -- productID 10
-- productID 8 -- productID 7 -- productID 6 -- productID 5 -- productID 3 -- productID 2 -- productID 1
-- With comments
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (1,20,4, 'So good'); --1
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (2,3,5, 'So nice'); --2
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (3,17,5, 'The best'); --3
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (2,1,1, 'Not very nice, not fresh'); --4
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (3,14,3, 'Decent'); --5
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,2,2, 'Not satisfying'); --6
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (10,10,4, 'Above average'); --7
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (7,12,1, 'Bad'); --8
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,8,2, 'Would not buy again'); --9
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,7,5, 'Best i ever had'); --10
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (11,11,3, 'Average'); --11
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (1,3,1, 'Eeeeeeww'); --12
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,15,2, 'So good it is very nice'); --13
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,16,4, 'Good and juicy'); --14
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (5,14,4, 'Very fresh can recommend'); --15
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (7,11,2, 'Dont buy this'); --16
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (11,10,1, 'Disgusting'); --17
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,5,4, 'I will tell my friends about this'); --18
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (14,8,5, '10/10'); --19
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (5,20,5, 'Best i have had in 2019'); --20

INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:25:55.853',25.00,45.00,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:27:20.437',25.00,69.50,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:27:46.183',25.00,43.00,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:29:25.723',25.00,28.50,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:30:17.530',25.00,34.00,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:30:49.303',25.00,44.50,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:31:48.357',25.00,28.00,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:32:08.830',25.00,23.50,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:32:24.300',25.00,27.50,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:33:43.727',25.00,4.00,6);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:34:02.003',25.00,22.10,6);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:34:19.420',25.00,10.00,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:35:02.060',25.00,12.35,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:35:21.580',25.00,5.50,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:37:29.120',25.00,13.50,8);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:37:48.680',25.00,32.35,8);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:38:06.890',25.00,18.70,9);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:39:00.883',25.00,18.70,9);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:40:13.323',25.00,35.00,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:40:28.257',25.00,53.50,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:41:56.920',25.00,45.00,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:42:11.313',25.00,32.50,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:43:00.123',25.00,16.00,12);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:43:18.187',25.00,17.50,12);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:09.947',25.00,39.00,13);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:52.953',25.00,11.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:54.840',25.00,11.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:45:08.607',25.00,25.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:45:14.373',25.00,25.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:46:45.987',25.00,47.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:06.700',25.00,12.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:08.897',25.00,4.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:26.737',25.00,36.00,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:05.010',25.00,30.00,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:06.457',25.00,30.00,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:14.940',25.00,14.50,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:51.033',25.00,13.50,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:12.357',25.00,11.50,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:22.967',25.00,7.85,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:23.363',25.00,7.85,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:50:19.283',25.00,15.00,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:50:59.083',25.00,25.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:51:15.273',25.00,25.00,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:51:58.410',25.00,17.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:52:08.430',25.00,27.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:52:51.577',25.00,18.00,22);

INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,1,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,1,2,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,1,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,1,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,1,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,2,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,2,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,2,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,2,2,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,2,2,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,3,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,3,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,3,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,3,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,3,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,4,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,4,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,4,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,4,2,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,4,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,5,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,5,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,5,2,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,5,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,5,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,6,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,6,2,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,6,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,6,3,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,6,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,7,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,7,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,7,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,7,2,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,7,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,8,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,8,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,8,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,8,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,8,2,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,9,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,9,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,9,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,9,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,9,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,10,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,10,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (6,11,1,2.10);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,11,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,12,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,13,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,13,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,14,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,15,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,15,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,15,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,16,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,16,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,16,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,17,2,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,17,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,17,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,18,2,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,18,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,18,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,19,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,19,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,19,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,19,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,20,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,20,2,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,20,2,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (15,20,1,13.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,21,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,21,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,21,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,21,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,22,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,22,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,22,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,23,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,23,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,23,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,24,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,24,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,25,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (18,25,1,21.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,26,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,26,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,27,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,27,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,28,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,28,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,29,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,29,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,30,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,30,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,30,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,30,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,30,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,31,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,31,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,32,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,33,2,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,34,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (19,34,1,9.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,34,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,35,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (19,35,1,9.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,35,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,36,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,36,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,36,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,37,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,37,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,37,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,38,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,38,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,39,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,39,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,40,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,40,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,41,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,41,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,42,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,42,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,42,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,43,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,43,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,43,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,44,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,44,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,45,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,45,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,46,1,18.00);