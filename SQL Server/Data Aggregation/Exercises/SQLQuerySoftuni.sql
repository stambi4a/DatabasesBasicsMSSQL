--SELECT DepartmentId, MIN(Salary) AS MinimumSalary FROM Employees
--Where DepartmentId IN(2,5,7) AND HireDate > CAST('2000-01-01' AS DATE)
--GROUP BY DepartmentId

--SELECT * 
--INTO Emps
--FROM Employees
--WHERE Salary > 30000 

--DELETE FROM Emps
--Where ManagerID = 42

--UPDATE Emps
--SET Salary = Salary  + 5000
--WHERE DepartmentID = 1 

--SELECT DepartmentID, AVG(Salary) AS AverageSalary FROM Emps
--GROUP BY DepartmentId
--SELECT DepartmentId,SUM(Salary) as TotalSalary FROM Employees
--GROUP BY DepartmentId
--ORDER BY TotalSalary
--SELECT DepartmentId, Max(Salary) AS MaxSalary FROM Employees
--GROUP BY DepartmentId
--HAVING MAX(Salary) NOT BETWEEN 30000 AND 70000

--SELECT COUNT(*) AS Count FROM Employees
--WHERE ManagerId IS NULL
--SELECT Salary FROM Employees
--GROUP BY DepartmentId, Salary
--ORDER BY DepartmentID ASC, Salary DESC

--SELECT DepartmentID, Salary FROM Employees
--WHERE DepartmentId = 1
--OFFSET  2 ROWS
--FETCH NEXT 1 ROWS ONLY
--SELECT  Salary from Employees
--   ORDER   BY Salary DESC
--   OFFSET  2 ROWS
--   FETCH NEXT 1 ROWS ONLY

--WITH CTE AS
--(
--    SELECT DepartmentId, Salary
--           RN = DENSE_RANK() OVER (ORDER BY EmpSalary DESC)
--    FROM Employees
--)

--SELECT EmpID,EmpName,EmpSalar
--FROM CTE
--WHERE RN = @NthRow

--WITH CTE AS
--(
--	SELECT DepartmentId, Salary,  DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS DR
--	FROM Employees
--	GROUP BY DepartmentID, Salary
--)
--SELECT DepartmentId, Salary FROM CTE
--WHERE DR = 3

--WITH DepartmentIdSalaryRows AS
--(
--    SELECT e.DepartmentID, e.Salary,
--        ROW_NUMBER() OVER(PARTITION BY e.DepartmentID ORDER BY e.Salary DESC) AS RowNumber
--    FROM
--        Employees e
--)
--SELECT di.DepartmentID, di.Salary AS ThirdHighestSalary
--FROM DepartmentIdSalaryRows di
--WHERE RowNumber = 3

--CREATE VIEW  Salary_Desc AS
--SELECT TOP 200 * FROM Employees
--ORDER BY Salary DESC

--CREATE VIEW Salary_Desc_By_Departments AS
--SELECT TOP 200 FirstName, LastName, DepartmentID, Salary FROM Employees
--GROUP BY DepartmentId, Salary, FIrstNAme, LastName
--ORDER BY DepartmentId, Salary DESC
--GO
--WITH CTE AS
--(
--	SELECT TOP 10 FirstName, LastName,DepartmentID, AVG(Salary) AS AvgSalary FROM Employees
--	GROUP BY DepartmentId
--	Having Salary >= AVG(Salary)
--	ORDER BY Salary DESC
--)

--SELECT TOP 10 FirstName, LastName, DepartmentID FROM CTE

--SELECT TOP 10 FirstName, LastName, DepartmentID FROM Employees
--ORDER BY Salary DESC

SELECT TOP 10 FirstName, LastName,Salary,  DepartmentId AS DepId
    FROM Employees empl
    WHERE Salary > 
		(SELECT AVG(Salary) FROM Employees 
		WHERE  DepartmentId = empl.DepartmentID)