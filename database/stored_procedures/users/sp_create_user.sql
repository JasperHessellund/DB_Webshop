CREATE OR ALTER PROCEDURE sp_create_user (
@cFirstName AS VARCHAR(64),
@cLastName AS VARCHAR(64),
@cAddress AS VARCHAR(255),
@cZipCode AS CHAR(4),
@cPhoneNumber AS VARCHAR(16),
@cEmail AS VARCHAR (255),
@cPassword AS VARCHAR(255),
@nTotalAmount AS INTEGER
)
AS
IF (SELECT COUNT(*) FROM tUsers WHERE cEmail = @cEmail) < 1
BEGIN
            INSERT INTO tUsers (cFirstName, cLastName, cAddress, cZipCode, cPhoneNumber, cEmail, cPassword, nTotalAmount)
        VALUES (@cFirstName,@cLastName,@cAddress,@cZipCode,@cPhoneNumber,@cEmail,@cPassword,@nTotalAmount)
END