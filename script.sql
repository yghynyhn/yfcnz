USE [master]
GO
/****** Object:  Database [Prokat]    Script Date: 19.10.2022 15:08:45 ******/
CREATE DATABASE [Prokat]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Prokat', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\Prokat.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Prokat_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Log\Prokat_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Prokat] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Prokat].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Prokat] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Prokat] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Prokat] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Prokat] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Prokat] SET ARITHABORT OFF 
GO
ALTER DATABASE [Prokat] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Prokat] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Prokat] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Prokat] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Prokat] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Prokat] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Prokat] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Prokat] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Prokat] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Prokat] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Prokat] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Prokat] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Prokat] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Prokat] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Prokat] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Prokat] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Prokat] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Prokat] SET RECOVERY FULL 
GO
ALTER DATABASE [Prokat] SET  MULTI_USER 
GO
ALTER DATABASE [Prokat] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Prokat] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Prokat] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Prokat] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Prokat] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Prokat] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Prokat', N'ON'
GO
ALTER DATABASE [Prokat] SET QUERY_STORE = OFF
GO
USE [Prokat]
GO
/****** Object:  Table [dbo].[Client]    Script Date: 19.10.2022 15:08:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client](
	[Cod_clienta] [int] NOT NULL,
	[Familia] [nvarchar](max) NOT NULL,
	[Imya] [nvarchar](max) NOT NULL,
	[Otchestvo] [nvarchar](max) NOT NULL,
	[Passport] [nvarchar](max) NOT NULL,
	[Data_rozdenya] [datetime] NOT NULL,
	[Adres] [nvarchar](max) NOT NULL,
	[E-mail] [nvarchar](max) NOT NULL,
	[Parol] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[Cod_clienta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sotrudniki]    Script Date: 19.10.2022 15:08:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sotrudniki](
	[Cod_sotrudnika] [int] NOT NULL,
	[Parol] [nvarchar](max) NOT NULL,
	[Posledny_vhod] [nvarchar](max) NOT NULL,
	[Tip_vhoda] [nvarchar](max) NOT NULL,
	[Dolznost] [nvarchar](max) NOT NULL,
	[Familia] [nvarchar](max) NOT NULL,
	[Imya] [nvarchar](max) NOT NULL,
	[Otchestvo] [nvarchar](max) NOT NULL,
	[Login] [nvarchar](max) NOT NULL,
	[Foto] [varbinary](max) NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[Cod_sotrudnika] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Spisok_uslug_zakaz]    Script Date: 19.10.2022 15:08:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Spisok_uslug_zakaz](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Id_uslugi] [int] NOT NULL,
	[Id_zakaza] [int] NOT NULL,
 CONSTRAINT [PK_Список услуг в заказе] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakazi]    Script Date: 19.10.2022 15:08:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakazi](
	[Id] [int] NOT NULL,
	[Kod_zakaza] [nvarchar](max) NOT NULL,
	[Data_sozdania] [datetime] NOT NULL,
	[Otvetstvenny] [int] NULL,
	[Vremya_zakaza] [nvarchar](max) NOT NULL,
	[Status] [nvarchar](max) NOT NULL,
	[Data_zakritya] [datetime] NULL,
	[Vremya_prokata] [int] NOT NULL,
	[Cod_clienta] [int] NOT NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Услуги]    Script Date: 19.10.2022 15:08:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Услуги](
	[Id] [int] NOT NULL,
	[Naimenovanie_uslugi] [nvarchar](max) NOT NULL,
	[Cod_uslugi] [nvarchar](max) NOT NULL,
	[Stoimost] [int] NOT NULL,
 CONSTRAINT [PK_Услуги] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Client] ([Cod_clienta], [Familia], [Imya], [Otchestvo], [Passport], [Data_rozdenya], [Adres], [E-mail], [Parol]) VALUES (1, N'Петрова', N'Дарья', N'Ивановна', N'963258', CAST(N'2004-03-20T00:00:00.000' AS DateTime), N'Задорожная 15', N'jgifgdhnkfghiuh@mail', N'12321')
INSERT [dbo].[Client] ([Cod_clienta], [Familia], [Imya], [Otchestvo], [Passport], [Data_rozdenya], [Adres], [E-mail], [Parol]) VALUES (2, N'Соколов', N'Николай', N'Викторович', N'963254', CAST(N'2005-05-20T00:00:00.000' AS DateTime), N'школьная 39', N'uofhduighfiudgb@mail.ru', N'34565')
INSERT [dbo].[Client] ([Cod_clienta], [Familia], [Imya], [Otchestvo], [Passport], [Data_rozdenya], [Adres], [E-mail], [Parol]) VALUES (3, N'Иванов', N'Наталья', N'Михайловна', N'955621', CAST(N'2006-04-20T00:00:00.000' AS DateTime), N'ленинская 1а', N'fugfdiugfb@mail', N'4331')
GO
INSERT [dbo].[Sotrudniki] ([Cod_sotrudnika], [Parol], [Posledny_vhod], [Tip_vhoda], [Dolznost], [Familia], [Imya], [Otchestvo], [Login], [Foto]) VALUES (1, N'74125', N'19.10.2022', N'Успешно', N'Продавец', N'петров', N'андрей', N'владимирович', N'1212', NULL)
INSERT [dbo].[Sotrudniki] ([Cod_sotrudnika], [Parol], [Posledny_vhod], [Tip_vhoda], [Dolznost], [Familia], [Imya], [Otchestvo], [Login], [Foto]) VALUES (2, N'96325', N'20 июня', N'планшет', N'Старший продавец', N'соколова', N'анастасия', N'петрвона', N'1234', NULL)
INSERT [dbo].[Sotrudniki] ([Cod_sotrudnika], [Parol], [Posledny_vhod], [Tip_vhoda], [Dolznost], [Familia], [Imya], [Otchestvo], [Login], [Foto]) VALUES (3, N'23455', N'31 марта', N'ноутбук', N'Администратор', N'иванов', N'иван', N'иванович', N'3652', NULL)
GO
SET IDENTITY_INSERT [dbo].[Spisok_uslug_zakaz] ON 

INSERT [dbo].[Spisok_uslug_zakaz] ([Id], [Id_uslugi], [Id_zakaza]) VALUES (6, 1, 1)
INSERT [dbo].[Spisok_uslug_zakaz] ([Id], [Id_uslugi], [Id_zakaza]) VALUES (7, 2, 2)
SET IDENTITY_INSERT [dbo].[Spisok_uslug_zakaz] OFF
GO
INSERT [dbo].[Zakazi] ([Id], [Kod_zakaza], [Data_sozdania], [Otvetstvenny], [Vremya_zakaza], [Status], [Data_zakritya], [Vremya_prokata], [Cod_clienta]) VALUES (1, N'213', CAST(N'2004-05-20T00:00:00.000' AS DateTime), 1, N'15 00', N'закрыт', CAST(N'2004-05-20T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[Zakazi] ([Id], [Kod_zakaza], [Data_sozdania], [Otvetstvenny], [Vremya_zakaza], [Status], [Data_zakritya], [Vremya_prokata], [Cod_clienta]) VALUES (2, N'324', CAST(N'2022-03-20T00:00:00.000' AS DateTime), 2, N'17 00', N'закрыт', CAST(N'2022-03-20T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[Zakazi] ([Id], [Kod_zakaza], [Data_sozdania], [Otvetstvenny], [Vremya_zakaza], [Status], [Data_zakritya], [Vremya_prokata], [Cod_clienta]) VALUES (3, N'654', CAST(N'2022-10-15T00:00:00.000' AS DateTime), 3, N'10 00', N'активен', CAST(N'2022-10-15T00:00:00.000' AS DateTime), 5, 3)
GO
INSERT [dbo].[Услуги] ([Id], [Naimenovanie_uslugi], [Cod_uslugi], [Stoimost]) VALUES (1, N'Лыжи', N'1', 152)
INSERT [dbo].[Услуги] ([Id], [Naimenovanie_uslugi], [Cod_uslugi], [Stoimost]) VALUES (2, N'коньки', N'2', 654)
INSERT [dbo].[Услуги] ([Id], [Naimenovanie_uslugi], [Cod_uslugi], [Stoimost]) VALUES (3, N'санки', N'3', 150)
GO
ALTER TABLE [dbo].[Spisok_uslug_zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Список услуг в заказе_Заказы] FOREIGN KEY([Id_zakaza])
REFERENCES [dbo].[Zakazi] ([Id])
GO
ALTER TABLE [dbo].[Spisok_uslug_zakaz] CHECK CONSTRAINT [FK_Список услуг в заказе_Заказы]
GO
ALTER TABLE [dbo].[Spisok_uslug_zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Список услуг в заказе_Услуги] FOREIGN KEY([Id_uslugi])
REFERENCES [dbo].[Услуги] ([Id])
GO
ALTER TABLE [dbo].[Spisok_uslug_zakaz] CHECK CONSTRAINT [FK_Список услуг в заказе_Услуги]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Клиенты] FOREIGN KEY([Cod_clienta])
REFERENCES [dbo].[Client] ([Cod_clienta])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Заказы_Клиенты]
GO
ALTER TABLE [dbo].[Zakazi]  WITH CHECK ADD  CONSTRAINT [FK_Заказы_Сотрудники] FOREIGN KEY([Otvetstvenny])
REFERENCES [dbo].[Sotrudniki] ([Cod_sotrudnika])
GO
ALTER TABLE [dbo].[Zakazi] CHECK CONSTRAINT [FK_Заказы_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [Prokat] SET  READ_WRITE 
GO
