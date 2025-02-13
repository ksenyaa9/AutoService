USE [master]
GO
/****** Object:  Database [Хазиев Автосервис]    Script Date: 09.10.2024 14:14:32 ******/
CREATE DATABASE [Хазиев Автосервис]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Хазиев Автосервис', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Хазиев Автосервис.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Хазиев Автосервис_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS01\MSSQL\DATA\Хазиев Автосервис_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Хазиев Автосервис] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Хазиев Автосервис].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Хазиев Автосервис] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET ARITHABORT OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Хазиев Автосервис] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Хазиев Автосервис] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Хазиев Автосервис] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Хазиев Автосервис] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Хазиев Автосервис] SET  MULTI_USER 
GO
ALTER DATABASE [Хазиев Автосервис] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Хазиев Автосервис] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Хазиев Автосервис] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Хазиев Автосервис] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Хазиев Автосервис] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Хазиев Автосервис] SET QUERY_STORE = OFF
GO
USE [Хазиев Автосервис]
GO
/****** Object:  Table [dbo].[AttachedProduct]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttachedProduct](
	[MainProductID] [int] NOT NULL,
	[AttachedProductID] [int] NOT NULL,
 CONSTRAINT [PK_AttachedProduct] PRIMARY KEY CLUSTERED 
(
	[MainProductID] ASC,
	[AttachedProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Patronymic] [nvarchar](50) NULL,
	[GenderCode] [nchar](1) NOT NULL,
	[Phone] [nvarchar](20) NOT NULL,
	[Birthday] [date] NULL,
	[Email] [nvarchar](255) NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[PhotoPath] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Client] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ClientService]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ClientService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientID] [int] NOT NULL,
	[ServiceID] [int] NOT NULL,
	[StartTime] [datetime] NOT NULL,
	[Comment] [nvarchar](max) NULL,
 CONSTRAINT [PK_ClientService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DocumentByService]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DocumentByService](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ClientServiceID] [int] NOT NULL,
	[DocumentPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_DocumentByService] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gender]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gender](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](10) NULL,
 CONSTRAINT [PK_Gender] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufacturer]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufacturer](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[StartDate] [date] NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Cost] [money] NOT NULL,
	[Description] [nvarchar](max) NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[IsActive] [bit] NOT NULL,
	[ManufacturerID] [int] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductPhoto]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductPhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ProductPhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSale]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSale](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SaleDate] [datetime] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[ClientServiceID] [int] NULL,
 CONSTRAINT [PK_ProductSale] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[MainImagePath] [nvarchar](1000) NULL,
	[Duration] [nvarchar](50) NOT NULL,
	[Cost] [decimal](18, 2) NOT NULL,
	[Discount] [float] NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServicePhoto]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServicePhoto](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ServiceID] [int] NOT NULL,
	[PhotoPath] [nvarchar](1000) NOT NULL,
 CONSTRAINT [PK_ServicePhoto] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tag]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Color] [nchar](6) NOT NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TagOfClient]    Script Date: 09.10.2024 14:14:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TagOfClient](
	[ClientID] [int] NOT NULL,
	[TagID] [int] NOT NULL,
 CONSTRAINT [PK_TagOfClient] PRIMARY KEY CLUSTERED 
(
	[ClientID] ASC,
	[TagID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Client] ON 

INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (1, N'Мишина', N'Иветта', N'Андреевна', N'ж', N'7(3926)244-81-96 ', CAST(N'2002-10-05' AS Date), N'aukjan@yahoo.com', CAST(N'2016-01-24T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (2, N'Суворова', N'Божена', N'Анатольевна', N'ж', N'7(347)895-86-57 ', CAST(N'1981-03-09' AS Date), N'attwood@aol.com', CAST(N'2016-01-28T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (3, N'Белозёрова', N'Диана', N'Антоновна', N'ж', N'7(9900)174-59-87 ', CAST(N'1989-02-27' AS Date), N'dialworld@aol.com', CAST(N'2017-01-30T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (4, N'Дементьева', N'Эдита', N'Онисимовна', N'ж', N'7(198)922-28-76 ', CAST(N'1975-09-17' AS Date), N'frosal@hotmail.com', CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (5, N'Блинов', N'Евгений', N'Мэлсович', N'м', N'7(0852)321-82-64 ', CAST(N'1994-01-05' AS Date), N'moxfulder@outlook.com', CAST(N'2017-05-07T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (6, N'Морозов', N'Наум', N'Валерьянович', N'м', N'7(636)050-96-13 ', CAST(N'1985-07-04' AS Date), N'salesgeek@mac.com', CAST(N'2016-05-02T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (7, N'Попова', N'Харита', N'Якуновна', N'ж', N'7(335)386-81-06 ', CAST(N'1997-12-16' AS Date), N'firstpr@verizon.net', CAST(N'2016-07-05T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (8, N'Крюков', N'Наум', N'Ильяович', N'м', N'7(81)657-88-92 ', CAST(N'1993-11-17' AS Date), N'floxy@hotmail.com', CAST(N'2017-02-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (9, N'Крюкова', N'Авигея', N'Святославовна', N'ж', N'7(499)318-88-53 ', CAST(N'2000-08-10' AS Date), N'simone@gmail.com', CAST(N'2018-01-03T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (10, N'Беляева', N'Сабрина', N'Федосеевна', N'ж', N'7(6580)534-32-58 ', CAST(N'1972-07-26' AS Date), N'agapow@gmail.com', CAST(N'2017-06-14T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (11, N'Медведев', N'Святослав', N'Юлианович', N'м', N'7(3520)435-21-20 ', CAST(N'1972-10-04' AS Date), N'hllam@comcast.net', CAST(N'2018-10-13T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (12, N'Блохин', N'Пантелеймон', N'Феликсович', N'м', N'7(9524)556-48-98 ', CAST(N'1978-03-06' AS Date), N'balchen@comcast.net', CAST(N'2018-02-14T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (13, N'Горбачёва', N'Никки', N'Еремеевна', N'ж', N'7(94)789-69-20 ', CAST(N'1987-04-21' AS Date), N'chinthaka@att.net', CAST(N'2018-08-16T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (14, N'Архипова', N'Прасковья', N'Валерьевна', N'ж', N'7(86)540-10-21 ', CAST(N'1979-01-09' AS Date), N'cgcra@live.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (15, N'Андреева', N'Патрисия', N'Валерьевна', N'ж', N'7(9648)953-81-26 ', CAST(N'1993-11-18' AS Date), N'jigsaw@aol.com', CAST(N'2016-07-17T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (16, N'Горшкова', N'Марта', N'Иосифовна', N'ж', N'7(544)650-59-03', CAST(N'2001-02-13' AS Date), N'gbacon@mac.com', CAST(N'2016-08-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (17, N'Орлова', N'Влада', N'Мартыновна', N'ж', N'7(2506)433-38-35 ', CAST(N'1990-06-26' AS Date), N'rnelson@yahoo.ca', CAST(N'2016-03-21T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (18, N'Ершов', N'Глеб', N'Федорович', N'м', N'7(2608)298-40-82 ', CAST(N'1970-06-14' AS Date), N'sjava@aol.com', CAST(N'2016-09-14T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (19, N'Быкова', N'Тала', N'Георгьевна', N'ж', N'7(13)915-53-53 ', CAST(N'2000-02-22' AS Date), N'ganter@optonline.net', CAST(N'2016-08-13T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (20, N'Новиков', N'Адриан', N'Аркадьевич', N'м', N'7(70)572-33-62 ', CAST(N'1974-01-15' AS Date), N'multiplx@verizon.net', CAST(N'2018-11-23T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (21, N'Филатов', N'Аристарх', N'Дмитриевич', N'м', N'7(696)235-29-24 ', CAST(N'1989-05-29' AS Date), N'hampton@att.net', CAST(N'2017-01-11T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (22, N'Анисимова', N'Тамара', N'Витальевна', N'ж', N'7(66)128-04-10 ', CAST(N'1988-06-16' AS Date), N'schwaang@mac.com', CAST(N'2016-02-25T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (23, N'Кудряшов', N'Аверкий', N'Константинович', N'м', N'7(88)732-96-30 ', CAST(N'1991-07-26' AS Date), N'nanop@msn.com', CAST(N'2018-03-08T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (24, N'Колобов', N'Орест', N'Юлианович', N'м', N'7(1680)508-58-26 ', CAST(N'2001-07-14' AS Date), N'parkes@verizon.net', CAST(N'2017-01-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (25, N'Кузьмина', N'Дэнна', N'Витальевна', N'ж', N'7(9940)977-45-73 ', CAST(N'1993-08-24' AS Date), N'nichoj@mac.com', CAST(N'2016-03-27T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (26, N'Александров', N'Станислав', N'Эдуардович', N'м', N'7(18)164-05-12 ', CAST(N'1981-07-04' AS Date), N'bigmauler@aol.com', CAST(N'2018-11-08T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (27, N'Андреев', N'Станислав', N'Максович', N'м', N'7(02)993-91-28 ', CAST(N'1975-10-10' AS Date), N'budinger@mac.com', CAST(N'2017-12-26T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (28, N'Дроздов', N'Вольдемар', N'Артемович', N'м', N'7(307)456-99-05 ', CAST(N'1976-02-07' AS Date), N'smpeters@me.com', CAST(N'2017-07-18T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (29, N'Абрамов', N'Станислав', N'Филатович', N'м', N'7(6545)478-87-79 ', CAST(N'1989-05-18' AS Date), N'solomon@att.net', CAST(N'2016-12-08T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (30, N'Гусева', N'Роза', N'Дмитриевна', N'ж', N'7(23)064-51-84 ', CAST(N'1999-02-13' AS Date), N'martyloo@live.com', CAST(N'2017-12-12T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (31, N'Лазарев', N'Алексей', N'Богданович', N'м', N'7(0055)737-37-48 ', CAST(N'1977-03-10' AS Date), N'claesjac@me.com', CAST(N'2017-01-02T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (32, N'Большаков', N'Вадим', N'Данилович', N'м', N'7(386)641-13-37 ', CAST(N'1970-05-15' AS Date), N'uncle@gmail.com', CAST(N'2018-08-04T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (33, N'Ефремов', N'Витольд', N'Авксентьевич', N'м', N'7(93)922-14-03 ', CAST(N'1975-12-02' AS Date), N'kwilliams@yahoo.ca', CAST(N'2018-04-09T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (34, N'Игнатов', N'Захар', N'Павлович', N'м', N'7(578)574-73-36 ', CAST(N'1998-10-07' AS Date), N'dieman@icloud.com', CAST(N'2017-11-10T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (35, N'Калашников', N'Артур', N'Юрьевич', N'м', N'7(147)947-47-21 ', CAST(N'1972-12-13' AS Date), N'oevans@aol.com', CAST(N'2017-08-20T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (36, N'Овчинникова', N'Лаура', N'Еремеевна', N'ж', N'7(85)829-33-79 ', CAST(N'1992-04-03' AS Date), N'carcus@yahoo.ca', CAST(N'2018-11-24T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (37, N'Голубев', N'Иосиф', N'Тимофеевич', N'м', N'7(78)972-73-11 ', CAST(N'1982-05-06' AS Date), N'smcnabb@att.net', CAST(N'2018-08-18T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (38, N'Галкин', N'Эрик', N'Онисимович', N'м', N'7(759)873-77-39 ', CAST(N'1975-01-18' AS Date), N'snunez@verizon.net', CAST(N'2016-07-19T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (39, N'Некрасов', N'Варлам', N'Михайлович', N'м', N'7(019)258-06-35 ', CAST(N'2000-11-12' AS Date), N'dogdude@verizon.net', CAST(N'2017-12-03T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (40, N'Федотов', N'Осип', N'Анатольевич', N'м', N'7(590)702-33-06 ', CAST(N'1971-04-13' AS Date), N'breegster@hotmail.com', CAST(N'2018-07-23T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (41, N'Смирнов', N'Мартын', N'Арсеньевич', N'м', N'7(6251)589-02-43 ', CAST(N'1996-06-25' AS Date), N'haddawy@live.com', CAST(N'2017-02-07T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (42, N'Копылов', N'Касьян', N'Робертович', N'м', N'7(5774)679-82-06 ', CAST(N'1983-08-04' AS Date), N'crobles@sbcglobal.net', CAST(N'2018-03-18T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (43, N'Дмитриева', N'Элина', N'Даниловна', N'ж', N'7(787)140-48-84 ', CAST(N'1988-12-10' AS Date), N'vmalik@live.com', CAST(N'2017-02-11T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (44, N'Бирюкова', N'Инара', N'Улебовна', N'ж', N'7(098)346-50-58 ', CAST(N'1978-07-21' AS Date), N'smpeters@hotmail.com', CAST(N'2017-10-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (45, N'Васильев', N'Оскар', N'Богданович', N'м', N'7(585)801-94-29 ', CAST(N'1971-01-30' AS Date), N'miturria@verizon.net', CAST(N'2017-05-28T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (46, N'Киселёв', N'Устин', N'Яковлевич', N'м', N'7(83)334-52-76 ', CAST(N'1985-01-08' AS Date), N'dalamb@verizon.net', CAST(N'2018-06-21T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (47, N'Кузьмин', N'Леонтий', N'Валерьянович', N'м', N'7(1340)148-90-68 ', CAST(N'2000-05-05' AS Date), N'msloan@hotmail.com', CAST(N'2017-10-12T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (48, N'Ефимова', N'Магда', N'Платоновна', N'ж', N'7(9261)386-15-92 ', CAST(N'1995-08-16' AS Date), N'rbarreira@me.com', CAST(N'2017-08-01T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (49, N'Воронова', N'Изабелла', N'Вячеславовна', N'ж', N'7(17)433-44-98 ', CAST(N'1999-09-24' AS Date), N'kildjean@sbcglobal.net', CAST(N'2017-12-21T00:00:00.000' AS DateTime), N'')
INSERT [dbo].[Client] ([ID], [FirstName], [LastName], [Patronymic], [GenderCode], [Phone], [Birthday], [Email], [RegistrationDate], [PhotoPath]) VALUES (50, N'Волков', N'Людвиг', N'Витальевич', N'м', N'7(8459)592-05-58 ', CAST(N'1977-12-27' AS Date), N'jrkorson@msn.com', CAST(N'2016-04-27T00:00:00.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[Client] OFF
SET IDENTITY_INSERT [dbo].[ClientService] ON 

INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (1, 47, 49, CAST(N'2019-04-15T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (2, 29, 92, CAST(N'2019-11-27T13:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (3, 38, 32, CAST(N'2019-07-29T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (4, 42, 15, CAST(N'2019-09-05T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (5, 41, 80, CAST(N'2019-02-04T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (6, 46, 49, CAST(N'2019-06-24T14:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (7, 50, 45, CAST(N'2019-12-05T18:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (8, 30, 25, CAST(N'2019-03-19T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (9, 28, 50, CAST(N'2019-10-09T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (10, 8, 83, CAST(N'2019-05-19T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (11, 11, 7, CAST(N'2019-08-02T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (12, 48, 90, CAST(N'2019-12-06T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (13, 48, 35, CAST(N'2019-08-08T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (14, 24, 8, CAST(N'2019-04-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (15, 30, 75, CAST(N'2019-09-09T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (16, 20, 28, CAST(N'2019-10-16T18:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (17, 5, 50, CAST(N'2019-12-07T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (18, 24, 13, CAST(N'2019-09-05T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (19, 13, 80, CAST(N'2019-11-26T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (20, 18, 27, CAST(N'2019-07-30T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (21, 11, 96, CAST(N'2019-07-07T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (22, 29, 75, CAST(N'2019-12-15T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (23, 27, 71, CAST(N'2019-12-16T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (24, 46, 52, CAST(N'2019-06-28T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (25, 16, 92, CAST(N'2019-12-30T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (26, 11, 8, CAST(N'2019-02-26T17:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (27, 23, 28, CAST(N'2019-11-15T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (28, 16, 81, CAST(N'2019-09-13T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (29, 15, 81, CAST(N'2019-03-06T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (30, 27, 74, CAST(N'2019-04-11T16:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (31, 14, 71, CAST(N'2019-07-12T19:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (32, 16, 88, CAST(N'2019-07-09T18:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (33, 39, 15, CAST(N'2019-11-23T14:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (34, 14, 27, CAST(N'2019-08-15T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (35, 23, 23, CAST(N'2019-11-27T09:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (36, 42, 7, CAST(N'2019-12-23T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (37, 7, 45, CAST(N'2019-09-17T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (38, 12, 84, CAST(N'2019-07-02T15:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (39, 1, 74, CAST(N'2019-08-12T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (40, 22, 65, CAST(N'2019-04-15T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (41, 36, 100, CAST(N'2019-06-10T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (42, 22, 39, CAST(N'2019-02-21T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (43, 34, 88, CAST(N'2019-10-14T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (44, 34, 87, CAST(N'2019-12-15T19:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (45, 25, 57, CAST(N'2019-08-24T11:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (46, 21, 13, CAST(N'2019-06-15T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (47, 35, 52, CAST(N'2019-04-22T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (48, 22, 39, CAST(N'2019-02-24T13:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (49, 14, 95, CAST(N'2019-02-15T17:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (50, 16, 27, CAST(N'2019-07-09T16:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (51, 32, 96, CAST(N'2019-08-24T17:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (52, 22, 97, CAST(N'2019-08-25T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (53, 13, 81, CAST(N'2019-06-21T14:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (54, 13, 13, CAST(N'2019-12-28T17:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (55, 38, 49, CAST(N'2019-01-29T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (56, 13, 90, CAST(N'2019-11-30T18:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (57, 20, 98, CAST(N'2019-10-17T19:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (58, 23, 4, CAST(N'2019-03-16T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (59, 35, 98, CAST(N'2019-11-14T15:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (60, 17, 33, CAST(N'2019-12-18T10:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (61, 18, 92, CAST(N'2019-06-14T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (62, 27, 74, CAST(N'2019-07-05T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (63, 20, 75, CAST(N'2019-10-14T19:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (64, 28, 27, CAST(N'2019-08-21T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (65, 7, 75, CAST(N'2019-05-28T11:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (66, 14, 72, CAST(N'2019-09-19T16:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (67, 48, 73, CAST(N'2019-06-22T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (68, 24, 26, CAST(N'2019-08-08T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (69, 8, 52, CAST(N'2019-08-12T08:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (70, 8, 49, CAST(N'2019-03-04T11:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (71, 11, 13, CAST(N'2019-03-22T15:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (72, 21, 94, CAST(N'2019-06-05T10:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (73, 17, 75, CAST(N'2019-04-21T12:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (74, 32, 4, CAST(N'2019-07-28T12:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (75, 32, 32, CAST(N'2019-10-10T13:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (76, 29, 100, CAST(N'2019-04-05T10:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (77, 2, 87, CAST(N'2019-07-30T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (78, 31, 52, CAST(N'2019-12-30T08:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (79, 50, 75, CAST(N'2019-06-29T17:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (80, 38, 8, CAST(N'2019-08-19T17:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (81, 6, 26, CAST(N'2019-11-05T12:10:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (82, 20, 97, CAST(N'2019-01-19T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (83, 6, 9, CAST(N'2019-04-14T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (84, 39, 21, CAST(N'2019-05-27T08:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (85, 18, 75, CAST(N'2019-06-16T12:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (86, 44, 21, CAST(N'2019-08-12T15:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (87, 31, 72, CAST(N'2019-04-06T11:50:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (88, 23, 84, CAST(N'2019-05-23T11:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (89, 1, 76, CAST(N'2019-09-20T08:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (90, 5, 84, CAST(N'2019-02-24T13:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (91, 47, 21, CAST(N'2019-05-01T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (92, 27, 94, CAST(N'2019-05-27T14:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (93, 22, 4, CAST(N'2019-02-16T09:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (94, 44, 65, CAST(N'2019-03-23T16:40:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (95, 34, 32, CAST(N'2019-12-24T09:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (96, 35, 16, CAST(N'2019-05-09T10:00:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (97, 10, 65, CAST(N'2019-10-05T18:30:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (98, 25, 15, CAST(N'2019-04-26T10:20:00.000' AS DateTime), NULL)
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (99, 17, 15, CAST(N'2019-08-05T10:10:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[ClientService] ([ID], [ClientID], [ServiceID], [StartTime], [Comment]) VALUES (100, 24, 95, CAST(N'2019-12-19T15:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ClientService] OFF
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'ж', N'женский')
INSERT [dbo].[Gender] ([Code], [Name]) VALUES (N'м', N'мужской')
SET IDENTITY_INSERT [dbo].[Service] ON 

INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (1, N'Замена жидкости в кондиционере', N' Услуги автосервиса\Кондиционер.jpg', N' 8 час.', CAST(3040.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (2, N'Ремонт и замена коллектора', N' Услуги автосервиса\Выхлопная система.jpg', N' 150 мин.', CAST(2770.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (3, N'Замена актуатора сцепления', N' Услуги автосервиса\Сцепление.jpg', N' 330 мин.', CAST(4100.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (4, N'Замена жидкости ГУР', N' Услуги автосервиса\ГУР.png', N' 9 час.', CAST(2380.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (5, N'Заправка кондиционеров', N' Услуги автосервиса\Кондиционер.jpg', N' 2 час.', CAST(4860.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (6, N'Замена масла в вариаторе', N' Услуги автосервиса\Вариатор.jpg', N' 2 час.', CAST(4720.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (7, N'Ремонт двигателя', N' Услуги автосервиса\Двигатель.png', N' 4 час.', CAST(2470.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (8, N'Замена заднего сальника АКПП', N' Услуги автосервиса\АКПП.jpg', N' 390 мин.', CAST(1510.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (9, N'Покраска', N' Услуги автосервиса\Дополнительные услуги.png', N' 2 час.', CAST(2370.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (10, N'Мойка колес', N' Услуги автосервиса\Шиномонтаж.jpg', N' 570 мин.', CAST(3490.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (11, N'Замена прокладки впускного-выпуского коллектора', N' Услуги автосервиса\Выхлопная система.jpg', N' 3 час.', CAST(2980.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (12, N'Диагностика работы двигателя', N' Услуги автосервиса\Двигатель.png', N' 150 мин.', CAST(2760.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (13, N'Установка сигнализации', N' Услуги автосервиса\Электрика.png', N' 4 час.', CAST(1760.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (14, N'Замена компрессора кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 270 мин.', CAST(2720.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (15, N'Замена ремня привода ГУР', N' Услуги автосервиса\ГУР.png', N' 10 час.', CAST(3350.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (16, N'Замена тормозных колодок', N' Услуги автосервиса\Техническое обслуживание.png', N' 8 час.', CAST(4260.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (17, N'Замена масла', N' Услуги автосервиса\Техническое обслуживание.png', N' 510 мин.', CAST(1430.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (18, N'Замена цепи ГРМ', N' Услуги автосервиса\Двигатель.png', N' 6 час.', CAST(4570.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (19, N'Замена бензонасоса', N' Услуги автосервиса\Топливная система.png', N' 4 час.', CAST(1780.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (20, N'Ремонт приводного вала', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 210 мин.', CAST(4520.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (21, N'Замена подшипника компрессора кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 330 мин.', CAST(1110.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (22, N'Снятие и установка колес', N' Услуги автосервиса\Шиномонтаж.jpg', N' 390 мин.', CAST(3130.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (23, N'Замена лямбда зонда', N' Услуги автосервиса\Выхлопная система.jpg', N' 270 мин.', CAST(770.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (24, N'Замена привода в сборе', N' Услуги автосервиса\transmission.jpg', N' 8 час.', CAST(3890.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (25, N'Замена трубки кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 3 час.', CAST(2810.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (26, N'Замена ремня кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 8 час.', CAST(4650.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (27, N'Замена охлаждающей жидкости', N' Услуги автосервиса\Техническое обслуживание.png', N' 210 мин.', CAST(1590.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (28, N'Замена троса сцепления', N' Услуги автосервиса\Сцепление.jpg', N' 8 час.', CAST(4460.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (29, N'Замена масла в МКПП', N' Услуги автосервиса\КПП.png', N' 9 час.', CAST(4490.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (30, N'Замена рулевой рейки', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 570 мин.', CAST(4840.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (31, N'Ремонт дисков', N' Услуги автосервиса\Шиномонтаж.jpg', N' 270 мин.', CAST(3860.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (32, N'Замена масла заднего редуктора (моста)', N' Услуги автосервиса\transmission.jpg', N' 7 час.', CAST(840.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (33, N'Замена подшипника задней ступицы', N' Услуги автосервиса\transmission.jpg', N' 270 мин.', CAST(1860.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (34, N'Восстановление рулевых реек', N' Услуги автосервиса\Подвеска.png', N' 2 час.', CAST(1020.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (35, N'Замена рулевой тяги', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 3 час.', CAST(570.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (36, N'Ремонт и замена гидроблока АКПП', N' Услуги автосервиса\АКПП.jpg', N' 270 мин.', CAST(2040.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (37, N'Замена масла раздаточной коробки', N' Услуги автосервиса\transmission.jpg', N' 510 мин.', CAST(2070.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (38, N'Диагностика кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 10 час.', CAST(2590.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (39, N'Ремонт и замена катализатора', N' Услуги автосервиса\Выхлопная система.jpg', N' 270 мин.', CAST(500.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (40, N'Замена гофры глушителя', N' Услуги автосервиса\Выхлопная система.jpg', N' 270 мин.', CAST(760.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (41, N'Замена ремня ГРМ', N' Услуги автосервиса\Двигатель.png', N' 150 мин.', CAST(4630.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (42, N'Ремонт редуктора', N' Услуги автосервиса\КПП.png', N' 8 час.', CAST(870.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (43, N'Замена электромагнитного клапана без снятия ТНВД', N' Услуги автосервиса\diz.jpg', N' 450 мин.', CAST(4610.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (44, N'Вулканизация шин', N' Услуги автосервиса\Шиномонтаж.jpg', N' 330 мин.', CAST(540.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (45, N'Ремонт стартера', N' Услуги автосервиса\Электрика.png', N' 8 час.', CAST(2680.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (46, N'Ремонт коробки передач', N' Услуги автосервиса\КПП.png', N' 450 мин.', CAST(1850.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (47, N'Жидкостная промывка топливной системы', N' Услуги автосервиса\Топливная система.png', N' 6 час.', CAST(3620.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (48, N'Ремонт генератора', N' Услуги автосервиса\Электрика.png', N' 210 мин.', CAST(1700.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (49, N'Замена масла АКПП', N' Услуги автосервиса\АКПП.jpg', N' 450 мин.', CAST(2430.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (50, N'Диагностика трансмиссии', N' Услуги автосервиса\transmission.jpg', N' 2 час.', CAST(2790.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (51, N'Монтаж и снятие шин с диска', N' Услуги автосервиса\Шиномонтаж.jpg', N' 10 час.', CAST(3990.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (52, N'Замена подшипника передней ступицы', N' Услуги автосервиса\transmission.jpg', N' 330 мин.', CAST(4020.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (53, N'Замена главного цилиндра сцепления', N' Услуги автосервиса\Сцепление.jpg', N' 150 мин.', CAST(4910.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (54, N'Установка автомагнитолы', N' Услуги автосервиса\Электрика.png', N' 270 мин.', CAST(3210.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (55, N'Диагностика рулевых тяг', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 3 час.', CAST(1680.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (56, N'Замена радиатора кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 9 час.', CAST(1770.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (57, N'Замена тормозной жидкости', N' Услуги автосервиса\Техническое обслуживание.png', N' 6 час.', CAST(2200.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (58, N'Ремонт рулевого управления', N' Услуги автосервиса\Подвеска.png', N' 2 час.', CAST(3440.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (59, N'Замена заднего редуктора', N' Услуги автосервиса\transmission.jpg', N' 330 мин.', CAST(2240.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (60, N'Дефектация CVT', N' Услуги автосервиса\Вариатор.jpg', N' 3 час.', CAST(1830.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (61, N'Замена карданного вала', N' Услуги автосервиса\transmission.jpg', N' 2 час.', CAST(4450.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (62, N'Замена сцепления', N' Услуги автосервиса\КПП.png', N' 330 мин.', CAST(4320.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (63, N'Установка системы автозапуска', N' Услуги автосервиса\Электрика.png', N' 9 час.', CAST(3620.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (64, N'Замена опоры АКПП', N' Услуги автосервиса\АКПП.jpg', N' 5 час.', CAST(2540.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (65, N'Ремонт бензонасоса', N' Услуги автосервиса\Топливная система.png', N' 210 мин.', CAST(500.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (66, N'Замена масла переднего редуктора (моста)', N' Услуги автосервиса\transmission.jpg', N' 9 час.', CAST(3950.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (67, N'Ремонт подвесного подшипника', N' Услуги автосервиса\transmission.jpg', N' 7 час.', CAST(4440.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (68, N'Тестирование форсунок (стенд)', N' Услуги автосервиса\Топливная система.png', N' 6 час.', CAST(1600.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (69, N'Диагностика сцепления', N' Услуги автосервиса\Сцепление.jpg', N' 6 час.', CAST(4210.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (70, N'Замена ступицы в сборе', N' Услуги автосервиса\transmission.jpg', N' 150 мин.', CAST(4250.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (71, N'Антибактериальная обработка кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 450 мин.', CAST(4580.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (72, N'Ремонт глушителя', N' Услуги автосервиса\Выхлопная система.jpg', N' 150 мин.', CAST(2100.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (73, N'Диагностика рулевого редуктора', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 3 час.', CAST(2930.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (74, N'Диагностика подвески', N' Услуги автосервиса\Подвеска.png', N' 330 мин.', CAST(1460.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (75, N'Замена свечей', N' Услуги автосервиса\Техническое обслуживание.png', N' 2 час.', CAST(2240.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (76, N'Диагностика инжектора', N' Услуги автосервиса\Топливная система.png', N' 330 мин.', CAST(3390.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (77, N'Комплексная диагностика автомобиля', N' Услуги автосервиса\Техническое обслуживание.png', N' 10 час.', CAST(1120.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (78, N'Ремонт раздаточной коробки', N' Услуги автосервиса\КПП.png', N' 10 час.', CAST(3610.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (79, N'Удаление катализатора', N' Услуги автосервиса\Дополнительные услуги.png', N' 510 мин.', CAST(1930.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (80, N'Снятие/установка форсунок', N' Услуги автосервиса\diz.jpg', N' 5 час.', CAST(1470.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (81, N'Развал-схождение', N' Услуги автосервиса\Подвеска.png', N' 3 час.', CAST(3890.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (82, N'Замена выжимного подшипника', N' Услуги автосервиса\Сцепление.jpg', N' 10 час.', CAST(2250.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (83, N'Чистка форсунок ультразвуком', N' Услуги автосервиса\Топливная система.png', N' 4 час.', CAST(3920.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (84, N'Ремонт компрессора кондиционера', N' Услуги автосервиса\Кондиционер.jpg', N' 150 мин.', CAST(4760.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (85, N'Замена цилиндра сцепления', N' Услуги автосервиса\Сцепление.jpg', N' 8 час.', CAST(810.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (86, N'Ремонт подвески (ходовой)', N' Услуги автосервиса\Подвеска.png', N' 3 час.', CAST(680.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (87, N'Замена фильтров', N' Услуги автосервиса\Техническое обслуживание.png', N' 210 мин.', CAST(530.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (88, N'Кузовной ремонт', N' Услуги автосервиса\Дополнительные услуги.png', N' 150 мин.', CAST(2750.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (89, N'Замена прокладки приемной трубки', N' Услуги автосервиса\Выхлопная система.jpg', N' 570 мин.', CAST(4680.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (90, N'Диагностика выхлопной системы автомобиля', N' Услуги автосервиса\Выхлопная система.jpg', N' 3 час.', CAST(2550.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (91, N'Балансировка колес', N' Услуги автосервиса\Шиномонтаж.jpg', N' 390 мин.', CAST(4690.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (92, N'Ремонт автоэлектрики', N' Услуги автосервиса\Электрика.png', N' 450 мин.', CAST(4230.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (93, N'ТО с сохранением гарантии', N' Услуги автосервиса\Техническое обслуживание.png', N' 270 мин.', CAST(4300.00 AS Decimal(18, 2)), 0.2, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (94, N'Ремонт карданного вала', N' Услуги автосервиса\transmission.jpg', N' 210 мин.', CAST(780.00 AS Decimal(18, 2)), 0.05, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (95, N'Ремонт сцепления', N' Услуги автосервиса\КПП.png', N' 10 час.', CAST(3290.00 AS Decimal(18, 2)), 0.25, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (96, N'Замена кулисы АКПП', N' Услуги автосервиса\АКПП.jpg', N' 6 час.', CAST(3250.00 AS Decimal(18, 2)), 0.1, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (97, N'Ремонт кронштейна глушителя', N' Услуги автосервиса\Выхлопная система.jpg', N' 570 мин.', CAST(1410.00 AS Decimal(18, 2)), 0, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (98, N'Замена сальника привода', N' Услуги автосервиса\transmission.jpg', N' 570 мин.', CAST(3820.00 AS Decimal(18, 2)), 0.15, NULL)
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (99, N'Замена пыльника шруса', N' Услуги автосервиса\rulevoe-upravlenie-avtomobilya.jpg', N' 5 час.', CAST(4730.00 AS Decimal(18, 2)), 0, NULL)
GO
INSERT [dbo].[Service] ([ID], [Title], [MainImagePath], [Duration], [Cost], [Discount], [Description]) VALUES (100, N'Замена маховика', N' Услуги автосервиса\Сцепление.jpg', N' 10 час.', CAST(2400.00 AS Decimal(18, 2)), 0.25, NULL)
SET IDENTITY_INSERT [dbo].[Service] OFF
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product] FOREIGN KEY([MainProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product]
GO
ALTER TABLE [dbo].[AttachedProduct]  WITH CHECK ADD  CONSTRAINT [FK_AttachedProduct_Product1] FOREIGN KEY([AttachedProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[AttachedProduct] CHECK CONSTRAINT [FK_AttachedProduct_Product1]
GO
ALTER TABLE [dbo].[Client]  WITH CHECK ADD  CONSTRAINT [FK_Client_Gender] FOREIGN KEY([GenderCode])
REFERENCES [dbo].[Gender] ([Code])
GO
ALTER TABLE [dbo].[Client] CHECK CONSTRAINT [FK_Client_Gender]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Client]
GO
ALTER TABLE [dbo].[ClientService]  WITH CHECK ADD  CONSTRAINT [FK_ClientService_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ClientService] CHECK CONSTRAINT [FK_ClientService_Service]
GO
ALTER TABLE [dbo].[DocumentByService]  WITH CHECK ADD  CONSTRAINT [FK_DocumentByService_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[DocumentByService] CHECK CONSTRAINT [FK_DocumentByService_ClientService]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerID])
REFERENCES [dbo].[Manufacturer] ([ID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
ALTER TABLE [dbo].[ProductPhoto]  WITH CHECK ADD  CONSTRAINT [FK_ProductPhoto_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductPhoto] CHECK CONSTRAINT [FK_ProductPhoto_Product]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_ClientService] FOREIGN KEY([ClientServiceID])
REFERENCES [dbo].[ClientService] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_ClientService]
GO
ALTER TABLE [dbo].[ProductSale]  WITH CHECK ADD  CONSTRAINT [FK_ProductSale_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ID])
GO
ALTER TABLE [dbo].[ProductSale] CHECK CONSTRAINT [FK_ProductSale_Product]
GO
ALTER TABLE [dbo].[ServicePhoto]  WITH CHECK ADD  CONSTRAINT [FK_ServicePhoto_Service] FOREIGN KEY([ServiceID])
REFERENCES [dbo].[Service] ([ID])
GO
ALTER TABLE [dbo].[ServicePhoto] CHECK CONSTRAINT [FK_ServicePhoto_Service]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Client] FOREIGN KEY([ClientID])
REFERENCES [dbo].[Client] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Client]
GO
ALTER TABLE [dbo].[TagOfClient]  WITH CHECK ADD  CONSTRAINT [FK_TagOfClient_Tag] FOREIGN KEY([TagID])
REFERENCES [dbo].[Tag] ([ID])
GO
ALTER TABLE [dbo].[TagOfClient] CHECK CONSTRAINT [FK_TagOfClient_Tag]
GO
USE [master]
GO
ALTER DATABASE [Хазиев Автосервис] SET  READ_WRITE 
GO
