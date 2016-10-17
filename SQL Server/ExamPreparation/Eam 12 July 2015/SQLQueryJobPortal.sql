--CREATE DATABASE "Job Portal"
--CREATE TABLE Users(
--Id INT PRIMARY KEY IDENTITY NOT NULL,
--Username VARCHAR(50) NOT NULL,
--Fullname VARCHAR(50)
--);

--CREATE TABLE Salaries(
--Id INT PRIMARY KEY IDENTITY NOT NULL,
--FromValue DECIMAL(10,2),
--ToValue DECIMAL(10,2)
--)

--CREATE TABLE JobAds(
--Id INT PRIMARY KEY IDENTITY NOT NULL,
--Title VARCHAR(200) NOT NULL,
--Description VARCHAR(500),
--AUTHOR VARCHAR(50),
--Salary INT FOREIGN KEY REFERENCES Salaries(Id)
--)

--CREATE TABLE JobAdApplications(
--Id INT PRIMARY KEY IDENTITY NOT NULL,
--[JobAd] INT FOREIGN KEY REFERENCES JobAds(Id),
--[User] INT FOREIGN KEY REFERENCES Users(Id)
--)

--insert into Users (Username, Fullname)
--values ('pesho', 'Peter Pan'),
--('gosho', 'Georgi Manchev'),
--('minka', 'Minka Dryzdeva'),
--('jivka', 'Jivka Goranova'),
--('gago', 'Georgi Georgiev'),
--('dokata', 'Yordan Malov'),
--('glavata', 'Galin Glavomanov'),
--('petrohana', 'Peter Petromanov'),
--('jubata', 'Jivko Jurandov'),
--('dodo', 'Donko Drozev'),
--('bobo', 'Bay Boris');

--INSERT INTO Salaries (FromValue, ToValue)
--VALUES (300, 500),
--(400, 600),
--(550, 700),
--(600, 800),
--(1000, 1200),
--(1300, 1500),
--(1500, 2000),
--(2000, 3000);

--insert into JobAds (title, [Description], Author, Salary)
--values ('PHP Developer', NULL, (select id from users where username = 'gosho'), (select id from salaries where FromValue = 300)),
--('Java Developer', 'looking to hire Junior Java Developer to join a team responsible for the development and maintenance of the payment infrastructure systems', (select id from users where username = 'jivka'), (select id from salaries where FromValue = 1000)),
--('.NET Developer', 'net developers who are eager to develop highly innovative web and mobile products with latest versions of Microsoft .NET, ASP.NET, Web services, SQL Server and related applications.', (select id from users where username = 'dokata'), (select id from salaries where FromValue = 1300)),
--('JavaScript Developer', 'Excellent knowledge in JavaScript', (select id from users where username = 'minka'), (select id from salaries where FromValue = 1500)),
--('C++ Developer', NULL, (select id from users where username = 'bobo'), (select id from salaries where FromValue = 2000)),
--('Game Developer', NULL, (select id from users where username = 'jubata'), (select id from salaries where FromValue = 600)),
--('Unity Developer', NULL, (select id from users where username = 'petrohana'), (select id from salaries where FromValue = 550));

--insert into JobAdApplications(JobAd, [User])
--values 
--	((select id from JobAds where title = 'C++ Developer'), (select id from users where username = 'gosho')),
--	((select id from JobAds where title = 'Game Developer'), (select id from users where username = 'gosho')),
--	((select id from JobAds where title = 'Java Developer'), (select id from users where username = 'gosho')),
--	((select id from JobAds where title = '.NET Developer'), (select id from users where username = 'minka')),
--	((select id from JobAds where title = 'JavaScript Developer'), (select id from users where username = 'minka')),
--	((select id from JobAds where title = 'Unity Developer'), (select id from users where username = 'petrohana')),
--	((select id from JobAds where title = '.NET Developer'), (select id from users where username = 'jivka')),
--	((select id from JobAds where title = 'Java Developer'), (select id from users where username = 'jivka'));

--SELECT username, fullname, Title AS Job, FromValue AS "From Value", ToValue AS "To Value" FROM JobAdApplications
--INNER JOIN Users
--ON Users.Id = JobAdApplications.[User]
--INNER JOIN JobAds
--ON JobAds.Id = JobAdApplications.JobAd
--INNER JOIN Salaries
--On Salaries.Id = JobAds.Salary
--ORDER BY Username, Title