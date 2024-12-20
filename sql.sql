USE [master]
GO
/****** Object:  Database [Managepersonalfinance]    Script Date: 7/7/2024 2:17:49 AM ******/
CREATE DATABASE [Managepersonalfinance]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Managepersonalfinance', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KHOADA\MSSQL\DATA\Managepersonalfinance.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Managepersonalfinance_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.KHOADA\MSSQL\DATA\Managepersonalfinance_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Managepersonalfinance] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Managepersonalfinance].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Managepersonalfinance] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET ARITHABORT OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Managepersonalfinance] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Managepersonalfinance] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Managepersonalfinance] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Managepersonalfinance] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Managepersonalfinance] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Managepersonalfinance] SET  MULTI_USER 
GO
ALTER DATABASE [Managepersonalfinance] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Managepersonalfinance] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Managepersonalfinance] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Managepersonalfinance] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Managepersonalfinance] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Managepersonalfinance] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Managepersonalfinance] SET QUERY_STORE = ON
GO
ALTER DATABASE [Managepersonalfinance] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Managepersonalfinance]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/7/2024 2:17:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[name] [nvarchar](100) NOT NULL,
	[type] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transactions]    Script Date: 7/7/2024 2:17:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transactions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[categoryId] [int] NULL,
	[date] [date] NULL,
	[amount] [decimal](10, 2) NULL,
	[description] [nvarchar](255) NULL,
	[status] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 7/7/2024 2:17:49 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](255) NOT NULL,
	[email] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [userId], [name], [type]) VALUES (1, 1, N'Salary', N'Income')
INSERT [dbo].[Categories] ([id], [userId], [name], [type]) VALUES (3, 1, N'Rent', N'Expense')
INSERT [dbo].[Categories] ([id], [userId], [name], [type]) VALUES (5, 1, N'do anh khoa', N'Income')
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Transactions] ON 

INSERT [dbo].[Transactions] ([id], [userId], [categoryId], [date], [amount], [description], [status]) VALUES (2, 1, 1, CAST(N'2023-07-01' AS Date), CAST(200.00 AS Decimal(10, 2)), N'Updated groceries111222', N'Active')
INSERT [dbo].[Transactions] ([id], [userId], [categoryId], [date], [amount], [description], [status]) VALUES (3, 1, 1, CAST(N'2023-07-01' AS Date), CAST(100.00 AS Decimal(10, 2)), N'Groceries', N'Deleted')
INSERT [dbo].[Transactions] ([id], [userId], [categoryId], [date], [amount], [description], [status]) VALUES (4, 1, 1, CAST(N'2023-07-01' AS Date), CAST(100.00 AS Decimal(10, 2)), N'Groceries', N'Deleted')
INSERT [dbo].[Transactions] ([id], [userId], [categoryId], [date], [amount], [description], [status]) VALUES (5, 1, 1, CAST(N'2024-07-10' AS Date), CAST(100.00 AS Decimal(10, 2)), N'qwe', N'Deleted')
INSERT [dbo].[Transactions] ([id], [userId], [categoryId], [date], [amount], [description], [status]) VALUES (6, 1, 3, CAST(N'2024-07-03' AS Date), CAST(0.02 AS Decimal(10, 2)), N'khoa', N'Deleted')
SET IDENTITY_INSERT [dbo].[Transactions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([id], [username], [password], [email]) VALUES (1, N'khoa', N'$2a$10$x9nvv7AOD5YgIL0.1t5P2udr394Ub5WNDeqNlT3OtgjyEPp5v.lKC', N'khoa@gmail.com')
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Users__F3DBC572A9732638]    Script Date: 7/7/2024 2:17:49 AM ******/
ALTER TABLE [dbo].[Users] ADD UNIQUE NONCLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([categoryId])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[Users] ([id])
GO
ALTER TABLE [dbo].[Categories]  WITH CHECK ADD CHECK  (([type]='Expense' OR [type]='Income'))
GO
ALTER TABLE [dbo].[Transactions]  WITH CHECK ADD CHECK  (([status]='Deleted' OR [status]='Active'))
GO
USE [master]
GO
ALTER DATABASE [Managepersonalfinance] SET  READ_WRITE 
GO
