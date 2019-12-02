USE webshop;
CREATE PROCEDURE sp_createUser (
@cFirstName AS VARCHAR(64),
@cLastName AS VARCHAR(64),
@cGender AS VARCHAR(6),
@cAddress AS VARCHAR(255),
@nZipCode AS INTEGER,
@nPhoneNumber AS INTEGER,
@cEmail AS VARCHAR (255),
@cPassword AS VARCHAR(255),
@nTotalAmount AS INTEGER
)
AS
    BEGIN
        INSERT INTO users (cFirstName, cLastName, cGender, cAddress, nZipCode, nPhoneNumber, cEmail, cPassword, nTotalAmount)
        VALUES (@cFirstName,@cLastName,@cGender,@cAddress,@nZipCode,@nPhoneNumber,@cEmail,@cPassword,@nTotalAmount)

end;