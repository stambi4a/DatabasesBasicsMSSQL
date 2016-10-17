--SELECT * FROM UserGameItems

--INNER JOIN (SELECT Id, StatisticId, MinLevel FROM Items) as items 
--ON items.Id = UserGameItems.ItemId
--WHERE UserGameId = 97

SELECT UserGameId, ItemId FROM UserGameItems
ORDER BY UserGameId ASC, ItemId