--Pr.1 Album's Name And Description
--SELECT Name, 
--CASE
--	WHEN Description IS NULL THEN 'No description'
--	ELSE Description
--END AS Description FROM Albums
--ORDER BY Name

--Pr.2 Photographs And Albums
--SELECT Title, Albums.Name FROM Photographs
--INNER JOIN AlbumsPhotographs ON 
--AlbumsPhotographs.PhotographId = Photographs.Id
--INNER JOIN Albums 
--ON Albums.Id = AlbumsPhotographs.AlbumId
--ORDER BY Albums.Name ASC, Photographs.Title DESC

--Pr.3 Photographs with Category and Author
--SELECT Title, Link, Description, Categories.Name AS CategoryName, Users.FullName AS Author FROM Photographs
--ON Categories.ID = Photographs.CategoryId
--INNER JOIN Users
--ON Users.Id = Photographs.UserId
--WHERE Description IS NOT NULL
--ORDER BY Title ASC

--Pr.4 Users Born In Janueary
--SELECT Username,FullName,BirthDate,
--CASE
--	WHEN Photographs.Id IS NULL THEN 'No photos'
--	ELSE Photographs.Title
--END AS Photo FROM Users
--LEFT JOIN Photographs
--ON Photographs.UserId = Users.Id
--WHERE MONTH(BirthDate) = 1
--ORDER BY FullName ASC

--Pr.5 Photographs with Equpment
--SELECT Title, Cameras.Model AS CameraModel, Lenses.Model as LensModel FROM Photographs
--INNER JOIN Equipments
--ON Equipments.Id = Photographs.EquipmentId
--INNER JOIN Cameras 
--ON Cameras.Id = Equipments.CameraId
--INNER JOIN Lenses
--ON Lenses.Id = Equipments.LensId
--ORDER BY Title ASC

--Pr.6 Most Expensive Photos
--SELECT Title, [Category Name], Model, [Manufacturer Name], Megapixels, Price FROM 
--(SELECT Title AS Title, Categories.Name AS "Category Name", Cameras.Model AS Model, Manufacturers.Name AS "Manufacturer Name",
--Megapixels AS Megapixels, Price, RANK() OVER(Partition BY CategoryID ORDER BY Price DESC) AS R FROM Photographs
-- INNER JOIN Categories
-- ON Categories.Id = Photographs.CategoryId
-- INNER JOIN Equipments 
-- ON Equipments.Id = photographs.EquipmentId
-- INNER JOIN Cameras 
-- ON Cameras.Id = Equipments.CameraId
-- INNER JOIN Manufacturers 
-- ON Manufacturers.Id = Cameras.ManufacturerId) aS sth
-- WHERE R = 1
-- ORDER BY Price DESC, Title

-- Pr.7 Price Larger Than Average
--WITH CTE AS
--(
--	SELECT AVG(Price) AS avg FROM Cameras
--)

--SELECT Name, Model, Price FROM Cameras
--INNER JOIN Manufacturers 
--ON Manufacturers.Id = Cameras.ManufacturerId
--WHERE Price > (SELECT avg fROM CTE)
--ORDER BY Price DESC, Model ASC

--Pr.8 Total Price of Lenses
--SELECT AVG(Price) FROM Cameras
-- Total Price Of Lenses
--SELECT MAX(Name) AS Name, SUM(Price) AS "Total Price" FROM Lenses 
--INNER JOIN Manufacturers 
--ON Manufacturers.Id = Lenses.ManufacturerId
--GROUP BY ManufacturerId
--ORDER BY Name ASC

--Pr.9 Users with Old Cameras
--SELECT Fullname AS FullName, Manufacturers.Name AS Manufacturer, Cameras.Model AS "Camera Model", Megapixels FROM Users
--INNER JOIN Equipments 
--ON Equipments.Id = Users.EquipmentId
--INNER JOIN Cameras
--ON Cameras.Id = Equipments.CameraId
--INNER JOIN Manufacturers
--ON Manufacturers.Id = Cameras.ManufacturerId
--WHERE Cameras.Year < 2015
--ORDER BY Fullname ASC

--Pr.10 Lenses Per Type
--SELECT Type, Count(Type) AS Count FROM Lenses
--GROUP BY Type
--ORDER BY Count DESC, Type ASC

--Pr.11 Sort Users
--SELECT Username, FullName FROM Users
--ORDER BY LEN(Username) + LEN(Fullname) ASC, BirthDate DESC

-- Pr.12 Manufacturers Without products
--SELECT Name FROM Manufacturers
--WHERE Id NOT IN(SELECT Distinct(ManufacturerId) FROM Lenses)
--AND Id Not IN(SELECT Distinct(ManufacturerId) FROM Cameras)
--ORDER BY Name

-- Pr.13 Changes In The Database
--SELECT * INTO CamerasCopy FROM Cameras
--UPDATE CamerasCopy
--SET Price =
--CASE 
--	WHEN Price IS NULL THEN 0
--	ELSE Price
--END
--UPDATE CamerasCopy
--SET Price = Price + 
--(SELECT AVG(Price) FROM CamerasCopy AS cams
--WHERE cams.ManufacturerId = CamerasCopy.ManufacturerId)
--* (CONVERT(MONEY,LEN((SELECT Name FROM Manufacturers
--WHERE Manufacturers.Id = CamerasCopy.ManufacturerId))) / 100)

SELECT Model, 
Price 
--= 
--CASE 
--WHEN Price IS NULL THEN 0
--ELSE Price
--END
, ManufacturerId FROM
(SELECT Model, Price, ManufacturerId, ROW_NUMBER() OVER(Partition BY ManufacturerID ORDER BY Price DESC) AS R FROM CamerasCopy
JOIN Manufacturers 
ON Manufacturers.Id = CamerasCopy.ManufacturerId) AS sth
WHERE R BETWEEN 1 AND 3
AND Price IS NOT NULL
ORDER BY ManufacturerId ASC, Price DESC, Model ASC

--SELECT AVG(Price) FROM Cameras --942.679

--SELECT AVG(Price) FROM Cameras --917.8947
--WHERE Cameras.ManufacturerId = 4 

--DECLARE @sth FLOAT = CONVERT(FLOAT,LEN((SELECT Name FROM Manufacturers
--WHERE Manufacturers.Id = 4))) / 100;
--PRINT @sth

--SELECT Id, Name, LEN(Manufacturers.Name) FROM Manufacturers
--SELECT SUM(Price), AVG(Price), COUNT(Price) FROM CamerasCopy 
--WHERE Price IS NOT NULL
--WHERE ManufacturerId = 7

-- Problem 14: Most cameras for given cash
--SELECT Sum(Price) FROM 
--(SELECT TOP 80  Id,  Price FROM CamerasCopy
--WHERE PRICE IS NOT NULL
--ORDER BY Price ) AS st
--SELECT * FROM 
--(SELECT TOP 80 * FROM CamerasCopy
--ORDER BY Price, Id ASC) AS sth
--ORDER BY sth.YEAR DESC, sth.ManufacturerId DESC, sth.Id ASC

--SELECT TOP 81 * FROM CamerasCopy
----WHERE Price IS NOT NULL
--ORDER BY Price, Id DESC