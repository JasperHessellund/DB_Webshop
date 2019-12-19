
CREATE PROCEDURE sp_buy_product(
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
		   PRINT('1')
           INSERT INTO TInvoice(nTax, dIssueDate, nTotalAmount, nCardID)
               VALUES (@Tax, GETDATE(), @TotalAmount, @CardID)
           SET @InvoiceID = SCOPE_IDENTITY()
		   PRINT('2')
           DECLARE @CurrentStock TABLE(
           ProductID INT,
           Stock INT,
           Quantity INT,
           CalculatedStock AS (Stock - Quantity)
           )
		   PRINT('3')
           INSERT INTO @CurrentStock
               SELECT nProductID, nCurrentStock, Quantity FROM OPENJSON(@JSON_PRODUCTS)
               WITH (
                   ProductID INT '$.nProductID',
                   Quantity INT '$.nQuantity',
                   Price INT '$.nPrice'
               )
               INNER JOIN TProduct
                   ON nProductID = ProductID

				   PRINT('4')

               Declare @InsufficientStock INT
               SET @InsufficientStock = (
                   SELECT COUNT(*) FROM @CurrentStock WHERE
                       CalculatedStock < 0
               )
              PRINT('5')
               IF (@InsufficientStock > 0)
                   BEGIN
				   PRINT('lol error')
                       RAISERROR('Item not in stock', 16, 1);
                   END
               ELSE
                   BEGIN
				   PRINT('6')
                       INSERT INTO TInvoiceLine([nInvoiceID],[nProductID],[nQuantity],[nPrice])
                           SELECT @InvoiceID, nProductID, nQuantity, nPrice FROM OPENJSON(@JSON_PRODUCTS)
                           WITH (
                               nProductID INT '$.nProductID',
                               nQuantity INT '$.nQuantity',
                               nPrice INT '$.nPrice'
                           )
                          PRINT('7')
                           UPDATE TProduct
                               SET TProduct.nCurrentStock = cs.CalculatedStock FROM TProduct p
                                   INNER JOIN @CurrentStock cs
                                       on p.nProductID = cs.ProductID
                                 PRINT('8')
                           UPDATE TCard
                               SET nTotalAmount = (nTotalAmount + @TotalAmount)
                               WHERE nCardID = @CardID
                              PRINT('9')
                           UPDATE TUsers
                               SET nTotalAmount = (nTotalAmount + @TotalAmount)
                               WHERE nUserID = @UserID

                           COMMIT
                       END

   END TRY
   BEGIN CATCH
       ROLLBACK
   END CATCH
END
