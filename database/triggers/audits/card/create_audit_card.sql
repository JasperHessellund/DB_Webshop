CREATE TABLE audit_card (
    --TODO: Dont know if nAudit should have card
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