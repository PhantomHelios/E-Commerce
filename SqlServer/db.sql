/****** Object:  Database [db]    Script Date: 23.09.2022 11:41:08 ******/
CREATE DATABASE [db]
GO
USE [db]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[PasswordHash] [varbinary](max) NOT NULL,
	[PasswordSalt] [varbinary](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RefreshToken] [nvarchar](max) NULL,
	[RefreshTokenExpiryTime] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Country] [nvarchar](max) NOT NULL,
	[City] [nvarchar](max) NOT NULL,
	[State] [nvarchar](max) NOT NULL,
	[Street] [nvarchar](max) NOT NULL,
	[PostCode] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[BonusPercentage] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
	[Added] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Favorites]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Favorites](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Added] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[AddressId] [bigint] NOT NULL,
	[TotalPrice] [int] NOT NULL,
	[OrderDate] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderItems]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderItems](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[OrderDetailId] [bigint] NOT NULL,
	[ProductId] [bigint] NOT NULL,
	[Quantity] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_OrderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [bigint] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[UnitPrice] [int] NOT NULL,
	[UnitsInStock] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[WalletId] [bigint] NOT NULL,
	[Amount] [int] NOT NULL,
	[Date] [datetime2](7) NOT NULL,
	[Type] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Transactions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[PhoneNumber] [nvarchar](max) NOT NULL,
	[Added] [datetime2](7) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Wallets]    Script Date: 23.09.2022 11:41:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Wallets](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[UserId] [bigint] NOT NULL,
	[Balance] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Wallets] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 

INSERT [dbo].[Accounts] ([Id], [UserId], [Email], [PasswordHash], [PasswordSalt], [IsDeleted], [RefreshToken], [RefreshTokenExpiryTime]) VALUES (1, 1, N'isa@gmail.com', 0x6BEE1B83AD71A1E78EF909C159F8FD4100289F1193119365C7525A290254AA2D360732F677FE9E8F78F6EFDE95ECF808AC4F1E3A8D76CBF579D440D8BF78ECCD, 0x92792FA16E802C004B812FC9FEB35D793BD3779BEF255EF66900C654AD316B410730EC57E7FCF4B944603CF197E0A8B0A49241A04884E6DF6E3C3DA3C63063CD5FCF966EE00CEFD49C691A6CD8DB9BEA14132E8680745D5FBE38E1D9DF3D1DE867629FCF076E01B083615E9B7050DFBCD6DC0863376D0A6020072C2DFC5A311F, 0, N'YDB08Evh4O03Uzp63MfR7DSWA8xDvnipjgwynj4t8f8=', CAST(N'2022-09-22T07:52:58.913' AS DateTime))
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Addresses] ON 

INSERT [dbo].[Addresses] ([Id], [UserId], [Name], [Country], [City], [State], [Street], [PostCode], [IsDeleted]) VALUES (1, 1, N'Home', N'Turkiye', N'Izmir', N'Buca', N'Ataturk Mah.', N'35390', 0)
SET IDENTITY_INSERT [dbo].[Addresses] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [Name], [BonusPercentage], [IsDeleted]) VALUES (1, N'Electronics', 20, 0)
INSERT [dbo].[Categories] ([Id], [Name], [BonusPercentage], [IsDeleted]) VALUES (2, N'Fashion', 15, 0)
INSERT [dbo].[Categories] ([Id], [Name], [BonusPercentage], [IsDeleted]) VALUES (3, N'Food', 12, 0)
INSERT [dbo].[Categories] ([Id], [Name], [BonusPercentage], [IsDeleted]) VALUES (4, N'Personal Care', 10, 0)
INSERT [dbo].[Categories] ([Id], [Name], [BonusPercentage], [IsDeleted]) VALUES (5, N'Tools', 25, 0)
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Text], [Added], [IsDeleted]) VALUES (1, 1, 1, N'Comment added.', CAST(N'2022-09-14T00:27:26.8828358' AS DateTime2), 0)
INSERT [dbo].[Comments] ([Id], [UserId], [ProductId], [Text], [Added], [IsDeleted]) VALUES (2, 1, 1, N'test', CAST(N'2022-09-14T00:29:12.0755286' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Comments] OFF
GO
SET IDENTITY_INSERT [dbo].[Favorites] ON 

INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (1, 1, 1, CAST(N'2022-09-13T23:35:22.3858496' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (2, 1, 1, CAST(N'2022-09-14T00:26:12.1097841' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (3, 1, 2, CAST(N'2022-09-14T00:26:27.9458358' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (4, 1, 3, CAST(N'2022-09-14T09:56:46.5226252' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (5, 1, 4, CAST(N'2022-09-14T10:18:21.6781593' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (6, 1, 7, CAST(N'2022-09-14T10:19:25.6055053' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (7, 1, 5, CAST(N'2022-09-14T10:24:59.9093686' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (8, 1, 1, CAST(N'2022-09-14T14:45:48.3189544' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (9, 1, 3, CAST(N'2022-09-14T15:16:01.2642840' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (10, 1, 9, CAST(N'2022-09-14T15:16:44.5746125' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (11, 1, 8, CAST(N'2022-09-14T15:16:47.4834512' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (12, 1, 4, CAST(N'2022-09-14T15:16:57.3341669' AS DateTime2), 1)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (13, 1, 1, CAST(N'2022-09-14T15:26:25.5330175' AS DateTime2), 0)
INSERT [dbo].[Favorites] ([Id], [UserId], [ProductId], [Added], [IsDeleted]) VALUES (14, 1, 14, CAST(N'2022-09-14T15:46:24.1316496' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Favorites] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 

INSERT [dbo].[OrderDetails] ([Id], [UserId], [AddressId], [TotalPrice], [OrderDate], [IsDeleted]) VALUES (1, 1, 1, 4041, CAST(N'2022-09-14T00:26:40.1085310' AS DateTime2), 1)
INSERT [dbo].[OrderDetails] ([Id], [UserId], [AddressId], [TotalPrice], [OrderDate], [IsDeleted]) VALUES (2, 1, 1, 1659, CAST(N'2022-09-14T09:19:23.5054470' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderItems] ON 

INSERT [dbo].[OrderItems] ([Id], [OrderDetailId], [ProductId], [Quantity], [IsDeleted]) VALUES (1, 1, 3, 3, 1)
INSERT [dbo].[OrderItems] ([Id], [OrderDetailId], [ProductId], [Quantity], [IsDeleted]) VALUES (2, 2, 2, 3, 0)
SET IDENTITY_INSERT [dbo].[OrderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (1, 2, N'Hat', 1506, 80, N'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo. Etiam pretium iaculis justo.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (2, 4, N'Antibacterial Foaming Hand Cleanser', 553, 43, N'Mauris sit amet eros. Suspendisse accumsan tortor quis turpis. Sed ante. Vivamus tortor. Duis mattis egestas metus.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (3, 1, N'Computer', 1347, 100, N'Nullam varius. Nulla facilisi. Cras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (4, 2, N'Dress', 1256, 140, N'Curabitur in libero ut massa volutpat convallis. Morbi odio odio, elementum eu, interdum eu, tincidunt in, leo. Maecenas pulvinar lobortis est. Phasellus sit amet erat.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (5, 5, N'Screwdriver', 30, 129, N'Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (6, 1, N'Smart Phone', 1704, 135, N'Nulla nisl. Nunc nisl. Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (7, 5, N'Folding Ladder', 1857, 84, N'Mauris lacinia sapien quis libero. Nullam sit amet turpis elementum ligula vehicula consequat. Morbi a ipsum.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (8, 3, N'Hamburger', 507, 150, N'Integer a nibh. In quis justo. Maecenas rhoncus aliquam lacus.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (9, 4, N'Face Mask', 1383, 105, N'Nulla justo. Aliquam quis turpis eget elit sodales scelerisque.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (10, 5, N'Bucket', 634, 179, N'Morbi quis tortor id nulla ultrices aliquet. Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (11, 2, N'Trousers', 1916, 167, N'Vivamus tortor. Duis mattis egestas metus. Aenean fermentum.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (12, 5, N'Hammer', 415, 177, N'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (13, 3, N'Pasta', 200, 147, N'Curabitur convallis. Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (14, 1, N'Monitor', 1623, 183, N'Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat. In congue. Etiam justo.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (15, 5, N'Socket Multiplier', 810, 136, N'Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio. Cras mi pede, malesuada in, imperdiet et, commodo vulputate, justo. In blandit ultrices enim.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (16, 4, N'Shampoo', 930, 195, N'Aliquam augue quam, sollicitudin vitae, consectetuer eget, rutrum at, lorem. Integer tincidunt ante vel ipsum.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (17, 3, N'Noodles', 82, 159, N'Suspendisse potenti. In eleifend quam a odio. In hac habitasse platea dictumst. Maecenas ut massa quis augue luctus tincidunt.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (18, 1, N'Microwave Oven ', 1931, 51, N'Ut at dolor quis odio consequat varius. Integer ac leo.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (19, 2, N'T-Shirt', 441, 32, N'In quis justo. Maecenas rhoncus aliquam lacus.', 0)
INSERT [dbo].[Products] ([Id], [CategoryId], [Name], [UnitPrice], [UnitsInStock], [Description], [IsDeleted]) VALUES (20, 3, N'Rice', 30, 29, N'Donec semper sapien a libero.', 0)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (1, 1, 100000, CAST(N'2022-09-13T23:34:56.3624463' AS DateTime2), N'Deposit', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (2, 1, 1, CAST(N'2022-09-14T00:19:31.2790833' AS DateTime2), N'Deposit', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (3, 1, -4041, CAST(N'2022-09-14T00:26:39.9275057' AS DateTime2), N'Payment', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (4, 1, 808, CAST(N'2022-09-14T00:26:40.1911857' AS DateTime2), N'Bonus', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (5, 1, -808, CAST(N'2022-09-14T00:26:46.2085583' AS DateTime2), N'Cashback Return', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (6, 1, 4041, CAST(N'2022-09-14T00:26:46.2213200' AS DateTime2), N'Refund', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (7, 1, -1659, CAST(N'2022-09-14T09:19:23.1477926' AS DateTime2), N'Payment', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (8, 1, 165, CAST(N'2022-09-14T09:19:23.6275648' AS DateTime2), N'Bonus', 0)
INSERT [dbo].[Transactions] ([Id], [WalletId], [Amount], [Date], [Type], [IsDeleted]) VALUES (9, 1, 10000, CAST(N'2022-09-14T15:22:34.6128644' AS DateTime2), N'Deposit', 0)
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [FirstName], [LastName], [PhoneNumber], [Added], [IsDeleted]) VALUES (1, N'Isa', N'Karahan', N'5555555555', CAST(N'2022-09-13T23:33:15.3996898' AS DateTime2), 0)
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET IDENTITY_INSERT [dbo].[Wallets] ON 

INSERT [dbo].[Wallets] ([Id], [UserId], [Balance], [IsDeleted]) VALUES (1, 1, 108507, 0)
SET IDENTITY_INSERT [dbo].[Wallets] OFF
GO