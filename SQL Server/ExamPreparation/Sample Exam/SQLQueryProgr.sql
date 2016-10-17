--String Joiner Function
--CREATE Function udf_ConcatString(@first VARCHAR(max), @second VARCHAR(max))
--RETURNS VARCHAR(max)
--AS 
--BEGIN
--DECLARE @result VARCHAR(max) = CONCAT(REVERSE(@first), REVERSE(@second))
--RETURN @result
--END
--GO

--SELECT dbo.udf_ConcatString ('Adas', 'aLWFYKWE')

-- Unexpired Loans Procedure
--CREATE PROCEDURE usp_CustomersWithUnexpiredLoans(@customerId INT) AS
--SELECT 
--Customers.CustomerID, FirstName, LoanId FROM Customers
--INNER JOIN Loans
--ON Loans.CustomerId = Customers.CustomerID
--WHERE Loans.ExpirationDate IS NULL AND Customers.CustomerId = @customerId

--EXEC usp_CustomersWithUnexpiredLoans 2

-- Take Loan Procedure
--CREATE PROCEDURE usp_TakeLoan(@CustomerId INT, @LoanAmount DECIMAL(18,2), @Interest DECIMAL(4,2), @StartDate DATE) AS
--BEGIN TRAN
--IF (@LoanAmount < 0.01 OR @LoanAmount > 100000)
--	BEGIN
--	RAISERROR('Invalid Loan Amount.', 16,1)
--	ROLLBACK
--	END
--ELSE
--	BEGIN
--	DECLARE @LoanId INT = (SELECT COUNT(LoanID) FROM Loans) + 1
--	INSERT INTO Loans
--	(LoanId, StartDate, Amount, Interest, ExpirationDate, CustomerId)
--	VALUES(@LoanId, CAST(@StartDate AS DATE), @LoanAmount, @Interest, NULL, @CustomerId)
--	COMMIT
--	END

--SET IDENTITY_INSERT Loans ON
--EXEC usp_TakeLoan @CustomerID = 1, @LoanAmount = 0.01, @Interest = 1, @StartDate='20160915';

--DELETE FROM Loans
--WHERE CustomerId = 1

--DECLARE @StartDate DATE = '20160915', @CustomerID INT = 1, @LoanAmount DECIMAL(18,2)= 500, @Interest DECIMAL(4,2) = 1.0
--DECLARE @LoanId INT = (SELECT COUNT(LoanID) FROM Loans) + 1 
--SET IDENTITY_INSERT Loans ON
--INSERT INTO Loans
--(LoanId, StartDate, Amount, Interest, ExpirationDate, CustomerId)
--VALUES(@LoanId, CAST(@StartDate AS DATE), @LoanAmount, @Interest, NULL, @CustomerId)

-- Trigger Hire Employee
--CREATE TRIGGER tr_After_Employees_Update ON Employees AFTER INSERT
--AS
--DECLARE @EmployeeID INT = (SELECT COUNT(EmployeeID) FROM Employees)
--DECLARE @LoanID INT = (SELECT LoanId FROM EmployeesLoans
--WHERE EmployeeID = @EmployeeID - 1)
--IF(@LoanId IS NOT NULL)
--	BEGIN
--	INSERT INTO EmployeesLoans VALUES(@EmployeeID, @LoanId)
--	END

--CREATE TRIGGER tr_After_Employees_Update ON Employees AFTER INSERT
--AS
--BEGIN
--	UPDATE EmployeesLoans
--	SET EmployeeId = i.EmployeeID
--	FROM EmployeesLoans AS e
--	JOIN inserted AS i
--	ON e.EmployeeId + 1 = i.EmployeeID
--END

	--SELECT * INTO EmployeesLoansCopy FROM EmployeesLoans

	--UPDATE EmployeesLoansCopy
	--SET EmployeeId = 
	--(SELECT i.EmployeeID
	--FROM EmployeesLoansCopy AS e
	--JOIN EmployeesCopy AS i
	--ON e.EmployeeId + 1 = i.EmployeeID)
	--WHERE i.EmployeeId = 31

--dROP TRIGGER tr_After_Employees_Update

--INSERT INTO Employees VALUES (31, 'Jake', '20161212', 500, 2, 1)

--DROP TRIGGER tr_After_Employees_Update

--Bonus Delete Trigger
--SELECT * INTO AccountLogs FROM Accounts 
--DROP TABLE AccountLogs

--CREATE TABLE AccountLogs(
--AccountId INT PRIMARY KEY NOT NULL,
--AccountNumber CHAR(12),
--StartDate DATE,
--CustomerId INT
--);

CREATE TRIGGER tr_Delete_Accounts ON Accounts INSTEAD OF DELETE
AS
BEGIN
	DELETE FROM EmployeesAccounts
	WHERE AccountId IN (SELECT d.AccountID FROM DELETED AS d)
	INSERT INTO AccountLogs SELECT * FROM DELETED 
	DELETE Accounts
	WHERE AccountId IN (SELECT d.AccountId FROM deleted AS d)
END


--DELETE FROM [dbo].[Accounts] WHERE CustomerID = 4
--DELETE FROM Accounts WHERE AccountId = 40
--DROP TRIGGER tr_Delete_Accounts