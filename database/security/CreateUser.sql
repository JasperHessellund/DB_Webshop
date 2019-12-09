-- Make sure to use the correct database
USE Library

-- Creates the login Koenjolleh with password 'Password123'.  
CREATE LOGIN Koenjolleh	  
    WITH PASSWORD = 'Password123';  

-- Creates a database user for the login created above.  
CREATE USER Koenjolleh FOR LOGIN Koenjolleh;  

-- Grant user Koenjolleh the role of db_owner
ALTER ROLE db_owner ADD MEMBER Koenjolleh;
ALTER LOGIN Koenjolleh WITH DEFAULT_DATABASE = Library

-- Creates the login Woodoo with password 'Qwerty123'.
CREATE LOGIN Woodoo
	WITH PASSWORD = 'Qwerty123'

-- Creates a database user for the login created above.
CREATE USER Woodoo FOR LOGIN Woodoo;

-- Grant user Woodoo the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER Woodoo;
ALTER LOGIN Woodoo WITH DEFAULT_DATABASE = Library

-- Creates the login Jayquellen with password 'Wasd123'.
CREATE LOGIN Jayquellen
	WITH PASSWORD = 'Wasd123'

-- Creates a database user for the login created above.
CREATE USER Jayquellen FOR LOGIN Jayquellen;

-- Grant user Jayquellen the role of db_datareader
ALTER ROLE db_datareader ADD MEMBER Jayquellen;
ALTER LOGIN Koenjolleh WITH DEFAULT_DATABASE = Library
DENY SELECT ON Library::TCountry TO Jayquellen;
DENY SELECT ON Library::TAuthor TO Jayquellen;

 --Remember to write down design descisions
 --We decided to use the SQL server standart fixed database level roles because
 --they already contained the permissions we needed for our users, the only thing
 --we needed to alter was the SELECT permissions for the restricted reader user on
 --the invoice related tables

