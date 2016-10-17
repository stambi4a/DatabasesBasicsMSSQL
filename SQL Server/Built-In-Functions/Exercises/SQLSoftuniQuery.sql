--SELECT FirstName, LastName FROM Employees
--WHERE SUBSTRING(FirstName, 1, 2) = 'SA'

--SELECT FirstName, LastName FROM Employees
--WHERE LastName LIKE '%ei%'

--SELECT FirstName FROM Employees
--WHERE DepartmentId IN(3, 10) AND YEAR(HireDate) BETWEEN 1995 AND 2005;

--DECLARE @SearchWord  VARCHAR(50)
--SET @SearchWord = '%engineer%' 
--SELECT FirstName, LastName FROM Employees
--WHERE JobTitle NOT LIKE @SearchWord

--SELECT Name FROM Towns
--WHERE LEN(Name) IN(5, 6)
--ORDER BY Name ASC

--SELECT * FROM Towns
--WHERE LEFT(Name, 1) IN('M', 'K', 'B', 'E')
--ORDER BY Name ASC 

--SELECT * FROM Towns
--WHERE LEFT(Name, 1) NOT IN('R', 'D', 'B')
--ORDER BY Name ASC 

--CREATE VIEW [V_EmployeesHiredAfter2000] AS
--SELECT FirstName, LastName FROM Employees
--WHERE YEAR(HireDate) > 2000

--SELECT FirstName, LastName FROM Employees
--WHERE LEN(LastNAme) = 5