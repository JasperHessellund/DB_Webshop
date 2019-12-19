CREATE TABLE audit_users (
    nAuditUser BIGINT IDENTITY(1,1) PRIMARY KEY,
    cOldFirstName VARCHAR(64),
    cOldLastName VARCHAR(64),
    cOldAddress VARCHAR(255),
    cOldZipCode CHAR(4),
    cOldPhoneNumber VARCHAR(16),
    cOldEmail VARCHAR(255),
    cOldPassword VARCHAR(255),
    nOldTotalAmount INTEGER,
    cNewFirstName VARCHAR(64),
    cNewLastName VARCHAR(64),
    cNewAddress VARCHAR(255),
    cNewZipCode CHAR(4),
    cNewPhoneNumber VARCHAR(16),
    cNewEmail VARCHAR(255),
    cNewPassword VARCHAR(255),
    nNewTotalAmount INTEGER,
    cAction CHAR(1) NOT NULL,
    dTime DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    -- VARBINARY: Variable-length binary data. n can be a value from 1 through 8,000. max indicates that the maximum
    --storage size is 2^31-1 bytes. The storage size is the actual length of the data entered + 2 bytes.
    --The data that is entered can be 0 bytes in length. The ANSI SQL synonym for varbinary is binary varying.

    --SUSER_ID:  Is the login identification number of the user.
    nUserID VARBINARY(85) NOT NULL DEFAULT SUSER_ID(),
    -- NVARCHAR: Variable-size string data. n defines the string size in byte-pairs and can be a value from 1 through
    --4,000. max indicates that the maximum storage size is 2^30-1 characters (2 GB). The storage size is two times n
    --bytes + 2 bytes. For UCS-2 encoding, the storage size is two times n bytes + 2 bytes and the number of characters
    --that can be stored is also n.

    -- SUSER_NAME: Is the login name of the user.
    cUserName NVARCHAR(128) NOT NULL DEFAULT SUSER_NAME(),

    -- HOST_ID: Returns the workstation identification number of the application on the client computer that is connecting to SQL Server
    nHostID CHAR(10) NOT NULL DEFAULT HOST_ID(),
    -- HOST_NAME: Returns the workstation name.
    cHostName NVARCHAR(128) NOT NULL DEFAULT HOST_NAME(),
    CONSTRAINT chkUserAction CHECK(cAction IN ('I','U','D'))
);