USE [master]
GO
/****** Object:  Database [DarshanBookBank]    Script Date: 10-06-2021 11:11:45 PM ******/
CREATE DATABASE [DarshanBookBank] ON  PRIMARY 
( NAME = N'DarshanBookBank', FILENAME = N'A:\ASP.net\Dashan Book Bank\DataBase\DarshanBookBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DarshanBookBank_log', FILENAME = N'A:\ASP.net\Dashan Book Bank\DataBase\DarshanBookBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DarshanBookBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DarshanBookBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DarshanBookBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DarshanBookBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DarshanBookBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DarshanBookBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [DarshanBookBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DarshanBookBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DarshanBookBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DarshanBookBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DarshanBookBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DarshanBookBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DarshanBookBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DarshanBookBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DarshanBookBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DarshanBookBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DarshanBookBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DarshanBookBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DarshanBookBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DarshanBookBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DarshanBookBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DarshanBookBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DarshanBookBank] SET RECOVERY FULL 
GO
ALTER DATABASE [DarshanBookBank] SET  MULTI_USER 
GO
ALTER DATABASE [DarshanBookBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DarshanBookBank] SET DB_CHAINING OFF 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DarshanBookBank', N'ON'
GO
USE [DarshanBookBank]
GO
/****** Object:  Table [dbo].[AdminUser]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminUser](
	[AdminUserID] [int] IDENTITY(1,1) NOT NULL,
	[AdminUserName] [varchar](100) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[Password] [varchar](15) NOT NULL,
	[InstituteID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[MobileNo] [varchar](10) NULL,
	[ProfilePicture] [varchar](500) NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK_AdminUser] PRIMARY KEY CLUSTERED 
(
	[AdminUserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[BookTitle] [varchar](200) NOT NULL,
	[Author] [varchar](100) NOT NULL,
	[Details] [varchar](1000) NULL,
	[Image] [varchar](500) NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookCopy]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookCopy](
	[BookCopyID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NOT NULL,
	[StudentID] [int] NULL,
	[BookCopyNo] [varchar](50) NOT NULL,
	[IsAvailable] [bit] NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK_BookCopy] PRIMARY KEY CLUSTERED 
(
	[BookCopyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookIssue]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookIssue](
	[BookIssueID] [int] IDENTITY(1,1) NOT NULL,
	[BookIssueDate] [datetime] NOT NULL,
	[BookDueDate] [datetime] NOT NULL,
	[BookReturnDate] [datetime] NULL,
	[BookID] [int] NOT NULL,
	[BookCopyID] [int] NOT NULL,
	[StudentID] [int] NOT NULL,
	[IssuedByStaffID] [int] NOT NULL,
	[ReturnByStaffID] [int] NULL,
	[ReturnRemarks] [varchar](250) NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_BookIssue] PRIMARY KEY CLUSTERED 
(
	[BookIssueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branch]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branch](
	[BranchID] [int] IDENTITY(1,1) NOT NULL,
	[BranchName] [varchar](100) NOT NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Branch] PRIMARY KEY CLUSTERED 
(
	[BranchID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Institute]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Institute](
	[InstituteID] [int] IDENTITY(1,1) NOT NULL,
	[InstituteName] [varchar](100) NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Institute] PRIMARY KEY CLUSTERED 
(
	[InstituteID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Semester]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Semester](
	[SemesterID] [int] IDENTITY(1,1) NOT NULL,
	[SemesterName] [varchar](5) NOT NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NULL,
	[ModificationDate] [datetime] NULL,
 CONSTRAINT [PK_Semester] PRIMARY KEY CLUSTERED 
(
	[SemesterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentID] [int] IDENTITY(1,1) NOT NULL,
	[StudentName] [varchar](100) NOT NULL,
	[EntrollmentNo] [varchar](15) NOT NULL,
	[Email] [varchar](100) NOT NULL,
	[InstituteID] [int] NOT NULL,
	[BranchID] [int] NOT NULL,
	[SemesterID] [int] NOT NULL,
	[AdminUserID] [int] NOT NULL,
	[CreationDate] [datetime] NOT NULL,
	[ModificationDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[StudentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[AdminUser] ON 

INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (1, N'jemissad bakarania', N'jemis.bakrania123@gmail.com', N'asd', 6, 20, N'9737628065', NULL, CAST(N'2021-03-30T10:50:34.310' AS DateTime), CAST(N'2021-03-30T10:50:34.310' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (2, N'Smit', N'v123@gmail.com', N'smit', 6, 19, N'0973628065', NULL, CAST(N'2021-03-30T12:18:46.303' AS DateTime), CAST(N'2021-03-30T12:18:46.303' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (3, N'Jemis', N'jemis.bakrania123@gmail.com', N'Jemis@12', 4, 19, N'0937628065', NULL, CAST(N'2021-03-30T12:21:36.980' AS DateTime), CAST(N'2021-03-30T12:21:36.980' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (4, N'Vishal', N'v123@gmail.com', N'Vishal@1', 4, 19, N'0973768065', N'~/UploadData/ProfilePicture/asdf12.jpg', CAST(N'2021-03-30T22:11:42.253' AS DateTime), CAST(N'2021-03-30T22:11:42.253' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (5, N'jemis bakaraniasdfsd', N'jemis.bakrania123@gmail.com', N'Jemis@12', 4, 20, N'0973762805', NULL, CAST(N'2021-03-30T22:27:31.920' AS DateTime), CAST(N'2021-03-30T22:27:31.920' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (6, N'jams', N'jams12sad3@gmail.com', N'123', 6, 20, N'0737628065', N'~/UploadData/ProfilePicture/asdf12.jpg', CAST(N'2021-03-30T23:05:35.280' AS DateTime), CAST(N'2021-03-30T23:05:35.280' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (7, N'ABC', N'ABC@gmail.com', N'asd', 6, 20, NULL, NULL, CAST(N'2021-04-01T12:15:44.920' AS DateTime), CAST(N'2021-04-01T12:15:44.920' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (8, N'Naimish Sir', N'Naimish@gmail.com', N'123', 6, 20, N'9825986233', N'~/UploadData/ProfilePicture/12CENRV_19042019_064035AM.jpg', CAST(N'2021-04-03T15:51:35.367' AS DateTime), CAST(N'2021-06-08T14:43:56.630' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (9, N'ABC XYZ', N'ABCSAD@gmail.com', N'123', 6, 19, N'9517536842', N'~/UploadData/ProfilePicture/AJAVA.jpg', CAST(N'2021-04-09T01:37:12.323' AS DateTime), CAST(N'2021-04-09T01:37:12.323' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (10, N'Darshak', N'darsha@sdasad.sdsd', N'Darshak@', 4, 19, NULL, NULL, CAST(N'2021-04-18T18:33:58.413' AS DateTime), CAST(N'2021-04-18T18:33:58.413' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (11, N'Darshak123', N'darsha@asd.asd', N'Darshak@', 4, 19, NULL, NULL, CAST(N'2021-04-18T18:34:51.103' AS DateTime), CAST(N'2021-04-18T18:34:51.103' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (13, N'Darshak12345', N'darsha@asd.asdsadfasd', N'Darshak@', 4, 19, NULL, N'~/UploadData/ProfilePicture/12CENRV_19042019_064035AM.jpg', CAST(N'2021-04-18T18:37:37.473' AS DateTime), CAST(N'2021-04-18T18:37:37.473' AS DateTime))
INSERT [dbo].[AdminUser] ([AdminUserID], [AdminUserName], [Email], [Password], [InstituteID], [BranchID], [MobileNo], [ProfilePicture], [CreationDate], [ModificationDate]) VALUES (14, N'Krunal Sir', N'KrunalSir@darshan.ac.in', N'Krunal@1', 4, 19, N'9824233980', N'~/UploadData/ProfilePicture/18CEKDV_19042019_064425AM.jpg', CAST(N'2021-06-02T09:53:14.953' AS DateTime), CAST(N'2021-06-02T09:58:12.037' AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminUser] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (25, N'MPI', N'JAMS', NULL, N'~/UploadData/BookPicture/MPI.jpg', 6, CAST(N'2021-04-02T11:13:12.300' AS DateTime), CAST(N'2021-04-02T11:13:12.300' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (29, N'TOC', N'JAMS', NULL, N'~/UploadData/BookPicture/TOC.jpg', 6, CAST(N'2021-04-02T11:14:26.930' AS DateTime), CAST(N'2021-04-02T11:14:26.930' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (30, N'MATHS', N'JAMS', N'This is the Sample Book test', N'~/UploadData/BookPicture/Maths.jpg', 8, CAST(N'2021-04-04T20:22:27.387' AS DateTime), CAST(N'2021-04-04T20:22:27.387' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (33, N'Computer Application', N'Krunal Sir', NULL, N'~/UploadData/BookPicture/ca.jpg', 14, CAST(N'2021-06-02T10:11:38.070' AS DateTime), CAST(N'2021-06-02T10:11:38.070' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (34, N'IOT', N'Thomas', NULL, N'~/UploadData/BookPicture/iot.jpg', 14, CAST(N'2021-06-02T10:14:50.263' AS DateTime), CAST(N'2021-06-02T10:14:50.263' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (35, N'IPDC', N'Krish', NULL, N'~/UploadData/BookPicture/PicsArt_06-01-07.17.26.png', 14, CAST(N'2021-06-02T10:33:28.153' AS DateTime), CAST(N'2021-06-02T10:33:28.153' AS DateTime))
INSERT [dbo].[Book] ([BookID], [BookTitle], [Author], [Details], [Image], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (37, N'ASPNet Book', N'Thomas', N'dfgdgbdfbdfbdfvdfbvdfbvfghgfhgh', N'~/UploadData/BookPicture/ASP.jpg', 14, CAST(N'2021-06-10T21:49:29.723' AS DateTime), CAST(N'2021-06-10T21:59:19.283' AS DateTime))
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[BookCopy] ON 

INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (48, 25, 5, N'MPI001', 0, 6, CAST(N'2021-04-02T11:13:17.680' AS DateTime), CAST(N'2021-04-02T11:13:17.680' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (49, 25, NULL, N'MPI002', 1, 6, CAST(N'2021-04-02T11:13:25.943' AS DateTime), CAST(N'2021-04-02T11:13:25.943' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (50, 25, NULL, N'MPI003', 1, 6, CAST(N'2021-04-02T11:13:30.993' AS DateTime), CAST(N'2021-04-02T11:13:30.993' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (55, 29, NULL, N'TOC001', 1, 6, CAST(N'2021-04-02T11:15:02.350' AS DateTime), CAST(N'2021-04-02T11:15:02.350' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (56, 29, NULL, N'TOC002', 1, 6, CAST(N'2021-04-02T11:15:07.720' AS DateTime), CAST(N'2021-04-02T11:15:07.720' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (57, 29, NULL, N'TOC003', 1, 6, CAST(N'2021-04-02T11:15:15.530' AS DateTime), CAST(N'2021-04-02T11:15:15.530' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (58, 30, NULL, N'MA001', 1, 8, CAST(N'2021-04-04T20:22:33.397' AS DateTime), CAST(N'2021-04-04T20:22:33.397' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (59, 30, NULL, N'MA002', 1, 8, CAST(N'2021-04-04T20:22:39.697' AS DateTime), CAST(N'2021-04-04T20:22:39.697' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (60, 30, NULL, N'MA003', 1, 8, CAST(N'2021-04-05T09:46:34.950' AS DateTime), CAST(N'2021-04-05T09:46:34.950' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (81, 34, NULL, N'IOT001', 1, 14, CAST(N'2021-06-02T10:15:04.280' AS DateTime), CAST(N'2021-06-02T10:15:04.280' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (82, 34, NULL, N'IOT002', 1, 14, CAST(N'2021-06-02T10:15:14.487' AS DateTime), CAST(N'2021-06-02T10:15:14.487' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (83, 34, NULL, N'IOT003', 1, 14, CAST(N'2021-06-02T10:15:21.773' AS DateTime), CAST(N'2021-06-02T10:15:21.773' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (84, 33, NULL, N'CA001', 1, 14, CAST(N'2021-06-02T10:15:28.780' AS DateTime), CAST(N'2021-06-02T10:15:28.780' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (85, 33, NULL, N'CA002', 1, 14, CAST(N'2021-06-02T10:15:37.953' AS DateTime), CAST(N'2021-06-02T10:15:37.953' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (86, 33, NULL, N'CA003', 1, 14, CAST(N'2021-06-02T10:15:45.980' AS DateTime), CAST(N'2021-06-02T10:15:45.980' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (88, 33, NULL, N'CA004', 1, 14, CAST(N'2021-06-02T10:31:31.710' AS DateTime), CAST(N'2021-06-02T10:31:31.710' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (89, 35, NULL, N'IPDC001', 1, 14, CAST(N'2021-06-02T10:33:40.257' AS DateTime), CAST(N'2021-06-02T10:33:40.257' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (90, 35, NULL, N'IPDC002', 1, 14, CAST(N'2021-06-02T10:33:47.267' AS DateTime), CAST(N'2021-06-02T10:33:47.267' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (91, 35, NULL, N'IPDC0003', 1, 14, CAST(N'2021-06-02T10:33:53.957' AS DateTime), CAST(N'2021-06-02T10:33:53.957' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (96, 37, NULL, N'ASP001', 1, 14, CAST(N'2021-06-10T21:49:45.027' AS DateTime), CAST(N'2021-06-10T21:49:45.027' AS DateTime))
INSERT [dbo].[BookCopy] ([BookCopyID], [BookID], [StudentID], [BookCopyNo], [IsAvailable], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (97, 37, NULL, N'ASP002', 1, 14, CAST(N'2021-06-10T21:49:50.827' AS DateTime), CAST(N'2021-06-10T21:49:50.827' AS DateTime))
SET IDENTITY_INSERT [dbo].[BookCopy] OFF
GO
SET IDENTITY_INSERT [dbo].[BookIssue] ON 

INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (59, CAST(N'2021-04-02T11:16:21.453' AS DateTime), CAST(N'2021-04-28T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 8, 6, 8, NULL, CAST(N'2021-04-02T11:16:21.453' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (61, CAST(N'2021-04-02T11:16:43.043' AS DateTime), CAST(N'2021-04-30T00:00:00.000' AS DateTime), CAST(N'2021-04-06T11:44:10.890' AS DateTime), 29, 55, 8, 6, 8, NULL, CAST(N'2021-04-02T11:16:43.043' AS DateTime), CAST(N'2021-04-06T11:44:10.890' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (64, CAST(N'2021-04-02T11:17:13.267' AS DateTime), CAST(N'2021-04-24T00:00:00.000' AS DateTime), CAST(N'2021-04-06T11:43:33.760' AS DateTime), 25, 49, 5, 6, 8, NULL, CAST(N'2021-04-02T11:17:13.267' AS DateTime), CAST(N'2021-04-06T11:43:33.760' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (74, CAST(N'2021-04-04T20:23:11.583' AS DateTime), CAST(N'2021-04-24T00:00:00.000' AS DateTime), CAST(N'2021-04-04T20:23:25.653' AS DateTime), 30, 58, 5, 8, 8, NULL, CAST(N'2021-04-04T20:23:11.583' AS DateTime), CAST(N'2021-04-04T20:23:25.653' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (75, CAST(N'2021-04-06T11:42:05.270' AS DateTime), CAST(N'2021-04-25T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-04-06T11:42:05.270' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (77, CAST(N'2021-04-09T11:06:32.080' AS DateTime), CAST(N'2021-07-22T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-04-09T11:06:32.080' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (78, CAST(N'2021-04-09T11:08:12.433' AS DateTime), CAST(N'2021-04-09T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-04-09T11:08:12.433' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (79, CAST(N'2021-04-17T23:28:46.513' AS DateTime), CAST(N'2021-04-07T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-04-17T23:28:46.513' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (85, CAST(N'2021-06-02T10:16:50.727' AS DateTime), CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2021-06-02T10:32:11.180' AS DateTime), 33, 84, 23, 14, 14, NULL, CAST(N'2021-06-02T10:16:50.727' AS DateTime), CAST(N'2021-06-02T10:32:11.180' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (89, CAST(N'2021-06-08T14:36:50.607' AS DateTime), CAST(N'2021-06-27T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-06-08T14:36:50.607' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (91, CAST(N'2021-06-10T11:41:41.803' AS DateTime), CAST(N'2021-06-24T00:00:00.000' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime), 25, 48, 5, 8, 8, NULL, CAST(N'2021-06-10T11:41:41.803' AS DateTime), CAST(N'2021-06-10T12:45:11.947' AS DateTime))
INSERT [dbo].[BookIssue] ([BookIssueID], [BookIssueDate], [BookDueDate], [BookReturnDate], [BookID], [BookCopyID], [StudentID], [IssuedByStaffID], [ReturnByStaffID], [ReturnRemarks], [CreationDate], [ModificationDate]) VALUES (93, CAST(N'2021-06-10T12:47:07.313' AS DateTime), CAST(N'2021-07-04T00:00:00.000' AS DateTime), NULL, 25, 48, 5, 8, NULL, NULL, CAST(N'2021-06-10T12:47:07.313' AS DateTime), CAST(N'2021-06-10T12:47:07.313' AS DateTime))
SET IDENTITY_INSERT [dbo].[BookIssue] OFF
GO
SET IDENTITY_INSERT [dbo].[Branch] ON 

INSERT [dbo].[Branch] ([BranchID], [BranchName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (19, N'Computer Engineering', 1, CAST(N'2001-02-21T00:00:00.000' AS DateTime), CAST(N'2001-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Branch] ([BranchID], [BranchName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (20, N'Civil Engineering', 1, CAST(N'2001-02-21T00:00:00.000' AS DateTime), CAST(N'2001-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Branch] ([BranchID], [BranchName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (23, N'Mechanical Engineering', 1, CAST(N'2001-02-21T00:00:00.000' AS DateTime), CAST(N'2001-02-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Branch] OFF
GO
SET IDENTITY_INSERT [dbo].[Institute] ON 

INSERT [dbo].[Institute] ([InstituteID], [InstituteName], [Code], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (4, N'Degree ', N'054', 1, CAST(N'2001-02-21T00:00:00.000' AS DateTime), CAST(N'2000-02-21T00:00:00.000' AS DateTime))
INSERT [dbo].[Institute] ([InstituteID], [InstituteName], [Code], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (6, N'Diploma', N'053', 1, CAST(N'2001-02-21T00:00:00.000' AS DateTime), CAST(N'2000-02-21T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Institute] OFF
GO
SET IDENTITY_INSERT [dbo].[Semester] ON 

INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (1, N'1st', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (2, N'2nd', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (3, N'3rd', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (4, N'4th', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (5, N'5th', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (6, N'6th', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (7, N'7th', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Semester] ([SemesterID], [SemesterName], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (8, N'8th', 6, CAST(N'2021-03-31T00:00:00.000' AS DateTime), CAST(N'2021-03-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Semester] OFF
GO
SET IDENTITY_INSERT [dbo].[Student] ON 

INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (2, N'Smit', N'180540107000', N'jemis.bakrania123@gmail.com', 4, 19, 6, 6, CAST(N'2021-03-31T11:00:02.990' AS DateTime), CAST(N'2021-06-02T10:32:37.660' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (5, N'jemis', N'180540107006', N'jemis.ba34krania123@gmail.com', 6, 20, 7, 6, CAST(N'2021-03-31T11:01:07.047' AS DateTime), CAST(N'2021-03-31T11:01:07.047' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (6, N'Smit', N'180540107187', N'SMit@gmilaas.as', 6, 19, 6, 2, CAST(N'2021-04-01T17:05:00.107' AS DateTime), CAST(N'2021-04-01T17:05:00.107' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (8, N'JEMIS BAKARANIA', N'180540107005', N'jemis.baasarania123@gmail.com', 6, 20, 6, 6, CAST(N'2021-04-01T18:08:09.020' AS DateTime), CAST(N'2021-04-09T01:01:10.267' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (21, N'Naimish Patel', N'090200107052', N'naimishp49@gmail.com', 6, 20, 6, 8, CAST(N'2021-04-09T10:05:09.220' AS DateTime), CAST(N'2021-06-08T14:40:59.000' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (23, N'Darshak', N'180540107100', N'Darshak@Darsha.sad', 4, 19, 6, 14, CAST(N'2021-06-02T10:02:34.520' AS DateTime), CAST(N'2021-06-02T10:32:01.600' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (25, N'Jemis', N'180540107007', N'jemis.bakrania12saa3@gmail.com', 4, 19, 6, 14, CAST(N'2021-06-02T10:34:34.420' AS DateTime), CAST(N'2021-06-02T10:34:34.420' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (26, N'Milan', N'180540107771', N'MIlan@gmial.com', 4, 19, 6, 14, CAST(N'2021-06-07T09:31:11.200' AS DateTime), CAST(N'2021-06-07T09:31:11.200' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (27, N'Tanvi', N'180540107112', N'Tanvi@gmail.com', 4, 19, 6, 14, CAST(N'2021-06-07T09:31:34.857' AS DateTime), CAST(N'2021-06-07T09:31:34.857' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (28, N'Darshak', N'180540107113', N'dk@gmail.com', 6, 20, 6, 8, CAST(N'2021-06-07T09:32:15.023' AS DateTime), CAST(N'2021-06-07T09:32:15.023' AS DateTime))
INSERT [dbo].[Student] ([StudentID], [StudentName], [EntrollmentNo], [Email], [InstituteID], [BranchID], [SemesterID], [AdminUserID], [CreationDate], [ModificationDate]) VALUES (29, N'Deep', N'180540107114', N'deep@gmail.com', 6, 20, 6, 8, CAST(N'2021-06-07T09:32:39.587' AS DateTime), CAST(N'2021-06-07T09:32:39.587' AS DateTime))
SET IDENTITY_INSERT [dbo].[Student] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AdminUser]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [IX_AdminUser] UNIQUE NONCLUSTERED 
(
	[AdminUserName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Book]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Book] ADD  CONSTRAINT [IX_Book] UNIQUE NONCLUSTERED 
(
	[BookTitle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_BookCopy]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[BookCopy] ADD  CONSTRAINT [IX_BookCopy] UNIQUE NONCLUSTERED 
(
	[BookCopyNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Institute]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Institute] ADD  CONSTRAINT [IX_Institute] UNIQUE NONCLUSTERED 
(
	[InstituteName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Institute_1]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Institute] ADD  CONSTRAINT [IX_Institute_1] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Semester]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Semester] ADD  CONSTRAINT [IX_Semester] UNIQUE NONCLUSTERED 
(
	[SemesterName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_Student] UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Student_1]    Script Date: 10-06-2021 11:11:45 PM ******/
ALTER TABLE [dbo].[Student] ADD  CONSTRAINT [IX_Student_1] UNIQUE NONCLUSTERED 
(
	[EntrollmentNo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AdminUser] ADD  CONSTRAINT [DF_AdminUser_CreationDate]  DEFAULT (getdate()) FOR [CreationDate]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [FK_AdminUser_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [FK_AdminUser_Branch]
GO
ALTER TABLE [dbo].[AdminUser]  WITH CHECK ADD  CONSTRAINT [FK_AdminUser_Institute] FOREIGN KEY([InstituteID])
REFERENCES [dbo].[Institute] ([InstituteID])
GO
ALTER TABLE [dbo].[AdminUser] CHECK CONSTRAINT [FK_AdminUser_Institute]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_AdminUser] FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_AdminUser]
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD  CONSTRAINT [FK_BookCopy_AdminUser] FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BookCopy] CHECK CONSTRAINT [FK_BookCopy_AdminUser]
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD  CONSTRAINT [FK_BookCopy_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[BookCopy] CHECK CONSTRAINT [FK_BookCopy_Book]
GO
ALTER TABLE [dbo].[BookCopy]  WITH CHECK ADD  CONSTRAINT [FK_BookCopy_Student] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[BookCopy] CHECK CONSTRAINT [FK_BookCopy_Student]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_AdminUser] FOREIGN KEY([IssuedByStaffID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_AdminUser]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_AdminUser1] FOREIGN KEY([ReturnByStaffID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_AdminUser1]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_Book] FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_Book]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_BookCopy] FOREIGN KEY([BookCopyID])
REFERENCES [dbo].[BookCopy] ([BookCopyID])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_BookCopy]
GO
ALTER TABLE [dbo].[BookIssue]  WITH CHECK ADD  CONSTRAINT [FK_BookIssue_BookIssue] FOREIGN KEY([StudentID])
REFERENCES [dbo].[Student] ([StudentID])
GO
ALTER TABLE [dbo].[BookIssue] CHECK CONSTRAINT [FK_BookIssue_BookIssue]
GO
ALTER TABLE [dbo].[Semester]  WITH CHECK ADD  CONSTRAINT [FK_Semester_AdminUser] FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[Semester] CHECK CONSTRAINT [FK_Semester_AdminUser]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_AdminUser] FOREIGN KEY([AdminUserID])
REFERENCES [dbo].[AdminUser] ([AdminUserID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_AdminUser]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Branch] FOREIGN KEY([BranchID])
REFERENCES [dbo].[Branch] ([BranchID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Branch]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Institute] FOREIGN KEY([InstituteID])
REFERENCES [dbo].[Institute] ([InstituteID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Institute]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Semester] FOREIGN KEY([SemesterID])
REFERENCES [dbo].[Semester] ([SemesterID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Semester]
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_DeleteByPK]
@AdminUserID INT
AS
DELETE FROM [dbo].[AdminUser]
WHERE [dbo].[AdminUser].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_Insert]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_Insert]
@AdminUserID int out,
@AdminUserName varchar(100),
@Email varchar(100),
@Password varchar(8),
@MobileNo varchar(10),
@InstituteID int,
@BranchID int,
@ProfilePicture varchar(500)

as

INSERT INTO [dbo].[AdminUser]
(
	[AdminUserName],
	[Email],
	[Password],
	[InstituteID],
	[BranchID],
	[MobileNo],
	[ProfilePicture],
	[CreationDate],
	[ModificationDate]
)

VALUES
(
	@AdminUserName,
	@Email,
	@Password,
	@InstituteID,
	@BranchID,
	@MobileNo,
	@ProfilePicture,
	GETDATE(),
	GETDATE()
)

SELECT @AdminUserID = SCOPE_IDENTITY() 
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_InsertByUserID]
@AdminUserName VARCHAR(100),
@Email VARCHAR(100),
@Password VARCHAR(8),
@InstituteID INT,
@BranchID INT,
@MobileNo VARCHAR(10),
@CreationDate DATETIME,
@ModificationDate DATE
AS
INSERT INTO [dbo].[AdminUser]
(
    [dbo].[AdminUser].[AdminUserName],
    [dbo].[AdminUser].[Email],
    [dbo].[AdminUser].[Password],
    [dbo].[AdminUser].[InstituteID],
    [dbo].[AdminUser].[BranchID],
    [dbo].[AdminUser].[MobileNo],
    [dbo].[AdminUser].[CreationDate],
    [dbo].[AdminUser].[ModificationDate]
)
VALUES
(
    @AdminUserName,
    @Email,
    @Password,
    @InstituteID,
    @BranchID,
    @MobileNo,
    @CreationDate,
    @ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_SelectAll]
AS
SELECT
    [dbo].[AdminUser].[AdminUserID],
    [dbo].[AdminUser].[AdminUserName],
    [dbo].[AdminUser].[Email],
    [dbo].[AdminUser].[Password],
    [dbo].[Institute].[InstituteID],
    [dbo].[Branch].[BranchID],
    [dbo].[AdminUser].[MobileNo],
    CONVERT(VARCHAR,[dbo].[AdminUser].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[AdminUser].[ModificationDate],106)

FROM [dbo].[AdminUser]
left outer join [dbo].[Institute]
on [dbo].[Institute].[InstituteID] = [dbo].[AdminUser].[InstituteID]
left outer join [dbo].[Branch]
on [dbo].[Branch].[BranchID] = [dbo].[AdminUser].[BranchID]
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_SelectByAdminUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_AdminUser_SelectByAdminUserID]
@AdminUserID INT

as

SELECT 
	[dbo].[AdminUser].[AdminUserID],
	[dbo].[AdminUser].[AdminUserName],
	[dbo].[AdminUser].[Password],
	[dbo].[AdminUser].[InstituteID],
	[dbo].[AdminUser].[BranchID],
	[dbo].[AdminUser].[ProfilePicture],
	[dbo].[AdminUser].[Email],
	[dbo].[AdminUser].[MobileNo],
	[dbo].[Institute].[InstituteName],
	[dbo].[Branch].[BranchName],
	CONVERT(VARCHAR,[dbo].[AdminUser].[CreationDate],106) as CreationDate,
    CONVERT(VARCHAR,[dbo].[AdminUser].[ModificationDate],106) as ModificationDate

FROM
	[dbo].[AdminUser]
	left outer join [dbo].[Institute]
	on [dbo].[Institute].[InstituteID] = [dbo].[AdminUser].[InstituteID]
	left outer join [dbo].[Branch]
	on [dbo].[Branch].[BranchID] = [dbo].[AdminUser].[BranchID]

WHERE
	[dbo].[AdminUser].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_SelectByAdminUserNamePassword]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_SelectByAdminUserNamePassword]
@AdminUserName varchar(100),
@Password varchar(15)

as

SELECT 
	[dbo].[AdminUser].[AdminUserID],
	[dbo].[AdminUser].[AdminUserName],
	[dbo].[AdminUser].[Password],
	[dbo].[AdminUser].[InstituteID],
	[dbo].[AdminUser].[BranchID],
	[dbo].[AdminUser].[ProfilePicture],
	[dbo].[AdminUser].[Email],
	[dbo].[AdminUser].[MobileNo],
	[dbo].[Institute].[InstituteName],
	[dbo].[Branch].[BranchName],
	CONVERT(VARCHAR,[dbo].[AdminUser].[CreationDate],106) as CreationDate,
    CONVERT(VARCHAR,[dbo].[AdminUser].[ModificationDate],106) as ModificationDate

FROM
	[dbo].[AdminUser]
	left outer join [dbo].[Institute]
	on [dbo].[Institute].[InstituteID] = [dbo].[AdminUser].[InstituteID]
	left outer join [dbo].[Branch]
	on [dbo].[Branch].[BranchID] = [dbo].[AdminUser].[BranchID]

WHERE
	[dbo].[AdminUser].[AdminUserName] = @AdminUserName
	AND
	[dbo].[AdminUser].[Password] = @Password
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_SelectByPK]
@AdminUserID INT
AS
SELECT
    [dbo].[AdminUser].[AdminUserID],
    [dbo].[AdminUser].[AdminUserName],
    [dbo].[AdminUser].[Email],
    [dbo].[AdminUser].[Password],
    [dbo].[Institute].[InstituteID],
    [dbo].[Branch].[BranchID],
    [dbo].[AdminUser].[MobileNo],
    CONVERT(VARCHAR,[dbo].[AdminUser].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[AdminUser].[ModificationDate],106)
FROM [dbo].[AdminUser]
left outer join [dbo].[Institute]
on [dbo].[Institute].[InstituteID] = [dbo].[AdminUser].[InstituteID]
left outer join [dbo].[Branch]
on [dbo].[Branch].[BranchID] = [dbo].[AdminUser].[BranchID]
WHERE
    [dbo].[AdminUser].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_AdminUser_UpdateByPK]
@AdminUserID INT,
@AdminUserName VARCHAR(100),
@Email VARCHAR(100),
@Password VARCHAR(8),
@MobileNo VARCHAR(10)

AS
UPDATE [dbo].[AdminUser]
SET
    [dbo].[AdminUser].[AdminUserName] = @AdminUserName,
    [dbo].[AdminUser].[Email] = @Email,
    [dbo].[AdminUser].[Password] = @Password,
    [dbo].[AdminUser].[MobileNo] = @MobileNo,
    [dbo].[AdminUser].[ModificationDate] = GETDATE()
WHERE
    [dbo].[AdminUser].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_AdminUser_UpdateProfilePictureByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_AdminUser_UpdateProfilePictureByPK]
@AdminUserID INT,
@ProfilePicture VARCHAR(500)

AS
UPDATE [dbo].[AdminUser]
SET
    [dbo].[AdminUser].[ProfilePicture] = @ProfilePicture,
    [dbo].[AdminUser].[ModificationDate] = GETDATE()
WHERE
    [dbo].[AdminUser].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_Count]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Book_Count]
@InstituteID INT,
@BranchID INT
as
select
	count(*) as TotalBooks
from Book
left outer Join AdminUser
on AdminUser.AdminUserID = Book.AdminUserID
where AdminUser.InstituteID = @InstituteID
and AdminUser.BranchID = @BranchID

GO
/****** Object:  StoredProcedure [dbo].[PR_Book_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_DeleteByPK]
@BookID INT
AS


DELETE FROM [dbo].[BookIssue]
WHERE [dbo].[BookIssue].[BookID] = @BookID

DELETE FROM [dbo].[BookCopy]
WHERE [dbo].[BookCopy].[BookID] = @BookID

DELETE FROM [dbo].[Book]
WHERE [dbo].[Book].[BookID] = @BookID
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_Insert]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Book_Insert]
@BookID INT OUT,
@BookTitle VARCHAR(200),
@Author VARCHAR(50),
@Details VARCHAR(1000),
@Image VARCHAR(500)
as
INSERT INTO [dbo].[Book]
(
    [dbo].[Book].[BookTitle],
    [dbo].[Book].[Author],
    [dbo].[Book].[Details],
    [dbo].[Book].[Image],
    [dbo].[Book].[CreationDate],
    [dbo].[Book].[ModificationDate]
)
VALUES
(
    @BookTitle,
    @Author,
    @Details,
    @Image,
    GETDATE(),
	GETDATE()
)

SELECT @BookID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_InsertByUserID]
@BookID INT OUT,
@BookTitle VARCHAR(200),
@Author VARCHAR(50),
@Details VARCHAR(1000),
@Image VARCHAR(500),
@AdminUserID INT


AS
INSERT INTO [dbo].[Book]
(
    [dbo].[Book].[BookTitle],
    [dbo].[Book].[Author],
    [dbo].[Book].[Details],
    [dbo].[Book].[Image],
    [dbo].[Book].[AdminUserID],
    [dbo].[Book].[CreationDate],
    [dbo].[Book].[ModificationDate]
)
VALUES
(
    @BookTitle,
    @Author,
    @Details,
    @Image,
    @AdminUserID,
    GETDATE(),
	GETDATE()
)

SELECT @BookID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_SelectAll]
@InstituteID INT,
@BranchID INT
AS
SELECT
    [dbo].[Book].[BookID],
    [dbo].[Book].[BookTitle],
    [dbo].[Book].[Author],
    [dbo].[Book].[Details],
    [dbo].[Book].[Image],
    CONVERT(VARCHAR,[dbo].[Book].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Book].[ModificationDate],106)
FROM
    [dbo].[Book]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[Book].[AdminUserID]
	where [dbo].[AdminUser].[InstituteID] = @InstituteID
	and [dbo].[AdminUser].[BranchID] = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_SelectByPK]
@BookID INT
AS
SELECT
    [dbo].[Book].[BookID],
    [dbo].[Book].[BookTitle],
    [dbo].[Book].[Author],
    [dbo].[Book].[Details],
    [dbo].[Book].[Image],
    [dbo].[Book].[AdminUserID],
    CONVERT(VARCHAR,[dbo].[Book].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Book].[ModificationDate],106)
FROM
    [dbo].[Book]
WHERE
    [dbo].[Book].[BookID] = @BookID
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_SelectForDropdownList]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_SelectForDropdownList]
@InstituteID int,
@BranchID int
AS
SELECT
    [dbo].[Book].[BookID],
    [dbo].[Book].[BookTitle]

FROM
    [dbo].[Book]
	inner join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[Book].[AdminUserID]
	where [dbo].[AdminUser].[BranchID]=@BranchID
	and [dbo].[AdminUser].[InstituteID]=@InstituteID
GO
/****** Object:  StoredProcedure [dbo].[PR_Book_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Book_UpdateByPK]
@BookID INT,
@BookTitle VARCHAR(200),
@Author VARCHAR(50),
@Details VARCHAR(1000),
@Image VARCHAR(500)
AS
UPDATE [dbo].[Book]
SET
    [dbo].[Book].[BookTitle] = @BookTitle,
    [dbo].[Book].[Author] = @Author,
    [dbo].[Book].[Details] = @Details,
    [dbo].[Book].[Image] = @Image,
    [dbo].[Book].[ModificationDate] = GETDATE()
WHERE [dbo].[Book].[BookID] = @BookID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_Count]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookCopy_Count]
@InstituteID INT,
@BranchID INT
as
select
	count(*) as TotalBookCopy
from BookCopy
left outer join AdminUser 
on AdminUser.AdminUserID = BookCopy.AdminUserID
where AdminUser.InstituteID = @InstituteID
and AdminUser.BranchID = @BranchID


GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_CountOfAvailableBooks]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookCopy_CountOfAvailableBooks]
@InstituteID INT,
@BranchID INT
as
select
	count(*) as TotalBooksAvailable
from BookCopy
left outer join AdminUser   
on AdminUser.AdminUserID = BookCopy.AdminUserID
where BookCopy.IsAvailable = '1'
and AdminUser.InstituteID = @InstituteID
and AdminUser.BranchID = @BranchID



GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_CountOfIssedBooks]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookCopy_CountOfIssedBooks]
@InstituteID INT,
@BranchID INT
as
select
	count(*) as TotalBooksIssued
from Student
left outer join BookCopy  
on Student.StudentID = BookCopy.StudentID
where IsAvailable = '0'
and student.InstituteID = @InstituteID
and student.BranchID = @BranchID



GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_DeleteByPK]
@BookCopyID INT
AS

DELETE FROM [dbo].[BookIssue]
WHERE [dbo].[BookIssue].[BookCopyID] = @BookCopyID

DELETE FROM [dbo].[BookCopy]
WHERE [dbo].[BookCopy].[BookCopyID] = @BookCopyID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_Insert]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_Insert]
@BookCopyID INT OUT,
@BookID INT,
@BookCopyNo VARCHAR(50)
AS
INSERT INTO [dbo].[BookCopy]
(
    [dbo].[BookCopy].[BookID],
    [dbo].[BookCopy].[BookCopyNo],
    [dbo].[BookCopy].[IsAvailable],
    [dbo].[BookCopy].[CreationDate],
    [dbo].[BookCopy].[ModificationDate]
)
VALUES
(
    @BookID,
    @BookCopyNo,
    '1',
	GETDATE(),
	GETDATE()
)

SELECT @BookCopyID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_InsertByUserID]
@BookCopyID INT OUT,
@BookID INT,
@BookCopyNo VARCHAR(50),
@AdminUserID INT
AS
INSERT INTO [dbo].[BookCopy]
(
    [dbo].[BookCopy].[BookID],
    [dbo].[BookCopy].[BookCopyNo],
    [dbo].[BookCopy].[IsAvailable],
    [dbo].[BookCopy].[AdminUserID],
    [dbo].[BookCopy].[CreationDate],
    [dbo].[BookCopy].[ModificationDate]
)
VALUES
(
    @BookID,
    @BookCopyNo,
	'1',
    @AdminUserID,
    GETDATE(),
	GETDATE()
)

SELECT @BookCopyID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SelectAll Query
CREATE PROCEDURE [dbo].[PR_BookCopy_SelectAll]
@AdminUserID INT
AS
SELECT
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[BookCopy].[BookID],
    [dbo].[BookCopy].[BookCopyNo],
    [dbo].[BookCopy].[IsAvailable],
    CONVERT(VARCHAR,[dbo].[BookCopy].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[BookCopy].[ModificationDate],106)
FROM
    [dbo].[BookCopy]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookCopy].[BookID]
	where [dbo].[BookCopy].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectByBookCopyID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_BookCopy_SelectByBookCopyID]
@BookCopyID INT

as

SELECT 
	[dbo].[BookCopy].[BookCopyID],
	[dbo].[BookCopy].[BookID]
From
	[dbo].[BookCopy]
where [dbo].[BookCopy].[BookCopyID] = @BookCopyID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectByBookCopyNo]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_BookCopy_SelectByBookCopyNo]
@BookCopyNo VARCHAR(50)

as

SELECT 
	[dbo].[BookCopy].[BookCopyID],
	[dbo].[BookCopy].[BookID]
From
	[dbo].[BookCopy]
where [dbo].[BookCopy].[BookCopyNo] = @BookCopyNo
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_SelectByPK]


@InstituteID INT,
@BranchID INT

AS

SELECT
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[Book].[Image],
    [dbo].[Book].[BookTitle],
    [dbo].[BookCopy].[BookCopyNo]

FROM
    [dbo].[BookCopy]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookCopy].[BookID]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[BookCopy].[AdminUserID]

WHERE
		[dbo].[AdminUser].[InstituteID] = @InstituteID
	and [dbo].[AdminUser].[BranchID] = @BranchID
	and [dbo].[BookCopy].[IsAvailable] = '1'
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectByPKByBookCopyID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_SelectByPKByBookCopyID]

@BookCopyID INT

AS

SELECT
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[Book].[Image],
    [dbo].[Book].[BookTitle],
    [dbo].[BookCopy].[BookCopyNo],
	[dbo].[Book].[Details],
	[dbo].[Book].[Author]

FROM
    [dbo].[BookCopy]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookCopy].[BookID]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[BookCopy].[AdminUserID]
WHERE
		[dbo].[BookCopy].[BookCopyID] = @BookCopyID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_SelectByPKBySerialNo]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_SelectByPKBySerialNo]


@InstituteID INT,
@BranchID INT,
@BookCopyNo VARCHAR(50)

AS

SELECT
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[Book].[Image],
    [dbo].[Book].[BookTitle],
    [dbo].[BookCopy].[BookCopyNo],
	[dbo].[Book].[Details]

FROM
    [dbo].[BookCopy]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookCopy].[BookID]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[BookCopy].[AdminUserID]
WHERE
		[dbo].[AdminUser].[InstituteID] = @InstituteID
	and [dbo].[AdminUser].[BranchID] = @BranchID
	and [dbo].[BookCopy].[IsAvailable] = '1'
	and [dbo].[BookCopy].[BookCopyNo] = @BookCopyNo
GO
/****** Object:  StoredProcedure [dbo].[PR_BookCopy_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookCopy_UpdateByPK]
@BookCopyID INT,
@BookCopyNo varchar(50),
@Author varchar(100),
@Details varchar(1000),
@BookTitle varchar(200)
AS
UPDATE [dbo].[BookCopy]
SET
    [dbo].[BookCopy].[BookCopyNo] = @BookCopyNo,
	[dbo].[BookCopy].[ModificationDate] = GETDATE()
WHERE
    [dbo].[BookCopy].[BookCopyID] = @BookCopyID

UPDATE [dbo].[Book]
SET 
	[dbo].[Book].[BookTitle] = @BookTitle,
	[dbo].[Book].[Author] = @Author,
	[dbo].[Book].[Details] = @Details
WHERE 
	[dbo].[Book].[BookTitle] = @BookTitle
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookIssue_DeleteByPK]
@BookIssueID INT
AS
DELETE FROM [dbo].[BookIssue]
WHERE [dbo].[BookIssue].[BookIssueID] = @BookIssueID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookIssue_InsertByUserID]
@BookIssueDate DATETIME,
@BookDueDate DATETIME,
@BookReturnDate DATETIME,
@BookID INT,
@BookCopyID INT,
@StudentID INT,
@IssuedByStaffID INT,
@ReturnByStaffID INT,
@ReturnRemarks VARCHAR(250),
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
INSERT INTO [dbo].[BookIssue]
(
    [dbo].[BookIssue].[BookIssueDate],
    [dbo].[BookIssue].[BookDueDate],
    [dbo].[BookIssue].[BookReturnDate],
    [dbo].[BookIssue].[BookID],
    [dbo].[BookIssue].[BookCopyID],
    [dbo].[BookIssue].[StudentID],
    [dbo].[BookIssue].[IssuedByStaffID],
    [dbo].[BookIssue].[ReturnByStaffID],
    [dbo].[BookIssue].[ReturnRemarks],
    [dbo].[BookIssue].[CreationDate],
    [dbo].[BookIssue].[ModificationDate]
)
VALUES
(
    @BookIssueDate,
    @BookDueDate,
    @BookReturnDate,
    @BookID,
    @BookCopyID,
    @StudentID,
    @IssuedByStaffID,
    @ReturnByStaffID,
    @ReturnRemarks,
    @CreationDate,
    @ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_ReturnBookByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookIssue_ReturnBookByUserID]
@BookCopyID INT,
@ReturnByStaffID INT,
@ReturnRemarks VARCHAR(250)
as

Update [dbo].[BookIssue]
SET 
	[dbo].[BookIssue].[BookReturnDate] = GETDATE(),
	[dbo].[BookIssue].[ReturnByStaffID] = @ReturnByStaffID,
	[dbo].[BookIssue].[ReturnRemarks] = @ReturnRemarks,
	[dbo].[BookIssue].[ModificationDate] = GETDATE()

WHERE
	[dbo].[BookIssue].[BookCopyID] = @BookCopyID

UPDATE [dbo].[BookCopy]
SET
	[dbo].[BookCopy].[StudentID] = null,
	[dbo].[BookCopy].[IsAvailable] = '1'

WHERE 
	[dbo].[BookCopy].[BookCopyID] = @BookCopyID

GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--SelectAll Query
CREATE PROCEDURE [dbo].[PR_BookIssue_SelectAll]
AS
SELECT
    [dbo].[BookIssue].[BookIssueID],
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookIssueDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookDueDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookReturnDate],106),
    [dbo].[Book].[BookID],
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[Student].[StudentID],
    [dbo].[BookIssue].[IssuedByStaffID],
    [dbo].[BookIssue].[ReturnByStaffID],
    [dbo].[BookIssue].[ReturnRemarks],
    CONVERT(VARCHAR,[dbo].[BookIssue].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[ModificationDate],106)
FROM
    [dbo].[BookIssue]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
	left outer join [dbo].[BookCopy]
	on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookIssueID]
	left outer join [dbo].[Student]
	on [dbo].[Student].[StudentID] = [dbo].[BookIssue].[StudentID]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[BookIssue].[IssuedByStaffID]
	and [dbo].[AdminUser].[AdminUserID] = [dbo].[BookIssue].[ReturnByStaffID]
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectByBookcopyNo]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookIssue_SelectByBookcopyNo]

@BookIssueID INT OUT,
@BookDueDate DATETIME,
@BookID INT,
@BookCopyID INT,
@StudentID INT,
@IssuedByStaffID INT


as

INSERT INTO [dbo].[BookIssue]
(
	[BookIssueDate],
	[BookDueDate],
	[BookID],
	[BookCopyID],
	[StudentID],
	[IssuedByStaffID],
	[CreationDate],
	[ModificationDate]
)
VALUES
(
	GETDATE(),
	@BookDueDate,
	@BookID,
	@BookCopyID,
	@StudentID,
	@IssuedByStaffID,
	GETDATE(),
	GETDATE()
)

SELECT @BookIssueID = SCOPE_IDENTITY()


UPDATE BookCopy
SET 
	StudentID = @StudentID
WHERE 
	StudentID is null
	and BookCopy.[BookCopyID] = @BookCopyID

UPDATE BookCopy
SET
	IsAvailable = '0'
WHERE 
	IsAvailable = '1'
and BookCopy.[BookCopyID] = @BookCopyID
and BookCopy.[StudentID] = @StudentID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectByBookCopyNoWithBookDetails]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookIssue_SelectByBookCopyNoWithBookDetails]
@BookCopyNo VARCHAR(50),
@InstituteID INT,
@BranchID INT

as

Select 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[EntrollmentNo],
	[dbo].[Student].[StudentName],
	[dbo].[Book].[BookTitle],
	[dbo].[Book].[Image],
	[dbo].[BookCopy].[BookCopyNo],
	CONVERT(VARCHAR,[dbo].[BookIssue].[BookIssueDate],106) as BookIssueDate,
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookDueDate],106) as BookDueDate
	
	
from [dbo].[BookIssue]
left outer join [dbo].[Student]
on [dbo].[Student].[StudentID]  = [dbo].[BookIssue].[StudentID]
left outer join [dbo].[Book]
on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
left outer join [dbo].[BookCopy]
on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookCopyID]


Where [dbo].[BookCopy].[BookCopyNo] = @BookCopyNo
and [dbo].[Student].[InstituteID]= @InstituteID
and [dbo].[Student].[BranchID] = @BranchID
and [dbo].[BookIssue].[BookReturnDate] is null
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectByEnrollemntNoWithBookDetails]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookIssue_SelectByEnrollemntNoWithBookDetails]
@EnrollmentNo VARCHAR(15),
@InstituteID INT,
@BranchID INT

as

Select 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[EntrollmentNo],
	[dbo].[Student].[StudentName],
	[dbo].[Book].[BookTitle],
	[dbo].[Book].[Image],
	[dbo].[BookCopy].[BookCopyNo],
	CONVERT(VARCHAR,[dbo].[BookIssue].[BookIssueDate],106) as BookIssueDate,
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookDueDate],106) as BookDueDate,
	CONVERT(VARCHAR,[dbo].[Student].[CreationDate],106) as CreationDate,
	CONVERT(VARCHAR,[dbo].[Student].[ModificationDate],106) as ModificationDate,
	[dbo].[Institute].[InstituteName],
	[dbo].[Branch].[BranchName]
	
	
from [dbo].[BookIssue]
left outer join [dbo].[Student]
on [dbo].[Student].[StudentID]  = [dbo].[BookIssue].[StudentID]
left outer join [dbo].[Book]
on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
left outer join [dbo].[BookCopy]
on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookCopyID]
left outer join [dbo].[Institute]
on [dbo].[Institute].[InstituteID] = [dbo].[Student].[InstituteID]
left outer join [dbo].[Branch]
on [dbo].[Branch].[BranchID] = [dbo].[Student].[BranchID]


Where [dbo].[Student].[EntrollmentNo] = @EnrollmentNo
and [dbo].[Student].[InstituteID]= @InstituteID
and [dbo].[Student].[BranchID] = @BranchID
and [dbo].[BookIssue].[BookReturnDate] is null
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookIssue_SelectByPK]
@BookIssueID INT
AS
SELECT
    [dbo].[BookIssue].[BookIssueID],
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookIssueDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookDueDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookReturnDate],106),
    [dbo].[Book].[BookID],
    [dbo].[BookCopy].[BookCopyID],
    [dbo].[Student].[StudentID],
    [dbo].[BookIssue].[IssuedByStaffID],
    [dbo].[BookIssue].[ReturnByStaffID],
    [dbo].[BookIssue].[ReturnRemarks],
    CONVERT(VARCHAR,[dbo].[BookIssue].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[BookIssue].[ModificationDate],106)
FROM
    [dbo].[BookIssue]
	left outer join [dbo].[Book]
	on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
	left outer join [dbo].[BookCopy]
	on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookIssueID]
	left outer join [dbo].[Student]
	on [dbo].[Student].[StudentID] = [dbo].[BookIssue].[StudentID]
	left outer join [dbo].[AdminUser]
	on [dbo].[AdminUser].[AdminUserID] = [dbo].[BookIssue].[IssuedByStaffID]
	and [dbo].[AdminUser].[AdminUserID] = [dbo].[BookIssue].[ReturnByStaffID]
WHERE
    [dbo].[BookIssue].[BookIssueID] = @BookIssueID
GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_SelectByStudentNoWithBookDetails]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_BookIssue_SelectByStudentNoWithBookDetails]
@StudentID INT,
@InstituteID INT,
@BranchID INT

as

Select 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[EntrollmentNo],
	[dbo].[Student].[StudentName],
	[dbo].[Student].[Email],
	[dbo].[Student].[SemesterID],
	[dbo].[Book].[BookTitle],
	[dbo].[Book].[Image],
	[dbo].[BookCopy].[BookCopyNo],
	CONVERT(VARCHAR,[dbo].[BookIssue].[BookIssueDate],106) as BookIssueDate,
    CONVERT(VARCHAR,[dbo].[BookIssue].[BookDueDate],106) as BookDueDate,
	CONVERT(VARCHAR,[dbo].[Student].[CreationDate],106) as CreationDate,
	CONVERT(VARCHAR,[dbo].[Student].[ModificationDate],106) as ModificationDate,
	[dbo].[Institute].[InstituteName],
	[dbo].[Branch].[BranchName]
	
	
from [dbo].[Student] 
left outer join [dbo].[BookIssue]
on [dbo].[Student].[StudentID]  = [dbo].[BookIssue].[StudentID]
left outer join [dbo].[Book]
on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
left outer join [dbo].[BookCopy]
on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookCopyID]
left outer join [dbo].[Institute]
on [dbo].[Institute].[InstituteID] = [dbo].[Student].[InstituteID]
left outer join [dbo].[Branch]
on [dbo].[Branch].[BranchID] = [dbo].[Student].[BranchID]


Where [dbo].[Student].[StudentID] = @StudentID
and [dbo].[Student].[InstituteID]= @InstituteID
and [dbo].[Student].[BranchID] = @BranchID

GO
/****** Object:  StoredProcedure [dbo].[PR_BookIssue_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_BookIssue_UpdateByPK]
@BookIssueID INT,
@BookIssueDate DATETIME,
@BookDueDate DATETIME,
@BookReturnDate DATETIME,
@BookID INT,
@BookCopyID INT,
@StudentID INT,
@IssuedByStaffID INT,
@ReturnByStaffID INT,
@ReturnRemarks VARCHAR(250),
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
UPDATE [dbo].[BookIssue]
SET
    [dbo].[BookIssue].[BookIssueDate] = @BookIssueDate,
    [dbo].[BookIssue].[BookDueDate] = @BookDueDate,
    [dbo].[BookIssue].[BookReturnDate] = @BookReturnDate,
    [dbo].[BookIssue].[ReturnRemarks] = @ReturnRemarks,
    [dbo].[BookIssue].[CreationDate] = @CreationDate,
    [dbo].[BookIssue].[ModificationDate] = @ModificationDate
WHERE
    [dbo].[BookIssue].[BookIssueID] = @BookIssueID
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Query
CREATE PROCEDURE [dbo].[PR_Branch_DeleteByPK]
@BranchID INT,
@AdminUserID INt
AS
DELETE FROM [dbo].[Branch]
WHERE [dbo].[Branch].[BranchID] = @BranchID
and [dbo].[Branch].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_InsertByUserID]
@BranchName VARCHAR(100),
@InstituteID INT,
@AdminUserID INT,
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
INSERT INTO [dbo].[Branch]
(
    [dbo].[Branch].[BranchName],
    [dbo].[Branch].[InstituteID],
    [dbo].[Branch].[AdminUserID],
    [dbo].[Branch].[CreationDate],
    [dbo].[Branch].[ModificationDate]
)
VALUES
(
    @BranchName,
    @InstituteID,
    @AdminUserID,
    @CreationDate,
    @ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_SelectAll]
@AdminUserD int
AS
SELECT
    [dbo].[Branch].[BranchID],
    [dbo].[Branch].[BranchName],
    [dbo].[Institute].[InstituteID],
    [dbo].[Branch].[AdminUserID],
    CONVERT(VARCHAR,[dbo].[Branch].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Branch].[ModificationDate],106)
FROM
    [dbo].[Branch]
	left outer join [dbo].[Institute]
	on [dbo].[Institute].[InstituteID] = [dbo].[Branch].[InstituteID]
	where [dbo].[Branch].[AdminUserID] = @AdminUserD
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_SelectByPK]
@BranchID INT,
@AdminUserID INT
AS
SELECT
    [dbo].[Branch].[BranchID],
    [dbo].[Branch].[BranchName],
    [dbo].[Institute].[InstituteID],
    [dbo].[Branch].[AdminUserID],
    CONVERT(VARCHAR,[dbo].[Branch].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Branch].[ModificationDate],106)
FROM
    [dbo].[Branch]
	left outer join [dbo].[Institute]
	on [dbo].[Institute].[InstituteID] = [dbo].[Branch].[InstituteID]
WHERE
    [dbo].[Branch].[BranchID] = @BranchID
	and [dbo].[Branch].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_SelectForDropdownList]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Branch_SelectForDropdownList]
AS
SELECT 
	[dbo].[Branch].[BranchID],
	[dbo].[Branch].[BranchName]

FROM
	[dbo].[Branch]

	
GO
/****** Object:  StoredProcedure [dbo].[PR_Branch_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Branch_UpdateByPK]
@BranchID INT,
@BranchName VARCHAR(100),
@InstituteID INT,
@AdminUserID INT,
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
UPDATE [dbo].[Branch]
SET
    [dbo].[Branch].[BranchName] = @BranchName,
    [dbo].[Branch].[CreationDate] = @CreationDate,
    [dbo].[Branch].[ModificationDate] = @ModificationDate
WHERE
    [dbo].[Branch].[BranchID] = @BranchID
	and [dbo].[Branch].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Delete Query
CREATE PROCEDURE [dbo].[PR_Institute_DeleteByPK]
@InstituteID INT,
@AdminUserID INT
AS
DELETE FROM [dbo].[Institute]
WHERE [dbo].[Institute].[InstituteID] = @InstituteID
and [dbo].[Institute].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Institute_InsertByUserID]
@InstituteName VARCHAR(100),
@Code VARCHAR(10),
@AdminUserID INT,
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
INSERT INTO [dbo].[Institute]
(
    [dbo].[Institute].[InstituteName],
    [dbo].[Institute].[Code],
    [dbo].[Institute].[AdminUserID],
    [dbo].[Institute].[CreationDate],
    [dbo].[Institute].[ModificationDate]
)
VALUES
(
    @InstituteName,
    @Code,
    @AdminUserID,
    @CreationDate,
    @ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Institute_SelectAll]
@AdminUserID int
AS
SELECT
    [dbo].[Institute].[InstituteID],
    [dbo].[Institute].[InstituteName],
    [dbo].[Institute].[Code],
    [dbo].[Institute].[AdminUserID],
    CONVERT(VARCHAR,[dbo].[Institute].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Institute].[ModificationDate],106)
FROM
    [dbo].[Institute]
where [dbo].[Institute].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Institute_SelectByPK]
@InstituteID INT,
@AdminUserID INT
AS
SELECT
    [dbo].[Institute].[InstituteID],
    [dbo].[Institute].[InstituteName],
    [dbo].[Institute].[Code],
    [dbo].[Institute].[AdminUserID],
    CONVERT(VARCHAR,[dbo].[Institute].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Institute].[ModificationDate],106)
FROM
    [dbo].[Institute]
WHERE
    [dbo].[Institute].[InstituteID] = @InstituteID
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_SelectForDropdownList]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[PR_Institute_SelectForDropdownList]
AS
SELECT 
	[dbo].[Institute].[InstituteID],
	[dbo].[Institute].[InstituteName]

FROM
	[dbo].[Institute]
	
GO
/****** Object:  StoredProcedure [dbo].[PR_Institute_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Update Query
CREATE PROCEDURE [dbo].[PR_Institute_UpdateByPK]
@InstituteID INT,
@InstituteName VARCHAR(100),
@Code VARCHAR(10),
@AdminUserID INT,
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
UPDATE [dbo].[Institute]
SET
    [dbo].[Institute].[InstituteName] = @InstituteName,
    [dbo].[Institute].[Code] = @Code,
    [dbo].[Institute].[CreationDate] = @CreationDate,
    [dbo].[Institute].[ModificationDate] = @ModificationDate
WHERE
    [dbo].[Institute].[InstituteID] = @InstituteID
	and [dbo].[Institute].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Semester_SelectForDropdownList]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[PR_Semester_SelectForDropdownList]
AS
SELECT
    [dbo].[Semester].[SemesterID],
    [dbo].[Semester].[SemesterName]

FROM
    [dbo].[Semester]
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_Count]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Student_Count]
@InstituteID INT,
@BranchID INT
as
select
	count(*) as TotalStudent
from Student
where student.InstituteID = @InstituteID
and student.BranchID = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_DeleteByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_DeleteByPK]
@StudentID INT
AS

DELETE FROM [dbo].[BookIssue]
WHERE [dbo].[BookIssue].[StudentID] = @StudentID

UPDATE BookCopy
SET
	StudentID = null,
	IsAvailable = '1'
WHERE 
	BookCopy.StudentID = @StudentID 

DELETE FROM [dbo].[Student]
WHERE [dbo].[Student].[StudentID] = @StudentID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_Insert]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PR_Student_Insert]
	@StudentID INT OUT,
	@StudentName VARCHAR(100),
	@EntrollmentNo VARCHAR(12),
	@Email VARCHAR(100),
	@InstituteID INT,
	@BranchID INT,
	@SemesterID INT,
	@AdminUserID INT
AS
		INSERT INTO [Student]
		(
			[StudentName],
			[EntrollmentNo],
			[Email],
			[InstituteID],
			[BranchID],
			[SemesterID],
			[AdminUserID],
			[CreationDate],
			[ModificationDate]
		)
		VALUES
		(
			@StudentName,
			@EntrollmentNo,
			@Email,
			@InstituteID,
			@BranchID,
			@SemesterID,
			@AdminUserID,
			GETDATE(),
			GETDATE()
		)
	SELECT @StudentID = SCOPE_IDENTITY()
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_InsertByUserID]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_InsertByUserID]
@StudentName VARCHAR(100),
@EntrollmentNo VARCHAR(12),
@Email VARCHAR(100),
@InstituteID INT,
@BranchID INT,
@Semester INT,
@AdminUserID INT,
@CreationDate DATETIME,
@ModificationDate DATETIME
AS
INSERT INTO [dbo].[Student]
(
    [dbo].[Student].[StudentName],
    [dbo].[Student].[EntrollmentNo],
    [dbo].[Student].[Email],
    [dbo].[Student].[InstituteID],
    [dbo].[Student].[BranchID],
    [dbo].[Student].[Semester],
    [dbo].[Student].[AdminUserID],
    [dbo].[Student].[CreationDate],
    [dbo].[Student].[ModificationDate]
)
VALUES
(
    @StudentName,
    @EntrollmentNo,
    @Email,
    @InstituteID,
    @BranchID,
    @Semester,
    @AdminUserID,
    @CreationDate,
    @ModificationDate
)
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectAll]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_SelectAll]
@InstituteID INT,
@BranchID INT

as

SELECT 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[StudentName],
	[dbo].[Student].[EntrollmentNo]
From
	[dbo].[Student]
where 
[dbo].[Student].[InstituteID] = @InstituteID
and [dbo].[Student].[BranchID] = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByBookCopyNoWithBookDetails]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Student_SelectByBookCopyNoWithBookDetails]
@BookCopyNo VARCHAR(50),
@Institute INT,
@BranchID INT

as

Select 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[EntrollmentNo],
	[dbo].[Student].[StudentName],
	[dbo].[Book].[BookTitle],
	[dbo].[Book].[Image],
	[dbo].[BookCopy].[BookCopyNo]
	
	
from [dbo].[Student]
left outer join [dbo].[BookIssue]
on [dbo].[Student].[BookIssueID]  = [dbo].[BookIssue].[BookIssueID]
left outer join [dbo].[Book]
on [dbo].[Book].[BookID] = [dbo].[BookIssue].[BookID]
left outer join [dbo].[BookCopy]
on [dbo].[BookCopy].[BookCopyID] = [dbo].[BookIssue].[BookCopyID]

Where [dbo].[BookCopy].[BookCopyNo] = @BookCopyNo
and [dbo].[Student].[InstituteID]= @Institute
and [dbo].[Student].[BranchID] = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByEnrollemntNo]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Student_SelectByEnrollemntNo]
@EnrollmentNo VARCHAR(15),
@InstituteID INT,
@BranchID INT

as

SELECT 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[StudentName],
	[dbo].[Student].[EntrollmentNo]
From
	[dbo].[Student]
where [dbo].[Student].[EntrollmentNo] = @EnrollmentNo
and [dbo].[Student].[InstituteID] = @InstituteID
and [dbo].[Student].[BranchID] = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByEnrollemntNoWithBookDetails]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[PR_Student_SelectByEnrollemntNoWithBookDetails]
@EnrollmentNo VARCHAR(15),
@InstituteID INT,
@BranchID INT

as

Select 
	[dbo].[Student].[StudentID],
	[dbo].[Student].[EntrollmentNo],
	[dbo].[Student].[StudentName],
	[dbo].[Book].[BookTitle],
	[dbo].[Book].[Image],
	[dbo].[BookCopy].[BookCopyNo]
	
	
from [dbo].[Student]
left outer join [dbo].[Book]
on [dbo].[Book].[BookID] = [dbo].[Student].[BookID]
left outer join [dbo].[BookCopy]
on [dbo].[BookCopy].[BookCopyID] = [dbo].[Student].[BookCopyID]

Where [dbo].[Student].[EntrollmentNo] = @EnrollmentNo
and [dbo].[Student].[InstituteID]= @InstituteID
and [dbo].[Student].[BranchID] = @BranchID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_SelectByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_SelectByPK]
@StudentID INT,
@AdminUserID INT
AS
SELECT
    [dbo].[Student].[StudentID],
    [dbo].[Student].[StudentName],
    [dbo].[Student].[EntrollmentNo],
    [dbo].[Student].[Email],
    [dbo].[Institute].[InstituteID],
    [dbo].[Branch].[BranchID],
    [dbo].[Student].[Semester],
    CONVERT(VARCHAR,[dbo].[Student].[CreationDate],106),
    CONVERT(VARCHAR,[dbo].[Student].[ModificationDate],106)
FROM
    [dbo].[Student]
	left outer join [dbo].[Institute]
	on [dbo].[Institute].[InstituteID] = [dbo].[Student].[InstituteID]
	left outer join [dbo].[Branch]
	on [dbo].[Branch].[BranchID] = [dbo].[Student].[BranchID]
WHERE
    [dbo].[Student].[StudentID] = @StudentID
	and [dbo].[Student].[AdminUserID] = @AdminUserID
GO
/****** Object:  StoredProcedure [dbo].[PR_Student_UpdateByPK]    Script Date: 10-06-2021 11:11:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PR_Student_UpdateByPK]
@StudentID INT,
@StudentName VARCHAR(100),
@EntrollmentNo VARCHAR(12),
@Email VARCHAR(100),
@SemesterID INT

AS
UPDATE [dbo].[Student]
SET
    [dbo].[Student].[StudentName] = @StudentName,
    [dbo].[Student].[EntrollmentNo] = @EntrollmentNo,
    [dbo].[Student].[Email] = @Email,
    [dbo].[Student].[SemesterID] = @SemesterID,
    [dbo].[Student].[ModificationDate] = GETDATE()
WHERE
    [dbo].[Student].[StudentID] = @StudentID
GO
USE [master]
GO
ALTER DATABASE [DarshanBookBank] SET  READ_WRITE 
GO
