CREATE PROCEDURE sp_get_product (
@nProductID AS INTEGER
)
AS
    BEGIN
    select * from tProduct;
    WHERE nProductID = 1
end;