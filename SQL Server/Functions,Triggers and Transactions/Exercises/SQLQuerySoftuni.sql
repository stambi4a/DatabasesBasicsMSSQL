--CREATE PROCEDURE usp_GetEmployeesSalaryAbove35000 AS
--SELECT FirstName, LastName FROM Employees
--WHERE Salary > 35000

--CREATE PROCEDURE usp_GetEmployeesSalaryAboveNumber(@number MONEY) AS
--SELECT FirstName, LastName FROM Employees
--WHERE Salary >= @number

--CREATE PROCEDURE usp_GetTownsStartingWith(@townName VARCHAR(50)) AS
--SELECT Name FROM Towns
--WHERE LEFT(Name, LEN(@townName)) = @townName

--SELECT Name FROM Towns
--ORDER BY Name ASC
--SELECT * FROM Employees
--ORDER BY AddressId
--DECLARE  @townName VARCHAR(50)
--SET @townName = 'Seattle'
--CREATE PROCEDURE usp_GetEmployeesFromTown(@townName VARCHAR(50)) AS
--SELECT FirstName, LastName FROM Employees
--WHERE AddressId IN (
--SELECT AddressID FROM Addresses 
--	WHERE TownID = (
--	SELECT TownID FROM Towns
--		WHERE LEFT(Name, LEN(@townName)) = @townName))

--CREATE FUNCTION ufn_GetSalaryLevel(@salary MONEY) 
--RETURNS VARCHAR(50)
--AS
--BEGIN
--    DECLARE @return VARCHAR(50)
--	SELECT @return = CASE

--	WHEN @salary < 30000 THEN 'Low'
--	WHEN @salary >= 30000 AND @salary <= 50000 THEN 'Average'
--	ELSE 'High'
--	END
--	RETURN @return
--END 
--DECLARE @some VARCHAR(50)
--SELECT dbo.ufn_GetSalaryLevel(60000);
--GO

--Problem 6. Employees by Salary Level
--CREATE PROCEDURE usp_EmployeesBySalaryLevel(@salaryInputLevel VARCHAR(50)) AS
--SELECT FirstName, LastName FROM Employees
--WHERE dbo.ufn_GetSalaryLevel(Salary) = @salaryInputLevel

--EXEC dbo.usp_EmployeesBySalaryLevel 'High'

--Problem 07. Define Function
--CREATE FUNCTION ufn_IsWordComprised(@setOfLetters NVARCHAR(max), @word NVARCHAR(max))
--RETURNS BIT
--AS
--BEGIN
--	DECLARE @wordLength INT, @index INT, @result BIT, @letter NCHAR
--	SET @wordLength = LEN(@word);
--	SET @index = 1;
--	SET @result = 1;
--	WHILE @index < @wordLength
--	BEGIN 
--		SET @letter = SUBSTRING(@word, @index, 1);
--		IF CHARINDEX(@letter, @setOfLetters) = 0 
--		RETURN 0;
--		SET @index = @index + 1;
--	END
--RETURN @result;
--END
--GO

--SELECT 	dbo.ufn_IsWordComprised('oistmiahf', 'Sofia');
--SELECT 	dbo.ufn_IsWordComprised('halves', 'Sofia');
--SELECT 	dbo.ufn_IsWordComprised('Rob', 'bobr');
--SELECT 	dbo.ufn_IsWordComprised('Guy', 'pppp');

--Problem 08. Delete Employees and Departments
--ALTER PROCEDURE dbo.delete_columns AS
----ALTER TABLE EmployeesProjects
----DROP "FK_EmployeesProjects_Employees" 
----ALTER TABLE Departments
----DROP "FK_Departments_Employees" 
--ALTER TABLE Employees
--DROP "FK_Employees_Employees" 
--DELETE FROM Employees
--WHERE DepartmentId In(7, 8)

--SELECT * FROM Employees
--WHERE departmentID IN(7, 8)