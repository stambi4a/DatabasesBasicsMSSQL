INSERT INTO DepositTypes
VALUES(1, 'Time Deposit');
INSERT INTO DepositTypes
VALUES(2, 'Call Deposit');
INSERT INTO DepositTypes
VALUES(3, 'Free Deposit');

INSERT INTO Deposits 
(Amount, StartDate, EndDate, DepositTypeId, CustomerId)
SELECT TOP 19 Amount = 
CASE 
WHEN DateOfBirth > CAST('01-01-1980' AS DATE) 
THEN 
	CASE 
	WHEN Gender = 'M' THEN 1100
	WHEN Gender = 'F' THEN 1200
	END
WHEN DateOfBirth <= CAST('01-01-1980' AS DATE) 
THEN
	CASE
	WHEN Gender = 'M' THen 1600
	When Gender = 'F' THEN 1700
	END
END,
CAST(GETDATE() AS DATE) AS StartDate,
NULL AS EndDate,
DepositTypeId = 
CASE
WHEN CustomerId % 2 = 1 AND CustomerID <= 15 THEN 1
WHEN CustomerId % 2 = 0 AND CustomerID <= 15 THEN 2
WHEN CustomerId > 15 THEN 3
END,
CustomerId 
FROM Customers;

INSERT INTO EmployeesDeposits
(EmployeeId, DepositId)
VALUES(15,4),
(20,15),
(8,7),
(4,8),
(3,13),
(3,8),
(4,10),
(10,1),
(13,4),
(14,9);

UPDATE Employees
SET ManagerId = 
CASE
 WHEN EmployeeID BETWEEN 2 AND 10 OR EmployeeId IN(11,21) THEN 1
 WHEN EmployeeID BETWEEN 12 AND 20 THEN 11
 WHEN EmployeeID BETWEEN 22 AND 30 THEN 21
END;

DELETE FROM EmployeesDeposits
WHERE DepositId = 9 OR EmployeeID = 3