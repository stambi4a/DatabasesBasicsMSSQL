--CREATE DATABASE Hotel

--CREATE TABLE Employees(
--Id INT PRIMARY KEY NOT NULL,
--FirstName VARCHAR(50) NOT NULL,
--LastName VARCHAR(50) NOT NULL,
--Title VARCHAR(50),
--Notes NVARCHAR(max)
--)

--INSERT Employees
--(Id, FirstName, LastName, Title, Notes)
--VALUES(1, 'Stanimir', 'Todorov', 'Boss', 'Stanimir Todorov Notes');
--INSERT Employees
--(Id, FirstName, LastName, Title, Notes)
--VALUES(2, 'Marian', 'Nakov', 'Ordinal', 'Marian Nakov Notes');
--INSERT Employees
--(Id, FirstName, LastName, Title, Notes)
--VALUES(3, 'Svetlin', 'Nakov', 'Janitar', 'Svetlin Nakov Notes');

--CREATE TABLE Customers(
--AccountNumber VARCHAR(20) PRIMARY KEY NOT NULL,
--FirstName VARCHAR(50),
--LastName VARCHAR(50),
--PhoneNumber VARCHAR(50),
--EmergencyName VARCHAR(50),
--EmergencyNumber VARCHAR(50),
--Notes NVARCHAR(max)
--)

--INSERT Customers
--(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
--VALUES('AS120', 'Richard', 'Donner', '026789452312', 'Rich', '0234567899', 'Richard Notes'); 
--INSERT Customers
--(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
--VALUES('AS121', 'Harry', 'Porter', '0267234452312', 'Hary', '0238457340', 'Harry Notes'); 
--INSERT Customers
--(AccountNumber, FirstName, LastName, PhoneNumber, EmergencyName, EmergencyNumber, Notes)
--VALUES('AS122', 'Martin', 'Cronner', '0267766752', 'Mar', '0289239273', 'Martin Notes'); 

--CREATE TABLE RoomStatus(
--RoomStatus BIT NOT NULL,
--Notes NVARCHAR(max)
--)

--INSERT RoomStatus (RoomStatus, Notes) VALUES(0, 'Busy Notes');
--INSERT RoomStatus (RoomStatus, Notes) VALUES(1, 'Vacant Notes');
--INSERT RoomStatus (RoomStatus, Notes) VALUES(1, 'Vacant Notes');

--CREATE TABLE RoomTypes(
--RoomType VARCHAR(50) NOT NULL,
--Notes NVARCHAR(max)
--)

--INSERT RoomTypes
--(RoomType, Notes) VALUES('Economic', 'Economic Notes');
--INSERT RoomTypes
--(RoomType, Notes) VALUES('Standard', 'Standard Notes');
--INSERT RoomTypes
--(RoomType, Notes) VALUES('Business', 'Business Notes');

--CREATE TABLE BedTypes(
--BedType VARCHAR(50) NOT NULL,
--Notes NVARCHAR(max)
--)

--INSERT BedTypes
--(BedType, Notes) VALUES('Double', 'Double Notes');
--INSERT BedTypes
--(BedType, Notes) VALUES('Kings', 'Kings Notes');
--INSERT BedTypes
--(BedType, Notes) VALUES('Luxurious', 'Luxurious Notes');

--CREATE TABLE Rooms(
--RoomNumber INT PRIMARY KEY NOT NULL,
--RoomType VARCHAR(50),
--BedType VARCHAR(50),
--Rate FLOAT,
--RoomStatus BIT,
--Notes NVARCHAR(max)
--)

--INSERT Rooms
--(RoomNumber, RoomType, BedType, Rate, Roomstatus,Notes)
--VALUES(123, 'Standard', 'Double', 20, 1, 'Standard Room Notes');
--INSERT Rooms
--(RoomNumber, RoomType, BedType, Rate, Roomstatus,Notes)
--VALUES(124, 'Business', 'Kings', 45, 1, 'Business Room Notes');
--INSERT Rooms
--(RoomNumber, RoomType, BedType, Rate, Roomstatus,Notes)
--VALUES(125, 'Economic', 'Double', 30, 1, 'Economic Room Notes');

--CREATE TABLE Payments (
--Id INT PRIMARY KEY NOT NULL,
--EmployeeId INT,
--PaymentDate DATE,
--AccountNumber VARCHAR(50),
--FirstDateOccupied DATE,
--LastDateOccupied DATE,
--TotalDays INT,
--AmountCharged FLOAT,
--TaxRate FLOAT,
--TaxAmount FLOAT,
--PaymentTotal FLOAT,
--Notes NVARCHAR(max)
--)


--INSERT Payments
--(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied,LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
--VALUES(1, 2, CAST('2016-09-09' AS DATE), 'AS122', CAST('2016-09-09' AS DATE), CAST('2016-09-12' AS DATE), 3, 100, 25, 25, 125, 'Payments 1 Notes');
--INSERT Payments
--(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied,LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
--VALUES(2, 1, CAST('2016-09-16' AS DATE),'AS123', CAST('2016-09-16' AS DATE), CAST('2016-09-22' AS DATE), 6, 180, 30, 54, 234, 'Payments 2 Notes');
--INSERT Payments
--(Id, EmployeeId, PaymentDate, AccountNumber, FirstDateOccupied,LastDateOccupied, TotalDays, AmountCharged, TaxRate, TaxAmount, PaymentTotal, Notes)
--VALUES(3, 3, CAST('2016-09-22' AS DATE), 'AS125', CAST('2016-09-22' AS DATE), CAST('2016-09-28' AS DATE), 6, 150, 30, 45, 195, 'Payments 3 Notes');

--CREATE TABLE Occupancies(
--Id INT PRIMARY KEY NOT NULL,
--EmployeeId INT, 
--DateOccupied DATE, 
--AccountNumber VARCHAR(50), 
--RoomNumber INT, 
--RateApplied FLOAT, 
--PhoneCharge FLOAT, 
--Notes NVARCHAR(max)
--)

--INSERT Occupancies
--(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
--VALUES(1, 2, CAST('2016-09-22' AS DATE), 'AS124', 123, 30, 10, 'Occupancies First Notes');
--INSERT Occupancies
--(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
--VALUES(2, 1, CAST('2016-09-23' AS DATE), 'AS123', 124, 40, 12, 'Occupancies Second Notes');
--INSERT Occupancies
--(Id, EmployeeId, DateOccupied, AccountNumber, RoomNumber, RateApplied, PhoneCharge, Notes)
--VALUES(3, 3, CAST('2016-09-24' AS DATE), 'AS122', 122, 50, 15, 'Occupancies Third Notes');

--UPDATE Payments
--SET TaxRate = TaxRate * 0.97;

--SELECT TaxRate FROM Payments

TRUNCATE TABLE Occupancies