--CREATE DATABASE BankOne

--CREATE TABLE AccountHolders(
--Id INT Primary Key NOT NULL,
--FirstName VARCHAR(50), 
--LastName VARCHAR(50),
--SSN VARCHAR(50)
--)
--GO
--CREATE TABLE Accounts(
--Id INT PRIMARY KEY NOT NULL,
--AccountHolderId INT,
--Balance Money
--)
--GO

--ALTER TABLE Accounts
--ADD FOREIGN KEY(AccountHolderId)
--REFERENCES AccountHolders(id)
--GO

--INSERT INTO AccountHolders
--VALUES(1, 'Stani', 'Mi', 'asdad')
--GO
--INSERT INTO AccountHolders
--VALUES(2, 'Miro', 'e', 'asad')
--GO
--INSERT INTO AccountHolders
--VALUES(3, 'Bobi', 'was', 'here')
--GO
--INSERT INTO AccountHolders
--VALUES(4, 'Mario', 'was', 'there')
--GO
--INSERT INTO AccountHolders
--VALUES(5, 'Dido', 'e', 'shmat')
--GO
--INSERT INTO Accounts
--VALUES(1, 1, 8000)
--GO
--INSERT INTO Accounts
--VALUES(2, 1, 7000)
--GO
--INSERT INTO Accounts
--VALUES(3, 2, 5000)
--GO
--INSERT INTO Accounts
--VALUES(4, 2, 5000)
--GO
--INSERT INTO Accounts
--VALUES(5, 2, 5000)
--GO
--INSERT INTO Accounts
--VALUES(6, 3, 9000)
--GO
--INSERT INTO Accounts
--VALUES(7, 3, 9000)
--GO
--INSERT INTO Accounts
--VALUES(8, 3, 9000)
--GO
--Problem 09. Find full Name
--CREATE PROCEDURE usp_GetHoldersFullName AS
--SELECT CONCAT(FirstName, ' ' ,LastName) AS "Full Name" FROM AccountHolders

--Problem 10. People with Balance Higher Than
CREATE PROC usp_GetHoldersWithBalanceHigherThan
(@Amount MONEY)
AS
SELECT FirstName AS "First Name", LastName aS "Last Name" FROM AccountHolders ah
INNER JOIN (SELECT AccountHolderId, SUM(Balance) AS TotalSum FROM Accounts) AS Ts
ON ah.ID = Ts.AccountHolderId
WHERE @Amount < TotalSum

--SELECT AccountHolderId, SUM(Balance) AS TotalSum FROM Accounts
--GROUP BY AccountHolderId
--CREATE PROCEDURE usp_GetHoldersWithBalanceHigherThan(@number MONEY) AS
--SELECT FirstName as "First Name", LastName as "Last Name" FROM AccountHolders
--JOIN (SELECT AccountHolderId, Balance FROM Accounts) AS accounts
--ON accounts.AccountHolderId = AccountHolders.Id
--GROUP BY FirstName, LastName
--HAVING SUM(Balance) > @number

--SELECT FirstName AS "First Name", LastName aS "Last Name" FROM AccountHolders ah
--INNER JOIN (SELECT AccountHolderId, SUM(Balance) AS TotalSum FROM Accounts
--GROUP BY AccountHolderId) AS Ts
--ON ah.ID = Ts.AccountHolderId
--WHERE 20000 < TotalSum

EXEC usp_GetHoldersWithBalanceHigherThan 10000

--Problem 11. Future Value Function
--CREATE FUNCTION ufn_CalculateFutureValue(@sum MONEY, @yearly_interest_rate MONEY, @years INT)
--RETURNS MONEY
--BEGIN 
--DECLARE @index INT = 0
--	WHILE @index < @years
--	BEGIN
--		SET @sum = @sum * (1 + @yearly_interest_rate)
--		SET @index = @index + 1
--	END
--RETURN @sum 
--END


--SELECT dbo.ufn_CalculateFutureValue(1000.0, 0.1, 5);

--DECLARE @account_id INT
--SET @account_id = 1
--GO
--Problem 12. Calculating Interest
--CREATE PROCEDURE usp_CalculateFutureValueForAccount(@account_id INT, @interest_rate MONEY) AS
--DECLARE @initial_balance MONEY
--SET @initial_balance = (SELECT Balance FROM Accounts
--WHERE @account_id = Id)
--DECLARE @balance_in_five_years MONEY
--SET @balance_in_five_years = dbo.ufn_CalculateFutureValue(@initial_balance, @interest_rate, 5)
--SELECT @account_id AS "Account Id", AccountHolders.FirstName AS "First Name", AccountHolders.LastName AS "Last Name", @initial_balance AS "Current Balance", @balance_in_five_years AS "Balance In Five Years" 
--FROM Accounts, AccountHolders
--WHERE(Accounts.Id = @account_id AND AccountHolders.Id = Accounts.Id)

--EXEC usp_CalculateFutureValueForAccount 1, 0.1

--Problem 13. Deposit Money
--CREATE PROCEDURE usp_DepositMoney(@account_id INT, @money_amount MONEY) AS
--BEGIN
--UPDATE  Accounts
--SET Balance = Balance + @money_amount
--FROM Accounts
--WHERE Accounts.Id = @account_id
--END

--EXEC dbo.usp_DepositMoney 1, 1000

--Problem 14. Withdraw Money
--CREATE PROCEDURE usp_WithdrawMoney(@account_id INT, @money_amount MONEY) AS
--BEGIN
--UPDATE  Accounts
--SET Balance = Balance - @money_amount
--FROM Accounts
--WHERE Accounts.Id = @account_id
--END

--Problem 15. Money Transfer
--CREATE PROCEDURE usp_TransferMoney(@source_account_id INT, @target_account_id INT, @money_amount MONEY) AS
--BEGIN
--IF EXISTS(SELECT * FROM Accounts WHERE Id = @source_account_id)
--IF EXISTS(SELECT * FROM Accounts WHERE Id = @target_account_id)
--IF @money_amount >= 0
--	BEGIN
--	UPDATE Accounts
--	SET Balance = Balance - @money_amount
--	FROM Accounts
--	WHERE Accounts.Id = @source_account_id
--	UPDATE Accounts
--	SET Balance = Balance + @money_amount
--	FROM Accounts
--	WHERE Accounts.Id = @target_account_id
--	END
--END
--GO
--EXEC dbo.usp_TransferMoney 1, 9, 1000

--Problem 16. Create Table Logs
--CREATE TABLE Logs
--(
--LogId INT PRIMARY KEY IDENTITY NOT NULL,
--AccountId INT,
--OldSum MONEY,
--NewSum MONEY
--)
--GO

--CREATE TRIGGER tr_account_sum_change ON Accounts
--AFTER UPDATE
--AS
--	BEGIN
--	--DECLARE @id INT = (SELECT DELETED.Id FROM DELETED)
--	--DECLARE @old_sum MONEY = (SELECT DELETED.Balance FROM DELETED WHERE DELETED.Id = @id)
--	--DECLARE @new_sum MONEY = (SELECT INSERTED.Balance FROM INSERTED WHERE INSERTED.Id = @id)
--	INSERT INTO Logs
--	SELECT DELETED.Id, DELETED.Balance, INSERTED.Balance 
--	FROM DELETED, INSERTED
--	WHERE Deleted.Balance != Inserted.Balance
--END
--GO
--EXEC dbo.usp_TransferMoney 1, 2, 1000

--Problem 17. Create Table Emails
--CREATE TABLE NotificationEmails
--(
--ID INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--Recipient INT,
--Subject VARCHAR(200),
--Body VARCHAR(200)
--)
--GO

--CREATE TRIGGER tr_insert_into_logs ON Logs
--AFTER INSERT
--AS
--BEGIN
--	DECLARE @recipient INT = (SELECT AccountId FROM INSERTED)
--	DECLARE @subject VARCHAR(200) = CONCAT('Balance change for account: {', @recipient, '}')
--	DECLARE @body  VARCHAR(200) = CONCAT('On {', GETDATE(), '} your balance was changed from {', (SELECT OldSum FROM INSERTED), '} to {', (SELECT NewSum FROM INSERTED), '}.')
--	INSERT INTO NotificationEmails
--	VALUES(@recipient, @subject, @body)
--END
--GO

--EXEC dbo.usp_TransferMoney 1, 2, 1000