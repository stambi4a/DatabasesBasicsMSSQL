--SELECT TOP 5 EmployeeID, JobTitle, Employees.AddressId, AddressText
--FROM Employees
--INNER JOIN Addresses
--ON Employees.AddressID = Addresses.AddressID
--ORDER BY Employees.AddressId ASC

--SELECT TOP 5 EmployeeID, FirstName, Salary, Departments.Name AS DepartmentName
--FROM Employees
--INNER JOIN Departments
--ON Employees.DepartmentId = Departments.DepartmentId
--Where Salary > 15000
--ORDER BY Departments.DepartmentId ASC

--SELECT TOP 3 Employees.EmployeeID, FirstName
--FROM Employees
--LEFT JOIN EmployeesProjects
--ON Employees.EmployeeID = EmployeesProjects.EmployeeID
--WHERE EmployeesProjects.ProjectID IS NULL
--ORDER BY Employees.EmployeeID

--SELECT TOP 5 Employees.EmployeeID, FirstName, Projects.Name
--FROM Employees
--INNER JOIN EmployeesProjects 
--		ON Employees.EmployeeID = EmployeesProjects.EmployeeID
--		LEFT JOIN Projects
--		ON EmployeesProjects.ProjectID = Projects.ProjectID
--		WHERE Projects.StartDate > '08-13-2002' AND Projects.EndDate IS NULL
--		ORDER BY EmployeeID ASC
		
--SELECT Employees.EmployeeID, FirstName, Projects.Name AS ProjectName
--FROM Employees
--INNER JOIN EmployeesProjects 
--		ON Employees.EmployeeID = EmployeesProjects.EmployeeID
--		LEFT JOIN Projects
--		ON EmployeesProjects.ProjectID = Projects.ProjectID AND YEAR(StartDate) < 2005
--		WHERE Employees.EmployeeID = 24 

SELECT Employees.EmployeeID, Employees.FirstName, Employees.ManagerID, empl.FirstName as ManagerName
FROM Employees
INNER JOIN Employees as empl
		ON Employees.ManagerID = empl.EmployeeID
		WHERE Employees.ManagerID IN(3, 7)
		ORDER BY Employees.EmployeeID ASC
		
		