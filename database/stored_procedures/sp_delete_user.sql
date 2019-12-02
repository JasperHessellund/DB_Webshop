USE webshop;

CREATE PROCEDURE sp_deleteUser (
    @cEmail AS VARCHAR(255),
    @cPassword AS VARCHAR(255)
)
AS
    BEGIN
        DELETE
        from users
        WHERE cEmail = @cEmail AND cPassword = @cPassword;
end;