--Problem 18. Scalar Function: Cash in User Games Odd Rows
--CREATE FUNCTION ufn_CashInUsersGames(@gameName NVARCHAR(50))
--RETURNS TABLE
--AS RETURN 
--WITH CTE AS 
--(
--SELECT Cash , RANK() OVER (ORDER BY Cash DESC) as rn FROM (SELECT Cash FROM UsersGames
--	WHERE GameId = (SELECT Id FROM Games WHERE Name = @gameName) 
--	) as g
--)

--SELECT SUM(Cash) as SumCash FROM CTE
--WHERE rn % 2 = 1 
--GO

--SELECT * FROM ufn_CashInUsersGames('Bali')
--SELECT * FROM UsersGames 
--ORDER BY Cash

--SELECT * FROM Games
--ORDER BY Name ASC

--Problem 20. Massive Shopping
--DECLARE @user_game_id INT = (SELECT Id FROM UsersGames
--WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Stamat')
--AND GameId = (SELECT ID FROM Games WHERE Name = 'Safflower'))
--DECLARE @user_cash MONEY = 
--(SELECT Cash FROM UsersGames WHERE Id = @user_game_id)
--DECLARE @sum_items MONEY = 
--(SELECT SUM(Price) FROM Items
--WHERE MinLevel IN(11,12))

--BEGIN TRANSACTION
--IF(@sum_items <= @user_cash) 
--SET @user_cash = @user_cash - @sum_items
--UPDATE UsersGames
--SET Cash = @user_cash
--WHERE Id = @user_game_id
--DECLARE @item_in_user_game_items INT
--DECLARE @cursor CURSOR
--SET  @cursor = CURSOR FOR 
--SELECT Id FROM Items 
--WHERE MinLevel IN(11,12)
--OPEN @cursor 
--FETCH NEXT FROM @cursor
--INTO @item_in_user_game_items
--WHILE @@FETCH_STATUS = 0
--BEGIN
--	IF EXISTS(SELECT ItemId, UserGameId FROM UserGameItems WHERE ItemId = @item_in_user_game_items AND UserGameId = @user_game_id)
--	FETCH NEXT FROM @cursor
--	INTO @item_in_user_game_items
--	ELSE
--	INSERT INTO UserGameItems VALUES (@item_in_user_game_items, @user_game_id)
--	FETCH NEXT FROM @cursor
--	INTO @item_in_user_game_items
--END
--COMMIT TRANSACTION

--SET @sum_items = 
--(SELECT SUM(Price) FROM Items
--WHERE MinLevel IN(19,21))

--BEGIN TRANSACTION
--IF(@sum_items <= @user_cash) 
--SET @user_cash = @user_cash - @sum_items
--UPDATE UsersGames
--SET Cash = @user_cash
--WHERE Id = @user_game_id
--SET  @cursor = CURSOR FOR 
--SELECT Id FROM Items 
--WHERE MinLevel IN(11,12)
--OPEN @cursor 
--FETCH NEXT FROM @cursor
--INTO @item_in_user_game_items
--WHILE @@FETCH_STATUS = 0
--BEGIN
--	IF NOT EXISTS(SELECT ItemID, UserGameId FROM UserGameItems WHERE ItemId = @item_in_user_game_items AND UserGameId = @user_game_id)
--	INSERT INTO UserGameItems VALUES (@item_in_user_game_items, @user_game_id)
--	FETCH NEXT FROM @cursor
--	INTO @item_in_user_game_items
--END
--COMMIT TRANSACTION

--SELECT Name FROM UserGameItems
--INNER JOIN Items ON
--Items.Id = UserGameItems.ItemId
--WHERE UserGameItems.UserGameId = @user_game_id

--Problem 21. Number of Users for Email Provider

--SELECT [Email Provider],COUNT(Username) AS "Number Of Users"  FROM(SELECT Username,
--REVERSE(LEFT(REVERSE(Email), CHARINDEX('@', REVERSE(Email)) - 1)) AS "Email Provider" FROM Users) as emails
--GROUP BY [Email Provider]
--ORDER BY [Number Of Users] DESC, [Email provider] ASC

--Problem 22. All User in Games
--SELECT Name AS Game, [Game Type], some_users.Username, users_games.Level, users_games.Cash, chars.Character   FROM Games
--INNER JOIN (SELECT Id, Name AS "Game Type" FROM GameTypes) as gam_types On
--gam_types.Id = Games.GameTypeId
--INNER JOIN (SELECT Id, GameId, UserId, CharacterId, Level, Cash FROM UsersGames) AS users_games
--ON users_games.gameId = Games.Id
--INNER JOIN (SELECT Id, Username FROM Users) as some_users
--ON users_games.UserId = some_users.Id
--INNER JOIN (SELECT Id, Name AS Character FROM CHARACTERS) as chars
--ON users_games.CharacterId = chars.Id
--ORDER BY Level DESC, Username ASC, Game ASC

--Problem 23. Users in Games with Their Items
--SELECT users.Username, Games.Name AS Game, COUNT(items.Id) AS "Items Count", SUM(items.Price) AS "Items Price"  FROM Games 
--INNER JOIN (SELECT Id, UserId, GameId, Cash FROM UsersGames) AS users_games
--ON Games.Id = users_games.GameID
--INNER JOIN (SELECT Id, Username FROM USERS) AS users
--ON users.Id = users_games.UserId 
--INNER JOIN(SELECT ItemId, UserGameId FROM UserGameItems) AS user_games_items
--ON user_games_items.UserGameId = users_games.Id
--INNER JOIN (SELECT Id, Price FROM Items) AS items
--ON items.Id = user_games_items.ItemId
--GROUP BY users.Username, Games.Name
--HAVING  COUNT(items.Id) >= 10
--ORDER BY [Items Count] DESC, [Items Price] DESC, users.Username ASC

--Problem 24. User in Games with Their Statistics
--SELECT Username, Game, Character, (str + Bonus + itemStr) AS Strength, (def + Bonus + itemDef) AS Defence,(sp + Bonus + itemSp) AS Speed,(mi + Bonus + itemMi) AS Mind, (lu + Bonus + itemLu) AS Luck FROM Users
--INNER JOIN (SELECT Id, UserId, GameId, CharacterId FROM UsersGames) AS users_games
--ON users_games.UserId = Users.Id
--INNER JOIN (SELECT Id, Name AS Game, GameTypeId FROM Games) AS games 
--ON games.Id = users_games.GameId
--INNER JOIN (SELECT Id, Name AS Character, StatisticId FROM Characters) AS characters
--ON characters.Id = users_games.CharacterId
--INNER JOIN (SELECT Id, Strength AS str, Defence AS def, Speed AS sp, Mind AS mi, Luck AS lu FROM [Statistics]) as stats
--ON stats.Id = characters.StatisticId
--INNER JOIN (SELECT Id, BonusStatsId AS Bonus FROM GameTypes ) AS game_types
--ON games.GameTypeId = game_types.Id
--INNER JOIN (SELECT UserGameId, ItemId FROM UserGameItems) AS user_game_items
--ON user_game_items.UserGameId = users_games.Id
--INNER JOIN 
--(SELECT Id, StatisticId FROM Items) AS items
--ON items.Id = user_game_items.ItemId
--INNER JOIN (SELECT Id, Strength AS itemStr, Defence AS itemDef, Speed AS itemSp, Mind AS itemMi, Luck AS itemLu FROM [Statistics]) AS statists
--ON statists.Id = items.StatisticId
--ORDER BY USername, Game, Character, Strength DESC, Speed DESC, Mind DESC, Luck DESC

--Problem 25. All Items with Greater than Average Statistics

--WITH CTE AS
--(
--	(SELECT AVG(Speed) AS avgspeed, AVG(Luck) AS avgluck, AVG(Mind) AS avgmind FROM Items 
--	INNER JOIN [Statistics]
--	ON [Statistics].Id = Items.StatisticId)
--)

--SELECT Items.Name, Price, MinLevel,Strength, Defence, Speed, Luck, Mind FROM Items 
--INNER JOIN [Statistics]
--ON [Statistics].Id = Items.StatisticId
--WHERE Mind > (SELECT avgspeed FROM CTE)
--AND Luck > (SELECT avgluck FROM CTE)
--AND Speed > (SELECT avgspeed FROM CTE)
--ORDER BY Name ASC

--Problem 26. Display All Items with information about Forbidden Game Type
--SELECT Name AS Item, Price, MinLevel, [Forbidden Game Type] FROM Items 
--LEFT JOIN (SELECT ItemId, GameTypeId FROM GameTypeForbiddenItems) AS game_type_forbidden_items
--ON game_type_forbidden_items.ItemId = Items.Id
--LEFT JOIN (SELECT Id, Name AS "Forbidden Game Type" FROM GameTypes) AS game_types
--ON game_types.Id = game_type_forbidden_items.GameTypeId
--ORDER BY [Forbidden Game Type] DESC, Item ASC

--DROP DATABASE Diablo
--Problem 27. Buy Items for User in Game
--BEGIN TRANSACTION
--DECLARE @user_game_id INT 
--SET @user_game_id = (SELECT UsersGames.Id FROM Users 
--INNER JOIN UsersGames 
--ON UsersGames.UserID = Users.Id
--INNER JOIN Games 
--ON Games.Id = UsersGames.GameId
--WHERE Username = 'Alex' AND Games.Name = 'Edinburgh')
--DECLARE @alex_cash MONEY
--SET @alex_cash = (SELECT UsersGames.Cash FROM Users 
--INNER JOIN UsersGames 
--ON UsersGames.UserID = Users.Id
--INNER JOIN Games 
--ON Games.Id = UsersGames.GameId
--WHERE Username = 'Alex' AND Games.Name = 'Edinburgh')

--DECLARE @item_id INT
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Blackguard')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Bottomless Potion of Amplification')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Eye of Etlich (Diablo III)')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Gem of Efficacious Toxin')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Golden Gorget of Leoric')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--SET @item_id = (SELECT Id FROM Items
--WHERE Name = 'Hellfire Amulet')
--INSERT INTO UserGameItems VALUES (@item_id, @user_game_id)
--UPDATE UsersGames
--SET Cash = Cash - (SELECT Price FROM Items WHERE Id = @item_id)
--WHERE id = @user_game_id
--COMMIT TRANSACTION

--SELECT Username, games.Name, Cash, [Item Name] FROM Users 
--INNER JOIN (SELECT UserId, GameId, Id, Cash FROM UsersGames) AS users_games
--ON Users.Id = users_games.UserId
--INNER JOIN (SELECT Id, Name FROM Games WHERE Name = 'Edinburgh') as games
--ON games.Id = users_games.GameId
--INNER JOIN(SELECT ItemId, UserGameId FROM UserGameItems) AS user_game_items
--ON user_game_items.UserGameId = users_games.Id
--INNER JOIN (SELECT Id, Name AS "Item Name"FROM Items) AS items
--ON items.Id = user_game_items.ItemId
--ORDER BY [Item Name]

select 
	u.Username, 
	g.Name as Game, 
	MAX(c.Name) Character,
	SUM(its.Strength) + gts.Strength + MAX(cs.Strength) as Strength,
	SUM(its.Defence) + MAX(gts.Defence) + MAX(cs.Defence) as Defence,
	SUM(its.Speed) + MAX(gts.Speed) + MAX(cs.Speed) as Speed,
	SUM(its.Mind) + MAX(gts.Mind) + MAX(cs.Mind) as Mind,
	SUM(its.Luck) + MAX(gts.Luck) + MAX(cs.Luck) as Luck
from Users u
join UsersGames ug on ug.UserId = u.Id
join Games g on ug.GameId = g.Id
join GameTypes gt on gt.Id = g.GameTypeId
join [Statistics] gts on gts.Id = gt.BonusStatsId
join Characters c on ug.CharacterId = c.Id
join [Statistics] cs on cs.Id = c.StatisticId
join UserGameItems ugi on ugi.UserGameId = ug.Id
join Items i on i.Id = ugi.ItemId
join [Statistics] its on its.Id = i.StatisticId
group by u.Username, g.Name
order by Strength desc, Defence desc, Speed desc, Mind desc, Luck desc