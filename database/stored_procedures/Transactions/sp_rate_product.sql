CREATE OR ALTER PROCEDURE sp_rate_product(
    @UserID INT,
    @ProductID INT,
    @RatingInput NUMERIC(1,0),
    @Comment TEXT
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SET NOCOUNT ON

            INSERT INTO TRating (nUserID, nProductID, nRating, cComment)
                VALUES (@UserID, @ProductID, @RatingInput, @Comment)


            DECLARE @CountRating NUMERIC(2,1)
            SET @CountRating = (SELECT COUNT(*) FROM TRating WHERE nProductID = @ProductID)
            PRINT (@CountRating)

            DECLARE @Rating INT
            SET @Rating = (SELECT SUM(nRating) FROM TRating WHERE nProductID = @ProductID)
            PRINT (@Rating)

            DECLARE @NewAverageRating NUMERIC(2,1)
            SET @NewAverageRating = (@Rating / @CountRating)
            PRINT @NewAverageRating

            UPDATE TProduct
                SET nAverageRating = @NewAverageRating
                WHERE nProductID = @ProductID

            COMMIT

        END TRY
        BEGIN CATCH
            ROLLBACK
        END CATCH

END
GO
