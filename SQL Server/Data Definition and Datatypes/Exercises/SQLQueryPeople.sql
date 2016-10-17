CREATE TABLE People (
Id INT IDENTITY(1,1) PRIMARY KEY,
Name NVARCHAR(200) NULL,
Picture IMAGE NULL,
Height FLOAT(2) NULL,
Weight FLOAT(2) NULL,
Gender VARCHAR(1) NOT NULL CHECK (Gender IN ('m', 'f')),
Birthdate DATE NOT NULL,
Biography NVARCHAR(max) NULL,
)

SET IDENTITY_INSERT [dbo].[People] ON 
INSERT [dbo].[People]
([Id], [Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography]) 
VALUES (1, N'Jenni', NULL, 168, 56, 'f',  CAST(N'1990-08-15' As Date), 'BiographyJenny')
INSERT [dbo].[People]
([Id], [Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography]) 
VALUES (2, N'Amanda', NULL, 178, 55, 'f',  CAST(N'1990-06-05' As Date), 'BiographyAmanda')
INSERT [dbo].[People]
([Id], [Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography]) 
VALUES (3, N'Danielle', NULL, 166, 54, 'f',  CAST(N'1979-06-15' As Date), 'BiographyDanielle')
INSERT [dbo].[People]
([Id], [Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography]) 
VALUES (4, N'Christina', NULL, 174, 60, 'f',  CAST(N'1980-12-18' As Date), 'BiographyChristina')
INSERT [dbo].[People]
([Id], [Name], [Picture], [Height], [Weight], [Gender], [Birthdate], [Biography]) 
VALUES (5, N'Rumi', NULL, 175, 51, 'f',  CAST(N'1975-12-10' As Date), 'BiographyRumi')