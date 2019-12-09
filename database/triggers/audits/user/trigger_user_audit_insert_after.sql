CREATE OR ALTER TRIGGER trg_user_audit_insert_after ON dbo.tUsers
    AFTER INSERT
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
    FROM inserted

    INSERT INTO dbo.audit_user (cNewFirstName, cNewLastName, cNewAddress, cNewZipCode,
                cNewPhoneNumber, cNewEmail, cNewPassword, cNewTotalAmount, cAction)
                --'I' stands for INSERT
           VALUES (@cFirstName, @cLastName, @cAddress, @cZipCode, @cPhoneNumber,
                   @cEmail, @cPassword, @nTotalAmount, 'I')
END