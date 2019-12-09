CREATE OR ALTER TRIGGER trg_user_audit_update_after ON dbo.tCard
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

    SELECT @cOldCardNumber = cCardNumber, @cOldCardHolder = cCardHolder, @dOldExpireDate = cExpireDate,
            @cOldCCV = cCCV, @nOldTotalAmount = nTotalAmount
    FROM deleted

    SELECT @cNewCardNumber = cCardNumber, @cNewCardHolder = cCardHolder, @dNewExpireDate = cExpireDate,
            @cNewCCV = cCCV, @nNewTotalAmount = nTotalAmount
    FROM inserted

    INSERT INTO dbo.audit_card (cOldCardNumber, cOldCardHolder, dOldExpireDate, cOldCCV,
                cOldTotalAmount, cNewCardNumber, cNewCardHolder, dNewExpireDate, cNewCCV,
                cNewTotalAmount, cAction)
                --'U' stands for UPDATE
           VALUES (@cOldCardNumber, @cOldCardHolder, @dOldExpireDate, @cOldCCV,
                   @nOldTotalAmount,@cNewCardNumber, @cNewCardHolder, @dNewExpireDate, @cNewCCV, @nNewTotalAmount, 'D')
END