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