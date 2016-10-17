--CREATE TABLE Users (
--Id BIGINT IDENTITY(1,1) PRIMARY KEY NOT NULL,
--Username VARCHAR(30) NOT NULL,
--Password VARCHAR(26) NOT NULL,
--ProfilePicture varbinary NULL,
--LastLoginTime DATETIME NULL,
--IsDeleted BIT NULL,
--)

--SET IDENTITY_INSERT [dbo].[Users] ON 
--INSERT [dbo].[Users] 
--([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted])
--VALUES (1, 'Elena', 'a1sqwOi', NULL, CAST('2016-09-26 23:23:24' AS DATETIME), 0);
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (2, 'Roni', '26S35sjdhK', NULL, CAST('2016-09-26 23:27:22' AS DATETIME), 1);
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (3, 'Vesi', 'a1sqAS867SDlkwOi', NULL, CAST('2016-09-26 23:45:01' AS DATETIME), 1);
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (4, 'Hrisi', 'Ma78ASDFKw', NULL, CAST('2016-09-27 00:02:17' AS DATETIME), 0);
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (5, 'Misho', '12KoL5GmH6', NULL, CAST('2016-09-27 00:06:09' AS DATETIME), 1);
--ALTER TABLE Users
--ALTER COLUMN Id BIGINT NOT NULL;
--GO

--ALTER TABLE Users MODIFY Id BIGINT NOT NULL;
--ALTER TABLE [dbo].[Users]
--DROP CONSTRAINT PK__Users__3214EC071E92A4E3;

--ALTER TABLE Users
--ADD CHECK(LEN(Password) >= 5)

--SET IDENTITY_INSERT [dbo].[Users] ON 
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (6, 'Misho', 'kjhaa', NULL, CAST('2016-09-27 00:06:09' AS DATETIME), 1);

--ALTER TABLE Users
--ADD CONSTRAINT Login_Default DEFAULT GETDATE() FOR LastLoginTime;

--ALTER TABLE Users
--ADD PRIMARY KEY(Id, Username);

--ALTER TABLE Users
--DROP CONSTRAINT PK__Users__772224597FA4D516;

--ALTER TABLE Users
--ADD PRIMARY KEY(Id)

--ALTER TABLE Users
--ADD CONSTRAINT Users_Password CHECK (DATALENGTH(Username) >=3)

--SET IDENTITY_INSERT [dbo].[Users] ON 
--INSERT Users 
--(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
--VALUES (7, 'Misho', 'ka', NULL, CAST('2016-09-27 00:06:09' AS DATETIME), 1);

SET IDENTITY_INSERT [dbo].[Users] ON 
INSERT Users 
(Id, Username, Password, ProfilePicture, LastLoginTime, IsDeleted)
VALUES (7, 'Mos', 'sdf8sdfka', NULL, CAST('2016-09-27 00:06:09' AS DATETIME), 1);