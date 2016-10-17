--Problem 33. Monasteries by Country
--CREATE TABLE Monasteries(
--Id INT PRIMARY KEY IDENTITY(1,1) NOT NULL,
--Name VARCHAR(50),
--CountryCode CHAR(2)
--)
--GO

--ALTER TABLE Monasteries
--ADD FOREIGN KEY(CountryCode)
--REFERENCES Countries(CountryCode)
--GO

--INSERT INTO Monasteries(Name, CountryCode) VALUES
--('Rila Monastery “St. Ivan of Rila”', 'BG'), 
--('Bachkovo Monastery “Virgin Mary”', 'BG'),
--('Troyan Monastery “Holy Mother''s Assumption”', 'BG'),
--('Kopan Monastery', 'NP'),
--('Thrangu Tashi Yangtse Monastery', 'NP'),
--('Shechen Tennyi Dargyeling Monastery', 'NP'),
--('Benchen Monastery', 'NP'),
--('Southern Shaolin Monastery', 'CN'),
--('Dabei Monastery', 'CN'),
--('Wa Sau Toi', 'CN'),
--('Lhunshigyia Monastery', 'CN'),
--('Rakya Monastery', 'CN'),
--('Monasteries of Meteora', 'GR'),
--('The Holy Monastery of Stavronikita', 'GR'),
--('Taung Kalat Monastery', 'MM'),
--('Pa-Auk Forest Monastery', 'MM'),
--('Taktsang Palphug Monastery', 'BT'),
--('Sümela Monastery', 'TR')

--ALTER TABLE Countries
--ADD IsDeleted BIT NOT NULL DEFAULT 0;

--ALTER TABLE Countries
--DROP COLUMN IsDeleted
--UPDATE Countries
--SET IsDeleted = 1
--WHERE 
--(SELECT COUNT(RiverId) FROM CountriesRivers
--WHERE Countries.CountryCode = CountriesRivers.CountryCode) > 3

--SELECT Monasteries.Name AS Monastery, CountryName AS Country FROM Monasteries
--INNER JOIN (SELECT CountryName, CountryCode, IsDeleted FROM Countries) AS countries
--ON countries.CountryCode = Monasteries.CountryCode
--WHERE IsDeleted = 0
--ORDER BY Monastery

--Problem 34. Monasteries by Continents and Countries
--UPDATE Countries
--SET CountryName = 'Burma'
--WHERE CountryName = 'Myanmar'

--SELECT * FROM Countries
--WHERE CountryNAme ='Burma'

--INSERT INTO Monasteries
--VALUES('Hanga Abbey', 'TZ')

--SELECT * FROM Monasteries
--WHERE Name = 'Hanga Abbey'

--INSERT INTO Monasteries
--VALUES('Myin-Tin-Daik', 'MM')

--SELECT * FROM Monasteries
--WHERE Name = 'Myin-Tin-Daik'

--SELECT ContinentName, CountryName, Count(Id) AS MonasteriesCount FROM Monasteries
--FULL JOIN (SELECT CountryCode, CountryName, ContinentCode FROM Countries WHERE IsDeleted = 0) AS countries
--ON countries.CountryCode = Monasteries.CountryCode
--RIGHT JOIN Continents 
--ON Continents.ContinentCode = countries.ContinentCode
--GROUP BY ContinentName, CountryName
--ORDER BY MonasteriesCount DESC, CountryName ASC