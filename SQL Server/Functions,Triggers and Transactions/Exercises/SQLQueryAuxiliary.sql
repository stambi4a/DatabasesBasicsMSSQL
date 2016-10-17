--SELECT * FROM UserGameItems 
--ORDER BY UserGameId ASC,ItemID ASC

--SELECT * FROM Items
--WHERE MinLevel IN(11,12)

--UPDATE UsersGames
--SET Cash = 6266
--WHERE ID = 110

--SELECT Username, Game, Character, UserGameId FROM Users
--INNER JOIN (SELECT Id AS UserGameId, UserId, GameId, CharacterId FROM UsersGames) as users_games
--ON Users.Id = users_games.UserId
--INNER JOIN (SELECT Id, Name AS Game FROM Games) AS games
--ON users_games.GameId = games.Id
--INNER JOIN (SELECT Id, Name AS Character FROM Characters) AS characters
--ON characters.Id = users_games.CharacterId
--ORDER BY Username, Game, Character


--SELECT Username, Game, Character, (str + BonusStr + sumstr) AS Strength, (def + BonusDef + sumdef) AS Defence,(sp + BonusSp + sumsp) AS Speed,(mi + BonusMi + summi) AS Mind, (lu + BonusLu + sumlu) AS Luck FROM Users
--INNER JOIN (SELECT Id, UserId, GameId, CharacterId FROM UsersGames) AS users_games
--ON users_games.UserId = Users.Id
--INNER JOIN (SELECT Id, Name AS Game, GameTypeId FROM Games) AS games 
--ON games.Id = users_games.GameId
--INNER JOIN (SELECT Id, Name AS Character, StatisticId FROM Characters) AS characters
--ON characters.Id = users_games.CharacterId
--INNER JOIN (SELECT Id, Strength AS str, Defence AS def, Speed AS sp, Mind AS mi, Luck AS lu FROM [Statistics]) as stats
--ON stats.Id = characters.StatisticId
--INNER JOIN (SELECT Id, BonusStatsId FROM GameTypes ) AS game_types
--ON games.GameTypeId = game_types.Id
--INNER JOIN (SELECT Id, Strength AS BonusStr, Defence AS BonusDef, Speed AS BonusSp, Mind AS BonusMi, Luck AS BonusLu FROM [Statistics]) AS stats2
--ON stats2.Id = game_types.BonusStatsId
--INNER JOIN (SELECT UserGameId, SUM(statists.itemStr) AS sumstr, SUM(statists.itemDef) AS sumdef, SUM(statists.itemSp) as sumsp, SUM(statists.itemMi) AS summi, SUM(statists.itemLu) AS sumlu FROM (SELECT UserGameId, ItemId FROM UserGameItems) AS user_game_items
--INNER JOIN 
--(SELECT Id, StatisticId FROM Items) AS items
--ON items.Id = user_game_items.ItemId
--INNER JOIN (SELECT Id, Strength AS itemStr, Defence AS itemDef, Speed AS itemSp, Mind AS itemMi, Luck AS itemLu FROM [Statistics]) AS statists
--ON statists.Id = items.StatisticId
--GROUP BY UserGameId) AS some_users
--ON some_users.UserGameId = users_games.Id
--ORDER BY Strength DESC,Defence DESC, Speed DESC, Mind DESC, Luck DESC

--SELECT * FROM Items
--INNER JOIN [Statistics]
--ON [Statistics].Id = Items.StatisticId
--ORDER BY StatisticId

--SELECT * FROM Users 
--INNER JOIN UsersGames 
--ON UsersGames.UserID = Users.Id
--INNER JOIN Games 
--ON Games.Id = UsersGames.GameId
--WHERE Username = 'Alex' AND Games.Name = 'Edinburgh'

--SELECT SUM(Price) FROM Items
--WHERE Name IN('Blackguard', 'Bottomless Potion of Amplification', 'Eye of Etlich (Diablo III)', 'Gem of Efficacious Toxin', 'Golden Gorget of Leoric', 'Hellfire Amulet')

--SELECT * fROM UserGameItems
--ORDER BY UserGameId, ItemId