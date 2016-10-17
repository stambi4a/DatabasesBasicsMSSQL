UPDATE Countries
SET CountryName = 'Burma'
WHERE CountryName = 'Myanmar'

INSERT INTO Monasteries
VALUES('Hanga Abbey', 'TZ')

--INSERT INTO Monasteries
--VALUES('Myin-Tin-Daik', 'MM')

SELECT ContinentName, CountryName, Count(Id) AS MonasteriesCount FROM Monasteries
FULL JOIN (SELECT CountryCode, CountryName, ContinentCode FROM Countries WHERE IsDeleted = 0) AS countries
ON countries.CountryCode = Monasteries.CountryCode
RIGHT JOIN Continents 
ON Continents.ContinentCode = countries.ContinentCode
GROUP BY ContinentName, CountryName
ORDER BY MonasteriesCount DESC, CountryName ASC