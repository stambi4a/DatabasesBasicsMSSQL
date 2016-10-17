--CREATE DATABASE CarRental 

CREATE TABLE Categories (
Id INT PRIMARY KEY NOT NULL,
Category VARCHAR(50) NOT NULL,
DailyRate FLOAT,
WeeklyRate FLOAT,
MonthlyRate FLOAT,
WeekendRate FLOAT
)

INSERT Categories
(Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES(1, 'First Category', 10, 30, 100, 20);
INSERT Categories
(Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES(2, 'Second Category', 11, 31, 101, 21);
INSERT Categories
(Id, Category, DailyRate, WeeklyRate, MonthlyRate, WeekendRate)
VALUES(3, 'Third Category', 12, 32, 102, 22);

CREATE TABLE Cars (
Id INT PRIMARY KEY NOT NULL,
PlateNumber VARCHAR(50) NOT NULL,
Make VARCHAR(20),
Model VARCHAR(20),
CarYear DATE,
CategoryID INT,
Doors INT,
Picture IMAGE,
Condition BIT,
Available BIT
)

INSERT Cars
(Id, PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES(1, 'CA 1980 AP', 'Lada', '1200', CAST('1985-07-08' AS DATE), 3, 4, NULL, 0, 1);
INSERT Cars
(Id, PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES(2, 'CB 2222 AP', 'Toyota', 'Corolla', CAST('2008-04-02' AS DATE), 2, 4, NULL, 1, 1);
INSERT Cars
(Id, PlateNumber, Make, Model, CarYear, CategoryId, Doors, Picture, Condition, Available)
VALUES(3, 'C 4567 HO', 'Ford', 'Escort', CAST('1999-11-08' AS DATE), 1, 4, NULL, 0, 0);

CREATE TABLE Employees (
Id INT PRIMARY KEY NOT NULL,
FirstName VARCHAR(20) NOT NULL,
LastName VARCHAR(20),
Title VARCHAR(20),
 Notes NVARCHAR(max),
)

INSERT Employees(id, FirstName, LastName, Title, Notes)
VALUES(1, 'Kay', 'Mars', 'CEO', 'Kay Mars Notes');
INSERT Employees(id, FirstName, LastName, Title, Notes)
VALUES(2, 'Mark', 'Lee', 'CTO', 'Mark Lee Notes');
INSERT Employees(id, FirstName, LastName, Title, Notes)
VALUES(3, 'Jamie', 'Strong', 'PR Head Manager', 'Jamie Strong Notes');

CREATE TABLE Customers (
Id INT PRIMARY KEY NOT NULL,
DriverLicenceNumber VARCHAR(20) NOT NULL,
FullName VARCHAR(50) NOT NULL,
Address NVARCHAR(100),
City VARCHAR(50),
ZipCode NVARCHAR(20),
Notes NVARCHAR(max)
)

INSERT Customers(Id, DriverLicenceNumber, FullName, Address, City, ZipCode, Notes)
VALUES(1, 'CA 7234 HK', 'Krasimir Stoyanov', 'ul.Zahari Stoynaov 20', 'Sofia', '1336', 'Krasi Notes');
INSERT Customers(Id, DriverLicenceNumber, FullName, Address, City, ZipCode, Notes)
VALUES(2, 'CB 6678 PP', 'Ivan Hristov', 'ul.Matej Preobrajenski 16', 'Sofia', '1221', 'Ivan Notes');
INSERT Customers(Id, DriverLicenceNumber, FullName, Address, City, ZipCode, Notes)
VALUES(3, 'CO 2643 CC', 'Maria Veleva', 'jk.Lulin blok 323', 'Sofia', '1334', 'Maria Notes');

CREATE TABLE RentalOrders (
Id INT PRIMARY KEY NOT NULL,
EmployeeId INT NOT NULL,
CustomerId INT NOT NULL,
CarId INT NOT NULL,
CarCondition VARCHAR(50),
TankLevel FLOAT,
KilometrageStart INT,
KilometrageEnd INT,
TotalKilometrage INT,
StartDate DATE,
EndDate DATE,
TotalDays INT,
RateApplied FLOAT,
TaxRate FLOAT,
OrderStatus BIT,
Notes NVARCHAR(max)
)

INSERT RentalOrders(Id ,EmployeeId,CustomerId,CarId,CarCondition,TankLevel,KilometrageStart,KilometrageEnd,TotalKilometrage,StartDate,EndDate,TotalDays,RateApplied,TaxRate,OrderStatus,Notes)
VALUES(1, 2, 3, 3, 'Good', 20, 120, 300, 180, CAST('2016-09-28' AS DATE), CAST('2016-09-30' AS DATE), 2, 1.5, 15, 1, 'Order1 Notes');
INSERT RentalOrders(Id ,EmployeeId,CustomerId,CarId,CarCondition,TankLevel,KilometrageStart,KilometrageEnd,TotalKilometrage,StartDate,EndDate,TotalDays,RateApplied,TaxRate,OrderStatus,Notes)
VALUES(2, 3, 3, 1, 'Excellent', 40, 120000, 120800, 800, CAST('2016-09-14' AS DATE), CAST('2016-09-17' AS DATE), 3, 2.2, 17, 0, 'Order2 Notes');
INSERT RentalOrders(Id ,EmployeeId,CustomerId,CarId,CarCondition,TankLevel,KilometrageStart,KilometrageEnd,TotalKilometrage,StartDate,EndDate,TotalDays,RateApplied,TaxRate,OrderStatus,Notes)
VALUES(3, 1, 1, 2, 'Normal', 35, 54000, 56440, 2440, CAST('2016-08-11' AS DATE), CAST('2016-08-31' AS DATE), 20, 1.6, 13, 0, 'Order Notes');