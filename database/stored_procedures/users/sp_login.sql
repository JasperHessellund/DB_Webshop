CREATE PROCEDURE sp_login (
@cEmail AS VARCHAR(255),
@cPassword AS VARCHAR(255)
)
AS
     BEGIN
        SELECT cEmail, cPassword
        FROM tUsers
        WHERE cEmail = @cEmail AND cPassword = @cPassword;
     END;