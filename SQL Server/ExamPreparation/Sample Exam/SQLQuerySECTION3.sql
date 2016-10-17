--SELECT EmployeeID, HireDate, Salary, BranchId FROM Employees
--WHERE salary > 2000 AND HireDate > CAST('2009/06/15' AS DATE)

--SECTION PO3. Customer Age
--SELECT FirstName, DateOfBirth, DATEDIFF(YEAR, DateOfBirth, CAST('2016-10-01' AS DATE)) AS Age FROM Customers
--WHERE DATEDIFF(YEAR, DateOfBirth, CAST(GETDATE() AS DATE)) BETWEEN 40 AND 50

-- CustomerCity
--SELECT CustomerID, FirstName, LastName, Gender, CityName FROM Customers
--INNER JOIN Cities 
--ON Cities.CityId = Customers.CityId 
--WHERE LEN(CityName) >= 8
--AND (LEFT(LastName, 2) = 'Bu' OR LEFT(REVERSE(FirstName), 1)= 'a')

--Employee Accounts
--SELECT TOP 5 Employees.EmployeeId, FirstName, AccountNumber FROM Employees
--INNER JOIN EmployeesAccounts
--ON EmployeesAccounts.EmployeeID = Employees.EmployeeId
--INNER JOIN Accounts
--ON Accounts.AccountID = EmployeesAccounts.AccountID
--WHERE YEAR(Accounts.StartDate) > 2012
--ORDER BY employees.FirstName DESC

-- Count Cities
SELECT  MIN(CityName) AS CityName, MIN(Branches.Name) AS Name, COUNT(EmployeeID) EmployeesCount FROM Cities
INNER JOIN Branches
ON Branches.CityId = Cities.CityId
INNER JOIN Employees
ON Employees.BranchId = Branches.BranchId
WHERE Cities.CityId != 4 AND Cities.CityId != 5
GROUP BY Cities.CityId, Branches.BranchId
HAVING COUNT(Employees.EmployeeId) >= 3

 SELECT c.CityName, b.Name, COUNT(*) AS EmployeesCount FROM Cities AS c
       JOIN Branches AS b
         ON b.CityID = c.CityID
      AND b.CityID NOT IN (4,5)
     JOIN Employees AS e
        ON e.BranchID = b.BranchID
 GROUP BY c.CityName, b.Name
HAVING COUNT(e.EmployeeId) >= 3 
--SELECT Cities.CityName,Branches.Name, 3 FROM
--Cities, Branches 
--WHERE CityName = 'Budapest' AND Branches.Name = 'Angela'

--Loan Statistics
--SELECT SUM(Loans.Amount) AS TotalLoanAmount, MAX(Interest) AS MaxInterest, MIN(Salary) AS MinEmployeeSalary FROM Loans
--INNER JOIN EmployeesLoans
--ON EmployeesLoans.LoanID = Loans.LoanID
--INNER JOIN Employees
--ON Employees.EmployeeID = EmployeesLoans.EmployeeID

-- Unite People
--SELECT TOP 3 FirstName, CityName FROM Employees
--INNER JOIN Branches
--ON Branches.BranchId = Employees.BranchId
--INNER JOIN Cities
--ON Cities.CityID = Branches.CityID
--UNION ALL
--SELECT TOP 3 FirstName, CityName FROM Customers
--INNER JOIN Cities
--ON Cities.CityID = Customers.CityID

-- Customers Without Accounts
--SELECT CustomerId, Height FROM Customers
--WHERE CustomerId NOT IN(SELECT CustomerID FROM Accounts)
--AND Height Between 1.74 AND 2.04

-- Customers With Accounts
--SELECT TOP 5 Customers.CustomerId, Amount FROM Customers
--INNER JOIN Loans
--ON Loans.CustomerId = Customers.CustomerId
----HAVING Amount > 
----(SELECT AVG(Amount) FROM Customers INNER JOIN LOANS
----ON Loans.CustomerId = Customers.CustomerId
----WHERE Gender = 'M')
--ORDER BY LastName ASC

-- Oldest ACcount
--SELECT Customers.CustomerId, FirstName,StartDate FROM Customers
--INNER JOIN Accounts
--ON Accounts.CustomerId = Customers.CustomerId
--WHERE StartDATE = (SELECT MIN(StartDate) FROM Accounts)