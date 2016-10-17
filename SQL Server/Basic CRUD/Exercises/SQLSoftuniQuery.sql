--SELECT * FROM Departments

--SELECT Name FROM Departments

--SELECT FirstName,LastName,Salary FROM Employees

--SELECT FirstName,MiddleName,LastName FROM Employees

--SELECT * FROM Employees

--ALTER TABLE Employees
--ADD FullEmailAddress VARCHAR(200);

--UPDATE Employees
--SET FullEmailAddress = FirstName + '.' + LastName + '@softuni.bg';

--SELECT FullEmailAddress FROM Employees

--ALTER TABLE Employees
--DROP COLUMN FullEmailAddress

--CREATE VIEW [Full Email Address] AS
--SELECT (FirstName + '.' + LastName + '@softuni,bg') AS "Full Email Address"
--FROM Employees
--GO

--SELECT [Full Email Address] FROM [Full Email Address]

--SELECT (FirstName + '.' + LastName + '@softuni.bg') AS "Full Email Address" 
--FROM Employees

--SELECT DISTINCT Salary FROM Employees

--SELECT * FROM Employees
--WHERE JobTitle = 'Sales Representative';

--SELECT FirstName, LastName, JobTitle FROM Employees
--WHERE Salary <= 30000 AND Salary >= 20000;

--SELECT (FirstName + ' ' + MiddleName+ ' ' + LastName) AS "Full Name" FROM Employees
--WHERE Salary = 12500 OR Salary = 14000 OR Salary = 23600 OR Salary = 25000;

--SELECT FirstName, LastName FROM Employees
--WHERE ManagerId is NULL;

--SELECT FirstName, LastName, Salary FROM Employees
--WHERE Salary >= 50000;

--SELECT FirstName, LastName, Salary FROM Employees
--WHERE Salary >= 50000
--ORDER BY Salary DESC

--SELECT TOP 5 FirstName, LastName FROM Employees
--ORDER BY Salary DESC

--SELECT FirstName, LastName FROM Employees
--WHERE DepartmentID != 4;

--SELECT * FROM Employees
--ORDER BY Salary DESC, FirstName ASC, LastName DESC, MiddleName ASC

--CREATE VIEW [V_EmployeesSalaries] AS
--SELECT FirstName, LastName, Salary FROM Employees

--CREATE VIEW [V_EmployeeNameJobTitle] AS
--SELECT (FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName) AS "Full Name",
--JobTitle FROM Employees

--SELECT DISTINCT JobTitle FROM Employees

--SELECT TOP 10 * FROM Projects
--ORDER BY StartDate ASC, Name ASC;

--SELECT TOP 7 FirstName, LastName, HireDate FROM Employees
--ORDER BY HireDate DESC

--Update Employees
--SET Salary = Salary * 1.12
--WHERE DepartmentID IN(1, 2, 4, 11);
--SELECT Salary FROM Employees
