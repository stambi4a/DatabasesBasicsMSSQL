USE Diablo

--SELECT TOP 50 Name AS "Game", cast(Start as date) as "Start" 
--FROM Games
--WHERE YEAR(Start) IN (2011, 2012)
--ORDER BY Start ASC, Game ASC

--select top 50 g.Name as Game,

--FORMAT(Start, 'yyyy-MM-dd') as Start
--from Games g
--where year(g.Start)= 2011 or year(g.Start) =  2012
--order by g.Start, g.Name

--SELECT Username, 
--REVERSE(LEFT(REVERSE(Email), CHARINDEX('@', REVERSE(Email)) - 1)) AS "Email Provider" FROM Users
--ORDER BY [Email Provider] ASC, Username ASC

--SELECT Username, IpAddress AS "IP Address" FROM Users
--WHERE IpAddress LIKE '___.1%.%.___'
--ORDER BY Username

--SELECT Name as "Game",
--CASE  
--WHEN DATEPART(HOUR, Start) >= 0 AND DATEPART(HOUR, Start) < 12 THEN 'Morning'
--WHEN DATEPART(HOUR, Start) >= 12 AND DATEPART(HOUR, Start) < 18 THEN 'Afternoon'
--WHEN DATEPART(HOUR, Start) >= 18 AND DATEPART(HOUR, Start) < 24 THEN 'Evening'
--END AS "Part of the Day",
--CASE  
--WHEN Duration Is NULL THEN 'Extra Long'
--WHEN Duration >= 0 AND Duration <= 3 THEN 'Extra Short'
--WHEN Duration >= 4 AND Duration <= 6 THEN 'Short'
--WHEN Duration > 6 THEN 'Long'
--END AS Duration
--From Games
--ORDER BY Game ASC, Duration ASC, "Part of the Day" ASC

SELECT Start FROM Games
WHERE Start = '2011-11-09'

--SELECT Start AS "st" FROM Games g
--WHERE FORMAT(Start, 'yyyy-MM-dd') = CAST('2011-11-09' AS DATE)

--SELECT FORMAT(Start, 'yyyy-MM-dd HH:mm:ss') AS s FROM Games
--WHERE FORMAT(Start, 'yyyy-MM-dd') = CAST('2011-11-09' AS DATE)
 