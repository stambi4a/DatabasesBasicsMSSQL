--SELECT CountryName, IsoCode FROM Countries
--WHERE CountryName LIKE '%a%a%a%'
--ORDER BY IsoCode

--SELECT [Peaks].[PeakName], [Rivers].[RiverName],
--STUFF(LOWER(PeakName),LEN(PeakName),LEN(RiverName), LOWER(RiverName)) AS "Mix"
--FROM Peaks CROSS JOIN Rivers
--WHERE LEFT(REVERSE(PeakName), 1) = LEFT(RiverName, 1)
--ORDER BY [Mix]