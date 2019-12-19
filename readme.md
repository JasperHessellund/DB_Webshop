#Webshop Database
##Pre-requisites to run the application
* NodeJS version: 12.14.0
* SQL Server 2017
* Modify "sa" login at server level in Microsoft SQL Server Management Studio called with password "Password123"
* In the application use the login "a@a.dk" and password "pass"
##Run scripts in the following order
In the project root, there is a folder called "database" containing all the scripts needed to use the application.

1. Navigate to database/DDL > run "create_webshop.sql"
2. Navigate to database/Data warehouse > run temporal_table.sql
3. Navigate to database/stored_procedures/product > run all the scripts in the folder
4. Navigate to database/transactions > run all the scripts in the folder
5. Navigate to database/users > run all scripts in the folder
6. Navigate to database/triggers/audits/card > run create_audit_card.sql > run the rest of the files in the folder
7. Navigate to database/triggers/audits/user > run create_audit_user.sql > run the rest of the files in the folder
8. Navigate to database/test data > run test data.sql

## How to run the application
After cloning the github repository write "npm install" in the terminal
Either write "nodemon start"  or "npm start" in the terminal in the project root folder