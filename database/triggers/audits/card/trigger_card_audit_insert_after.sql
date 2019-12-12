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