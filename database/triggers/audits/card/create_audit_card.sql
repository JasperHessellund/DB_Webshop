CREATE TABLE audit_card (
    --TODO: Dont know if nAudit should have card
    nAuditCard BIGINT IDENTITY(1,1) PRIMARY KEY,
    cOldCardNumber AS VARCHAR(22),
    cOldCardHolder AS VARCHAR(255),
    cOldExpireDate AS DATE
    cOldCCV AS CHAR(3),
    cOldTotalAmount AS INT,
    cNewCardNumber AS VARCHAR(22),
    cNewCardHolder AS VARCHAR(255),
    cNewExpireDate AS DATE
    cNewCCV AS CHAR(3),
    cNewTotalAmount AS INT,
    cAction CHAR(1) NOT NULL,
    dTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    nUserID VARBINARY(85) NOT NULL DEFAULT SUSER_ID(),
    cUserName NVARCHAR(128) NOT NULL DEFAULT SUSER_NAME(),
    nHostID CHAR(10) NOT NULL DEFAULT HOST_ID(),
    cHostName NVARCHAR(128) NOT NULL DEFAULT HOST_NAME(),
    CONSTRAINT chkAction CHECK(cAction IN ('I','U','D')

);