USE [Minions]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 9/27/2016 7:05:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](30) NOT NULL,
	[Password] [varchar](26) NOT NULL,
	[ProfilePicture] [varbinary](1) NULL,
	[LastLoginTime] [datetime] NULL,
	[IsDeleted] [bit] NULL
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES (1, N'Elena', N'a1sqwOi', NULL, CAST(N'2016-09-26T23:23:24.000' AS DateTime), 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES (2, N'Roni', N'26S35sjdhK', NULL, CAST(N'2016-09-26T23:27:22.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES (3, N'Vesi', N'a1sqAS867SDlkwOi', NULL, CAST(N'2016-09-26T23:45:01.000' AS DateTime), 1)
INSERT [dbo].[Users] ([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES (4, N'Hrisi', N'Ma78ASDFKw', NULL, CAST(N'2016-09-27T00:02:17.000' AS DateTime), 0)
INSERT [dbo].[Users] ([Id], [Username], [Password], [ProfilePicture], [LastLoginTime], [IsDeleted]) VALUES (5, N'Misho', N'12KoL5GmH6', NULL, CAST(N'2016-09-27T00:06:09.000' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[Users] OFF
