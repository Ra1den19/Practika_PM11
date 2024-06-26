USE [master]
GO
/****** Object:  Database [ХранительПРО]    Script Date: 15.04.2024 15:36:36 Часы ******/
CREATE DATABASE [ХранительПРО]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ХранительПРО', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ХранительПРО_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\ХранительПРО_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ХранительПРО] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ХранительПРО].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ХранительПРО] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ХранительПРО] SET ARITHABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ХранительПРО] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ХранительПРО] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ХранительПРО] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ХранительПРО] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ХранительПРО] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ХранительПРО] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ХранительПРО] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ХранительПРО] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ХранительПРО] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ХранительПРО] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ХранительПРО] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ХранительПРО] SET  MULTI_USER 
GO
ALTER DATABASE [ХранительПРО] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ХранительПРО] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ХранительПРО] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ХранительПРО] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ХранительПРО] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ХранительПРО]
GO
/****** Object:  Table [dbo].[Заявки]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявки](
	[код заявки] [int] NOT NULL,
	[код клиента] [int] NULL,
	[код сотрудника] [int] NULL,
 CONSTRAINT [PK_заявки] PRIMARY KEY CLUSTERED 
(
	[код заявки] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Информация для пропуска]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Информация для пропуска](
	[код информации] [int] NOT NULL,
	[код заявки] [int] NULL,
	[срок действия заявки] [date] NULL,
	[цель посещения] [nvarchar](50) NULL,
	[статус] [nvarchar](50) NULL,
 CONSTRAINT [PK_Информация для пропуска] PRIMARY KEY CLUSTERED 
(
	[код информации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[код клиента] [int] NOT NULL,
	[ФИО] [nvarchar](50) NULL,
	[телефон] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[код организации] [int] NULL,
	[дата рождения] [date] NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[код клиента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Организации]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Организации](
	[код организации] [int] NOT NULL,
	[название организации] [nvarchar](50) NULL,
	[телефон организации] [nvarchar](50) NULL,
 CONSTRAINT [PK_Организации] PRIMARY KEY CLUSTERED 
(
	[код организации] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Отделы]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отделы](
	[код отдела] [int] NOT NULL,
	[название отдела] [nvarchar](50) NULL,
 CONSTRAINT [PK_Отделы] PRIMARY KEY CLUSTERED 
(
	[код отдела] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Паспортные данные клиентов]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Паспортные данные клиентов](
	[код паспортных данных] [int] NOT NULL,
	[код клиента] [int] NULL,
	[серия паспорта] [int] NULL,
	[номер паспорта] [int] NULL,
 CONSTRAINT [PK_Паспортные данные клиентов] PRIMARY KEY CLUSTERED 
(
	[код паспортных данных] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Паспортные данные сотрудников]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Паспортные данные сотрудников](
	[код паспортных данных] [int] NOT NULL,
	[код сотрудника] [int] NULL,
	[серия паспорта] [nvarchar](50) NULL,
	[номер паспорта] [nvarchar](50) NULL,
 CONSTRAINT [PK_Паспортные данные сотрудников] PRIMARY KEY CLUSTERED 
(
	[код паспортных данных] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Подразделения]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Подразделения](
	[код подразделения] [int] NOT NULL,
	[название подразделения] [nvarchar](50) NULL,
 CONSTRAINT [PK_Подразделения] PRIMARY KEY CLUSTERED 
(
	[код подразделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Сотрудники]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудники](
	[код сотрудника] [int] NOT NULL,
	[ФИО] [nvarchar](50) NULL,
	[телефон] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
	[код подразделения] [int] NULL,
	[код отдела] [int] NULL,
	[код организации] [int] NULL,
 CONSTRAINT [PK_Сотрудники] PRIMARY KEY CLUSTERED 
(
	[код сотрудника] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Учетные данные клиентов]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Учетные данные клиентов](
	[код учетных данных] [int] NOT NULL,
	[код клиента] [int] NULL,
	[логин] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
 CONSTRAINT [PK_Учетные данные клиентов] PRIMARY KEY CLUSTERED 
(
	[код учетных данных] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Учетные данные сотрудников]    Script Date: 15.04.2024 15:36:36 Часы ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Учетные данные сотрудников](
	[код учетных данных] [int] NOT NULL,
	[код сотрудника] [int] NULL,
	[логин] [nvarchar](50) NULL,
	[пароль] [nvarchar](50) NULL,
 CONSTRAINT [PK_Учетные данные сотрудников] PRIMARY KEY CLUSTERED 
(
	[код учетных данных] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Клиенты] FOREIGN KEY([код клиента])
REFERENCES [dbo].[Клиенты] ([код клиента])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Клиенты]
GO
ALTER TABLE [dbo].[Заявки]  WITH CHECK ADD  CONSTRAINT [FK_Заявки_Сотрудники] FOREIGN KEY([код сотрудника])
REFERENCES [dbo].[Сотрудники] ([код сотрудника])
GO
ALTER TABLE [dbo].[Заявки] CHECK CONSTRAINT [FK_Заявки_Сотрудники]
GO
ALTER TABLE [dbo].[Информация для пропуска]  WITH CHECK ADD  CONSTRAINT [FK_Информация для пропуска_Заявки] FOREIGN KEY([код заявки])
REFERENCES [dbo].[Заявки] ([код заявки])
GO
ALTER TABLE [dbo].[Информация для пропуска] CHECK CONSTRAINT [FK_Информация для пропуска_Заявки]
GO
ALTER TABLE [dbo].[Клиенты]  WITH CHECK ADD  CONSTRAINT [FK_Клиенты_Организации] FOREIGN KEY([код организации])
REFERENCES [dbo].[Организации] ([код организации])
GO
ALTER TABLE [dbo].[Клиенты] CHECK CONSTRAINT [FK_Клиенты_Организации]
GO
ALTER TABLE [dbo].[Паспортные данные клиентов]  WITH CHECK ADD  CONSTRAINT [FK_Паспортные данные клиентов_Клиенты] FOREIGN KEY([код клиента])
REFERENCES [dbo].[Клиенты] ([код клиента])
GO
ALTER TABLE [dbo].[Паспортные данные клиентов] CHECK CONSTRAINT [FK_Паспортные данные клиентов_Клиенты]
GO
ALTER TABLE [dbo].[Паспортные данные сотрудников]  WITH CHECK ADD  CONSTRAINT [FK_Паспортные данные сотрудников_Сотрудники] FOREIGN KEY([код сотрудника])
REFERENCES [dbo].[Сотрудники] ([код сотрудника])
GO
ALTER TABLE [dbo].[Паспортные данные сотрудников] CHECK CONSTRAINT [FK_Паспортные данные сотрудников_Сотрудники]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Организации] FOREIGN KEY([код организации])
REFERENCES [dbo].[Организации] ([код организации])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Организации]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Отделы] FOREIGN KEY([код отдела])
REFERENCES [dbo].[Отделы] ([код отдела])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Отделы]
GO
ALTER TABLE [dbo].[Сотрудники]  WITH CHECK ADD  CONSTRAINT [FK_Сотрудники_Подразделения] FOREIGN KEY([код подразделения])
REFERENCES [dbo].[Подразделения] ([код подразделения])
GO
ALTER TABLE [dbo].[Сотрудники] CHECK CONSTRAINT [FK_Сотрудники_Подразделения]
GO
ALTER TABLE [dbo].[Учетные данные клиентов]  WITH CHECK ADD  CONSTRAINT [FK_Учетные данные клиентов_Клиенты] FOREIGN KEY([код клиента])
REFERENCES [dbo].[Клиенты] ([код клиента])
GO
ALTER TABLE [dbo].[Учетные данные клиентов] CHECK CONSTRAINT [FK_Учетные данные клиентов_Клиенты]
GO
ALTER TABLE [dbo].[Учетные данные сотрудников]  WITH CHECK ADD  CONSTRAINT [FK_Учетные данные сотрудников_Сотрудники] FOREIGN KEY([код сотрудника])
REFERENCES [dbo].[Сотрудники] ([код сотрудника])
GO
ALTER TABLE [dbo].[Учетные данные сотрудников] CHECK CONSTRAINT [FK_Учетные данные сотрудников_Сотрудники]
GO
USE [master]
GO
ALTER DATABASE [ХранительПРО] SET  READ_WRITE 
GO
