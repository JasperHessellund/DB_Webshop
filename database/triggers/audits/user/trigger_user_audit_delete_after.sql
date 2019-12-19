CREATE OR ALTER TRIGGER trg_user_audit_delete_after ON dbo.TUsers
    AFTER DELETE
AS
BEGIN
    DECLARE @cFirstName AS VARCHAR(64)
    DECLARE @cLastName AS VARCHAR(64)
    DECLARE @cAddress AS VARCHAR(255)
    DECLARE @cZipCode AS CHAR(4)
    DECLARE @cPhoneNumber AS VARCHAR(16)
    DECLARE @cEmail AS VARCHAR (255)
    DECLARE @cPassword AS VARCHAR(255)
    DECLARE @nTotalAmount AS INTEGER

    SELECT @cFirstName = cFirstName, @cLastName = cLastName, @cAddress = cAddress,
            @cZipCode = cZipCode, @cPhoneNumber = cPhoneNumber, @cEmail = cEmail,
            @cPassword = cPassword, @nTotalAmount = nTotalAmount
    FROM deleted

    INSERT INTO dbo.audit_users (cOldFirstName, cOldLastName, cOldAddress, cOldZipCode,
                cOldPhoneNumber, cOldEmail, cOldPassword, nOldTotalAmount, cAction)
                --'D' stands for DELETE
           VALUES (@cFirstName, @cLastName, @cAddress, @cZipCode, @cPhoneNumber,
                   @cEmail, @cPassword, @nTotalAmount, 'D')
END