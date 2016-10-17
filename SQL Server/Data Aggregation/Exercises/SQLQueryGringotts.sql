
--SELECT COUNT(FirstName) FROM WizzardDeposits

--SELECT MAX(MagicWandSize) AS LongestMagicWand FROM WizzardDeposits

--SELECT DepositGroup, MAX(MagicWandSize) AS LongestMagicWand FROM WizzardDeposits
--GROUP BY DepositGroup
--CREATE VIEW SomeView AS
--SELECT DepositGroup, AVG(MagicWandSize) AS LongestMagicWand
--FROM WizzardDeposits
--ORDER BY LongestMagicWand
--GO
--SELECT TOP 2 DepositGroup
--FROM WizzardDeposits
--GROUP BY DepositGroup
--ORDER BY AVG(MagicWandSize) ASC

--SELECT DepositGroup, SUM(DepositAmount) AS TotalSum FROM WizzardDeposits
--GROUP BY DepositGroup

--SELECT DepositGroup, SUM(DepositAmount) AS TotalSum FROM WizzardDeposits
--WHERE MagicWandCreator = 'Ollivander Family'
--GROUP BY DepositGroup

--SELECT DepositGroup, SUM(DepositAmount) AS TotalSum FROM WizzardDeposits
--WHERE MagicWandCreator = 'Ollivander Family' 
--GROUP BY DepositGroup
--HAVING SUM(DepositAmount) < 150000
--ORDER BY TotalSum DESC

--SELECT DepositGroup, MagicWandCreator, MIN(DepositCharge) AS MinDepositCharge FROM WizzardDeposits
--GROUP BY DepositGroup, MagicWandCreator
--ORDER BY MagicWandCreator ASC, DepositGroup ASC

--SELECT 
--CASE 
-- WHEN Age >= 0 AND Age <= 10 THEN  '[0-10]'
-- WHEN Age >= 11 AND Age <= 20 THEN '[11-20]'
-- WHEN Age >= 21 AND Age <= 30 THEN '[21-30]'
-- WHEN Age >= 31 AND Age <= 40 THEN '[31-40]'
-- WHEN Age >= 41 AND Age <= 50 THEN '[41-50]'
-- WHEN Age >= 51 AND Age <= 60 THEN '[51-60]'
-- WHEN Age >= 61 THEN '[61+]' END AS AgeGroup,
--  COUNT(Age) AS WizardCount FROM WizzardDeposits
--GROUP BY
--CASE
-- WHEN Age >= 0 AND Age <= 10 THEN  '[0-10]'
-- WHEN Age >= 11 AND Age <= 20 THEN '[11-20]'
-- WHEN Age >= 21 AND Age <= 30 THEN '[21-30]'
-- WHEN Age >= 31 AND Age <= 40 THEN '[31-40]'
-- WHEN Age >= 41 AND Age <= 50 THEN '[41-50]'
-- WHEN Age >= 51 AND Age <= 60 THEN '[51-60]'
-- WHEN Age >= 61 THEN '[61+]' END

--SELECT DISTINCT(LEFT(FirstName, 1)) AS FirstLetter FROM WizzardDeposits
--WHERE DepositGroup = 'Troll Chest'
--GROUP BY FirstName

SELECT DepositGroup, IsDepositExpired, AVG(DepositInterest) AS AverageInterest FROM WizzardDeposits
WHERE DepositStartDate > FORMAT('1985/01/01', 'yyyy-MM-dd')
GROUP BY DepositGroup, IsDepositExpired
ORDER BY DepositGroup  DESC, IsDepositExpired ASC


--SELECT TOP 1  FIRST_VALUE(DepositAmount) OVER (ORDER BY Id ASC)
--  - LAST_VALUE(DepositAmount) OVER (ORDER BY Id DESC) AS SumDifference FROM WizzardDeposits