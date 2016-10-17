Use Master
GO
CREATE DATABASE Movies;
GO
Use Movies



--CREATE TABLE Directors (
--Id INT PRIMARY KEY,
--DirectorName VARCHAR(50),
--Notes NVARCHAR(max)
--)

--INSERT Directors 
--(id, DirectorName, Notes) VALUES(1, 'Steven Spielberg', 'Notes of Spielberg');
--INSERT Directors 
--(id, DirectorName, Notes) VALUES(2, 'Steven Soderberg', 'Notes of Soderberg');
--INSERT Directors 
--(id, DirectorName, Notes) VALUES(3, 'Edd Zwick', 'Notes of Zwick');
--INSERT Directors 
--(id, DirectorName, Notes) VALUES(4, 'Cristopher Nollen', 'Notes of Nollen');
--INSERT Directors 
--(id, DirectorName, Notes) VALUES(5, 'Roland Emerich', 'Notes of Emerich');

--CREATE TABLE Genres (
--Id INT PRIMARY KEY,
--GenreName VARCHAR(50),
--Notes NVARCHAR(max)
--)
--INSERT Genres 
--(id, GenreName, Notes) VALUES(1, 'Drama', 'Drama Notes');
--INSERT Genres 
--(id, GenreName, Notes) VALUES(2, 'Action', 'Action Notes');
--INSERT Genres 
--(id, GenreName, Notes) VALUES(3, 'Thriller', 'Thriller Notes');
--INSERT Genres 
--(id, GenreName, Notes) VALUES(4, 'Sci-Fi', 'Sci-Fi Notes');
--INSERT Genres 
--(id, GenreName, Notes) VALUES(5, 'Historical', 'Comedy Notes');

--CREATE TABLE Categories (
--Id INT PRIMARY KEY,
--CategoryName VARCHAR(50),
--Notes NVARCHAR(max)
--)
--INSERT Categories 
--(id, CategoryName, Notes) VALUES(1, 'BlockBusters', 'BlockBusters Notes');
--INSERT Categories 
--(id, CategoryName, Notes) VALUES(2, 'Oscar Pretendents', 'Oscar Pretendents Notes');
--INSERT Categories 
--(id, CategoryName, Notes) VALUES(3, 'B-Movies', 'B-Movies Notes');
--INSERT Categories 
--(id, CategoryName, Notes) VALUES(4, 'Cartoon', 'Cartoon Notes');
--INSERT Categories 
--(id, CategoryName, Notes) VALUES(5, 'Epic', 'Documentary Notes');

--CREATE TABLE Movies (
--Id INT PRIMARY KEY,
--Title VARCHAR(50),
--DirectorId INT,
--CopyrightYear DATE ,
--Length TIME,
--GenreId INT,
--CategoryId INT,
--Rating FLOAT,
--Notes NVARCHAR(max)
--)
--INSERT Movies
--(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--VALUES(1, 'The BFG', 1, CAST('2016-09-09' AS DATE), CAST('01:40:30' AS TIME), 4, 1, 7.5, 'The BFG Notes');
--INSERT Movies
--(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--VALUES(2, 'Inception', 4, CAST('2010-09-09' AS DATE), CAST('02:45:20' AS TIME), 4, 2, 8.8, 'Inception Notes');
--INSERT Movies
--(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--VALUES(3, 'Che', 2, CAST('2008-04-15' AS DATE), CAST('02:10:10' AS TIME), 1, 2, 7.8, 'Che Notes');
--INSERT Movies
--(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--VALUES(4, 'Independence day', 5, CAST('1996-07-04' AS DATE), CAST('02:10:20' AS TIME), 2, 1, 6.5, 'Independence Day Notes');
--INSERT Movies
--(Id, Title, DirectorId, CopyrightYear, Length, GenreId, CategoryId, Rating, Notes)
--VALUES(5, 'Last Samurai', 3, CAST('2002-10-02' AS DATE), CAST('02:20:45' AS TIME), 5, 5, 8.6, 'Last Samurai Notes');