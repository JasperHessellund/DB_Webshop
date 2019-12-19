CREATE OR ALTER TRIGGER trg_user_audit_update_after ON dbo.TUsers
    AFTER DELETE
AS
BEGIN
    DECLARE @cOldFirstName AS VARCHAR(64)
    DECLARE @cOldLastName AS VARCHAR(64)
    DECLARE @cOldAddress AS VARCHAR(255)
    DECLARE @cOldZipCode AS CHAR(4)
    DECLARE @cOldPhoneNumber AS VARCHAR(16)
    DECLARE @cOldEmail AS VARCHAR (255)
    DECLARE @cOldPassword AS VARCHAR(255)
    DECLARE @nOldTotalAmount AS INTEGER
    DECLARE @cNewFirstName AS VARCHAR(64)
    DECLARE @cNewLastName AS VARCHAR(64)
    DECLARE @cNewAddress AS VARCHAR(255)
    DECLARE @cNewZipCode AS CHAR(4)
    DECLARE @cNewPhoneNumber AS VARCHAR(16)
    DECLARE @cNewEmail AS VARCHAR (255)
    DECLARE @cNewPassword AS VARCHAR(255)
    DECLARE @nNewTotalAmount AS INTEGER

    SELECT @cOldFirstName = cFirstName, @cOldLastName = cLastName, @cOldAddress = cAddress,
            @cOldZipCode = cZipCode, @cOldPhoneNumber = cPhoneNumber, @cOldEmail = cEmail,
            @cOldPassword = cPassword, @nOldTotalAmount = nTotalAmount
    FROM deleted
    SELECT @cNewFirstName = cFirstName, @cNewLastName = cLastName, @cNewAddress = cAddress,
            @cNewZipCode = cZipCode, @cNewPhoneNumber = cPhoneNumber, @cNewEmail = cEmail,
            @cNewPassword = cPassword, @nNewTotalAmount = nTotalAmount
    FROM inserted

    INSERT INTO dbo.audit_users (cOldFirstName, cOldLastName, cOldAddress, cOldZipCode,
                cOldPhoneNumber, cOldEmail, cOldPassword, nOldTotalAmount,cNewFirstName, cNewLastName, cNewAddress, cNewZipCode,
                cNewPhoneNumber, cNewEmail, cNewPassword, nNewTotalAmount, cAction)
                --'U' stands for UPDATE
           VALUES (@cOldFirstName, @cOldLastName, @cOldAddress, @cOldZipCode, @cOldPhoneNumber,
                   @cOldEmail, @cOldPassword, @nOldTotalAmount,@cNewFirstName, @cNewLastName, @cNewAddress, @cNewZipCode, @cNewPhoneNumber,
                   @cNewEmail, @cNewPassword, @nNewTotalAmount, 'D')
END