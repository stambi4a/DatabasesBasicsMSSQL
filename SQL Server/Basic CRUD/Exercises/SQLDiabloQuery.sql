--SELECT Name FROM Characters
--ORDER BY Name ASC

--SELECT Id FROM Users 
--WHERE Username IN('baleremuda', 'loosenoise', 'buildingdeltoid', 'inguinalself', 'monoxidecos')

--Problem 19. Trigger
--UPDATE UsersGames
--SET Cash = Cash + 50000
--WHERE UserId IN(Select Id FROM Users WHERE Username IN('baleremuda', 'loosenoise', 'buildingdeltoid', 'inguinalself', 'monoxidecos')) AND GameId IN(SELECT Id FROM Games WHERE Name = 'Bali')

--CREATE PROCEDURE ufp_buy_item(@item_id INT, @user_id INT) AS
--BEGIN
	
--END
--GO
--CREATE TRIGGER tr_buy_item ON UsersGames INSTEAD OF UPDATE
--AS
--BEGIN
--	DECLARE @user_level INT = (SELECT Level FROM UsersGames WHERE UsersGames.UserId = INSERTED.UserId)
--	DECLARE @min_user_level INT = (SELECT MinLevel FROM Items WHERE Id = Ierted)
--	IF @user_level IS NOT NULL AND @min_user_level IS NOT NULL
--	AND @user_level >= @min_user_level
--	DECLARE @current_user_cash MONEY= (SELECT Cash FROM UsersGames WHERE UserId = @user_id)
--	DECLARE @item_price MONEY = (SELECT Price FROM Items WHERE Id = @item_id)
--	IF(@current_user_cash >= @item_price)
--	BEGIN
--		UPDATE UsersGames
--		SET Cash = Cash - @item_price 
--		WHERE UserId = @user_id
--	END
--END

--Problem 20. Massive Shopping
--SELECT Name FROM Games 
--ORDER BY Name ASC

--SELECT UserID, GameId, Level FROM UsersGames
--WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Stamat')
--AND GameId = (SELECT ID FROM Games WHERE Name = 'Safflower')
--ORDER BY UserId ASC, GameId ASC

--UPDATE UsersGames
--SET Cash = 6266
--WHERE Id = 110

--SELECT Cash FROM UsersGames
--WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Stamat')
--AND GameId = (SELECT ID FROM Games WHERE Name = 'Safflower')

DECLARE @user_game_id INT = (SELECT Id FROM UsersGames
WHERE UserId = (SELECT Id FROM Users WHERE Username = 'Stamat')
AND GameId = (SELECT ID FROM Games WHERE Name = 'Safflower'))
DECLARE @user_cash MONEY = 
(SELECT Cash FROM UsersGames WHERE Id = @user_game_id)
DECLARE @sum_items MONEY = 
(SELECT SUM(Price) FROM Items
WHERE MinLevel IN(11,12))

BEGIN TRANSACTION
IF(@sum_items <= @user_cash) 
SET @user_cash = @user_cash - @sum_items
UPDATE UsersGames
SET Cash = @user_cash
WHERE Id = @user_game_id
DECLARE @item_id_to_insert INT
DECLARE @cursor CURSOR
SET @cursor = CURSOR FOR
SELECT Id FROM Items
WHERE MinLevel IN(11,12)
OPEN @cursor
FETCH NEXT FROM @cursor
INTO @item_id_to_insert
INSERT INTO UserGameItems VALUES(@user_game_id, @item_id_to_insert)
WHILE @@FETCH_STATUS = 0
COMMIT TRANSACTION

--SET @sum_items = 
--(SELECT SUM(Price) FROM Items
--WHERE MinLevel IN(19,21))

--BEGIN TRANSACTION
--IF(@sum_items <= @user_cash) 
--SET @user_cash = @user_cash - @sum_items
--UPDATE UsersGames
--SET Cash = @user_cash
--WHERE Id = @user_game_id
--INSERT INTO UserGameItems
--SELECT DISTINCT(SELECT Id FROM Items 
--WHERE MinLevel IN(11,12))
--COMMIT TRANSACTION

--SELECT Name FROM UserGameItems
--INNER JOIN Items ON
--Items.Id = UserGameItems.ItemId
--WHERE UserGameItems.UserGameId = @user_game_id