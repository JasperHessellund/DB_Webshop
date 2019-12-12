-- evt sig not null på her
CREATE PROCEDURE sp_create_product (
@cName AS VARCHAR(80),
@cDescription AS TEXT,
@nPrice AS INTEGER,
@nCurrentStock AS INTEGER,
@nAverageRating AS REAL
)
AS
IF (SELECT COUNT(*) FROM TProduct WHERE cName = @cName) < 1
BEGIN
        INSERT INTO TProduct (cName, cDescription, nPrice, nCurrentStock, nAverageRating)
        VALUES (@cName,@cDescription,@nPrice,@nCurrentStock,@nAverageRating)
END

