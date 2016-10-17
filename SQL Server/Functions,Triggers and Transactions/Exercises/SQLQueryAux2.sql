SELECT Username, Game, Character,Level, str, def, sp, mi, lu, Bonus, itemStr, itemDef, itemSp, itemMi, itemLu FROM Users
INNER JOIN (SELECT Id, UserId, GameId, CharacterId, Level FROM UsersGames) AS users_games
ON users_games.UserId = Users.Id
INNER JOIN (SELECT Id, Name AS Game, GameTypeId FROM Games) AS games 
ON games.Id = users_games.GameId
INNER JOIN (SELECT Id, Name AS Character, StatisticId FROM Characters) AS characters
ON characters.Id = users_games.CharacterId
INNER JOIN (SELECT Id, Strength AS str, Defence AS def, Speed AS sp, Mind AS mi, Luck AS lu FROM [Statistics]) as stats
ON stats.Id = characters.StatisticId
INNER JOIN (SELECT Id, BonusStatsId AS Bonus FROM GameTypes ) AS game_types
ON games.GameTypeId = game_types.Id
INNER JOIN (SELECT UserGameId, ItemId FROM UserGameItems) AS user_game_items
ON user_game_items.UserGameId = users_games.Id
INNER JOIN 
(SELECT Id, StatisticId FROM Items) AS items
ON items.Id = user_game_items.ItemId
INNER JOIN (SELECT Id, Strength AS itemStr, Defence AS itemDef, Speed AS itemSp, Mind AS itemMi, Luck AS itemLu FROM [Statistics]) AS statists
ON statists.Id = items.StatisticId
ORDER BY Username, Game, Character