USE [master]
GO
/****** Object:  Database [Blog_Test]    Script Date: 23.06.2016 17:32:06 ******/
CREATE DATABASE [Blog_Test]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Blog_Test', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Blog_Test.mdf' , SIZE = 4288KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Blog_Test_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Blog_Test_log.ldf' , SIZE = 1072KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Blog_Test] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Blog_Test].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Blog_Test] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Blog_Test] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Blog_Test] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Blog_Test] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Blog_Test] SET ARITHABORT OFF 
GO
ALTER DATABASE [Blog_Test] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Blog_Test] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Blog_Test] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Blog_Test] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Blog_Test] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Blog_Test] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Blog_Test] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Blog_Test] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Blog_Test] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Blog_Test] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Blog_Test] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Blog_Test] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Blog_Test] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Blog_Test] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Blog_Test] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Blog_Test] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Blog_Test] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Blog_Test] SET RECOVERY FULL 
GO
ALTER DATABASE [Blog_Test] SET  MULTI_USER 
GO
ALTER DATABASE [Blog_Test] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Blog_Test] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Blog_Test] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Blog_Test] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Blog_Test] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Blog_Test', N'ON'
GO
USE [Blog_Test]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Blogs]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Blogs](
	[Blog_Number] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](256) NULL,
	[Author] [int] NOT NULL,
	[Description] [nvarchar](2048) NULL,
 CONSTRAINT [PK_dbo.Blogs] PRIMARY KEY CLUSTERED 
(
	[Blog_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Comments]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Comment_Number] [int] IDENTITY(1,1) NOT NULL,
	[Comment] [nvarchar](max) NULL,
	[User_Number] [int] NULL,
	[Writes_Number] [int] NULL,
 CONSTRAINT [PK_dbo.Comments] PRIMARY KEY CLUSTERED 
(
	[Comment_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Likes]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Likes](
	[Like_Number] [int] IDENTITY(1,1) NOT NULL,
	[Like] [int] NOT NULL,
	[Write_Number] [int] NULL,
	[Comment_Number] [int] NULL,
 CONSTRAINT [PK_dbo.Likes] PRIMARY KEY CLUSTERED 
(
	[Like_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Topics]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Topics](
	[Topic_Number] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nvarchar](1024) NULL,
	[Topic_Title] [nvarchar](max) NULL,
	[Blog_Number] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Topics] PRIMARY KEY CLUSTERED 
(
	[Topic_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Users]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[User_Number] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[Last_Name] [nvarchar](256) NULL,
	[Age] [int] NULL,
	[Education] [nvarchar](256) NULL,
	[Mobile_Phone] [int] NULL,
	[Short_Information] [nvarchar](2048) NULL,
	[Facebook_Link] [nvarchar](max) NULL,
	[Vk_Link] [nvarchar](max) NULL,
	[Mail_Link] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[User_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Writes]    Script Date: 23.06.2016 17:32:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Writes](
	[Write_Number] [int] IDENTITY(1,1) NOT NULL,
	[Topic_Number] [int] NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Author] [int] NOT NULL,
	[Date] [datetime] NULL,
	[Time] [datetime] NULL,
 CONSTRAINT [PK_dbo.Writes] PRIMARY KEY CLUSTERED 
(
	[Write_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Index [IX_Comment_Number]    Script Date: 23.06.2016 17:32:06 ******/
CREATE NONCLUSTERED INDEX [IX_Comment_Number] ON [dbo].[Likes]
(
	[Comment_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Write_Number]    Script Date: 23.06.2016 17:32:06 ******/
CREATE NONCLUSTERED INDEX [IX_Write_Number] ON [dbo].[Likes]
(
	[Write_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Blog_Number]    Script Date: 23.06.2016 17:32:06 ******/
CREATE NONCLUSTERED INDEX [IX_Blog_Number] ON [dbo].[Topics]
(
	[Blog_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Topic_Number]    Script Date: 23.06.2016 17:32:06 ******/
CREATE NONCLUSTERED INDEX [IX_Topic_Number] ON [dbo].[Writes]
(
	[Topic_Number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Likes_dbo.Comments_Comment_Number] FOREIGN KEY([Comment_Number])
REFERENCES [dbo].[Comments] ([Comment_Number])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_dbo.Likes_dbo.Comments_Comment_Number]
GO
ALTER TABLE [dbo].[Likes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Likes_dbo.Writes_Write_Number] FOREIGN KEY([Write_Number])
REFERENCES [dbo].[Writes] ([Write_Number])
GO
ALTER TABLE [dbo].[Likes] CHECK CONSTRAINT [FK_dbo.Likes_dbo.Writes_Write_Number]
GO
ALTER TABLE [dbo].[Topics]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Topics_dbo.Blogs_Blog_Number] FOREIGN KEY([Blog_Number])
REFERENCES [dbo].[Blogs] ([Blog_Number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Topics] CHECK CONSTRAINT [FK_dbo.Topics_dbo.Blogs_Blog_Number]
GO
ALTER TABLE [dbo].[Writes]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Writes_dbo.Topics_Topic_Number] FOREIGN KEY([Topic_Number])
REFERENCES [dbo].[Topics] ([Topic_Number])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Writes] CHECK CONSTRAINT [FK_dbo.Writes_dbo.Topics_Topic_Number]
GO
USE [master]
GO
ALTER DATABASE [Blog_Test] SET  READ_WRITE 
GO
