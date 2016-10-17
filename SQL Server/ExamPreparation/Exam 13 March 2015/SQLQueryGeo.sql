--SELECT PeakName FROM Peaks
--ORDER BY PeakName ASC

--SELECT TOP 30 CountryName, Population FROM Countries
--WHERE ContinentCode='EU'
--ORDER BY Population DESC

--SELECT CountryName, CountryCode, 
--CASE CurrencyCode 
--WHEN 'EUR' THEN 'Euro'
--ELSE 'Not Euro' 
--END AS "Currency" FROM Countries
--ORDER BY CountryName ASC

--SELECT CountryName AS "Country Name", IsoCode AS "ISO Code" FROM Countries
--WHERE CountryName LIKE '%a%a%a%'
--ORDER BY [Iso Code]

--SELECT PeakName,  Mountain, Elevation FROM Peaks 
--INNER JOIN (SELECT iD, MountainRange AS Mountain FROM Mountains) AS mountains
--ON mountains.Id = Peaks.MountainId
--order by Elevation DESC

--SELECT PeakName, Mountain, CountryName,ContinentName FROM Peaks
--INNER JOIN (SELECT Id, MountainRange AS Mountain FROM Mountains) AS mountains
--ON mountains.Id = Peaks.MountainId
--INNER JOIN MountainsCountries 
--ON mountains.Id = MountainsCountries.MountainID
--INNER JOIN (SELECT CountryCode, CountryName, ContinentCode FROM Countries) AS countries
--ON countries.CountryCode = MountainsCountries.CountryCode
--INNER JOIN (SELECT ContinentName, ContinentCode FROM Continents) as continents
--ON continents.ContinentCode = countries.ContinentCode
--ORDER By PeakName ASC, CountryName ASC

--SELECT RiverName AS River, Count(CountryName) AS "Countries Count" FROM Rivers
--INNER JOIN CountriesRivers
--ON CountriesRivers. RiverId = Rivers.Id
--INNER JOIN Countries
--ON Countries.CountryCode = CountriesRivers.CountryCode
--GROUP BY RiverName
--HAVING Count(CountryName) >= 3

--SELECT MAX(Elevation) AS MaxElevation, Min(Elevation) AS MinElevation, AVG(Elevation) AS AverageElevation FROM Peaks

--SELECT Countries.CountryName, ContinentName,COUNT(Id) AS RiversCount, 
--CASE 
--WHEN Count(id) = 0 THEN 0
--ELSE Sum(Length)
--END AS TotalLength FROM Countries
--INNER JOIN Continents
--ON Continents.ContinentCode = Countries.ContinentCode
--LEFT JOIN CountriesRivers
--ON CountriesRivers.CountryCode = Countries.CountryCode
--LEFT JOIN (SELECT Id, Length FROM Rivers) AS rivers
--ON rivers.Id = CountriesRivers.RiverId
--GROUP BY CountryName, ContinentName
--ORDER BY RiversCount DESC, TotalLength DESC, CountryName ASC

--SELECT cur.CurrencyCode, cur.[Description] AS Currency, COUNT(c.CountryCode) AS NumberOfCountries
--FROM [dbo].[Currencies] AS cur
--LEFT JOIN [dbo].[Countries] AS c
--ON cur.CurrencyCode = c.CurrencyCode
--GROUP BY cur.CurrencyCode, cur.[Description]
--ORDER BY NumberOfCountries DESC, Currency ASC

--SELECT ContinentName, SUM(CONVERT(BIGINT, AreaInSqKm)) AS CountriesArea, SUM(CONVERT(BIGINT, Population)) AS CountriesPopulation FROM Continents
--INNER JOIN (SELECT ContinentCode, Population, AreaInSqKm FROM Countries) AS countries
--ON countries.ContinentCode = Continents.ContinentCode
--GROUP BY ContinentName
--ORDER BY CountriesPopulation DESC

--WITH CTE AS 
--(
--	SELECT CountryName, Peaks.Elevation AS HighestPeakElevation, Rivers.Length AS LongestRiverLength, ROW_NUMBER() OVER(PARTITION BY CountryName ORDER BY Peaks.Elevation DESC)  AS RN FROM Countries
--	Left JOIN MountainsCountries
--		ON MountainsCountries.CountryCode = Countries.CountryCode
--		LEFT JOIN Peaks 
--			ON MountainsCountries.MountainId = Peaks.MountainId
--			LEFT JOIN CountriesRivers
--				ON CountriesRivers.CountryCode = Countries.CountryCode
--				LEFT JOIN Rivers
--					ON Rivers.Id = CountriesRivers.RiverId

--)

--SELECT CountryName, HighestPeakElevation, LongestRiverLength FROM CTE
--WHERE RN = 1
--ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC, CountryName

--SELECT * FROM Countries
--ORDER BY CountryName ASC

--SELECT [Peaks].[PeakName], [Rivers].[RiverName],
--STUFF(LOWER(PeakName),LEN(PeakName),LEN(RiverName), LOWER(RiverName)) AS "Mix"
--FROM Peaks CROSS JOIN Rivers
--WHERE LEFT(REVERSE(PeakName), 1) = LEFT(RiverName, 1)
--ORDER BY [Mix]

--WITH CTE AS
--(
--SELECT CountryName AS Country, Peaks.PeakName AS "Highest Peak Name", Peaks.Elevation AS "Highest Peak Elevation", Mountains.MountainRange AS Mountain, RANK() OVER(PARTITION BY Countries.CountryCode ORDER BY Peaks.Elevation DESC)
-- AS RN FROM Countries
--LEFT JOIN MountainsCountries	
--	ON MountainsCountries.CountryCode = Countries.CountryCode
--	LEFT JOIN Mountains
--		ON Mountains.Id = MountainsCountries.MountainId
--		LEFT JOIN Peaks
--			ON Peaks.MountainId = Mountains.Id						
--)

--SELECT Country, [Highest Peak Name]
--= CASE
--	WHEN [Highest Peak Name] IS NULL THEN '(no highest peak)'
--	ELSE [Highest Peak Name]
--END, 
--[Highest Peak Elevation] =
--CASE
--	WHEN [Highest Peak Elevation] IS NULL THEN 0
--	ELSE [Highest Peak Elevation]
--END, 
--Mountain = 
--CASE
--	WHEN Mountain IS NULL THEN '(no mountain)'
--	ELSE Mountain 	
--END
--FROM CTE
--WHERE RN = 1
--ORDER BY Country ASC, [Highest Peak Name] ASC

--WITH CTE AS
--(
--SELECT CountryName AS Country, Peaks.PeakName AS "Highest Peak Name", Peaks.Elevation AS "Highest Peak Elevation", Mountains.MountainRange AS Mountain FROM Countries
--LEFT JOIN MountainsCountries	
--	ON MountainsCountries.CountryCode = Countries.CountryCode
--	LEFT JOIN Mountains
--		ON Mountains.Id = MountainsCountries.MountainId
--		LEFT JOIN Peaks
--			ON Peaks.MountainId = Mountains.Id						
--)

--SELECT Country, [Highest Peak Name]
--= CASE
--	WHEN [Highest Peak Name] IS NULL THEN '(no highest peak)'
--	ELSE [Highest Peak Name]
--END, 
--[Highest Peak Elevation] =
--CASE
--	WHEN [Highest Peak Elevation] IS NULL THEN 0
--	ELSE [Highest Peak Elevation]
--END, 
--Mountain = 
--CASE
--	WHEN Mountain IS NULL THEN '(no mountain)'
--	ELSE Mountain 	
--END
--FROM CTE
--ORDER BY Country ASC, [Highest Peak Name] ASC


