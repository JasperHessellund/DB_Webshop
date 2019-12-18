CREATE OR ALTER PROCEDURE sp_buy_product(
    @Tax INT,
    @TotalAmount INT,
    @CardID INT,
    @UserID INT,
    @JSON_PRODUCTS NVARCHAR(MAX)
)
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION
            SET NOCOUNT ON
            DECLARE @InvoiceID INT

            INSERT INTO TInvoice(nTax, nTotalAmount, nCardID)
                VALUES (@Tax, @TotalAmount, @CardID)
            SET @InvoiceID = SCOPE_IDENTITY()

            DECLARE @CurrentStock TABLE(
            ProductID INT,
            Stock INT,
            Quantity INT,
            CalculatedStock AS (Stock - Quantity)
            )
            INSERT INTO @CurrentStock
                SELECT nProductID, nCurrentStock, Quantity FROM OPENJSON(@JSON_PRODUCTS)
                WITH (
                    ProductID INT '$.nProductID',
                    Quantity INT '$.quantity',
                    Price INT '$.price'
                )
                INNER JOIN TProduct
                    ON nProductID = ProductID

                Declare @InsufficientStock INT
                SET @InsufficientStock = (
                    SELECT COUNT(*) FROM @CurrentStock WHERE
                        CalculatedStock < 0
                )

                IF (@InsufficientStock > 0)
                    BEGIN
                        RAISERROR('Item not in stock', 16, 1);
                    END
                ELSE
                    BEGIN
                        INSERT INTO TInvoiceLine([nInvoiceID],[nProductID],[nQuantity],[nPrice])
                            SELECT @InvoiceID, ProductID, Quantity, Price FROM OPENJSON(@JSON_PRODUCTS)
                            WITH (
                                ProductID INT '$.nProductID',
                                Quantity INT '$.quantity',
                                Price INT '$.price'
                            )

                            UPDATE TProduct
                                SET TProduct.nCurrentStock = cs.CalculatedStock FROM TProduct p
                                    INNER JOIN @CurrentStock cs
                                        on p.nProductID = cs.ProductID

                            UPDATE TCard
                                SET nTotalAmount = (nTotalAmount + @TotalAmount)
                                WHERE nCardID = @CardID

                            UPDATE TUser
                                SET nTotalAmount = (nTotalAmount + @TotalAmount)
                                WHERE nUserID = @UserID

                            COMMIT
                        END

    END TRY
    BEGIN CATCH
        ROLLBACK
    END CATCH
 END
 GO

