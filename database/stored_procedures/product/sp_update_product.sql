CREATE PROCEDURE sp_update_product (
@cName AS VARCHAR(80),
@cDescription AS TEXT,
@nPrice AS INTEGER,
@nCurrentStock AS INTEGER,
@nAverageRating AS REAL
)
AS
BEGIN
        UPDATE tProduct (cName, cDescription, nPrice)
        SET cName = @cName, cDescription = @cDescription, nPrice = @nPrice
        WHERE nProductID = 1
END

