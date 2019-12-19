
-- 20 products
INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Screwdriver','Can screw screws', '30', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Battery','Fuels your electrics', '10', '50','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Table cloth','Cleans like everything', '10', '40','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Water bottle','Hydrates body and soul', '10', '25','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Nokia 3310','Drop it and you break the floor', '600', '3','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Hammer','Nail things the way you like', '60', '15','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Fidget spinner','2017 what a year!', '15', '10','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Scissor','Ideal for a chrismas gift!', '13', '55','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Nail','Can be used with a hammer or Nokia 3310', '2', '400','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Belt','Holds your jeans tight', '100', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Notebook','Write or burn up, to you', '15', '40','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('USB-C Charger','Innovative fast charging', '60', '80','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Thunderbolt Charger','For the hipsters', '150', '10','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Micro USB Charger','For the outdated', '30', '20','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Ethernet Cable','Who knows what version? Its from China.', '50', '50','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('VHS tape','Dont know we found it in the trash', '5', '1','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Food container','Can contain food', '12', '33','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Fake money: 100kr','Yes we are illegal', '50', '100','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Mouse pad','Cures cancer in the wrist', '70', '44','0')

INSERT INTO TProduct(cName, cDescription, nPrice, nCurrentStock, nAverageRating)
VALUES ('Asprin','For writing 20 product test data inserts', '25', '1000','0')

-- Cities

INSERT INTO TCity([cCity]) VALUES('København NV');
INSERT INTO TCity([cCity]) VALUES('Frederiksberg');
INSERT INTO TCity([cCity]) VALUES('Vanløse');
INSERT INTO TCity([cCity]) VALUES('Næstved');
INSERT INTO TCity([cCity]) VALUES('Silkeborg');
INSERT INTO TCity([cCity]) VALUES('Køge');
INSERT INTO TCity([cCity]) VALUES('Hvidovre');
INSERT INTO TCity([cCity]) VALUES('Kongens Lyngby');
INSERT INTO TCity([cCity]) VALUES('Skanderborg');
INSERT INTO TCity([cCity]) VALUES('Slagelse');

-- 15 users
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('John','Doe','Rentemestervej 1','2400','88331212','a@a.dk','pass',157.50, 1);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Jakob','Jensen','Hvidovrevej 280','2650','765677577','jako@jens.dk','pass',107.00, 2);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Mehmet','Deniz','Egevolden 188','2650','76564527','me@me.dk','pass',79.00, 2);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Mia','Olsen','Bymuren 22','2650','55662121','mia@olsen.dk','pass',53.95, 2);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Jakob','Fisker','Lygten 37','2400','90897867','j@j.dk','pass',83.25, 1);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Mette','Mortensen','Valbyvej 65','4200','76567277','me@Mortensen.dk','pass',166.00, 3);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Jens','Olesen','Vandværksvej 3','4200','76313244','jens@olesen.dk','pass',33.50, 3);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Bibi','Albert','Nordre Fasanvej 32','2000','89785544','bibi@albert.dk','pass',39.00, 4);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Lone','Kragh','Smalegade 8','2000','34233344','lone@kragh.dk','pass',174.50, 4);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Britta','Nielsen','Ålekistevej 230','2720','90908888','britta@nielsen.dk','pass',74.50, 5);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Hanibal','Stump','Linde Alle 3','2720','77664454','hanibal@stump.dk','pass',55.70, 5);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Ali','Kaya','Engelsborgvej 32','2800','43543322','ali@kaya.dk','pass',113.50, 6);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('David','Lorenzen','Dyrlundsvej 12','4600','60778855','d@l.dk','pass',0.00, 7);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Jytte','Jensen','Nørre Alle 2','8660','54667788','jytte@jensen.dk','pass',0.00, 8);
INSERT INTO TUsers(cFirstName,cLastName,cAddress,cZipCode,cPhoneNumber,cEmail,cPassword,nTotalAmount,nCityID) VALUES ('Ole','Skam','Fuglevænget 7','4700','76564433','ole@skam.dk','pass',0.00, 9);

-- Cards
-- Insert credit cards TODO: Add cardholder corresponding to user firstname and lastname

INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Finn Olsen','1122334455667788','04-29-20','444',157.50,1);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Lars Larsen','1133445566778899','04-29-20','555',0.00,1);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Lars Findsen','1144556677889900','04-29-20','666',0.00,1);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Bogdan Thomsen','1155667788990011','04-29-20','777',107.00,2);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Hanne Larsen','1166778899001122','04-29-20','888',79.00,3);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Tim Hanne','1177889900112233','04-29-20','999',26.10,4);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Frank Arnesen','1188990011223344','04-29-20','111',27.85,4);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Lise Lotte','1199001122334455','04-29-20','222',45.85,5);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Birgitte Stougaard','2211223344556677','04-29-20','333',37.40,5);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Kristoffer Birk','2222334455667788','04-29-20','456',166.00,6);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Johanne skov','2244556677889900','04-29-20','467',0.00,6);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Fnan','2255667788990011','04-29-20','478',33.50,7);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Sussanne','2266778899001122','04-29-20','489',39.00,8);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Søren','2277889900112233','04-29-20','512',174.50,9);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Emil','2288990011223344','04-29-20','522',0.00,9);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Magnus','2299001122334455','04-29-20','533',0.00,9);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Philip','3311223344556677','04-29-20','544',74.50,10);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Kristian','3322334455667788','04-29-20','556',55.70,11);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Louise','3333445566778899','04-29-20','567',0.00,11);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Ditte','3344556677889900','04-29-20','578',0.00,11);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Mie','3355667788990011','04-29-20','580',95.50,12);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Mette','3366778899001122','04-29-20','590',18.00,12);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Fie','3377889900112233','04-29-20','610',0.00,12);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Simone','3388990011223344','04-29-20','620',0.00,13);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Simon','3399001122334455','04-29-20','630',0.00,13);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Tom Kristensen','4411223344556677','04-29-20','640',0.00,13);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Lionel Messi','4422334455667788','04-29-20','650',0.00,14);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Christiano Ronaldo','4433445566778899','04-29-20','660',0.00,14);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Robert Van Persie','4444556677889900','04-29-20','670',0.00,14);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Michael Arteta','4455667788990011','04-29-20','680',0.00,15);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Frederik Ljungberg','4466778899001122','04-29-20','690',0.00,15);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Joey Moe','4477889900112233','04-29-20','700',0.00,15);
INSERT INTO TCard(cCardHolder,cCardNumber,dExpireDate,cCCV,nTotalAmount,nUserID) VALUES ('Niklas Thomsen','4488990011223344','04-29-20','710',0.00,15);


-- UserID 14 -- UserID 13 -- UserID 11 -- UserID 10 -- UserID 9 -- UserID 7 -- UserID 5 -- UserID 3 -- UserID 2 -- UserID 1

-- productID 20 -- productID 17 -- productID 16 -- productID 15 -- productID 14 -- productID 12 -- productID 11 -- productID 10
-- productID 8 -- productID 7 -- productID 6 -- productID 5 -- productID 3 -- productID 2 -- productID 1
-- With comments
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (1,20,4, 'So good'); --1
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (2,3,5, 'So nice'); --2
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (3,17,5, 'The best'); --3
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (2,1,1, 'Not very nice, not fresh'); --4
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (3,14,3, 'Decent'); --5
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,2,2, 'Not satisfying'); --6
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (10,10,4, 'Above average'); --7
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (7,12,1, 'Bad'); --8
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,8,2, 'Would not buy again'); --9
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,7,5, 'Best i ever had'); --10
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (11,11,3, 'Average'); --11
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (1,3,1, 'Eeeeeeww'); --12
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,15,2, 'So good it is very nice'); --13
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (9,16,4, 'Good and juicy'); --14
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (5,14,4, 'Very fresh can recommend'); --15
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (7,11,2, 'Dont buy this'); --16
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (11,10,1, 'Disgusting'); --17
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (13,5,4, 'I will tell my friends about this'); --18
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (14,8,5, '10/10'); --19
INSERT INTO TRating (nUserID, nProductID, nRating, cComment) VALUES (5,20,5, 'Best i have had in 2019'); --20

INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:25:55.853',25.00,45.00,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:27:20.437',25.00,69.50,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:27:46.183',25.00,43.00,1);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:29:25.723',25.00,28.50,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:30:17.530',25.00,34.00,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:30:49.303',25.00,44.50,4);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:31:48.357',25.00,28.00,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:32:08.830',25.00,23.50,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:32:24.300',25.00,27.50,5);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:33:43.727',25.00,4.00,6);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:34:02.003',25.00,22.10,6);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:34:19.420',25.00,10.00,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:35:02.060',25.00,12.35,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:35:21.580',25.00,5.50,7);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:37:29.120',25.00,13.50,8);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:37:48.680',25.00,32.35,8);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:38:06.890',25.00,18.70,9);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:39:00.883',25.00,18.70,9);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:40:13.323',25.00,35.00,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:40:28.257',25.00,53.50,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:41:56.920',25.00,45.00,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:42:11.313',25.00,32.50,10);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:43:00.123',25.00,16.00,12);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:43:18.187',25.00,17.50,12);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:09.947',25.00,39.00,13);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:52.953',25.00,11.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:44:54.840',25.00,11.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:45:08.607',25.00,25.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:45:14.373',25.00,25.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:46:45.987',25.00,47.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:06.700',25.00,12.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:08.897',25.00,4.50,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:47:26.737',25.00,36.00,14);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:05.010',25.00,30.00,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:06.457',25.00,30.00,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:14.940',25.00,14.50,17);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:48:51.033',25.00,13.50,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:12.357',25.00,11.50,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:22.967',25.00,7.85,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:49:23.363',25.00,7.85,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:50:19.283',25.00,15.00,18);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:50:59.083',25.00,25.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:51:15.273',25.00,25.00,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:51:58.410',25.00,17.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:52:08.430',25.00,27.50,21);
INSERT INTO TInvoice(dIssueDate,nTax,nTotalAmount,nCardID) VALUES ('2019-12-14 21:52:51.577',25.00,18.00,22);

INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,1,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,1,2,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,1,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,1,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,1,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,2,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,2,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,2,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,2,2,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,2,2,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,3,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,3,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,3,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,3,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,3,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,4,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,4,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,4,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,4,2,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,4,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,5,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,5,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,5,2,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,5,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,5,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,6,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,6,2,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,6,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,6,3,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,6,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,7,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,7,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,7,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,7,2,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,7,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,8,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,8,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,8,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,8,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,8,2,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,9,2,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,9,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,9,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,9,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,9,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,10,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,10,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (6,11,1,2.10);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,11,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,12,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,13,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,13,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,14,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,15,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,15,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,15,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,16,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,16,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,16,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,17,2,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,17,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,17,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,18,2,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,18,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,18,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,19,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,19,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,19,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,19,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,20,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,20,2,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,20,2,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (15,20,1,13.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,21,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,21,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,21,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,21,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,22,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,22,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,22,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,23,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,23,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,23,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,24,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,24,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,25,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (18,25,1,21.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,26,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,26,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,27,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,27,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,28,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,28,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,29,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,29,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (7,30,1,20.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,30,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,30,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,30,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,30,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (11,31,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,31,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (12,32,1,4.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,33,2,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,34,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (19,34,1,9.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,34,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,35,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (19,35,1,9.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (20,35,1,3.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (1,36,1,2.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,36,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,36,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (2,37,1,2.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,37,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,37,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (3,38,1,1.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,38,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,39,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,39,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (8,40,1,2.35);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,40,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,41,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,41,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (4,42,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,42,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,42,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (5,43,1,10.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (9,43,1,5.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,43,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,44,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (13,44,1,8.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (10,45,1,9.50);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,45,1,18.00);
INSERT INTO TInvoiceLine(nProductID,nInvoiceID,nQuantity,nPrice) VALUES (17,46,1,18.00);

