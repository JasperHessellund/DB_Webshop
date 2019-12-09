CREATE PROCEDURE sp_create_product (
@cName AS VARCHAR(80),
@cDescription AS TEXT(1500),
@nPrice AS INTEGER NOT NULL,
@nCurrentStock AS INTEGER NOT NULL,
@nAverageRating AS REAL NOT NULL
)
AS
IF (SELECT COUNT(*) FROM tProduct WHERE cName = @cName) < 1
BEGIN
        INSERT INTO tProduct (cName, cDescription, nPrice, nCurrentStock, nAverageRating)
        VALUES (@cName,@cDescription,@nPrice,@nCurrentStock,@nAverageRating)
END

