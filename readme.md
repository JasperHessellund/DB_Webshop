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

##Neo4J

###SETUP
- Download and install the Neo4j desktop application from https://neo4j.com/download/
- Launch the application
- Click the "new" button to create a new project
- Click "add graph" on the right side of the screen to add a graph to the project
- Navigate to the databate your just created from the explorer.
  The path should be something like the one below.
  C:\Users\Bruger\.Neo4jDesktop\neo4jDatabases\database-d55ee0c0-3ef5-43a2-b952-09e484e06732
- Unzip the CVS-files in the "import" folder of the database you just navigated to through the explorer

###RUN
- Go back to Neo4j desktop application and click "start" on the database and then click "open neo4j browser"
- Execute the following queries:

###CREATE NOTES 
- City nodes

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TCityData.csv" AS row
CREATE (:City {cityID: row.nCityID, cityName: row.cCityName});

- User nodes

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TUserData.csv" AS row
CREATE (:User {userID: row.nUserID, firstName: row.cFirstName, surname: row.cSurname, address: row.cAddress, 
zipCode: row.cZipCode, cityID: row.nCityID, phoneNumber: row.cPhoneNumber, email: row.cEmail, totalSpent: row.nTotalSpent});

- Product nodes

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TProductData.csv" AS row
CREATE (:Product {productID: row.nProductID, name: row.cName, description: row.cDescription, unitPrice: row.nUnitPrice,
stock: row.nStock, averageRating: row.nAverageRating});

- Rating nodes

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TRatingData.csv" AS row
CREATE (:Rating {userID: row.nUserID, productID: row.nProductID, score: row.nScore, comment: row.cComment});

- Relationships between users and cities

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TUserData.csv" AS row
MATCH (user:User {userID: row.nUserID})
MATCH (city:City {cityID: row.nCityID})
MERGE (user)-[:LIVES_IN]->(city);

- Relationships between ratings and users

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TRatingData.csv" AS row
MATCH (rating:Rating {userID: row.nUserID})
MATCH (user:User {userID: row.nUserID})
MERGE (rating)-[:RATED_BY]->(user);

- Relationships between ratings and products

###USING PERIODIC COMMIT
LOAD CSV WITH HEADERS FROM "file:///TRatingData.csv" AS row
MATCH (rating:Rating {productID: row.nProductID})
MATCH (product:Product {productID: row.nProductID})
MERGE (rating)-[:RATING_OF]->(product);

