--SELECT Countries.CountryCode, Mountains.MountainRange, Peaks.PeakName, Peaks.Elevation
--From Countries 
--	LEFT JOIN MountainsCountries
--	ON Countries.CountryCode = MountainsCountries.CountryCode
--	INNER JOIN Mountains 
--		ON MountainsCountries.MountainID = Mountains.ID
--		INNER JOIN Peaks 
--			ON Mountains.ID = Peaks.MountainID
--			WHERE Countries.CountryName = 'Bulgaria' AND Peaks.Elevation > 2835 
--			ORDER BY Elevation DESC

--SELECT Countries.CountryCode, COUNT(Mountains.MountainRange)
--FROM Countries
--	LEFT JOIN MountainsCountries
--	ON Countries.CountryCode = MountainsCountries.CountryCode
--	INNER JOIN Mountains
--		ON MountainsCountries.MountainID = Mountains.ID
--		WHERE Countries.CountryName IN('United States', 'Russia', 'Bulgaria')
--		GROUp BY Countries.CountryCode

--SELECT TOP 5 CountryName, Rivers.RiverName
--FROM Countries
--	LEFT JOIN CountriesRivers
--	ON Countries.CountryCode = CountriesRivers.CountryCode
--	LEFT JOIN Rivers
--		ON CountriesRivers.RiverID = Rivers.ID
--		WHERE Countries.ContinentCode = 'AF'
--		ORDER BY CountryName ASC
--WITH CTE AS
--(
--	SELECT ContinentCode, CurrencyCode, COUNT(CurrencyCode) AS CurrencyCount, RANK() OVER(PARTITION BY ContinentCode ORDER BY COUNT(CurrencyCode) DESC) AS RN
--	FROM Countries
--	GROUP BY ContinentCode, CurrencyCode
--)

--SELECT ContinentCode, CurrencyCode, CurrencyCount FROM CTE
--WHERE RN = 1 AND CurrencyCount > 1

--SELECT COUNT(Countries.CountryCode) AS c FROM Countries
--RIGHT JOIN MountainsCountries
--ON
--	Countries.CountryCode = MountainsCountries.CountryCode
	
--WITH CTE AS 
--(
--	SELECT CountryName, Peaks.Elevation AS HighestPeakElevation, Rivers.Length AS LongestRiverLength, ROW_NUMBER() OVER(PARTITION BY CountryName ORDER BY Peaks.Elevation DESC)  AS RN FROM Peaks
--	INNER JOIN MountainsCountries
--		ON MountainsCountries.MountainId = Peaks.MountainId
--		INNER JOIN Countries 
--			ON Countries.CountryCode = MountainsCountries.CountryCode
--			INNER JOIN CountriesRivers
--				ON CountriesRivers.CountryCode = Countries.CountryCode
--				INNER JOIN Rivers
--					ON Rivers.Id = CountriesRivers.RiverId
--					--ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC
--)

--SELECT TOP 5 CountryName, HighestPeakElevation, LongestRiverLength FROM CTE
--WHERE RN = 1
--ORDER BY HighestPeakElevation DESC, LongestRiverLength DESC

WITH CTE AS
(
SELECT CountryName AS Country, Peaks.PeakName AS HighestPeakName, Peaks.Elevation AS HighestPeakElevation, Mountains.MountainRange AS Mountain, RANK() OVER(PARTITION BY Countries.CountryCode ORDER BY Peaks.Elevation DESC)
 AS RN FROM Countries
FULL JOIN MountainsCountries	
	ON MountainsCountries.CountryCode = Countries.CountryCode
	FULL JOIN Mountains
		ON Mountains.Id = MountainsCountries.MountainId
		FULL JOIN Peaks
			ON Peaks.MountainId = Mountains.Id						
)

SELECT TOP 5 Country, HighestPeakName
= CASE
	WHEN HighestPeakName IS NULL THEN '(no highest peak)'
END, 
HighestPeakElevation =
CASE
	WHEN HighestPeakElevation IS NULL THEN '0'
END, 
Mountain = 
CASE
	WHEN Mountain IS NULL THEN '(no mountain)' 	
END
FROM CTE
WHERE RN = 1 AND Country Is NOT NULL
ORDER BY Country ASC, HighestPeakName ASC