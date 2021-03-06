USE [master]
GO
/****** Object:  Database [Fish]    Script Date: 23.06.2022 21:15:58 ******/
CREATE DATABASE [Fish]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Fish', FILENAME = N'C:\asd\MSSQL13.SQLEXPRESS01\MSSQL\DATA\Fish.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Fish_log', FILENAME = N'C:\asd\MSSQL13.SQLEXPRESS01\MSSQL\DATA\Fish_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Fish] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Fish].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Fish] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Fish] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Fish] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Fish] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Fish] SET ARITHABORT OFF 
GO
ALTER DATABASE [Fish] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Fish] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Fish] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Fish] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Fish] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Fish] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Fish] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Fish] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Fish] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Fish] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Fish] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Fish] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Fish] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Fish] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Fish] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Fish] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Fish] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Fish] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Fish] SET  MULTI_USER 
GO
ALTER DATABASE [Fish] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Fish] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Fish] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Fish] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Fish] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Fish] SET QUERY_STORE = OFF
GO
USE [Fish]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Fish]
GO
/****** Object:  Table [dbo].[ListMater]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ListMater](
	[IdZakaz] [int] NOT NULL,
	[IdMater] [int] NOT NULL,
 CONSTRAINT [PK_ListMater] PRIMARY KEY CLUSTERED 
(
	[IdZakaz] ASC,
	[IdMater] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Material]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Material](
	[IdMaterial] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NULL,
	[Count] [decimal](10, 3) NULL,
	[Cost] [decimal](10, 2) NULL,
	[IdType] [int] NULL,
 CONSTRAINT [PK_Material] PRIMARY KEY CLUSTERED 
(
	[IdMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pynct]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pynct](
	[IdPynct] [int] IDENTITY(1,1) NOT NULL,
	[Gorod] [nvarchar](200) NOT NULL,
	[Ylica] [nvarchar](200) NOT NULL,
	[Dom] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_Pynct] PRIMARY KEY CLUSTERED 
(
	[IdPynct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[IdRol] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Type]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Type](
	[IdType] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[Image] [binary](1000) NULL,
 CONSTRAINT [PK_Type] PRIMARY KEY CLUSTERED 
(
	[IdType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[SurName] [nvarchar](50) NULL,
	[RoleId] [int] NOT NULL,
	[Mail] [nvarchar](100) NULL,
	[Phone] [nchar](20) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Zakaz]    Script Date: 23.06.2022 21:15:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Zakaz](
	[IdZakaz] [int] IDENTITY(1,1) NOT NULL,
	[IdPynct] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
	[Count] [decimal](10, 3) NOT NULL,
	[Cost] [decimal](10, 2) NOT NULL,
 CONSTRAINT [PK_Zakaz] PRIMARY KEY CLUSTERED 
(
	[IdZakaz] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (1, 1)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (1, 2)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (1, 3)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (4, 2)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (4, 3)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (5, 2)
INSERT [dbo].[ListMater] ([IdZakaz], [IdMater]) VALUES (5, 3)
SET IDENTITY_INSERT [dbo].[Material] ON 

INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (1, N'Ручка', CAST(20.000 AS Decimal(10, 3)), CAST(10.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (2, N'Карандаш', CAST(2.000 AS Decimal(10, 3)), CAST(10.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (3, N'Пенал', CAST(2.000 AS Decimal(10, 3)), CAST(300.00 AS Decimal(10, 2)), 3)
INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (4, N'Парта', CAST(0.000 AS Decimal(10, 3)), CAST(900.00 AS Decimal(10, 2)), 1)
INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (5, N'Стерка', CAST(50.000 AS Decimal(10, 3)), CAST(20.00 AS Decimal(10, 2)), 2)
INSERT [dbo].[Material] ([IdMaterial], [Title], [Count], [Cost], [IdType]) VALUES (6, N'Гель', CAST(70.000 AS Decimal(10, 3)), CAST(60.00 AS Decimal(10, 2)), 3)
SET IDENTITY_INSERT [dbo].[Material] OFF
SET IDENTITY_INSERT [dbo].[Pynct] ON 

INSERT [dbo].[Pynct] ([IdPynct], [Gorod], [Ylica], [Dom]) VALUES (1, N'Боровичи', N'Комунарная', N'6')
INSERT [dbo].[Pynct] ([IdPynct], [Gorod], [Ylica], [Dom]) VALUES (5, N'Боровичи', N'Комунарная', N'50')
INSERT [dbo].[Pynct] ([IdPynct], [Gorod], [Ylica], [Dom]) VALUES (6, N'Москва', N'Колхоз', N'10')
INSERT [dbo].[Pynct] ([IdPynct], [Gorod], [Ylica], [Dom]) VALUES (7, N'Бел', N'Летная', N'100')
SET IDENTITY_INSERT [dbo].[Pynct] OFF
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([IdRol], [Title]) VALUES (1, N'Админ')
INSERT [dbo].[Role] ([IdRol], [Title]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([IdRol], [Title]) VALUES (3, N'Пользователь')
SET IDENTITY_INSERT [dbo].[Role] OFF
SET IDENTITY_INSERT [dbo].[Type] ON 

INSERT [dbo].[Type] ([IdType], [Title], [Image]) VALUES (1, N'Удочка', NULL)
INSERT [dbo].[Type] ([IdType], [Title], [Image]) VALUES (2, N'Кручек', NULL)
INSERT [dbo].[Type] ([IdType], [Title], [Image]) VALUES (3, N'Гель', NULL)
SET IDENTITY_INSERT [dbo].[Type] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (1, N'Кузьмина', N'Дэнна', N'Витальевна', 1, N'nichoj@mac.com', N'7(9940)977-45-73    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (2, N'Мамонтова', N'Марфа', N'Мироновна', 2, N'rfoley@verizon.net', N'7(38)095-64-18      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (3, N'Степанова', N'Амелия', N'Робертовна', 3, N'rasca@hotmail.com', N'7(1217)441-28-42    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (4, N'Колесникова', N'Алина', N'Еремеевна', 2, N'gfxguy@outlook.com', N'7(74)977-39-71      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (5, N'Морозов', N'Наум', N'Валерьянович', 3, N'salesgeek@mac.com', N'7(636)050-96-13     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (6, N'Сысоева', N'Дарина', N'Ярославовна', 2, N'treit@verizon.net', N'7(0698)387-96-04    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (7, N'Горбачёва', N'Никки', N'Еремеевна', 3, N'chinthaka@att.net', N'7(94)789-69-20      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (8, N'Бирюкова', N'Инара', N'Улебовна', 2, N'smpeters@hotmail.com', N'7(098)346-50-58     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (9, N'Киселёв', N'Устин', N'Яковлевич', 3, N'dalamb@verizon.net', N'7(83)334-52-76      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (10, N'Крюкова', N'Авигея', N'Святославовна', 2, N'simone@gmail.com', N'7(499)318-88-53     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (11, N'Костина', N'Любава', N'Авксентьевна', 3, N'gordonjcp@hotmail.com', N'7(6419)959-21-87    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (12, N'Попова', N'Харита', N'Якуновна', 2, N'firstpr@verizon.net', N'7(335)386-81-06     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (13, N'Андреева', N'Патрисия', N'Валерьевна', 3, N'jigsaw@aol.com', N'7(9648)953-81-26    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (14, N'Гусева', N'Роза', N'Дмитриевна', 2, N'martyloo@live.com', N'7(23)064-51-84      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (15, N'Быков', N'Трофим', N'Константинович', 3, N'jguyer@aol.com', N'7(3414)460-12-05    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (16, N'Гусев', N'Яков', N'Авксентьевич', 2, N'jdhedden@icloud.com', N'7(0972)781-11-37    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (17, N'Турова', N'Георгина', N'Семёновна', 3, N'yruan@optonline.net', N'7(555)321-42-99     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (18, N'Трофимова', N'Альжбета', N'Якововна', 2, N'gbacon@mac.com', N'7(1084)658-92-95    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (19, N'Баранова', N'Эльмира', N'Дмитриевна', 3, N'jgmyers@comcast.net', N'7(9240)643-15-50    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (20, N'Федотов', N'Осип', N'Анатольевич', 2, N'breegster@hotmail.com', N'7(590)702-33-06     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (21, N'Борисов', N'Аввакум', N'Артемович', 3, N'chlim@live.com', N'7(2296)930-08-88    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (22, N'Артемьева', N'Лиза', N'Максимовна', 2, N'snunez@yahoo.ca', N'7(696)972-70-21     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (23, N'Воронова', N'Изабелла', N'Вячеславовна', 3, N'kildjean@sbcglobal.net', N'7(17)433-44-98      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (24, N'Федотова', N'Сандра', N'Владленовна', 2, N'penna@verizon.net', N'7(126)195-25-86     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (25, N'Ефремов', N'Витольд', N'Авксентьевич', 3, N'kwilliams@yahoo.ca', N'7(93)922-14-03      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (26, N'Ермакова', N'Алла', N'Мироновна', 2, N'whimsy@aol.com', N'7(06)437-13-73      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (27, N'Шашкова', N'Гелла', N'Эдуардовна', 3, N'jadavis@mac.com', N'7(57)446-21-04      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (28, N'Быкова', N'Тала', N'Георгьевна', 2, N'ganter@optonline.net', N'7(13)915-53-53      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (29, N'Орлова', N'Влада', N'Мартыновна', 3, N'rnelson@yahoo.ca', N'7(2506)433-38-35    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (30, N'Анисимова', N'Тамара', N'Витальевна', 2, N'schwaang@mac.com', N'7(66)128-04-10      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (31, N'Архипова', N'Прасковья', N'Валерьевна', 3, N'cgcra@live.com', N'7(86)540-10-21      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (32, N'Новиков', N'Адриан', N'Аркадьевич', 2, N'multiplx@verizon.net', N'7(70)572-33-62      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (33, N'Лазарева', N'Эльвина', N'Робертовна', 3, N'ahuillet@comcast.net', N'7(5564)609-81-37    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (34, N'Афанасьева', N'Розалия', N'Макаровна', 2, N'malattia@hotmail.com', N'7(0661)413-23-32    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (35, N'Устинова', N'Юнона', N'Валентиновна', 3, N'kempsonc@live.com', N'7(33)367-13-07      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (36, N'Алексеева', N'Элина', N'Матвеевна', 2, N'pthomsen@verizon.net', N'7(8086)245-64-81    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (37, N'Гущина', N'Янита', N'Федоровна', 3, N'lishoy@att.net', N'7(4544)716-68-96    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (38, N'Суворова', N'Божена', N'Анатольевна', 2, N'attwood@aol.com', N'7(347)895-86-57     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (39, N'Горшкова', N'Марта', N'Иосифовна', 3, N'gbacon@mac.com', N'7(544)650-59-03     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (40, N'Смирнов', N'Мартын', N'Арсеньевич', 2, N'haddawy@live.com', N'7(6251)589-02-43    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (41, N'Корнилова', N'Анэля', N'Михайловна', 3, N'jonathan@aol.com', N'7(20)980-01-60      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (42, N'Ефимова', N'Магда', N'Платоновна', 2, N'rbarreira@me.com', N'7(9261)386-15-92    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (43, N'Бурова', N'Светлана', N'Лукьевна', 3, N'wsnyder@aol.com', N'7(358)173-82-21     ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (44, N'Сидорова', N'Татьяна', N'Михайловна', 2, N'tbeck@mac.com', N'7(51)732-91-79      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (45, N'Ершова', N'Номи', N'Андреевна', 3, N'miltchev@mac.com', N'7(7757)315-90-99    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (46, N'Овчинникова', N'Лаура', N'Еремеевна', 2, N'carcus@yahoo.ca', N'7(85)829-33-79      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (47, N'Мишина', N'Иветта', N'Андреевна', 3, N'aukjan@yahoo.com', N'7(3926)244-81-96    ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (48, N'Колобова', N'Злата', N'Романовна', 2, N'sinkou@aol.com', N'7(50)884-07-35      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (49, N'Селиверстов', N'Глеб', N'Максимович', 3, N'jigsaw@sbcglobal.net', N'7(20)554-28-68      ')
INSERT [dbo].[User] ([IdUser], [FirstName], [LastName], [SurName], [RoleId], [Mail], [Phone]) VALUES (50, N'Дмитриева', N'Элина', N'Даниловна', 2, N'vmalik@live.com', N'7(787)140-48-84     ')
SET IDENTITY_INSERT [dbo].[User] OFF
SET IDENTITY_INSERT [dbo].[Zakaz] ON 

INSERT [dbo].[Zakaz] ([IdZakaz], [IdPynct], [IdUser], [Count], [Cost]) VALUES (1, 1, 1, CAST(100.000 AS Decimal(10, 3)), CAST(200.00 AS Decimal(10, 2)))
INSERT [dbo].[Zakaz] ([IdZakaz], [IdPynct], [IdUser], [Count], [Cost]) VALUES (4, 7, 5, CAST(0.000 AS Decimal(10, 3)), CAST(0.00 AS Decimal(10, 2)))
INSERT [dbo].[Zakaz] ([IdZakaz], [IdPynct], [IdUser], [Count], [Cost]) VALUES (5, 1, 5, CAST(0.000 AS Decimal(10, 3)), CAST(620.00 AS Decimal(10, 2)))
SET IDENTITY_INSERT [dbo].[Zakaz] OFF
ALTER TABLE [dbo].[ListMater]  WITH CHECK ADD  CONSTRAINT [FK_ListMater_Material] FOREIGN KEY([IdMater])
REFERENCES [dbo].[Material] ([IdMaterial])
GO
ALTER TABLE [dbo].[ListMater] CHECK CONSTRAINT [FK_ListMater_Material]
GO
ALTER TABLE [dbo].[ListMater]  WITH CHECK ADD  CONSTRAINT [FK_ListMater_Zakaz] FOREIGN KEY([IdZakaz])
REFERENCES [dbo].[Zakaz] ([IdZakaz])
GO
ALTER TABLE [dbo].[ListMater] CHECK CONSTRAINT [FK_ListMater_Zakaz]
GO
ALTER TABLE [dbo].[Material]  WITH CHECK ADD  CONSTRAINT [FK_Material_Type] FOREIGN KEY([IdType])
REFERENCES [dbo].[Type] ([IdType])
GO
ALTER TABLE [dbo].[Material] CHECK CONSTRAINT [FK_Material_Type]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Role] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Role] ([IdRol])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Role]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_Pynct] FOREIGN KEY([IdPynct])
REFERENCES [dbo].[Pynct] ([IdPynct])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_Pynct]
GO
ALTER TABLE [dbo].[Zakaz]  WITH CHECK ADD  CONSTRAINT [FK_Zakaz_User] FOREIGN KEY([IdUser])
REFERENCES [dbo].[User] ([IdUser])
GO
ALTER TABLE [dbo].[Zakaz] CHECK CONSTRAINT [FK_Zakaz_User]
GO
USE [master]
GO
ALTER DATABASE [Fish] SET  READ_WRITE 
GO
