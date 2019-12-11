CREATE PROCEDURE sp_delete_user (
    @cEmail AS VARCHAR(255),
    @cPassword AS VARCHAR(255)
)
AS
    BEGIN
        DELETE
        from TUsers
        WHERE cEmail = @cEmail AND cPassword = @cPassword;
end;