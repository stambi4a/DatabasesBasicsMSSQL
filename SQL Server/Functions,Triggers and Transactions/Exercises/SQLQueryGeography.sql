--Problem 28. Peaks and Mountains
--SELECT PeakName,  Mountain, Elevation FROM Peaks 
--INNER JOIN (SELECT iD, MountainRange AS Mountain FROM Mountains) AS mountains
--ON mountains.Id = Peaks.MountainId
--order by Elevation DESC

--Problem 29. Peaks with Their Mountain, Country and Continent
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

--Problem 30. Rivers by Country
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

--Problem 31. Count of Countries by Currency
--SELECT Currencies.CurrencyCode AS CurrencyCode, MAX(Description) AS Currency, COUNT(CountryCode) AS NumberOfCountries FROM Currencies
--LEFT JOIN (SELECT CountryCode, CurrencyCode FROM Countries) AS countries
--ON countries.CurrencyCode = Currencies.CurrencyCode
--GROUP BY Currencies.CurrencyCode
--ORDER BY NumberOfCountries DESC, Currency ASC

--Problem 32. Population and Area by Continent
--SELECT ContinentName, SUM(CONVERT(BIGINT, AreaInSqKm)) AS CountriesArea, SUM(CONVERT(BIGINT, Population)) AS CountriesPopulation FROM Continents
--INNER JOIN (SELECT ContinentCode, Population, AreaInSqKm FROM Countries) AS countries
--ON countries.ContinentCode = Continents.ContinentCode
--GROUP BY ContinentName
--ORDER BY CountriesPopulation DESC