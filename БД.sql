USE [master]
GO
/****** Object:  Database [user15]    Script Date: 15.12.2021 10:42:38 ******/
CREATE DATABASE [user15]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'user15', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\user15.mdf' , SIZE = 9216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'user15_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\user15_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [user15] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [user15].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [user15] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [user15] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [user15] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [user15] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [user15] SET ARITHABORT OFF 
GO
ALTER DATABASE [user15] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [user15] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [user15] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [user15] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [user15] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [user15] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [user15] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [user15] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [user15] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [user15] SET  ENABLE_BROKER 
GO
ALTER DATABASE [user15] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [user15] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [user15] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [user15] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [user15] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [user15] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [user15] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [user15] SET RECOVERY FULL 
GO
ALTER DATABASE [user15] SET  MULTI_USER 
GO
ALTER DATABASE [user15] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [user15] SET DB_CHAINING OFF 
GO
ALTER DATABASE [user15] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [user15] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [user15] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [user15] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'user15', N'ON'
GO
ALTER DATABASE [user15] SET QUERY_STORE = OFF
GO
USE [user15]
GO
/****** Object:  Table [dbo].[TypeOfProduct]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfProduct](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfProduct] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfProduct] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameOfProduct] [nvarchar](50) NULL,
	[Article] [int] NULL,
	[MinPrice] [money] NULL,
	[Logo] [nvarchar](50) NULL,
	[IDtypeOfProduct] [bigint] NULL,
	[CountPeople] [int] NULL,
	[NumberCex] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[VW_ProductDetails]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VW_ProductDetails]
AS
SELECT        dbo.Products.ID, dbo.TypeOfProduct.TypeOfProduct, dbo.Products.NameOfProduct, dbo.Products.Article
FROM            dbo.Products INNER JOIN
                         dbo.TypeOfProduct ON dbo.Products.IDtypeOfProduct = dbo.TypeOfProduct.ID
GO
/****** Object:  Table [dbo].[History]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfHistory] [nvarchar](50) NOT NULL,
	[IDProduct] [bigint] NOT NULL,
	[MinPrice] [nchar](10) NULL,
 CONSTRAINT [PK_History] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MaterialShort]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MaterialShort](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[NameMaterial] [nvarchar](255) NULL,
	[IdTypeOfMaterial] [bigint] NULL,
	[Count] [int] NULL,
	[IdTypeOfEdinica] [bigint] NULL,
	[CountOnSklad] [int] NULL,
	[MinOstatok] [int] NULL,
	[Price] [money] NULL,
 CONSTRAINT [PK_MaterialShort] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductDetails]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductDetails](
	[IDView] [bigint] IDENTITY(1,1) NOT NULL,
	[IDTypeProduct] [bigint] NULL,
	[NameProduct] [nvarchar](50) NULL,
	[Article] [int] NULL,
	[CountTypeMaterial] [int] NULL,
	[CostPrice] [money] NULL,
	[Description] [nvarchar](100) NULL,
	[MinPriceAgent] [money] NULL,
	[Logo] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductDetails] PRIMARY KEY CLUSTERED 
(
	[IDView] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductMaterial]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductMaterial](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[IDOfProduct] [bigint] NULL,
	[IDOfMaterial] [bigint] NULL,
	[NeseccaryCount] [int] NULL,
 CONSTRAINT [PK_ProductMaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfEdinica]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfEdinica](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Edinica] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfEdinica] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TypeOfMaterial]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TypeOfMaterial](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[TypeOfMaterial] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypeOfMaterial] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([ID], [TypeOfHistory], [IDProduct], [MinPrice]) VALUES (1, N'Добавление нового продукта', 101, NULL)
INSERT [dbo].[History] ([ID], [TypeOfHistory], [IDProduct], [MinPrice]) VALUES (2, N'Изменение минимаьной стоимости', 1, N'  12345.00')
SET IDENTITY_INSERT [dbo].[History] OFF
GO
SET IDENTITY_INSERT [dbo].[MaterialShort] ON 

INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (1, N'Гранулы для бумаги розовый 0x2', 1, 7, 1, 37, 50, 17227.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (2, N'Гранулы для бумаги розовый 0x3', 1, 4, 2, 379, 41, 3868.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (3, N'Гранулы для бумаги розовый 2x2', 1, 10, 2, 661, 16, 10608.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (4, N'Гранулы для бумаги синий 1x2', 1, 6, 2, 112, 34, 25624.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (5, N'Гранулы для бумаги синий 1x3', 1, 10, 2, 841, 18, 38700.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (6, N'Гранулы для бумаги цветной 0x1', 1, 5, 2, 759, 28, 9216.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (7, N'Гранулы для бумаги цветной 0x3', 1, 10, 1, 962, 33, 35922.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (8, N'Переработка бумаги белый 2x0', 2, 5, 3, 794, 17, 21637.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (9, N'Переработка бумаги белый 3x0', 2, 10, 3, 247, 11, 39500.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (10, N'Переработка бумаги серый 0x2', 2, 3, 3, 167, 17, 10248.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (11, N'Переработка бумаги серый 1x2', 2, 8, 3, 516, 49, 35981.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (12, N'Переработка бумаги серый 3x3', 2, 10, 3, 89, 20, 49391.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (13, N'Переработка бумаги синий 0x1', 2, 7, 3, 97, 30, 47937.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (14, N'Переработка бумаги синий 0x2', 2, 9, 1, 709, 47, 23157.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (15, N'Переработка бумаги синий 0x3', 2, 9, 3, 958, 32, 14180.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (16, N'Переработка бумаги синий 1x2', 2, 4, 3, 81, 32, 47873.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (17, N'Переработка бумаги цветной 0x0', 2, 9, 3, 508, 19, 51147.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (18, N'Переработка бумаги цветной 0x1', 2, 8, 3, 833, 34, 53875.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (19, N'Переработка бумаги цветной 1x3', 2, 6, 1, 32, 34, 37930.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (20, N'Рулон бумаги белый 0x3', 4, 2, 3, 933, 50, 7253.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (21, N'Рулон бумаги белый 1x0', 4, 1, 3, 501, 49, 15833.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (22, N'Рулон бумаги белый 1x3', 4, 2, 1, 382, 10, 32770.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (23, N'Рулон бумаги белый 3x2', 4, 4, 1, 16, 31, 53759.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (24, N'Рулон бумаги белый 3x3', 4, 2, 1, 201, 46, 51261.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (25, N'Рулон бумаги зеленый 1x1', 4, 3, 3, 634, 36, 26841.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (26, N'Рулон бумаги зеленый 2x2', 4, 8, 1, 593, 20, 55016.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (27, N'Рулон бумаги зеленый 2x3', 4, 2, 3, 181, 35, 45388.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (28, N'Рулон бумаги зеленый 3x3', 4, 3, 3, 861, 45, 37283.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (29, N'Рулон бумаги розовый 2x1', 4, 1, 3, 349, 9, 36163.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (30, N'Рулон бумаги розовый 3x2', 4, 9, 3, 144, 41, 51776.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (31, N'Рулон бумаги серый 3x3', 4, 3, 3, 596, 8, 50247.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (32, N'Рулон бумаги синий 2x2', 4, 6, 1, 363, 47, 38450.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (33, N'Рулон бумаги синий 3x1', 4, 3, 3, 720, 11, 44675.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (34, N'Рулон бумаги синий 3x2', 4, 9, 3, 508, 16, 25561.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (35, N'Рулон бумаги цветной 1x2', 4, 10, 3, 246, 37, 5016.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (36, N'Рулон бумаги цветной 1x3', 4, 10, 1, 149, 13, 22724.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (37, N'Рулон бумаги цветной 2x0', 4, 3, 3, 386, 46, 35544.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (38, N'Рулон бумаги цветной 2x2', 4, 10, 1, 534, 46, 50776.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (39, N'Спрессованный материал белый 1x1', 3, 7, 1, 843, 16, 43440.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (40, N'Спрессованный материал белый 3x3', 3, 8, 3, 942, 12, 17600.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (41, N'Спрессованный материал розовый 1x2', 3, 7, 3, 509, 26, 10604.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (42, N'Спрессованный материал розовый 2x1', 3, 8, 3, 636, 21, 52606.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (43, N'Спрессованный материал розовый 2x3', 3, 3, 3, 552, 7, 4657.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (44, N'Спрессованный материал серый 0x2', 3, 5, 3, 140, 49, 33128.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (45, N'Спрессованный материал синий 0x2', 3, 3, 1, 514, 40, 6555.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (46, N'Спрессованный материал синий 3x1', 3, 10, 3, 270, 50, 38809.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (47, N'Спрессованный материал цветной 0x0', 3, 6, 3, 754, 24, 4611.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (48, N'Спрессованный материал цветной 1x0', 3, 8, 3, 856, 26, 12817.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (49, N'Спрессованный материал цветной 1x2', 3, 1, 3, 429, 47, 15802.0000)
INSERT [dbo].[MaterialShort] ([ID], [NameMaterial], [IdTypeOfMaterial], [Count], [IdTypeOfEdinica], [CountOnSklad], [MinOstatok], [Price]) VALUES (50, N'Спрессованный материал цветной 1x3', 3, 3, 3, 772, 40, 51672.0000)
SET IDENTITY_INSERT [dbo].[MaterialShort] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductDetails] ON 

INSERT [dbo].[ProductDetails] ([IDView], [IDTypeProduct], [NameProduct], [Article], [CountTypeMaterial], [CostPrice], [Description], [MinPriceAgent], [Logo]) VALUES (1, 2, N'Бумага', 23134, 2, 345.0000, N'Туалетная бумага', 349.0000, N'\products\paper_7.jpg')
INSERT [dbo].[ProductDetails] ([IDView], [IDTypeProduct], [NameProduct], [Article], [CountTypeMaterial], [CostPrice], [Description], [MinPriceAgent], [Logo]) VALUES (2, 3, N'Бумага1', 3424, 6, 123.0000, N'Туалетная бумага 1', 212.0000, N'\products\paper_7.jpg')
INSERT [dbo].[ProductDetails] ([IDView], [IDTypeProduct], [NameProduct], [Article], [CountTypeMaterial], [CostPrice], [Description], [MinPriceAgent], [Logo]) VALUES (3, 1, N'Бумага 2', 54214, 1, 12.0000, N'Туалтеная бумага 3', 563.0000, NULL)
INSERT [dbo].[ProductDetails] ([IDView], [IDTypeProduct], [NameProduct], [Article], [CountTypeMaterial], [CostPrice], [Description], [MinPriceAgent], [Logo]) VALUES (4, 5, N'Бумага 4', 3425, 2, 3243.0000, N'Туалетная бумага 4', 342.0000, N'\products\paper_7.jpg')
SET IDENTITY_INSERT [dbo].[ProductDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductMaterial] ON 

INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (1, 20, 29, 20)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (2, 2, 21, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (3, 27, 21, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (4, 4, 29, 18)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (5, 38, 21, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (6, 86, 29, 9)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (7, 49, 49, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (8, 20, 24, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (9, 13, 20, 12)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (10, 78, 24, 20)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (11, 38, 22, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (12, 95, 27, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (13, 53, 20, 12)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (14, 90, 24, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (15, 86, 24, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (16, 73, 22, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (17, 36, 22, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (18, 11, 22, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (19, 70, 25, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (20, 70, 37, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (21, 15, 28, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (22, 18, 31, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (23, 53, 43, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (24, 13, 33, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (25, 24, 31, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (26, 32, 31, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (27, 60, 25, 16)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (28, 63, 28, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (29, 92, 45, 5)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (30, 11, 43, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (31, 10, 43, 14)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (32, 34, 33, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (33, 46, 25, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (34, 66, 33, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (35, 46, 10, 2)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (36, 6, 50, 9)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (37, 97, 31, 10)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (38, 33, 33, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (39, 95, 33, 14)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (40, 93, 31, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (41, 29, 37, 2)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (42, 78, 45, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (43, 37, 50, 11)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (44, 92, 23, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (45, 34, 16, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (46, 57, 2, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (47, 70, 2, 16)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (48, 63, 2, 11)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (49, 94, 2, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (50, 38, 6, 20)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (51, 60, 6, 18)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (52, 19, 6, 18)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (53, 61, 6, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (54, 95, 6, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (55, 13, 47, 11)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (56, 4, 32, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (57, 24, 4, 18)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (58, 45, 47, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (59, 93, 19, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (60, 97, 47, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (61, 37, 4, 6)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (62, 75, 47, 7)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (63, 95, 4, 14)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (64, 57, 1, 14)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (65, 32, 1, 5)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (66, 8, 13, 15)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (67, 63, 39, 13)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (68, 11, 39, 10)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (69, 75, 39, 5)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (70, 61, 41, 20)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (71, 15, 40, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (72, 13, 48, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (73, 86, 42, 13)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (74, 24, 48, 18)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (75, 22, 18, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (76, 19, 34, 20)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (77, 93, 34, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (78, 93, 14, 14)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (79, 78, 15, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (80, 45, 17, 10)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (81, 95, 30, 5)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (82, 20, 17, 1)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (83, 92, 30, 10)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (84, 32, 15, 19)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (85, 24, 34, 16)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (86, 53, 30, 17)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (87, 42, 5, 8)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (88, 62, 7, 17)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (89, 97, 7, 10)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (90, 53, 5, 11)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (91, 72, 9, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (92, 66, 38, 16)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (93, 2, 38, 11)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (94, 2, 12, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (95, 24, 5, 12)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (96, 63, 5, 16)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (97, 22, 12, 3)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (98, 8, 9, 4)
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (99, 20, 7, 10)
GO
INSERT [dbo].[ProductMaterial] ([ID], [IDOfProduct], [IDOfMaterial], [NeseccaryCount]) VALUES (100, 61, 5, 6)
SET IDENTITY_INSERT [dbo].[ProductMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 

INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (1, N'Бумага 10М Дыня', 446103, 12345.0000, NULL, 3, 1, 3)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (2, N'Бумага 10М Клубника', 275591, NULL, N'\products\paper_7.jpg', 1, 4, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (3, N'Бумага 12М Бриз', 426804, NULL, NULL, 3, 1, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (4, N'Бумага 12М Клубника', 456129, NULL, N'\products\paper_1.jpg', 3, 3, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (5, N'Бумага 13М Бриз', 349861, 2345.0000, NULL, 1, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (6, N'Бумага 13М Дыня', 348651, 3477.0000, NULL, 5, 3, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (7, N'Бумага 14М Бриз', 310507, 7846.0000, NULL, 2, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (8, N'Бумага 15М Клубника', 449359, 10009.0000, NULL, 1, 3, 7)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (9, N'Бумага 16М Дыня', 262257, 9107.0000, NULL, 4, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (10, N'Бумага 20М Бриз', 285792, NULL, NULL, 2, 3, 7)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (11, N'Бумага 20М Клубника', 253218, 11684.0000, NULL, 3, 2, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (12, N'Бумага 21М Дыня', 366160, 11064.0000, N'\products\paper_2.jpg', 4, 1, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (13, N'Бумага 26М Ваниль', 444337, 3007.0000, NULL, 4, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (14, N'Бумага 28М Дыня', 298632, 14671.0000, NULL, 2, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (15, N'Бумага 29М Дыня', 332522, 5439.0000, N'\products\paper_18.jpg', 5, 3, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (16, N'Бумага 29М Клубника', 334943, 5997.0000, NULL, 3, 1, 10)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (17, N'Бумага 32М Бриз', 379800, 6832.0000, NULL, 2, 1, 7)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (18, N'Бумага 32М Дыня', 268393, NULL, NULL, 3, 4, 3)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (19, N'Бумага 33М Бриз', 347239, NULL, NULL, 1, 5, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (20, N'Бумага 33М Клубника', 252485, NULL, N'\products\paper_0.jpg', 5, 3, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (21, N'Бумага 37М Клубника', 442634, 12664.0000, N'\products\paper_14.jpg', 2, 5, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (22, N'Бумага 38М Ваниль', 416066, NULL, NULL, 5, 2, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (23, N'Бумага 3М Бриз', 260492, 8278.0000, NULL, 1, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (24, N'Бумага 40М Бриз', 326200, NULL, N'\products\paper_19.jpg', 1, 5, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (25, N'Бумага 44М Бриз', 422185, NULL, NULL, 3, 2, 5)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (26, N'Бумага 45М Бриз', 374276, NULL, NULL, 2, 3, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (27, N'Бумага 45М Клубника', 400484, 3475.0000, NULL, 4, 3, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (28, N'Бумага 49М Бриз', 414339, NULL, NULL, 5, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (29, N'Бумага 50М Бриз', 340583, NULL, N'\products\paper_15.jpg', 2, 4, 7)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (30, N'Бумага 50М Ваниль', 454479, 3163.0000, NULL, 2, 3, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (31, N'Бумага 5М Бриз', 345239, NULL, NULL, 3, 1, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (32, N'Бумага 5М Дыня', 256862, NULL, N'\products\paper_5.jpg', 3, 5, 5)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (33, N'Бумага 7М Ваниль', 290729, 6934.0000, NULL, 4, 4, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (34, N'Бумага 9М Ваниль', 446348, NULL, NULL, 2, 3, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (35, N'Набор 10М Ваниль', 261465, NULL, N'\products\paper_12.jpg', 4, 5, 3)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (36, N'Набор 10М Дыня', 431234, NULL, N'\products\paper_22.jpg', 3, 4, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (37, N'Набор 11М Дыня', 450659, 5956.0000, N'\products\paper_16.jpg', 1, 3, 7)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (38, N'Набор 12М Бриз', 349614, NULL, N'\products\paper_3.jpg', 2, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (39, N'Набор 14М Дыня', 373939, NULL, NULL, 5, 2, 3)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (40, N'Набор 16М Дыня', 376834, 11927.0000, NULL, 3, 4, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (41, N'Набор 17М Клубника', 441239, 14863.0000, NULL, 4, 2, 10)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (42, N'Набор 18М Ваниль', 331270, NULL, NULL, 5, 4, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (43, N'Набор 19М Бриз', 277950, NULL, NULL, 2, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (44, N'Набор 19М Дыня', 382063, 2373.0000, NULL, 4, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (45, N'Набор 20М Бриз', 377042, NULL, N'\products\paper_9.jpg', 3, 5, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (46, N'Набор 22М Бриз', 443382, 4501.0000, NULL, 2, 3, 5)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (47, N'Набор 22М Клубника', 360424, NULL, NULL, 5, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (48, N'Набор 24М Ваниль', 374263, NULL, NULL, 3, 5, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (49, N'Набор 24М Дыня', 337632, 11471.0000, NULL, 1, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (50, N'Набор 24М Клубника', 296007, 14162.0000, NULL, 2, 2, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (51, N'Набор 25М Бриз', 434113, 13047.0000, NULL, 3, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (52, N'Набор 26М Дыня', 279801, NULL, NULL, 1, 2, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (53, N'Набор 29М Ваниль', 344868, 7618.0000, N'\products\paper_4.jpg', 5, 1, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (54, N'Набор 31М Дыня', 449401, NULL, NULL, 3, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (55, N'Набор 32М Клубника', 351062, 4450.0000, NULL, 4, 3, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (56, N'Набор 34М Ваниль', 316033, 13533.0000, NULL, 4, 1, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (57, N'Набор 34М Клубника', 381110, 2372.0000, NULL, 1, 3, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (58, N'Набор 40М Бриз', 353930, 12767.0000, NULL, 1, 2, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (59, N'Набор 40М Дыня', 346154, NULL, NULL, 2, 4, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (60, N'Набор 41М Дыня', 385037, 3295.0000, N'\products\paper_21.jpg', 3, 5, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (61, N'Набор 41М Клубника', 281425, 9908.0000, N'\products\paper_23.jpg', 4, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (62, N'Набор 42М Дыня', 390914, NULL, N'\products\paper_13.jpg', 2, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (63, N'Набор 43М Дыня', 330360, 5867.0000, NULL, 5, 5, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (64, N'Набор 43М Клубника', 443538, NULL, NULL, 3, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (65, N'Набор 45М Бриз', 349802, 12040.0000, NULL, 1, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (66, N'Набор 50М Бриз', 414595, NULL, N'\products\paper_8.jpg', 1, 4, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (67, N'Набор 50М Клубника', 278721, 14220.0000, NULL, 2, 3, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (68, N'Набор 5М Бриз', 278382, 7325.0000, NULL, 1, 3, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (69, N'Набор 6М Бриз', 289779, 14154.0000, NULL, 3, 1, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (70, N'Набор 8М Дыня', 240580, 7465.0000, NULL, 3, 5, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (71, N'Набор 9М Бриз', 259548, NULL, NULL, 1, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (72, N'Набор 9М Дыня', 440942, 2580.0000, NULL, 3, 3, 4)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (73, N'Полотенце 11М Дыня', 400418, NULL, N'\products\paper_25.jpg', 4, 2, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (74, N'Полотенце 14М Дыня', 331688, 10330.0000, NULL, 1, 2, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (75, N'Полотенце 14М Клубника', 309862, NULL, N'\products\paper_17.jpg', 1, 4, 8)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (76, N'Полотенце 15М Бриз', 365615, NULL, NULL, 3, 1, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (77, N'Полотенце 16М Бриз', 418298, NULL, NULL, 5, 2, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (78, N'Полотенце 16М Ваниль', 259488, NULL, NULL, 4, 3, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (79, N'Полотенце 17М Бриз', 309067, 13825.0000, N'\products\paper_24.jpg', 1, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (80, N'Полотенце 17М Ваниль', 403054, 5048.0000, NULL, 4, 2, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (81, N'Полотенце 23М Ваниль', 437519, 3317.0000, NULL, 5, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (82, N'Полотенце 24М Дыня', 264493, NULL, NULL, 1, 5, 10)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (83, N'Полотенце 25М Бриз', 258695, NULL, NULL, 5, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (84, N'Полотенце 27М Ваниль', 278463, 3978.0000, N'\products\paper_10.jpg', 1, 3, 5)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (85, N'Полотенце 27М Дыня', 238686, NULL, NULL, 1, 2, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (86, N'Полотенце 28М Клубника', 334385, NULL, N'\products\paper_20.jpg', 5, 2, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (87, N'Полотенце 33М Бриз', 297840, 4611.0000, NULL, 4, 4, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (88, N'Полотенце 37М Клубника', 292358, 3961.0000, NULL, 3, 4, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (89, N'Полотенце 41М Дыня', 239349, NULL, NULL, 2, 2, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (90, N'Полотенце 43М Клубника', 425641, 14151.0000, NULL, 4, 2, 6)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (91, N'Полотенце 44М Ваниль', 357053, 3396.0000, NULL, 3, 5, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (92, N'Полотенце 45М Бриз', 303994, 13081.0000, N'\products\paper_6.jpg', 2, 2, 1)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (93, N'Полотенце 45М Клубника', 352034, 11939.0000, NULL, 5, 2, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (94, N'Полотенце 47М Дыня', 294441, 11460.0000, NULL, 4, 4, 5)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (95, N'Полотенце 47М Клубника', 378723, 3871.0000, NULL, 3, 4, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (96, N'Полотенце 48М Клубника', 292206, 9801.0000, NULL, 4, 3, 3)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (97, N'Полотенце 50М Ваниль', 310212, NULL, N'\products\paper_11.jpg', 5, 1, NULL)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (98, N'Полотенце 6М Ваниль', 324941, 5594.0000, NULL, 1, 1, 2)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (99, N'Полотенце 7М Бриз', 350515, 4986.0000, NULL, 1, 2, 2)
GO
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (100, N'Полотенце 7М Ваниль', 397143, NULL, NULL, 2, 2, 9)
INSERT [dbo].[Products] ([ID], [NameOfProduct], [Article], [MinPrice], [Logo], [IDtypeOfProduct], [CountPeople], [NumberCex]) VALUES (101, N'Полотенце', 342, 343.0000, NULL, 3, 1, 4)
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfEdinica] ON 

INSERT [dbo].[TypeOfEdinica] ([ID], [Edinica]) VALUES (1, N' кг')
INSERT [dbo].[TypeOfEdinica] ([ID], [Edinica]) VALUES (2, N' л')
INSERT [dbo].[TypeOfEdinica] ([ID], [Edinica]) VALUES (3, N' м')
SET IDENTITY_INSERT [dbo].[TypeOfEdinica] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfMaterial] ON 

INSERT [dbo].[TypeOfMaterial] ([ID], [TypeOfMaterial]) VALUES (1, N' Гранулы')
INSERT [dbo].[TypeOfMaterial] ([ID], [TypeOfMaterial]) VALUES (2, N' Нарезка')
INSERT [dbo].[TypeOfMaterial] ([ID], [TypeOfMaterial]) VALUES (3, N' Пресс')
INSERT [dbo].[TypeOfMaterial] ([ID], [TypeOfMaterial]) VALUES (4, N' Рулон')
SET IDENTITY_INSERT [dbo].[TypeOfMaterial] OFF
GO
SET IDENTITY_INSERT [dbo].[TypeOfProduct] ON 

INSERT [dbo].[TypeOfProduct] ([ID], [TypeOfProduct]) VALUES (1, N'Два слоя')
INSERT [dbo].[TypeOfProduct] ([ID], [TypeOfProduct]) VALUES (2, N'Детская')
INSERT [dbo].[TypeOfProduct] ([ID], [TypeOfProduct]) VALUES (3, N'Один слой')
INSERT [dbo].[TypeOfProduct] ([ID], [TypeOfProduct]) VALUES (4, N'Супер мягкая')
INSERT [dbo].[TypeOfProduct] ([ID], [TypeOfProduct]) VALUES (5, N'Три слоя')
SET IDENTITY_INSERT [dbo].[TypeOfProduct] OFF
GO
ALTER TABLE [dbo].[MaterialShort]  WITH CHECK ADD  CONSTRAINT [FK_MaterialShort_TypeOfEdinica] FOREIGN KEY([IdTypeOfEdinica])
REFERENCES [dbo].[TypeOfEdinica] ([ID])
GO
ALTER TABLE [dbo].[MaterialShort] CHECK CONSTRAINT [FK_MaterialShort_TypeOfEdinica]
GO
ALTER TABLE [dbo].[MaterialShort]  WITH CHECK ADD  CONSTRAINT [FK_MaterialShort_TypeOfMaterial] FOREIGN KEY([IdTypeOfMaterial])
REFERENCES [dbo].[TypeOfMaterial] ([ID])
GO
ALTER TABLE [dbo].[MaterialShort] CHECK CONSTRAINT [FK_MaterialShort_TypeOfMaterial]
GO
ALTER TABLE [dbo].[ProductDetails]  WITH CHECK ADD  CONSTRAINT [FK_ProductDetails_TypeOfProduct] FOREIGN KEY([IDTypeProduct])
REFERENCES [dbo].[TypeOfProduct] ([ID])
GO
ALTER TABLE [dbo].[ProductDetails] CHECK CONSTRAINT [FK_ProductDetails_TypeOfProduct]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_MaterialShort] FOREIGN KEY([IDOfMaterial])
REFERENCES [dbo].[MaterialShort] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_MaterialShort]
GO
ALTER TABLE [dbo].[ProductMaterial]  WITH CHECK ADD  CONSTRAINT [FK_ProductMaterial_Products] FOREIGN KEY([IDOfProduct])
REFERENCES [dbo].[Products] ([ID])
GO
ALTER TABLE [dbo].[ProductMaterial] CHECK CONSTRAINT [FK_ProductMaterial_Products]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_TypeOfProduct] FOREIGN KEY([IDtypeOfProduct])
REFERENCES [dbo].[TypeOfProduct] ([ID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_TypeOfProduct]
GO
/****** Object:  Trigger [dbo].[TR_Product_AddProduct]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create trigger [dbo].[TR_Product_AddProduct]
on [dbo].[Products]
after insert
as
insert into [dbo].[History]([TypeOfHistory], IDProduct)
select 'Добавление нового продукта', inserted.ID
from inserted
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [TR_Product_AddProduct]
GO
/****** Object:  Trigger [dbo].[TR_Product_UpdateMinPrice]    Script Date: 15.12.2021 10:42:38 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE trigger [dbo].[TR_Product_UpdateMinPrice]
on [dbo].[Products]
after update
as
insert into [dbo].[History]([TypeOfHistory], IDProduct, MinPrice)
select 'Изменение минимаьной стоимости', inserted.ID, inserted.MinPrice
from inserted
GO
ALTER TABLE [dbo].[Products] ENABLE TRIGGER [TR_Product_UpdateMinPrice]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Products"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 136
               Right = 216
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "TypeOfProduct"
            Begin Extent = 
               Top = 6
               Left = 254
               Bottom = 102
               Right = 424
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ProductDetails'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VW_ProductDetails'
GO
USE [master]
GO
ALTER DATABASE [user15] SET  READ_WRITE 
GO
