-- 20 products
INSERT INTO TProduct
VALUES ('Screwdriver','Can screw screws', '30', '20','0')

INSERT INTO TProduct
VALUES ('Battery','Fuels your electrics', '10', '50','0')

INSERT INTO TProduct
VALUES ('Table cloth','Cleans like everything', '10', '40','0')

INSERT INTO TProduct
VALUES ('Water bottle','Hydrates body and soul', '10', '25','0')

INSERT INTO TProduct
VALUES ('Nokia 3310','Drop it and you break the floor', '600', '3','0')

INSERT INTO TProduct
VALUES ('Hammer','Nail things the way you like', '60', '15','0')

INSERT INTO TProduct
VALUES ('Fidget spinner','2017 what a year!', '15', '10','0')

INSERT INTO TProduct
VALUES ('Scissor','Ideal for a chrismas gift!', '13', '55','0')

INSERT INTO TProduct
VALUES ('Nail','Can be used with a hammer or Nokia 3310', '2', '400','0')

INSERT INTO TProduct
VALUES ('Belt','Holds your jeans tight', '100', '20','0')

INSERT INTO TProduct
VALUES ('Notebook','Write or burn up, to you', '15', '40','0')

INSERT INTO TProduct
VALUES ('USB-C Charger','Innovative fast charging', '60', '80','0')

INSERT INTO TProduct
VALUES ('Thunderbolt Charger','For the hipsters', '150', '10','0')

INSERT INTO TProduct
VALUES ('Micro USB Charger','For the outdated', '30', '20','0')

INSERT INTO TProduct
VALUES ('Ethernet Cable','Who knows what version? Its from China.', '50', '50','0')

INSERT INTO TProduct
VALUES ('VHS tape','Dont know we found it in the trash', '5', '1','0')

INSERT INTO TProduct
VALUES ('Food container','Can contain food', '12', '33','0')

INSERT INTO TProduct
VALUES ('Fake money: 100kr','Yes we are illegal', '50', '100','0')

INSERT INTO TProduct
VALUES ('Mouse pad','Cures cancer in the wrist', '70', '44','0')

INSERT INTO TProduct
VALUES ('Asprin','For writing 20 product test data inserts', '25', '1000','0')

--5 cities
INSERT INTO TCity
VALUES ('Viborg');

INSERT INTO TCity
VALUES ('Horsen');

INSERT INTO TCity
VALUES ('Frederiksberg');

INSERT INTO TCity
VALUES ('Ølstykke');

INSERT INTO TCity
VALUES ('Slagelse');

INSERT INTO TCity
VALUES ('Holsterbro');

INSERT INTO TCity
VALUES ('Helsingør');

INSERT INTO TCity
VALUES ('København K');

INSERT INTO TCity
VALUES ('Stubbekøbing');

INSERT INTO TCity
VALUES ('Jyllinge');

-- 15 users TODO
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (1,'John','Doe','Rentemestervej 1','2400',1,'88331212','a@a.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (2,'Jakob','Jensen','Hvidovrevej 280','2650',7,'76567777','jako@jens.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (3,'Mehmet','Deniz','Egevolden 188','2650',7,'76567777','me@me.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (4,'Mia','Olsen','Bymuren 22','2650',7,'55662121','mia@olsen.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (5,'Jakob','Fisker','Lygten 37','2400',1,'90897867','j@j.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (6,'Mette','Mortensen','Valbyvej 65','4200',10,'76567777','me@Mortensen.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (7,'Jens','Olesen','Vandværksvej 3','4200',10,'76313244','jens@olesen.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (8,'Bibi','Albert','Nordre Fasanvej 32','2000',2,'89785544','bibi@albert.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (9,'Lone','Kragh','Smalegade 8','2000',2,'34233344','lone@kragh.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (10,'Britta','Nielsen','Ålekistevej 230','2720',3,'90908888','britta@nielsen.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (11,'Hanibal','Stump','Linde Alle 3','2720',3,'77664454','hanibal@stump.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (12,'Ali','Kaya','Engelsborgvej 32','2800',8,'43543322','ali@kaya.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (13,'David','Lorenzen','Dyrlundsvej 12','4600',6,'60778855','d@l.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (14,'Jytte','Jensen','Nørre Alle 2','8660',9,'54667788','jytte@jensen.dk',0);
INSERT INTO TUser(nUserID,cFirstName,cLastName,cAddress,cZipCode,nCityID,cPhoneNumber,cEmail,nTotalSpent) VALUES (15,'Ole','Skam','Fuglevænget 7','4700',4,'76564433','ole@skam.dk',0);



INSERT INTO TUsers
VALUES ('Joachim', 'Stougaard', 'Larsbjørnsstræde 17. 1tv.', '2000', '40813813', 'joachim.stougaard@hotmail.com', 'test', 0, 6);

INSERT INTO TUsers
VALUES ('Lars', 'Larsen', 'Larsbjørnsstræde 55. 1tv.', '2000', '40605030', 'lars_larsen@hotmail.com', 'pass', 0, 6);

-- average of 2 credit cards pr. user
INSERT INTO TCard
VALUES ('4362727348887128', 'Birgitte Stougaard', '2021-12-31', '514', '0', 1);

INSERT INTO TCard
VALUES ('4362727342987128', 'Joachim Stougaard', '2022-09-15', '883', '0', 1);

INSERT INTO TCard
VALUES ('4362727342987169', 'Lars Larsen', '2023-09-03', '683', '0', 2);

INSERT INTO TCard
VALUES ('4362496342987128', 'Lars Larsen', '2020-09-15', '333', '0', 2);

INSERT INTO TCard
VALUES ('8862496342987128', 'Henrik Thomsen', '2024-09-15', '843', '0', 3);

INSERT INTO TCard
VALUES ('8862496342987128', 'Henrik Thomsen', '2024-09-15', '843', '0', 3);

INSERT INTO TCard
VALUES ('8879496342987128', 'Finn Person', '2021-04-15', '853', '0', 4);

INSERT INTO TCard
VALUES ('8862496342987128', 'Thom', '2024-09-15', '843', '0', 4);





