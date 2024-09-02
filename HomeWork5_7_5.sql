Use MyFuncDB
Go

CREATE TABLE [Person] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [Name] varchar(50),
  [PhoneNumber] varchar(50)
)
GO

CREATE TABLE [Position] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [PersonId] integer NOT NULL,
  [Salary] money,
  [Position] varchar(50)
)
GO

CREATE TABLE [Bio] (
  [Id] integer PRIMARY KEY IDENTITY(1, 1),
  [PersonId] integer NOT NULL,
  [MaritalStatus] varchar(50),
  [DOB] date,
  [Address] varchar(100)
)
GO

ALTER TABLE [Bio] ADD FOREIGN KEY ([PersonId]) REFERENCES [Person] ([Id])
GO

ALTER TABLE [Position] ADD FOREIGN KEY ([PersonId]) REFERENCES [Person] ([Id])
GO

SET IDENTITY_INSERT [dbo].[Person] ON 
INSERT [dbo].[Person] ([Id], [Name], [PhoneNumber]) VALUES (1, N'Alex', N'0663807520')
INSERT [dbo].[Person] ([Id], [Name], [PhoneNumber]) VALUES (2, N'Edik', N'0682312340')
SET IDENTITY_INSERT [dbo].[Person] OFF
GO

SET IDENTITY_INSERT [dbo].[Bio] ON 
INSERT [dbo].[Bio] ([Id], [PersonId], [MaritalStatus], [DOB], [Address]) VALUES (1, 1, N'неодружений', CAST(N'2007-08-23' AS Date), N'вул.Пушіна')
INSERT [dbo].[Bio] ([Id], [PersonId], [MaritalStatus], [DOB], [Address]) VALUES (2, 2, N'одружений', CAST(N'2013-07-27' AS Date), N'вул.Негрійська')
SET IDENTITY_INSERT [dbo].[Bio] OFF
GO

SET IDENTITY_INSERT [dbo].[Position] ON 
INSERT [dbo].[Position] ([Id], [PersonId], [Salary], [Position]) VALUES (1, 1, 2000.0000, N'Менеджер')
INSERT [dbo].[Position] ([Id], [PersonId], [Salary], [Position]) VALUES (2, 2, 1000.0000, N'Робітник')
SET IDENTITY_INSERT [dbo].[Position] OFF
GO