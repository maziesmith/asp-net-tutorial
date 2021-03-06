USE [master]
GO
/****** Object:  Database [bookstore]    Script Date: 17/08/2017 11:48:35 SA ******/
CREATE DATABASE [bookstore]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'bookstore', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bookstore.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'bookstore_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\bookstore_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [bookstore] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [bookstore].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [bookstore] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [bookstore] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [bookstore] SET ARITHABORT OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [bookstore] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [bookstore] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [bookstore] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [bookstore] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [bookstore] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [bookstore] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [bookstore] SET  DISABLE_BROKER 
GO
ALTER DATABASE [bookstore] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [bookstore] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [bookstore] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [bookstore] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [bookstore] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [bookstore] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [bookstore] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [bookstore] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [bookstore] SET  MULTI_USER 
GO
ALTER DATABASE [bookstore] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [bookstore] SET DB_CHAINING OFF 
GO
ALTER DATABASE [bookstore] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [bookstore] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [bookstore] SET DELAYED_DURABILITY = DISABLED 
GO
USE [bookstore]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 17/08/2017 11:48:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[CateID] [bigint] NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [ntext] NULL,
	[Detail] [ntext] NULL,
	[Price] [float] NULL,
	[ImagePath] [nvarchar](500) NULL CONSTRAINT [DF_Book_ImagePath]  DEFAULT (N'none.png'),
	[Meta_Keyword] [nvarchar](500) NULL,
	[Meta_Description] [nvarchar](500) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Book_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_Book_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Category]    Script Date: 17/08/2017 11:48:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [ntext] NULL,
	[Detail] [ntext] NULL,
	[ImagePath] [nvarchar](500) NULL CONSTRAINT [DF_Category_ImagePath]  DEFAULT (N'none.png'),
	[Meta_Keyword] [nvarchar](500) NULL,
	[Meta_Description] [nvarchar](500) NULL,
	[Status] [bit] NULL CONSTRAINT [DF_Category_Status]  DEFAULT ((1)),
	[ShowOnHome] [bit] NULL CONSTRAINT [DF_Category_ShowOnHome]  DEFAULT ((0)),
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[User]    Script Date: 17/08/2017 11:48:35 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[Password] [varchar](32) NULL,
	[ImagePath] [nvarchar](250) NULL CONSTRAINT [DF_User_ImagePath]  DEFAULT (N'none.png'),
	[Status] [int] NULL CONSTRAINT [DF_User_Status]  DEFAULT ((1)),
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([ID], [CateID], [Name], [Description], [Detail], [Price], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (1, 4, N'Harry Potter and the Philosopher''s Stone', N'<p><strong>Harry Potter and the Philosopher''s Stone</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the first novel in the Harry Potter series and J. K. Rowling''s debut novel, first published in 1997 by Bloomsbury</span></p>
', N'<p><strong>Harry Potter and the Philosopher''s Stone</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the first novel in the Harry Potter series and J. K. Rowling''s debut novel, first published in 1997 by Bloomsbury</span></p>
', 12, N'/assets/upload/images/book/1.png', N'harry potter', N'harry potter', 1, NULL)
INSERT [dbo].[Book] ([ID], [CateID], [Name], [Description], [Detail], [Price], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (2, 7, N'Harry Potter and the Chamber of Secrets', N'<p><span style="color:rgb(34, 34, 34); font-family:arial,sans-serif">Harry Potter and the Chamber of Secrets is the second novel in the Harry Potter series, written by J. K. Rowling</span></p>
', N'<p><span style="color:rgb(34, 34, 34); font-family:arial,sans-serif">Harry Potter and the Chamber of Secrets is the second novel in the Harry Potter series, written by J. K. Rowling</span></p>
', 134, N'/assets/upload/images/book/2.png', N'harry potter new', N'harry potter new', 1, NULL)
INSERT [dbo].[Book] ([ID], [CateID], [Name], [Description], [Detail], [Price], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (4, 4, N'Harry Potter and the Prisoner of Azkaban', N'<p><strong>Harry Potter and the Prisoner of Azkaban</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the third novel in the Harry Potter series, written by J. K. Rowling. The book follows Harry Potter, a young wizard</span></p>
', N'<p><strong>Harry Potter and the Prisoner of Azkaban</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the third novel in the Harry Potter series, written by J. K. Rowling. The book follows Harry Potter, a young wizard</span></p>
', 45, N'/assets/upload/images/book/3.png', N'harry potter', N'harry potter', 1, NULL)
INSERT [dbo].[Book] ([ID], [CateID], [Name], [Description], [Detail], [Price], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (5, 4, N'Harry Potter and the Goblet of Fire', N'<p><strong>Harry Potter and the Goblet of Fire</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the fourth novel in the Harry Potter series, written by British author J. K. Rowling. It follows Harry Potter, a wizard in his fourth</span></p>
', N'<p><strong>Harry Potter and the Goblet of Fire</strong><span style="color:rgb(84, 84, 84); font-family:arial,sans-serif; font-size:small">&nbsp;is the fourth novel in the Harry Potter series, written by British author J. K. Rowling. It follows Harry Potter, a wizard in his fourth</span></p>
', 35, N'/assets/upload/images/book/4.png', N'harry potter', N'harry potter', 1, NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([ID], [Name], [Description], [Detail], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (4, N'Arts & Photography New', N'<p><a href="http://www.booksprice.com/Arts1.html" style="text-decoration-line: none; color: rgb(101, 131, 128); font-family: Verdana, Arial, Helvetica, sans-serif; font-size: 18.2px; text-align: justify; word-spacing: -1.82px;">Arts &amp; Photography</a>&nbsp;NEW</p>
', NULL, N'/assets/upload/images/category/20686530_333106057150264_7469278840225792_n.jpg', N'Arts & Photography new', N'new', 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Detail], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (6, N'Sách kinh tế', N'<p>chuyên mục sách kinh tế</p>
', NULL, N'/assets/upload/images/category/none.png', N'sách kinh tế', N'sách kinh tế', 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Detail], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (7, N'Sách văn học', N'<p>Sách văn học</p>
', NULL, N'/assets/upload/images/category/none.png', N'Sách văn học', N'Sách văn học', 1, NULL)
INSERT [dbo].[Category] ([ID], [Name], [Description], [Detail], [ImagePath], [Meta_Keyword], [Meta_Description], [Status], [ShowOnHome]) VALUES (8, N'Sách toán học', N'<p>Sách toán học</p>
', NULL, N'/assets/upload/images/category/none.png', N'Sách toán học', N'Sách toán học', 1, NULL)
SET IDENTITY_INSERT [dbo].[Category] OFF
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([ID], [Name], [Email], [Password], [ImagePath], [Status]) VALUES (1, N'Tuan Bui Dev', N'admin@admin.com', N'admin@123', N'none.png', 1)
SET IDENTITY_INSERT [dbo].[User] OFF
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CateID])
REFERENCES [dbo].[Category] ([ID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
USE [master]
GO
ALTER DATABASE [bookstore] SET  READ_WRITE 
GO
