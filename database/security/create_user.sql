-- Make sure to use the correct database
USE webshop

-- Creates the login webshopAdmin with password 'Password1'.
CREATE LOGIN webshopAdmin
    WITH PASSWORD = 'Password1';

-- Creates a database user for the login created above.  
CREATE USER webshopAdmin FOR LOGIN webshopAdmin;
-- Grant user webshopAdmin the role of db_owner
ALTER ROLE db_owner ADD MEMBER webshopAdmin;
ALTER LOGIN webshopAdmin WITH DEFAULT_DATABASE = webshop

-- Creates the login webshopReader with password 'Password2'.
CREATE LOGIN webshopReader
	WITH PASSWORD = 'Password2'

-- Creates a database user for the login created above.
CREATE USER webshopReader FOR LOGIN webshopReader;

-- Grant user webshopReader the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER webshopReader;
ALTER LOGIN webshopReader WITH DEFAULT_DATABASE = webshop

-- Creates the login webshopRestricted with password 'Password3'.
CREATE LOGIN webshopRestricted
	WITH PASSWORD = 'Password3'

-- Creates a database user for the login created above.
CREATE USER webshopRestricted FOR LOGIN webshopRestricted;

-- Grant user webshopRestricted the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER webshopRestricted;
ALTER LOGIN webshopRestricted WITH DEFAULT_DATABASE = webshop
DENY SELECT ON webshop::TInvoice TO webshopRestricted;
DENY SELECT ON webshop::TInvoiceLine TO webshopRestricted;

 --Remember to write down design descisions
 --We decided to use the SQL server standart fixed database level roles because
 --they already contained the permissions we needed for our users, the only thing
 --we needed to alter was the SELECT permissions for the restricted reader user on
 --the invoice related tables

