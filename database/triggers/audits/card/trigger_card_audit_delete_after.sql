CREATE OR ALTER TRIGGER trg_user_audit_delete_after ON dbo.tCard
    AFTER DELETE
AS
BEGIN
    DECLARE @cCardNumber AS VARCHAR(22)
    DECLARE @cCardHolder AS VARCHAR(255)
    DECLARE @dExpireDate AS DATE
    DECLARE @cCCV AS CHAR(3)
    DECLARE @nTotalAmount AS INTEGER

    SELECT @cCardNumber = cCardNumber, @cCardHolder = cCardHolder, @cExpireDate = cExpireDate,
            @cCCV = cCCV, @nTotalAmount = nTotalAmount
    FROM deleted

    INSERT INTO dbo.audit_card (cOldCardNumber, cOldCardHolder, cOldExpireDate, cOldCCV,
                cOldTotalAmount, cAction)
                --'D' stands for DELETE
           VALUES (@cCardNumber, @cCardHolder, @cExpireDate, @cCCV, @nTotalAmount, 'D')
END