use webshop;
CREATE PROCEDURE sp_login {
@cEmail AS VARCHAR(255),
@cPassword AS VARCHAR(255)
}
AS
     BEGIN
        SELECT users.email, users.password
